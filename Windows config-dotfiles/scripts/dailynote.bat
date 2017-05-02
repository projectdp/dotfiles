@echo off

echo ###############################################################################
echo #                          Create new daily note                              #
echo ###############################################################################
echo.

Set mm=%DATE:~4,2%
Set dd=%DATE:~7,2%
Set yyyy=%DATE:~10,4%
Set wdir=%USERPROFILE%\Desktop\notes
set pvar=%wdir%\"notes %yyyy%-%mm%-%dd%.txt"

if not exist %pvar% echo. 2> %pvar%
start %pvar%
exit
