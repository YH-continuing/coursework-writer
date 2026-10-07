#!/usr/bin/env bash
# 结课作业写作助手 · DSH v44+ 安装脚本（macOS / Linux）
#
# 一行安装（复制到终端回车）：
#   curl -fsSL https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@v2.0.0/install.sh | bash
#
# 原理：DSH v44 起，模式（agent preset）不再是目录，而是 profile 里的
# `@deepseek-ai/dsh-agent-preset` 行。本脚本把该行写入 ~/.dsh/profiles/*/cordis.patch.yml。

set -euo pipefail

BASE="https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@v2.0.0"
DSH_HOME="${DSH_HOME:-$HOME/.dsh}"
PROFILES="$DSH_HOME/profiles"

echo "正在安装「结课作业写作」模式 ..."

if [ ! -d "$PROFILES" ]; then
  echo "错误：找不到 DSH 配置目录：$PROFILES" >&2
  echo "请先启动一次 DSH（让它生成 profile），再运行本脚本。" >&2
  exit 1
fi

TMP="$(mktemp)"
curl -fsSL "$BASE/preset/coursework-writer.patch.yml" -o "$TMP"

FOUND=0
for d in "$PROFILES"/*/; do
  f="${d}cordis.patch.yml"
  [ -f "$f" ] || continue
  FOUND=1
  name="$(basename "$d")"

  if grep -q 'preset-coursework-writer' "$f"; then
    echo "  [$name] 已安装过，跳过"
    continue
  fi

  cp "$f" "$f.bak-coursework"

  if [ "$(tr -d '[:space:]' < "$f")" = "[]" ]; then
    awk -v snip="$TMP" '
      /^[[:space:]]*\[\][[:space:]]*$/ { while ((getline line < snip) > 0) print line; next }
      { print }
    ' "$f" > "$f.new"
  else
    cat "$f" > "$f.new"
    printf '\n' >> "$f.new"
    cat "$TMP" >> "$f.new"
  fi

  mv "$f.new" "$f"
  echo "  [$name] 已写入"
done

rm -f "$TMP"

if [ "$FOUND" -eq 0 ]; then
  echo "错误：$PROFILES 下没有找到包含 cordis.patch.yml 的 profile。" >&2
  exit 1
fi

echo ""
echo "✓ 安装完成"
echo "  模式 id ：coursework-writer"
echo "  显示名  ：结课作业写作"
echo ""
echo "下一步：完全退出 DSH 再重新打开，然后到「设置 → Agent 预设 → 自定义」里选择它。"
echo ""
echo "卸载：删除各 profile 的 cordis.patch.yml 中「# 结课作业写作助手」开头的那段即可"
echo "      （原文件已备份为 cordis.patch.yml.bak-coursework）。"
