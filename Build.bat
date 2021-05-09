@echo off
echo Tor Host Service Builder
echo Check is this the working directory:
echo %cd%
echo Deleting old build... (Ignore Errors)
rd /s /q .\Build
set /p torloc=Enter Tor Location:
mkdir Build
echo %torloc%\Browser\TorBrowser\Tor\
xcopy /y /e %torloc%\Browser\TorBrowser\Tor\ .\Build
xcopy /y /e .\Files\ .\Build
echo Complete

set torloc=
set torcd=
pause