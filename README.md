# 🎓 结课作业写作助手 (Coursework Writer)

<p align="center">
  <b>面向 DeepSeek Harness (DSH) 的深度拟真人学术作业写作模式</b><br>
  拒绝生硬模板与假大空套话，输出具有个人痕迹、文采斐然、深度契合课程调性的高质量结课作业。
</p>

<p align="center">
  <a href="https://github.com/YH-continuing/coursework-writer/stargazers"><img src="https://img.shields.io/github/stars/YH-continuing/coursework-writer?style=flat&logo=github&color=ffaa00" alt="GitHub Stars"></a>
  <a href="https://github.com/YH-continuing/coursework-writer/releases"><img src="https://img.shields.io/github/v/release/YH-continuing/coursework-writer?color=blue&label=Release" alt="Latest Release"></a>
  <img src="https://img.shields.io/badge/Platform-DeepSeek%20Harness%20(DSH)-6f42c1" alt="Platform DSH">
  <img src="https://img.shields.io/badge/OS-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey" alt="OS">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License"></a>
</p>

---

## 💡 为什么需要它？传统 AI 写作 vs 本助手

市面上通用的 ChatGPT / DeepSeek 提示词写出来的结课作业，往往充斥着浓重的**“AI 味”**——老师一眼就能看出来。本模式彻底重构了写作逻辑：

| 维度 | 常见通用大模型 / 传统提示词 | 结课作业写作助手 (本模式) |
| :--- | :--- | :--- |
| **逻辑连接** | 机械堆砌「首先、其次、再次、最后、总而言之」 | 叙述自然过渡，运用生活细节、疑问句与设问自然引出下文 |
| **句式结构** | 大量对称排比句、四字成语四六级堆叠 | 长短句错落，口吻自然，保留真实大学生的表达节奏与思考波折 |
| **名言引用** | 突兀且生硬地插入「正如著名哲学家 XX 所言」 | 将观点自然融化在句中，紧跟个人真实感悟，毫无生搬硬套之感 |
| **文章结尾** | 空洞喊口号、强行升华到宏大叙事 | 落地为真实生活观察或实践启发，言之有物，不浮夸 |
| **个性化记忆** | 每次会话重置，千篇一律 | **具备本地画像记忆**：自动积累你的真实经历与表达习惯，越写越像你 |

---

## ✨ 核心能力

- 📝 **全场景体裁覆盖**：
  - **结课论文**（论点清晰、学术规范与自主思考并重）
  - **读书报告 / 论文研读**（抓核心议题、个人反思）
  - **影视观后感 / 纪录片评论**（细节共情、视听语言分析）
  - **学习心得 / 研讨体会**（真实感触、结合大学生活动）
  - **社会调查 / 实践报告**（实事求是、数据事实支撑）
  - **结课 PPT 汇报稿与演讲逐字稿**（口语化、控场互动）
- 🎯 **极简四要素驱动**：只需输入 **题目、体裁、课程、字数**（可选特殊要求），即可自动化启动。
- 🔍 **克制且智能的追问**：仅在缺失核心前提时定向追问 3~4 个关键细节，绝无问卷轰炸。
- 🛡️ **交付前自检清单**：内置反套话审查机制，交稿前自动剔除排比堆砌、空洞口号与虚假套话。
- 🔒 **纯本地记忆与素材库**：个人画像、偏好反馈及过往经历沉淀**只保存在本机工作区**，安全不泄露。

---

## 🔄 写作执行流

```mermaid
flowchart TD
    A[提供基础输入: 题目 / 体裁 / 课程 / 字数] --> B{关键信息是否完整?}
    B -- 缺关键上下文 --> C[智能补齐: 追问 2~3 个具体细节/经历]
    B -- 信息充足 --> D[加载课程调性与本地画像库]
    C --> D
    D --> E[草拟正文: 融入真实细节与长短句节奏]
    E --> F[执行「去 AI 味」自检清单]
    F --> G[落盘工作区文件，交付成品]
    G --> H[课后反馈机制: 提炼偏好更新个人画像]
```

---

## 🚀 极速安装与部署

