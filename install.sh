#!/usr/bin/env bash
# 结课作业写作助手 · macOS / Linux 一键安装
set -euo pipefail

DSH_HOME="${DSH_HOME:-$HOME/.dsh}"
SRC="$(cd "$(dirname "$0")" && pwd)/preset/coursework-writer"
DEST="$DSH_HOME/.agent-presets/coursework-writer"

if [ ! -f "$SRC/agent.cordis.yml" ]; then
  echo "错误：找不到 $SRC" >&2
  echo "请确认 install.sh 和 preset 文件夹在同一个目录下。" >&2
  exit 1
fi

mkdir -p "$DEST"
cp -R "$SRC/." "$DEST/"

echo ""
echo "✓ 安装完成"
echo "  模式 id   ：coursework-writer"
echo "  显示名   ：结课作业写作"
echo "  安装位置 ：$DEST"
echo ""
echo "下一步：打开 DSH，在模式选择器里选「结课作业写作」，新开一个会话。"
echo "         （若 DSH 正在运行，请重启或刷新，新模式才会出现在列表里。）"
