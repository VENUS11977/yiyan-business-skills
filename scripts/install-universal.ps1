$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$SourceRoot = Join-Path $RepoRoot "skills"
$TargetRoot = if ($env:YIYAN_SKILLS_HOME) { $env:YIYAN_SKILLS_HOME } else { Join-Path $HOME ".agents\skills" }
$ImportRoot = if ($env:YIYAN_IMPORT_HOME) { $env:YIYAN_IMPORT_HOME } else { Join-Path $HOME "yiyan-business-skills-import" }
$StandaloneRoot = Join-Path $ImportRoot "standalone"

if (-not (Test-Path $SourceRoot -PathType Container)) {
    throw "找不到 Skill 目录：$SourceRoot"
}

New-Item -ItemType Directory -Force -Path $TargetRoot, (Join-Path $ImportRoot "skills"), $StandaloneRoot | Out-Null
$Installed = 0

Get-ChildItem -Path $SourceRoot -Directory | ForEach-Object {
    $SourceDir = $_.FullName
    $SkillFile = Join-Path $SourceDir "SKILL.md"
    if (-not (Test-Path $SkillFile -PathType Leaf)) { return }

    $Name = $_.Name
    $TargetDir = Join-Path $TargetRoot $Name
    $ImportDir = Join-Path (Join-Path $ImportRoot "skills") $Name
    New-Item -ItemType Directory -Force -Path $TargetDir, $ImportDir | Out-Null

    Get-ChildItem -Path $SourceDir -File -Recurse | Where-Object {
        $_.Name -ne ".DS_Store" -and $_.Extension -ne ".pyc"
    } | ForEach-Object {
        $Relative = $_.FullName.Substring($SourceDir.Length + 1)
        $TargetFile = Join-Path $TargetDir $Relative
        $ImportFile = Join-Path $ImportDir $Relative
        New-Item -ItemType Directory -Force -Path (Split-Path $TargetFile), (Split-Path $ImportFile) | Out-Null
        Copy-Item $_.FullName $TargetFile -Force
        Copy-Item $_.FullName $ImportFile -Force
    }

    $StandaloneFile = Join-Path $StandaloneRoot "$Name.md"
    Get-Content -Raw -Encoding UTF8 $SkillFile | Set-Content -Encoding UTF8 $StandaloneFile
    $ReferencesDir = Join-Path $SourceDir "references"
    if (Test-Path $ReferencesDir -PathType Container) {
        Get-ChildItem -Path $ReferencesDir -File -Recurse -Filter "*.md" | Sort-Object FullName | ForEach-Object {
            $RelativeReference = $_.FullName.Substring($SourceDir.Length + 1)
            $ReferenceContent = Get-Content -Raw -Encoding UTF8 $_.FullName
            $ReferenceContent = $ReferenceContent -replace '^(# )', '## '
            "`n`n---`n`n# 导入参考：$RelativeReference`n`n$ReferenceContent" | Add-Content -Encoding UTF8 $StandaloneFile
        }
    }
    $Installed++
}

Copy-Item (Join-Path $RepoRoot "INSTALL.md") (Join-Path $ImportRoot "INSTALL.md") -Force
Copy-Item (Join-Path $RepoRoot "manifest.json") (Join-Path $ImportRoot "manifest.json") -Force

@"
一炎商业与自媒体 Skills 导入包

支持 Agent Skills 的客户端：
  npx -y skills add VENUS11977/yiyan-business-skills -g --all

豆包、DeepSeek、ChatGPT 等平台：
  优先导入 standalone/yiyan-business-self-study.md；
  再按需要导入 standalone/ 中的具体分类单文件。

standalone/ 已把每个入口的 SKILL.md 与 references 合并，适合只能导入单个文件的平台。

详细说明请阅读 INSTALL.md。
"@ | Set-Content -Encoding UTF8 (Join-Path $ImportRoot "README.txt")

Write-Host "已安装 $Installed 个入口到：$TargetRoot"
Write-Host "已生成网页 AI 导入包：$ImportRoot"
Write-Host "网页 AI 仍需要在平台内手动导入，安装器不会登录或修改账号设置。"