> **前置条件**：已安装运行 **DeepSeek Harness (DSH) v44 或更高版本**。
> **重要变化**：DSH v44 起，模式（agent preset）**不再是目录**，而是 profile 里声明的一行 `@deepseek-ai/dsh-agent-preset`。本项目的安装脚本会把这一行写进你的 profile 补丁文件。

### 方式 A：一键安装（推荐）

#### 🔹 Windows 用户 (PowerShell)
以普通或管理员身份打开 PowerShell，粘贴运行：
```powershell
iex ([Text.Encoding]::UTF8.GetString((New-Object Net.WebClient).DownloadData('https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@v2.0.0/install.ps1')))
```

> 为什么不用更短的 `irm ... | iex`？Windows PowerShell 5.1 会把下载内容按错误编码解码，导致中文提示变乱码（**不影响安装**）。上面这行显式按 UTF-8 读取，中文提示就正常。

#### 🔹 macOS / Linux 用户 (Terminal)
打开终端，复制运行：
```bash
curl -fsSL https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@v2.0.0/install.sh | bash
```

安装完成后，**完全退出 DSH 再重新打开**，然后进入 **设置 → Agent 预设 → 自定义**，选中 **「结课作业写作」**。

---

### 方式 B：国内备用镜像源（jsDelivr 不通时）

从 Gitee 克隆后，手动把补丁片段追加到 profile 的补丁文件：

```bash
git clone https://gitee.com/hu-youjun-114514/coursework-writer.git

# macOS / Linux（把 <profile> 换成你的 profile 名，桌面版通常是 desktop）
cat coursework-writer/preset/coursework-writer.patch.yml >> ~/.dsh/profiles/<profile>/cordis.patch.yml
```
```powershell
# Windows
Add-Content -Encoding UTF8 "$HOME\.dsh\profiles\<profile>\cordis.patch.yml" `
  (Get-Content ".\coursework-writer\preset\coursework-writer.patch.yml" -Raw)
```

> ⚠️ 如果该补丁文件当前内容只有空补丁 `[]`，请先把那一行 `[]` 删掉再追加（或者直接用方式 A 的脚本，它会自动处理）。

---

### 卸载

删除 `~/.dsh/profiles/<profile>/cordis.patch.yml` 中从 `# 结课作业写作助手` 开始到文件末尾的那一段即可（安装脚本会留一份 `.bak-coursework` 备份）。

---

## 📖 最佳实践使用模板

在 DSH 模式选择器中选中 **「结课作业写作」**，直接发送任务提示词：

```text
题目：数字经济时代青年消费心理与理性审视
体裁：结课论文
课程：西方经济学（通识公选课）
字数：2500 字左右
要求：结合大学生的日常生活真实消费开销，引用恩格尔系数等概念，不要写成空洞口号。
```

它会根据你的要求，快速确认核心论述方向并自动完成撰写。

---

## ❓ 常见问题 (FAQ)

<details>
<summary><b>Q1: 安装完后在 DSH 模式列表里找不到该模式？</b></summary>
模式只在 DSH <b>启动时</b>加载，所以请<b>完全退出 DSH（含系统托盘）再重新打开</b>，然后到 <b>设置 → Agent 预设 → 自定义</b> 查看。若仍没有，确认 <code>~/.dsh/profiles/&lt;profile&gt;/cordis.patch.yml</code> 中包含 <code>preset-coursework-writer</code>。
</details>

<details>
<summary><b>Q2: 生成的作业能直接交吗？</b></summary>
虽然本模式在“去 AI 味”和语言自然度上做了大量优化，但我们始终建议：<b>将其作为高质量底稿与灵感骨干</b>。交稿前请结合自身实际通读一遍，补足你的真实小经历，这样既能保证 100% 契合课程，也是对学业诚信的负责。
</details>

<details>
<summary><b>Q3: 如何调整或定制默认写作规则？</b></summary>
编辑 <code>~/.dsh/profiles/&lt;profile&gt;/cordis.patch.yml</code>，找到 <code>preset-coursework-writer</code> 那一段里的 <code>persona</code> → <code>config.prefix</code>，那里就是写作规则正文；改完重启 DSH 生效。
</details>

---

## 📄 许可证

本项目基于 [MIT License](./LICENSE) 开放源代码。
欢迎 Star ⭐️ 支持与提交 Issue / PR 交流！
