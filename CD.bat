@echo off
echo Tor Host Service Builder
if [%1]==[] (set /p torver=Enter Tor Version:) else (set torver=%1)
echo Deleting Old Builds...(Ignore Errors)
rd /s /q .\Build
rd /s /q .\Tor
del tor.zip
echo Done
echo Downloading Tor Release...
curl https://dist.torproject.org/torbrowser/%torver%/tor-win32-0.4.5.7.zip --Output tor.zip
.\7z\7za e tor.zip -oTor
mkdir Build
dir
xcopy /y /e .\Tor .\Build
xcopy /y /e .\Files .\Build
echo Cleaning Up...
rd /s /q .\Tor
del tor.zip
.\7z\7za a -tzip Build.zip .\Build -y
echo Complete

set torver=