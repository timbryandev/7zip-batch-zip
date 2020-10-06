@echo off
echo.

echo Ignore the UNC error above if running from a mapped drive with an absolute path
echo.

REM #TB 04/08/2017
REM Before the console can complain, `pushd` creates an alias for the UNC path and `cd`s to it
pushd "%~dp0"

REM For each folder in this dir
REM  Launch 7zip and tell it to zip the folders content in the root of the zip
REM  Use the folders name as the name for the archive
for /d %%a in (*) do ("c:\Program Files\7-Zip\7z.exe" a -r -tzip "%%~na.zip" ".\%%a\*")

REM Now the popd should remove that alias we made - otherwise it could get messy using this tool in many locations
popd
echo.

pause & exit
