$url = 'https://github.com/boredwz/l4d2_4inazes_mod/releases/latest/download/l4d2_4inazes_mod.vpk'

$l4d2_reg = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 550'
$l4d2_path = (Get-ItemProperty $l4d2_reg -ErrorAction 0).InstallLocation
if (!$l4d2_path) {Write-Host "> L4D2 path not found." -f Red}
$destination = Join-Path $l4d2_path 'left4dead2\addons\l4d2_4inazes_mod.vpk'

"> Downloading..."
$ErrorActionPreference = 'SilentlyContinue'
try {Invoke-WebRequest $url -OutFile $destination}
catch {Write-Host "> Web-request error." -f Red; return}
$ErrorActionPreference = 'Continue'

Write-Host "> Done" -f Green