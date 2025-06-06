# Creation date = 03-12-2024
# Last update = 03-12-2024
# Created by = SirFudge
# Function = Installation and deinstallation of programs using exe files stored in the intunewin/scriptroot.

# Define the parameters.
param ($type)

# Set variables.
$AppName = "[APPNAME]"
$Path_logs = "$env:Programfiles\_MEM"
$FilePath = "$PSScriptRoot\[EXE in file folder]"
$InstallArgumentList = "/install /silent /norestart" # Might need to edit this, usualy the same parameters are used
$UninstallArgumentList = "/uninstall /silent /norestart" # Might need to edit this, usualy the same parameters are used
$UnistallerPath = "$PSScriptRoot\[EXE in file folder]" 

# Do not Edit the script beyond this point.
# Start the creation of the transcript.
Start-Transcript -Path "$Path_logs\Log\$AppName-install.log" -Force -Append

# Download & installation of the application using the "Install" parameter.
if ($type -ieq "Install") {
		# Start silent uninstall of the application to ensure the right version gets installed.
		Write-Host "Starting deinstallation of $AppName."
		Start-Process -FilePath "$UnistallerPath" -ArgumentList "$UninstallArgumentList" -Wait
		Write-Host "$AppName has been uninstalled."
		# Run the EXE file of the program to start installation.
		Write-Host "Starting installation of $AppName."
		Start-Process -FilePath "$FilePath" -ArgumentList "$InstallArgumentList" -Wait
		Write-Host "$AppName has been Installed."
		Exit 0
	}

# Uninstall of the application using the "Uninstall" parameter.
elseif ($type -ieq "Uninstall") {
	# Start silent uninstall of the application
	Start-Process -FilePath "$UnistallerPath" -ArgumentList "$UninstallArgumentList" -Wait
	Write-Host "$AppName has been uninstalled."
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
