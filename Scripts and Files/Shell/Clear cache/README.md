# MacOS Troubleshooting Scripts

All scripts below will help with general troubleshooting of mac and reduce friction. 

To use the script simply copy the below code into Terminal, note: you will need to Alt + Right Click and select copy as pathname to get <Path_to_script>.

## Make Script Executable (Mac)
All scripts are that provided as Shell (.sh) can be made executable and setup so that they can be opened to run on mac:
1. Open a Terminal or Command Prompt in scripts folder
2. chmod u+x FileName.sh
3. Change the .sh exetension to .command
4. Run your script on a Test Device to verify results

## Clear Cache

Clears all cache locations, MacOS will automatically rebuild on reboot.

Copy all text below into Terminal:

<Path_to_script>/ClearCache.sh

You will be prompted for the local machine password.
**Once Complete you will need to restart the device**
