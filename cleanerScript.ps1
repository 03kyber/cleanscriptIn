#Run CCleaner tools
echo "Running CCleaner cleanup tools..."
& 'C:\Program Files\CCleaner\CCleaner.exe' /AUTO
$desktopFiles = Get-ChildItem -LiteralPath "$env:USERPROFILE\Desktop"
$downloadsFiles = Get-ChildItem -Path "$env:USERPROFILE\Downloads"
$savedPicturesFiles = Get-ChildItem -Path "$env:USERPROFILE\Pictures\Saved Pictures"
#Delete "Desktop" files
echo "Deleting Desktop Files..."
foreach ($file in $desktopFiles) {
    del "$env:USERPROFILE\Desktop\$file" -Confirm:$false
}
#Safe Folder Shortcut Restoration
$WshShell = New-Object -COMObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Carpeta Segura.lnk")
$Shortcut.TargetPath = "$env:USERPROFILE\Carpeta Segura"
$Shortcut.Save()
#Delete "Downloads" files
echo "Deleting Downloads Files..."
foreach ($file in $downloadsFiles) {
    del "$env:USERPROFILE\Downloads\$file" -Confirm:$false
}
#Delete "Saved Pictures" Files
echo "Deleting Saved Pictures Files..."
foreach ($file in $savedPicturesFiles) {
    del "$env:USERPROFILE\Pictures\Saved Pictures\$file" -Confirm:$false
}

