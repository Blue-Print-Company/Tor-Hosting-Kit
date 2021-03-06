@echo off
echo Tor Host Service Builder
if [%1]==[] (set /p torver=Enter Tor Version:) else (set torver=%1)
echo Deleting Old Builds...(Ignore Errors)
rd /s /q .\Tor_Hosting_Kit
rd /s /q .\Tor
del tor.zip
echo Done
echo Downloading Tor Release...
curl https://dist.torproject.org/torbrowser/%torver%/tor-win32-0.4.5.9.zip --Output tor.zip
.\7z\7za e tor.zip -oTor
mkdir Tor_Hosting_Kit
xcopy /y /e .\Tor\ .\Tor_Hosting_Kit\
xcopy /y /e .\Files\ .\Tor_Hosting_Kit\
echo Cleaning Up...
rd /s /q .\Tor
del tor.zip
echo Complete

set torver=
pause
