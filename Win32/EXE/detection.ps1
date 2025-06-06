$File = Test-Path -Path "PATH\TO\INSTALLED\EXE" -ErrorAction SilentlyContinue
$version = "[APP-VERSION]"
$EXEPath = "PATH\TO\INSTALLED\EXE"

# Don't edit beyond this point
if ($file -ne $false) {
    $file_version = (get-item "$EXEPath").VersionInfo
    if ($file_version.FileVersion -ge $version) {
        Write-Host "Found it!"
    }
}
