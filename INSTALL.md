# 安装与导入向导

这套内容采用“一个公开源、三种接入方式”：

1. 支持 Agent Skills 的客户端，使用 `npx skills add` 自动安装；
2. 能配置智能体、系统提示词或知识库的平台，导入对应的 `SKILL.md`；
3. 没有持久化配置入口的聊天界面，在新对话开头临时粘贴对应入口。

平台能否自动安装，取决于平台是否开放本地 Skill 目录或提示词／知识库接口。本仓库不会读取账号密码，也不会尝试绕过平台权限。

## A. 支持 Skill 标准的客户端

适用于 Codex、Claude Code、Gemini CLI、Cursor、Cline 等支持 Agent Skills 的工具：

```bash
npx -y skills add VENUS11977/yiyan-business-skills -g --all
```

只安装一个入口：

```bash
npx -y skills add VENUS11977/yiyan-business-skills --skill yiyan-business -g
```

安装完成后，重启客户端或重新加载项目规则，再调用对应入口。

## B. 本地安装器（macOS／Linux）

如果你已经把仓库下载到本地，可以运行：

```bash
bash scripts/install-universal.sh
```

它会把 10 个入口复制到：

```text
~/.agents/skills/
```

并在以下目录生成适合手动导入网页 AI 的副本：

```text
~/yiyan-business-skills-import/
```

本地安装器只处理文件，不会登录任何 AI 平台，也不会修改真实目录中已有的其他 Skill。

## C. Windows PowerShell

在仓库根目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-universal.ps1
```

默认安装到：

```text
$HOME\.agents\skills\
```

网页端 AI 的导入副本位于：

```text
$HOME\yiyan-business-skills-import\
```

## D. 豆包、DeepSeek、ChatGPT 自定义 GPT 等

这些平台通常没有统一的 `npx` Skill 安装器。建议先导入总入口：

```text
skills/yiyan-business-self-study/SKILL.md
```

操作顺序：

1. 在仓库中打开对应的 `SKILL.md`，点击 Raw；
2. 复制全文；
3. 粘贴到平台的“智能体提示词”“自定义指令”“系统提示词”“项目规则”或知识库；
4. 新建对话测试分流；
5. 需要具体工作时，再导入对应分类入口，例如 `yiyan-business/SKILL.md`。

如果平台没有持久化配置入口，就把 `SKILL.md` 放在新对话的第一条消息中，并在后面提出任务。

测试总入口：

```text
我已经加载了一炎商业与自媒体总入口。
我想做轻资产创业，但不知道该做什么。
请先根据我的基础、资源、目标和卡点判断入口，不要跳过分流。
```

## E. 不能承诺的事情

- 不能让不支持自定义指令、知识库或 Skill 目录的聊天界面自动安装；
- 不能代替用户登录、上传个人资料或修改账号设置；
- 不能保证不同平台对同一段 Markdown 的调用方式完全一致；
- 不能把“成功复制文件”说成“平台已经原生支持 Skill”。

## 入口文件链接

- [总入口](https://raw.githubusercontent.com/VENUS11977/yiyan-business-skills/main/skills/yiyan-business-self-study/SKILL.md)
- [商业与轻资产创业](https://raw.githubusercontent.com/VENUS11977/yiyan-business-skills/main/skills/yiyan-business/SKILL.md)
- [产品与服务设计](https://raw.githubusercontent.com/VENUS11977/yiyan-business-skills/main/skills/yiyan-product-design/SKILL.md)
- [自媒体与内容系统](https://raw.githubusercontent.com/VENUS11977/yiyan-business-skills/main/skills/yiyan-content-system/SKILL.md)
- [个人品牌、私域与销售](https://raw.githubusercontent.com/VENUS11977/yiyan-business-skills/main/skills/yiyan-brand-sales/SKILL.md)
- [交付、运营与经营看板](https://raw.githubusercontent.com/VENUS11977/yiyan-business-skills/main/skills/yiyan-business-operations/SKILL.md)
- [心力与执行系统](https://raw.githubusercontent.com/VENUS11977/yiyan-business-skills/main/skills/yiyan-mind-system/SKILL.md)
- [心理学辅助](https://raw.githubusercontent.com/VENUS11977/yiyan-business-skills/main/skills/yiyan-psychology-support/SKILL.md)
- [佛学辅助](https://raw.githubusercontent.com/VENUS11977/yiyan-business-skills/main/skills/yiyan-buddhism-support/SKILL.md)
- [健康生活](https://raw.githubusercontent.com/VENUS11977/yiyan-business-skills/main/skills/yiyan-health-life/SKILL.md)
