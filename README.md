# 一炎商业与自媒体 Skills

一套面向商业、轻资产创业和自媒体实践的中文 AI Skill 集合。它把不同任务拆成独立入口：你可以先让总入口判断，也可以直接进入具体入口。

本项目免费开源，采用 MIT License。内容是通用的教育与决策框架，不承诺收入、流量、成交或投资结果。

## 包含的入口

| 入口 | 用途 |
|---|---|
| `yiyan-business-self-study` | 总入口：根据目标、基础和卡点分流到合适入口 |
| `yiyan-business` | 商业与轻资产创业：资源盘点、方向筛选、现金流和小实验 |
| `yiyan-product-design` | 产品与服务设计：对象、问题、交付结果、产品阶梯和定价逻辑 |
| `yiyan-content-system` | 自媒体与内容系统：定位、栏目、选题、脚本、直播和复盘 |
| `yiyan-brand-sales` | 个人品牌、私域与销售：主页、信任证据、筛选、成交和转介绍 |
| `yiyan-business-operations` | 交付、运营与经营看板：SOP、容量、有效时薪、退款和复盘 |
| `yiyan-mind-system` | 心力与执行系统：拖延、过载、边界、恢复和最小行动 |
| `yiyan-psychology-support` | 心理学辅助：事实、解释、认知偏差、情绪调节和行动 |
| `yiyan-buddhism-support` | 佛学辅助：正命、因缘、无常、执著、慈悲与自主性 |
| `yiyan-health-life` | 健康生活：睡眠、饮食、活动、户外和信息边界的通用建议 |

## 安装

如果你使用支持 Agent Skills 的客户端（例如 Codex、Claude Code、Gemini CLI、Cursor 等），可以安装整个集合：

```bash
npx -y skills add VENUS11977/yiyan-business-skills -g --all
```

也可以只安装一个入口（以安装商业入口为例）：

```bash
npx -y skills add VENUS11977/yiyan-business-skills --skill yiyan-business -g
```

如果仓库被 fork 到其他 GitHub owner 下，请将 `VENUS11977` 替换为 fork 后的 owner；直接使用本仓库时无需修改命令。

## 统一安装器与平台导入

想查看所有平台的安装方式，请阅读 [INSTALL.md](INSTALL.md)。

已经下载仓库的用户，可以运行本地安装器：

macOS／Linux：

```bash
bash scripts/install-universal.sh
```

Windows PowerShell：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-universal.ps1
```

本地安装器会把入口复制到通用的 `~/.agents/skills/`（Windows 为 `$HOME\.agents\skills\`），并生成一个 `yiyan-business-skills-import` 导入包。豆包、DeepSeek、ChatGPT 自定义 GPT 等平台需要把导入包中的 `SKILL.md` 放到平台提供的智能体提示词、系统指令、项目规则或知识库中；平台没有这些入口时，无法由外部脚本代替平台完成安装。

## 使用

安装后，先使用总入口：

```text
$yiyan-business-self-study
我想做轻资产创业，但不知道该做什么。请根据我的基础、资源、卡点和目标，帮我选择最合适的入口，并说明下一步需要提供什么信息。
```

或者直接进入一个分类：

```text
$yiyan-business
我想做轻资产创业，但不知道该做什么。
```

在不支持 `$skill-name` 调用的客户端里，把对应目录的 `SKILL.md` 内容复制到系统提示词、项目规则或知识库中即可。

## 不同 AI 平台的使用方式

“能使用这套 Skill”和“有统一的一键安装器”是两回事：

- 支持 Agent Skills 格式的客户端：使用上面的 `npx skills add` 命令。
- ChatGPT 自定义 GPT：没有跨账号通用的一键安装命令；将需要的 `SKILL.md` 上传或复制到 GPT 的 Instructions／知识中。
- Gemini、Claude 的网页端，以及豆包、DeepSeek 等平台：如果平台提供系统提示词、项目规则或知识库功能，手动导入对应 `SKILL.md`；平台不支持时无法强行启用 Skill 机制。
- 普通聊天界面：下载仓库后，复制一个入口的 `SKILL.md` 到对话开头或自定义指令中。想使用多个入口时，建议先导入 `yiyan-business-self-study`，再按它的判断导入具体入口。

因此，本项目提供的是跨平台可迁移的 Markdown Skill 内容，不宣称所有平台都能原生识别或自动安装。

## 边界与安全

- 不保证暴富、爆款、涨粉、成交、成功或投资回报。
- 不鼓励违法经营、虚构案例、虚假背书、恐惧销售或制造客户依赖。
- 商业建议不能替代法律、税务、投资、劳动、医疗或心理治疗意见；涉及这些领域时请核对官方信息并咨询合格专业人士。
- 健康、心理和佛学入口分别标明了适用范围与停止条件，请不要把教育性内容当成诊断、处方或宗教权威结论。

## 目录结构

```text
yiyan-business-skills/
├── README.md
├── LICENSE
└── skills/
    ├── yiyan-business-self-study/
    ├── yiyan-business/
    ├── yiyan-product-design/
    ├── yiyan-content-system/
    ├── yiyan-brand-sales/
    ├── yiyan-business-operations/
    ├── yiyan-mind-system/
    ├── yiyan-psychology-support/
    ├── yiyan-buddhism-support/
    └── yiyan-health-life/
```

## 反馈与贡献

欢迎提交 Issue 或 Pull Request。请不要上传客户隐私、聊天记录、付款信息、未公开课程原稿、密钥或其他个人资料。新增内容应保持：边界清楚、结果可验证、不作绝对承诺，并与对应分类入口保持一致。
