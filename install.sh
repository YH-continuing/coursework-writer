#!/usr/bin/env bash
# 结课作业写作助手 · macOS / Linux 在线安装（jsDelivr CDN，国内可用）
# 一行命令安装（复制这一行，粘贴到终端回车）：
#   curl -fsSL https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@v1.0.0/install.sh | bash
#
# 原理：从 jsDelivr CDN（缓存自 GitHub 仓库，国内一般可访问）下载两个 preset 文件，
#       放进 DSH 的模式目录。

set -euo pipefail

BASE="https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@v1.0.0/preset/coursework-writer"
DSH_HOME="${DSH_HOME:-$HOME/.dsh}"
DEST="$DSH_HOME/.agent-presets/coursework-writer"

echo "正在安装「结课作业写作」模式 ..."

mkdir -p "$DEST"
curl -fsSL "$BASE/agent.cordis.yml" -o "$DEST/agent.cordis.yml"
curl -fsSL "$BASE/preset.yml"      -o "$DEST/preset.yml"

echo ""
echo "✓ 安装完成"
echo "  模式 id   ：coursework-writer"
echo "  显示名   ：结课作业写作"
echo "  安装位置 ：$DEST"
echo ""
echo "下一步：打开 DSH，在模式选择器里选「结课作业写作」，新开一个会话。"
echo "         （若 DSH 正在运行，请重启或刷新，新模式才会出现在列表里。）"
