# Runs jobs from queue.txt one at a time (the llama-server handles one request at a time).
# Each line in queue.txt:   <prompt file>                 -> new session
#                           <fix file> | <session title>  -> correction sent to that page's session
# Lines can be appended while the queue runs. Finished lines move to queue-done.txt.
$here  = Split-Path -Parent $MyInvocation.MyCommand.Path
$queue = Join-Path $here 'queue.txt'
$done  = Join-Path $here 'queue-done.txt'
while ($true) {
  $lines = @(Get-Content $queue -ErrorAction SilentlyContinue | Where-Object { $_.Trim() })
  if ($lines.Count -eq 0) { break }
  $job = $lines[0]
  Set-Content -Encoding utf8 $queue ($lines | Select-Object -Skip 1)
  $parts = @($job -split '\|' | ForEach-Object { $_.Trim() })   # @() keeps it an array even with one part
  $start = Get-Date
  if ($parts.Count -gt 1) { & (Join-Path $here 'run.ps1') $parts[0] -Fix $parts[1] | Out-Null }
  else                    { & (Join-Path $here 'run.ps1') $parts[0] | Out-Null }
  $log  = Join-Path $here ([IO.Path]::ChangeExtension($parts[0], '.log'))
  $last = ((Get-Content $log -Tail 1) -replace '\x1b\[[0-9;]*m','')
  $line = '{0:HH:mm} {1} ({2:N0} min): {3}' -f (Get-Date), $job, ((Get-Date) - $start).TotalMinutes, $last
  Add-Content -Encoding utf8 $done $line
  Write-Output $line
}
