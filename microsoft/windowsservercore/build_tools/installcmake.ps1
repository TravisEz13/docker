choco install -y cmake.install
$cmakeSource = Get-ChildItem -path cmake.exe -Recurse | Select-Object -First 1 -ExpandProperty FullName
$cmakePath = Split-Path -Path $cmakeSource
$newPath = "$env:path;$cmakePath"
Write-Verbose "setting path to: $newPath" -Verbose
[System.Environment]::SetEnvironmentVariable('path',$newPath,[System.EnvironmentVariableTarget]::Machine)