# Run one page prompt with the local model in a NEW opencode session, or send a fix to that page's session.
#   powershell -File run.ps1 01-calendar.txt                         -> new session titled "01-calendar"
#   powershell -File run.ps1 fix-calendar-1.txt -Fix 01-calendar     -> sends your corrections to the
#                                                                       session titled "01-calendar"
# Output is saved next to the prompt as <name>.log
param(
  [Parameter(Mandatory = $true, Position = 0)][string]$PromptFile,
  [string]$Fix,                       # title of the session to continue, e.g. 01-calendar
  [string]$Model = 'llamacpp/nemotron'
)
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$path = if (Test-Path $PromptFile) { (Resolve-Path $PromptFile).Path } else { Join-Path $here $PromptFile }
$text = Get-Content -Raw -Encoding utf8 $path
$log  = [IO.Path]::ChangeExtension($path, '.log')
Push-Location 'C:\Projects\hotel'   # paths in the prompts are relative to the repo root
try {
  if ($Fix) {
    # find the newest session with that exact title
    $line = opencode session list -n 200 | Where-Object { ($_ -split "`t")[1] -eq $Fix } | Select-Object -First 1
    if (-not $line) { throw "No opencode session titled '$Fix'. Run 'opencode session list' to see titles." }
    $id = ($line -split "`t")[0]
    opencode run --session $id --model $Model $text *> $log
  } else {
    opencode run --model $Model --title ([IO.Path]::GetFileNameWithoutExtension($path)) $text *> $log
  }
} finally { Pop-Location }
Get-Content $log -Tail 20
