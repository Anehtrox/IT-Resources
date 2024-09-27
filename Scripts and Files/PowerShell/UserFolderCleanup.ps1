#Requires -RunAsAdministrator

# Set the path to the users folder
$usersFolder = "C:\Users"

# Set the threshold for the maximum allowed size (e.g. 5 GB)
$threshold = 5368709120 # 5 GB in bytes

# Loop through each user folder
Get-ChildItem -Path $usersFolder -Directory | ForEach-Object {
    $userFolder = $_
    TakeOwn -Path $userFolder.FullName -Force
    $folderSize = (Get-ChildItem -Path $userFolder.FullName -Recurse | Measure-Object -Property Length -Sum).Sum

    # Check if the folder size exceeds the threshold
    if ($folderSize -gt $threshold) {
        Write-Host "Removing user folder $($userFolder.Name) as it exceeds the maximum allowed size of $($threshold / 1GB) GB"
        
        # Prompt for confirmation
        $response = Read-Host "Are you sure you want to delete this folder? (y/n)"
        if ($response -eq "y") {
            try {
                Remove-Item -Path $userFolder.FullName -Force -Recurse
                Write-Host "Folder deleted successfully"
                # Log the deletion
                Add-Content -Path "C:\Logs\DeletedFolders.log" -Value "Deleted folder $($userFolder.Name) on $(Get-Date)"
            } catch {
                Write-Host "Error deleting folder: $($Error[0].Message)"
            }
        } else {
            Write-Host "Deletion cancelled"
        }
    }
}
