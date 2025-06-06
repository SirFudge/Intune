# Creation date = 05-06-2025
# Last update = 05-06-2025
# Created by = SirFudge
# Function = Installation and deinstallation of Microsoft Edge PWA's using register items.

# Define the parameters.
param ($type)

# Set variables.
$AppName = "[App_Name]"
$Path_logs = "$env:Programfiles\_MEM"
$RegPath = "$PSScriptRoot\[File_name].reg"
$RegDelPath = "$PSScriptRoot\[File_name].reg"

# Do not Edit the script beyond this point.
# Start the creation of the transcript.
Start-Transcript -Path "$Path_logs\Log\$AppName-install.log" -Force -Append

# Download & installation of the application using the "Install" parameter.
if ($type -ieq "Install") {
	reg import "$RegPath"
	Exit 0
}

# Uninstall of the application using the "Uninstall" parameter.
elseif ($type -ieq "Uninstall") {
	reg import "$RegDelPath"
	Exit 0
}
# Stop the script if no parameter has been supplied.
else {
	Write-Host "No Parameter has been supplied, please use the parameter Install or Uninstall."
	Write-Host "Exiting the script."
	Exit 1
}
# Stop the creation of the transcript.
Stop-Transcript
