# Uninstall HP Wolf Security
Write-Host "Uninstalling HP Wolf Security..."
$hpWolfSecurityUninstaller = "C:\Program Files\HP\Wolf Security\uninstall.exe"
if (Test-Path $hpWolfSecurityUninstaller) {
    Start-Process -FilePath $hpWolfSecurityUninstaller -ArgumentList "/silent" -Wait
    Write-Host "HP Wolf Security uninstalled successfully"
} else {
    Write-Host "HP Wolf Security not found"
}

# Install Windows updates
Write-Host "Checking for Windows updates..."
$updates = Get-WindowsUpdate -ErrorAction SilentlyContinue
if ($updates.Count -gt 0) {
    Write-Host "Installing Windows updates..."
    $updates | Install-WindowsUpdate -ErrorAction SilentlyContinue
    Write-Host "Windows updates installed successfully"
} else {
    Write-Host "No Windows updates available"
}

# Install driver updates
Write-Host "Checking for driver updates..."
$drivers = Get-WindowsDriver -ErrorAction SilentlyContinue
if ($drivers.Count -gt 0) {
    Write-Host "Installing driver updates..."
    $drivers | Install-WindowsDriver -ErrorAction SilentlyContinue
    Write-Host "Driver updates installed successfully"
} else {
    Write-Host "No driver updates available"
}

# Install other updates
Write-Host "Checking for other updates..."
$otherUpdates = Get-WindowsUpdate -Category "Optional" -ErrorAction SilentlyContinue
if ($otherUpdates.Count -gt 0) {
    Write-Host "Installing other updates..."
    $otherUpdates | Install-WindowsUpdate -ErrorAction SilentlyContinue
    Write-Host "Other updates installed successfully"
} else {
    Write-Host "No other updates available"
}

Write-Host "Script complete!"