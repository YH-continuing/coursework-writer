# 结课作业写作助手（coursework-writer）

一个给 **DeepSeek Harness（DSH）** 用的**写作模式（agent preset）**：帮你写通识 / 公共课的结课作业——结课论文、读书报告、观后感、心得体会、调查报告、PPT 汇报稿，字数通常 1000~5000 字。

它只抓三件事：

1. **有文采、语言流畅**——读起来顺、有节奏，不是辞藻堆砌；
2. **像真人写的**——自然、有个人痕迹、没有「AI 味」；
3. **贴课程调性**——思政、文学、艺术、科普，各是各的口吻。

而且它会**越用越懂你**：每次交付后你反馈哪里好、哪里要改，它把反馈沉淀成规则，下次自动套用。

---

## 特性

- 内置「去 AI 味」规则：禁用机械连接词、三连排比、四字成语堆砌、结尾强行升华……每条都带 **反例 → 正例**
- 覆盖 **6 种体裁**（论文 / 读书报告 / 观后感 / 心得 / 调查报告 / PPT 稿）和 **7 类课程调性**
- 写前自检清单 + 交付后结构化征询反馈
- **迭代机制**：反馈 → 蒸馏成带「来源 + 适用范围」的规则 → 写进你的个人画像 → 下次自动生效
- 你的个人偏好和真实素材**只存在你自己的电脑里**，不上传、不共享

---

## 快速开始（在线一键安装，推荐）

> 前提：已经安装并在使用 DeepSeek Harness（DSH）。
> 通道：默认走 **jsDelivr CDN**（缓存自 GitHub 仓库，国内一般可访问）。海外 / 想拿最新版可改用 GitHub raw 直链，见下方「安装通道说明」。

### Windows（PowerShell）

复制这一行，粘贴到 PowerShell 回车：

```powershell
irm https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@v1.0.0/install.ps1 | iex
```

### macOS / Linux（终端）

复制这一行，粘贴到终端回车：

```bash
curl -fsSL https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@v1.0.0/install.sh | bash
```

装完打开 DSH，在**模式选择器**里选「结课作业写作」，新开一个会话即可。

> 想先看看脚本内容再运行？用浏览器打开上面那串 `https://cdn.jsdelivr.net/...` 链接，脚本全文都公开在仓库里，可先审阅。

### 安装通道说明（国内 / 海外怎么选）

| 通道 | 地址 | 适合场景 |
|---|---|---|
| **jsDelivr CDN**（默认） | `cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@v1.0.0/...` | 国内一键安装；文件更新可能稍有延迟 |
| **GitHub raw** | `raw.githubusercontent.com/YH-continuing/coursework-writer/main/...` | 海外 / 能访问 GitHub；永远最新 |
| **Gitee 镜像** | `gitee.com/hu-youjun-114514/coursework-writer` | 国内浏览文档、`git clone`；注意 Gitee 的 raw 直链需登录，不适合脚本下载 |

> 版本更新：以后改动规则，打一个新 tag（如 `v1.0.1`）并推送，再把 README 里的 `@v1.0.0` 换成新版本号即可——jsDelivr 按 tag 缓存，永远精确、不滞后。

#### 国内备用：用 Gitee 手动克隆安装

jsDelivr 也不通时，走 Gitee（国内秒开）：

```bash
git clone https://gitee.com/hu-youjun-114514/coursework-writer.git
cd coursework-writer
# 然后把 preset/coursework-writer 文件夹手动复制到 ~/.dsh/.agent-presets/
```

或直接在 Gitee 网页上看 README 和代码。

---

## 手动安装（不想用脚本时）

把 `preset/coursework-writer` 这个**文件夹整个**复制到你的 DSH 用户目录下：

| 系统 | 目标路径 |
|---|---|
| Windows | `%DSH_HOME%\.agent-presets\`（`DSH_HOME` 默认是 `~\.dsh`） |
| macOS / Linux | `$DSH_HOME/.agent-presets/` |

最终路径形如：`~/.dsh/.agent-presets/coursework-writer/`。

> 文件夹名 `coursework-writer` 就是模式的 **id**，想改 id 就重命名文件夹；显示名在 `preset.yml` 的 `name` 字段。

---

## 怎么用

新开会话（模式选「结课作业写作」），直接发任务：

```
题目：xxx
体裁：结课论文 / 读书报告 / 观后感 / 心得体会 / 调查报告 / PPT 汇报稿
课程：xxx（比如「马克思主义基本原理」）
字数：3000
其他：老师要求……（可选）
```

它会自动：

1. 读你的个人画像（**第一次用会问你要几个真实经历 / 细节**）；
2. 只在缺关键信息时追问（最多 3~4 个，绝不问卷轰炸）；
3. 按规则起草 → 自检 → 交付；
4. 交付后按 **语言 / 结构 / 内容 / 调性 / 篇幅** 五个维度请你反馈。

---

## 迭代机制（为什么越用越贴你）

- 每条反馈归四类：**喜欢的写法 / 红线 / 真实素材 / 范围偏好**；
- 每条规则带「**适用范围 + 来源 + 置信度**」：单次反馈标「试」，反复出现才固定为「稳」；
- 沉淀写进工作区的 `结课作业写作系统/个人画像.md`，原始记录进 `反馈日志.md`。

**这些记忆只在你本地工作区里**，不属于本仓库，也不会随分享外泄——你分享出去的是「会写作业的助手」，不是「你的写作记忆」。

---

## 目录结构

```
coursework-writer/
├── README.md
├── install.ps1              # Windows 一键安装
├── install.sh               # macOS / Linux 一键安装
├── LICENSE
└── preset/
    └── coursework-writer/
        ├── agent.cordis.yml # 模式本体（人格 + 写作规则 + 工具集）
        └── preset.yml       # 显示名与描述
```

---

## 常见问题

**Q：装完模式列表里没有？**
重启 DSH（或刷新模式选择器）。模式由 `~/.dsh/.agent-presets/` 目录实时发现。

**Q：想改写作规则？**
编辑 `agent.cordis.yml` 里 `persona` 的 `text` 字段（安装后位于 `~/.dsh/.agent-presets/coursework-writer/agent.cordis.yml`）。

**Q：个人画像在哪？**
在你所用**工作区**的 `结课作业写作系统/个人画像.md`。换个工作区就是一份新画像（记忆不跨工作区）。

**Q：会不会被判 AI / 查重？**
请把它当**打底稿 + 调风格**的助手：交稿前自己通读一遍，改成你自己的语气和真实经历。模式会引导你填入真实个人细节——这既是「像真人」的关键，也是负责任的做法。

---

## License

[MIT](./LICENSE) © 2026 YH-continuing
