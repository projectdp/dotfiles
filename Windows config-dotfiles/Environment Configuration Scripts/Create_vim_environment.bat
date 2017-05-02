@echo off

echo ###############################################################################
echo #                           Set up vim environment                            #
echo ###############################################################################
echo.
set home=%USERPROFILE%
set dirvar=%USERPROFILE%\vimfiles

:: Checks for .vimrc
if exist %home%\_vimrc (
move %home%\_vimrc %home%\.vimrc
echo _vimrc detected, renamed to .vimrc
)

if exist %home%\.vimrc (
echo A .vimrc file already exists. Skipping.
)

if not exist %home%\.vimrc (
move "%~dp0\..\..\.vimrc" %home%
echo moved .vimrc to user's home folder.
)

:: Check for vimfiles path
if exist %dirvar% (
echo "%dirvar%" already exists.
)

:: Create vimfiles paths
if not exist %dirvar% (
mkdir %dirvar%
mkdir %dirvar%\backup
mkdir %dirvar%\colors
mkdir %dirvar%\fonts
mkdir %dirvar%\syntax
mkdir %dirvar%\temp
echo "%dirvar%" created.
echo "%dirvar%\backup" created.
echo "%dirvar%\colors" created.
echo "%dirvar%\fonts" created.
echo "%dirvar%\syntax" created.
echo "%dirvar%\temp" created.
)

:: Check for herald color scheme
if exist %dirvar%\colors\herald.vim (
echo "%dirvar%\colors\herald.vim" already exists.
)

:: Download the herald vimfile (https://h3rald.com/herald-vim-color-scheme/ for more information)
if not exist %dirvar%\colors\herald.vim (
    powershell -Command "Invoke-WebRequest https://h3rald.com/files/herald.vim -OutFile %dirvar%\colors\herald.vim"
    echo Downloaded herald.vim to %dirvar%\colors\herald.vim
    )
echo.
pause
