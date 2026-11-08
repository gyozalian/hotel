# Rebuilds the full prompt files (NN-page.txt) from _system.txt + _pages\<page>.txt.
# Edit the parts, then run:  powershell -File build.ps1
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$system = Get-Content -Raw -Encoding utf8 (Join-Path $here '_system.txt')
$order = 'calendar','guests','automation','reports','channels','users','access','settings','login','landing'
$i = 1
foreach ($p in $order) {
  $page = Get-Content -Raw -Encoding utf8 (Join-Path $here "_pages\$p.txt")
  $name = '{0:D2}-{1}.txt' -f $i, $p
  $text = $system.TrimEnd() + "`r`n`r`n" + $page
  [IO.File]::WriteAllText((Join-Path $here $name), $text, (New-Object Text.UTF8Encoding $false))
  Write-Output "wrote $name"
  $i++
}
