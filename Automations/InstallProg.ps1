# Ensure the script runs with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script as an administrator."
    exit
}

# Function to install a program using winget
function Install-Program {
    param (
        [string]$programId
    )
    try {
        Write-Host "Installing $programId..."
        winget install -e --id $programId
    } catch {
        Write-Host "Failed to install $programId. Error: $_"
    }
}

# Install WinDirStat
Install-Program "WinDirStat.WinDirStat"

# Install Adobe Acrobat Reader DC
# Note: The winget ID for Adobe Acrobat Reader DC is "Adobe.Acrobat.Reader.64-bit"
Install-Program "Adobe.Acrobat.Reader.64-bit"

# Run Windows Update
Write-Host "Checking for Windows updates..."
try {
    # Import the Update session COM object
    $updateSession = New-Object -ComObject Microsoft.Update.Session
    $updateSearcher = $updateSession.CreateUpdateSearcher()
    
    # Search for updates
    $searchResult = $updateSearcher.Search("IsInstalled=0")
    
    if ($searchResult.Updates.Count -eq 0) {
        Write-Host "No updates available."
    } else {
        Write-Host "$($searchResult.Updates.Count) updates found. Installing updates..."
        
        # Create an update installer
        $updateInstaller = $updateSession.CreateUpdateInstaller()
        $updateInstaller.Updates = $searchResult.Updates
        
        # Install the updates
        $installationResult = $updateInstaller.Install()
        
        Write-Host "Updates installed with result code: $($installationResult.ResultCode)"
    }
} catch {
    Write-Host "Failed to check for or install updates. Error: $_"
}

Write-Host "Script completed."
