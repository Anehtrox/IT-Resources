# Set the path to the users folder
$usersFolder = "C:\Users"

# Set the threshold for the maximum allowed size (e.g. 5 GB)
$threshold = 5GB

# Loop through each user folder
Get-ChildItem -Path $usersFolder -Directory | ForEach-Object {
    $userFolder = $_
    $folderSize = (Get-ChildItem -Path $userFolder.FullName -Recurse | Measure-Object -Property Length -Sum).Sum

    # Check if the folder size exceeds the threshold
    if ($folderSize -gt $threshold) {
        Write-Host "Removing user folder $($userFolder.Name) as it exceeds the maximum allowed size of $threshold"
        Remove-Item -Path $userFolder.FullName -Force -Recurse
    }
}