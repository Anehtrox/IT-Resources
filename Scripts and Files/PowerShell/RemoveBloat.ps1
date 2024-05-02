# List of Microsoft bloatware apps to remove
$microsoftBloatwareApps = @(
    "Microsoft.3DBuilder"
    "Microsoft.BingWeather"
    "Microsoft.DesktopAppInstaller"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MicrosoftStickyNotes"
    "Microsoft.MixedReality.Portal"
    "Microsoft.MixedReality.Portal"
    "Microsoft.Office.OneNote"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.SkypeApp"
    "Microsoft.StorePurchaseApp"
    "Microsoft.VP9VideoExtensions"
    "Microsoft.Wallet"
    "Microsoft.WebMediaExtensions"
    "Microsoft.Windows.Photos"
    "Microsoft.WindowsAlarms"
    "Microsoft.WindowsCalculator"
    "Microsoft.WindowsCamera"
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.WindowsStore"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxApp"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.YourPhone"
)

# List of HP bloatware apps to remove
$hpBloatwareApps = @(
    "HPInc.-HPSystemEventUtility"
    "HPInc.-HPAudioSwitch"
    "HPInc.-HPConnectionOptimization"
    "HPInc.-HPDocumentation"
    "HPInc.-HPJumpStartApps"
    "HPInc.-HPJumpStartBridge"
    "HPInc.-HPJumpStartProvider"
    "HPInc.-HPSupportAssistant"
)

# List of Dell bloatware apps to remove
$dellBloatwareApps = @(
    "DellInc.DellSupportAssistAgent"
    "DellInc.DellSupportCenter"
    # Add more Dell bloatware apps here
)

# Function to remove bloatware apps
function Remove-Bloatware {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$apps
    )

    foreach ($app in $apps) {
        Write-Host "Uninstalling $app..."
        Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq $app} | Remove-AppxPackage
    }
}

# Remove Microsoft bloatware
Remove-Bloatware -apps $microsoftBloatwareApps

# Remove HP bloatware
Remove-Bloatware -apps $hpBloatwareApps

# Remove Dell bloatware
Remove-Bloatware -apps $dellBloatwareApps

Write-Host "Bloatware removal completed."
