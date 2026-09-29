# 一炎商业与自媒体 Skills

一套以商业与轻资产创业为主轴、以自媒体和经营闭环为核心、以心力／心理学／佛学／健康生活为支持层的中文 AI Skill 集合。

整套系统由 **1 个总判断入口 + 9 个独立分类入口** 组成。你可以让总入口根据当前阶段和瓶颈选择入口，也可以直接进入某一分类。它不是把一本教材塞进提示词，而是按当前任务逐步加载相关理论、工作表和边界。

本项目免费开源，采用 MIT License。内容是通用的教育与决策框架，不承诺收入、流量、成交或投资结果。

## 包含的入口

| 入口 | 用途 |
|---|---|
| `yiyan-business-self-study` | 总入口：展示所有入口，或根据阶段、证据、瓶颈和期望交付物选择一个主入口 |
| `yiyan-business` | 商业与轻资产创业：方向探索、商业模型、资源与能力、现金流、可逆实验和停止条件 |
| `yiyan-product-design` | 产品与服务设计：客户任务、价值主张、服务蓝图、产品阶梯、定价和验证 |
| `yiyan-content-system` | 自媒体与内容系统：受众情境、内容战略、栏目选题、多形式生产、资产化和数据实验 |
| `yiyan-brand-sales` | 个人品牌、私域与销售：定位、证据、客户旅程、适配筛选、会谈、跟进和转介绍 |
| `yiyan-business-operations` | 交付、运营与经营看板：流程、SOP、质量、容量、单位经济、售后和周期复盘 |
| `yiyan-mind-system` | 心力与执行系统：任务、能力、动机、环境、容量和恢复六维诊断 |
| `yiyan-psychology-support` | 心理学辅助：非临床问题建模、认知与行为工具、价值、情绪和低风险实验 |
| `yiyan-buddhism-support` | 佛学辅助：原典分层、正命、业与因缘、无常、执著、慈悲、在家伦理和修习反思 |
| `yiyan-health-life` | 健康生活：7 天基线、睡眠、饮食、活动、久坐、工作方式、信息边界与恢复 |

## 系统怎样工作

商业链路是：

```text
战略选择 → 产品与价值 → 内容与需求 → 信任与成交 → 交付与学习
```

心力、心理学、佛学与健康生活负责支持经营者的行动、判断、伦理和长期产能。它们不会替代客户证据、现金流、合规要求、医疗或心理治疗。

每个入口的 `SKILL.md` 只保留路由、核心流程和停止条件；详细理论、工作表与来源放在 `references/` 中，由 AI 根据任务按需读取。这样既保留体系深度，也避免一次加载全部材料造成混乱。

## 知识与证据怎么区分

本项目把内容分为不同证据层，不混写成“一炎说过”或“某个理论已经证明”：

- **一炎原始材料与个人经验**：保留其方法、案例和体系语言，并明确适用范围；
- **外部理论与研究**：优先采用原始论文、权威机构与经典理论，只保留能改变判断或行动的部分；
- **佛教材料**：区分佛教原典、传统解释、个人修学与现代经营转译；
- **现实经营假设**：必须通过客户行为、交易、交付和复盘继续验证；
- **象征与主观体验**：可以启发观察，不能替代市场、医学或因果证据。

## 安装

如果你使用支持 Agent Skills 的客户端（例如 Codex、Claude Code、Gemini CLI、Cursor 等），可以安装整个集合：

```bash
npx -y skills add VENUS11977/yiyan-business-skills -g --all
```

也可以只安装一个入口（以安装商业入口为例）：

```bash
npx -y skills add VENUS11977/yiyan-business-skills --skill yiyan-business -g
```

`-g --all` 会让安装器尝试当前版本识别到的多个 Agent。个别客户端如果本身不支持全局 Skill，可能显示类似 `does not support global skill installation` 的提示；这不代表整套安装失败。以输出中出现 `Installed 10 skills`，并且 `~/.agents/skills/` 下能看到 10 个 `yiyan-*` 目录为准。

如果仓库被 fork 到其他 GitHub owner 下，请将 `VENUS11977` 替换为 fork 后的 owner；直接使用本仓库时无需修改命令。

## 统一安装器与平台导入

想查看所有平台的安装方式，请阅读 [INSTALL.md](INSTALL.md)。

已经下载仓库的用户，可以运行本地安装器：

macOS／Linux：

```bash
git clone https://github.com/VENUS11977/yiyan-business-skills.git
cd yiyan-business-skills
bash scripts/install-universal.sh
```

Windows PowerShell：

```powershell
git clone https://github.com/VENUS11977/yiyan-business-skills.git
cd yiyan-business-skills
powershell -ExecutionPolicy Bypass -File .\scripts\install-universal.ps1
```

本地安装器会把入口复制到通用的 `~/.agents/skills/`（Windows 为 `$HOME\.agents\skills\`），并生成一个 `yiyan-business-skills-import` 导入包。导入包的 `standalone/` 目录会把每个入口的 `SKILL.md` 与 `references/` 合并成单文件完整版，适合豆包、DeepSeek、ChatGPT 自定义 GPT 等网页平台。平台没有自定义指令或知识库入口时，外部脚本无法代替平台完成安装。

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

总入口只负责判断和生成调用提示词，不会给出一个缩减版的商业答案。进入分类入口后，该入口会根据任务读取自己的 `references/`；一般不需要用户手动挑选参考文件。

## 不同 AI 平台的使用方式

“能使用这套 Skill”和“有统一的一键安装器”是两回事：

- 支持 Agent Skills 格式的客户端：使用上面的 `npx skills add` 命令。
- ChatGPT 自定义 GPT：没有跨账号通用的一键安装命令；上传安装器生成的对应 `standalone/*.md` 到 Instructions／知识中。
- Gemini、Claude 的网页端，以及豆包、DeepSeek 等平台：如果平台提供系统提示词、项目规则或知识库功能，手动导入对应单文件完整版；平台不支持时无法强行启用 Skill 机制。
- 普通聊天界面：把一个单文件完整版放到对话开头。想使用多个入口时，建议先导入 `yiyan-business-self-study.md`，再按它的判断导入具体分类文件。

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
├── manifest.json
├── INSTALL.md
└── skills/
    ├── yiyan-business-self-study/
    │   ├── SKILL.md
    │   ├── agents/openai.yaml
    │   └── references/
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

本地安装器还会在仓库外生成：

```text
yiyan-business-skills-import/
├── skills/       # 保留标准目录结构
└── standalone/   # 适合网页 AI 的单文件完整版
```

## 反馈与贡献

欢迎提交 Issue 或 Pull Request。请不要上传客户隐私、聊天记录、付款信息、未公开课程原稿、密钥或其他个人资料。新增内容应保持：边界清楚、结果可验证、不作绝对承诺，并与对应分类入口保持一致。
