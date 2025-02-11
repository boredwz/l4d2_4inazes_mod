$url = 'https://github.com/boredwz/l4d2_4inazes_mod/releases/latest/download/l4d2_4inazes_mod.vpk'

$l4d2_reg = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 550'
$l4d2_path = (Get-ItemProperty $l4d2_reg -ErrorAction 0).InstallLocation
if (!$l4d2_path) {return "> L4D2 path not found."}
$addons_path = Join-Path $l4d2_path 'left4dead2\addons'

try {Invoke-WebRequest $url -OutFile $addons_path}
catch {Write-Host "> Web-request error." -ForegroundColor Red; return}

Write-Host "> Done" -ForegroundColor Green