@echo off

echo ###############################################################################
echo #                          Set up notes environment                           #
echo ###############################################################################
echo.
:: Add scripts and utilities to PATH variable.
set PATH=%PATH%;%USERPROFILE%\scripts\;%USERPROFILE%\scripts\utils

if exist %USERPROFILE%\Desktop\notes (
echo "%USERPROFILE%\Desktop\notes" Folder exists.
)

if not exist %USERPROFILE%\Desktop\notes (
mkdir %USERPROFILE%\Desktop\notes
)

:: Create "Note" shortcut on Desktop.
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Note.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%USERPROFILE%\scripts\dailynote.bat" >> %SCRIPT%
echo oLink.IconLocation = "%SystemRoot%\system32\SHELL32.dll, 69" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%

pause
