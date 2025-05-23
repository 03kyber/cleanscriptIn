#Run CCleaner tools
echo "Running CCleaner cleanup tools..."
& 'C:\Program Files\CCleaner\CCleaner.exe' /AUTO
$desktopFiles = Get-ChildItem -Path C:\Users\Propietario\Desktop
$downloadsFiles = Get-ChildItem -Path C:\Users\Propietario\Downloads
$savedPicturesFiles = Get-ChildItem -Path 'C:\Users\Propietario\Pictures\Saved Pictures'
#Delete "Desktop" files
echo "Deleting Desktop Files..."
foreach ($file in $desktopFiles) {
    del C:\Users\Propietario\Desktop\$file
}
#Safe Folder Shortcut Restoration
$WshShell = New-Object -COMObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Carpeta Segura.lnk")
$Shortcut.TargetPath = "C:\Users\Propietario\Carpeta Segura"
$Shortcut.Save()
#Delete "Downloads" files
echo "Deleting Downloads Files..."
foreach ($file in $downloadsFiles) {
    del C:\Users\Propietario\Downloads\$file
}
#Delete "Saved Pictures" Files
echo "Deleting Saved Pictures Files..."
foreach ($file in $savedPicturesFiles) {
    del 'C:\Users\Propietario\Pictures\Saved Pictures\$file'
}

