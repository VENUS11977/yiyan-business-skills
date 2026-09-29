#!/usr/bin/env bash
set -euo pipefail

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
repo_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
source_root="$repo_root/skills"
target_root="${YIYAN_SKILLS_HOME:-${HOME}/.agents/skills}"
import_root="${YIYAN_IMPORT_HOME:-${HOME}/yiyan-business-skills-import}"
standalone_root="$import_root/standalone"

if [[ ! -d "$source_root" ]]; then
  echo "错误：找不到 Skill 目录：$source_root" >&2
  exit 1
fi

mkdir -p "$target_root" "$import_root/skills" "$standalone_root"

installed=0
for source_dir in "$source_root"/*; do
  [[ -d "$source_dir" ]] || continue
  [[ -f "$source_dir/SKILL.md" ]] || continue
  name="$(basename "$source_dir")"
  target_dir="$target_root/$name"
  import_dir="$import_root/skills/$name"
  mkdir -p "$target_dir" "$import_dir"
  find "$source_dir" -type f ! -name '.DS_Store' ! -name '*.pyc' -print0 |
    while IFS= read -r -d '' source_file; do
      relative="${source_file#"$source_dir/"}"
      mkdir -p "$target_dir/$(dirname "$relative")" "$import_dir/$(dirname "$relative")"
      cp "$source_file" "$target_dir/$relative"
      cp "$source_file" "$import_dir/$relative"
    done

  standalone_file="$standalone_root/$name.md"
  cp "$source_dir/SKILL.md" "$standalone_file"
  if [[ -d "$source_dir/references" ]]; then
    while IFS= read -r -d '' reference_file; do
      relative_reference="${reference_file#"$source_dir/"}"
      {
        printf '\n\n---\n\n# 导入参考：%s\n\n' "$relative_reference"
        sed '1s/^# /## /' "$reference_file"
      } >> "$standalone_file"
    done < <(find "$source_dir/references" -type f -name '*.md' -print0 | sort -z)
  fi
  installed=$((installed + 1))
done

cp "$repo_root/INSTALL.md" "$import_root/INSTALL.md"
cp "$repo_root/manifest.json" "$import_root/manifest.json"

cat > "$import_root/README.txt" <<'EOF'
一炎商业与自媒体 Skills 导入包

支持 Agent Skills 的客户端：
  npx -y skills add VENUS11977/yiyan-business-skills -g --all

豆包、DeepSeek、ChatGPT 等平台：
  优先导入 standalone/yiyan-business-self-study.md；
  再按需要导入 standalone/ 中的具体分类单文件。

standalone/ 已把每个入口的 SKILL.md 与 references 合并，适合只能导入单个文件的平台。

详细说明请阅读 INSTALL.md。
EOF

echo "已安装 $installed 个入口到：$target_root"
echo "已生成网页 AI 导入包：$import_root"
echo "网页 AI 仍需要在平台内手动导入，安装器不会登录或修改账号设置。"
