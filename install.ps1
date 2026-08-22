# 结课作业写作助手 · Windows 在线安装（jsDelivr CDN，国内可用）
# 一行命令安装（复制这一行，粘贴到 PowerShell 回车）：
#   irm https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@main/install.ps1 | iex
#
# 原理：从 jsDelivr CDN（缓存自 GitHub 仓库，国内一般可访问）下载两个 preset 文件，
#       放进 DSH 的模式目录。

$ErrorActionPreference = 'Stop'

$base   = 'https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@main/preset/coursework-writer'
$dshHome = if ($env:DSH_HOME) { $env:DSH_HOME } else { Join-Path $HOME '.dsh' }
$dest   = Join-Path $dshHome '.agent-presets\coursework-writer'

Write-Host "正在安装「结课作业写作」模式 ..."

New-Item -ItemType Directory -Path $dest -Force | Out-Null

Invoke-WebRequest -Uri "$base/agent.cordis.yml" -OutFile (Join-Path $dest 'agent.cordis.yml') -TimeoutSec 60
Invoke-WebRequest -Uri "$base/preset.yml"      -OutFile (Join-Path $dest 'preset.yml')      -TimeoutSec 60

Write-Host ""
Write-Host "✓ 安装完成" -ForegroundColor Green
Write-Host "  模式 id   ：coursework-writer"
Write-Host "  显示名   ：结课作业写作"
Write-Host "  安装位置 ：$dest"
Write-Host ""
Write-Host "下一步：打开 DSH，在模式选择器里选「结课作业写作」，新开一个会话。"
Write-Host "         （若 DSH 正在运行，请重启或刷新，新模式才会出现在列表里。）"
