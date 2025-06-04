$WshShell = New-Object -ComObject WScript.Shell
$desktop = [Environment]::GetFolderPath("Desktop")
$targetPath = "$PSScriptRoot\start_dashboard.bat"
$shortcut = $WshShell.CreateShortcut("$desktop\Start FANUC Dashboard.lnk")
$shortcut.TargetPath = $targetPath
$shortcut.WorkingDirectory = $PSScriptRoot
$shortcut.WindowStyle = 1
$shortcut.Description = "Start the FANUC Device Dashboard"
$shortcut.Save()