# 结课作业写作助手 · Windows 一键安装
# 用法：在本目录打开 PowerShell，运行  .\install.ps1

$ErrorActionPreference = 'Stop'

$dshHome = if ($env:DSH_HOME) { $env:DSH_HOME } else { Join-Path $HOME '.dsh' }
$src  = Join-Path $PSScriptRoot 'preset\coursework-writer'
$dest = Join-Path $dshHome '.agent-presets\coursework-writer'

if (-not (Test-Path (Join-Path $src 'agent.cordis.yml'))) {
    Write-Host "错误：找不到 $src" -ForegroundColor Red
    Write-Host "请确认 install.ps1 和 preset 文件夹在同一个目录下。" -ForegroundColor Red
    exit 1
}

New-Item -ItemType Directory -Path $dest -Force | Out-Null
Copy-Item -Path (Join-Path $src '*') -Destination $dest -Recurse -Force

Write-Host ""
Write-Host "✓ 安装完成" -ForegroundColor Green
Write-Host "  模式 id   ：coursework-writer"
Write-Host "  显示名   ：结课作业写作"
Write-Host "  安装位置 ：$dest"
Write-Host ""
Write-Host "下一步：打开 DSH，在模式选择器里选「结课作业写作」，新开一个会话。"
Write-Host "         （若 DSH 正在运行，请重启或刷新，新模式才会出现在列表里。）"
