@echo off
echo Tor Host Service Builder
set torver=%1
del tor.zip
echo Done
echo Downloading Tor Release...
curl https://dist.torproject.org/torbrowser/%torver%/tor-win32-0.4.5.7.zip --Output tor.zip
.\7z\7za e tor.zip -oTor
mkdir Tor_Hosting_Kit
xcopy /y /e .\Tor .\Tor_Hosting_Kit\
xcopy /y /e .\Files .\Tor_Hosting_Kit\
echo Cleaning Up...
rd /s /q .\Tor
del tor.zip
.\7z\7za a -tzip Build.zip .\Tor_Hosting_Kit -y
echo Complete

set torver=
