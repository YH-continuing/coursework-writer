# 结课作业写作助手 · DSH v44+ 安装脚本（Windows）
#
# 一行安装（复制到 PowerShell 回车）：
#   iex ([Text.Encoding]::UTF8.GetString((New-Object Net.WebClient).DownloadData('https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@v2.0.0/install.ps1')))
#
# 原理：DSH v44 起，模式（agent preset）不再是目录，而是 profile 里的
# `@deepseek-ai/dsh-agent-preset` 行。本脚本把该行写入 ~/.dsh/profiles/*/cordis.patch.yml。

$ErrorActionPreference = 'Stop'

$BASE = 'https://cdn.jsdelivr.net/gh/YH-continuing/coursework-writer@v2.0.0'
$dshHome = if ($env:DSH_HOME) { $env:DSH_HOME } else { Join-Path $HOME '.dsh' }
$profilesRoot = Join-Path $dshHome 'profiles'

Write-Host "正在安装「结课作业写作」模式 ..."

if (-not (Test-Path $profilesRoot)) {
    Write-Host "错误：找不到 DSH 配置目录：$profilesRoot" -ForegroundColor Red
    Write-Host "请先启动一次 DSH（让它生成 profile），再运行本脚本。" -ForegroundColor Red
    exit 1
}

$snippet = [Text.Encoding]::UTF8.GetString(
    (New-Object Net.WebClient).DownloadData("$BASE/preset/coursework-writer.patch.yml"))

$targets = @(Get-ChildItem $profilesRoot -Directory -ErrorAction SilentlyContinue |
    Where-Object { Test-Path (Join-Path $_.FullName 'cordis.patch.yml') })

if ($targets.Count -eq 0) {
    Write-Host "错误：$profilesRoot 下没有找到包含 cordis.patch.yml 的 profile。" -ForegroundColor Red
    exit 1
}

foreach ($t in $targets) {
    $f = Join-Path $t.FullName 'cordis.patch.yml'
    $cur = [IO.File]::ReadAllText($f, [Text.Encoding]::UTF8)

    if ($cur -match 'preset-coursework-writer') {
        Write-Host "  [$($t.Name)] 已安装过，跳过"
        continue
    }

    Copy-Item $f "$f.bak-coursework" -Force

    $lines = $cur -split "`r?`n"
    $out = New-Object System.Collections.Generic.List[string]
    $replaced = $false
    foreach ($ln in $lines) {
        if (-not $replaced -and $ln.Trim() -eq '[]') {
            $out.Add($snippet.TrimEnd())
            $replaced = $true
        } else {
            $out.Add($ln)
        }
    }
    if (-not $replaced) { $out.Add($snippet.TrimEnd()) }

    [IO.File]::WriteAllText($f, (($out -join "`r`n").TrimEnd() + "`r`n"), (New-Object Text.UTF8Encoding($false)))
    Write-Host "  [$($t.Name)] 已写入"
}

Write-Host ""
Write-Host "✓ 安装完成" -ForegroundColor Green
Write-Host "  模式 id ：coursework-writer"
Write-Host "  显示名  ：结课作业写作"
Write-Host ""
Write-Host "下一步：完全退出 DSH 再重新打开，然后到「设置 → Agent 预设 → 自定义」里选择它。"
Write-Host ""
Write-Host "卸载：删除各 profile 的 cordis.patch.yml 中「# 结课作业写作助手」开头的那段即可"
Write-Host "      （原文件已备份为 cordis.patch.yml.bak-coursework）。"
