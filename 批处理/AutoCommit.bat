@echo off
echo ==========================================
echo =         Aladdin Version 1.0"            =
echo ==========================================

set workDir="dxw.test"
::检查更新的文件
for /f "tokens=1,* delims= " %%i in ('svn status %workDir%') do (
    echo %%i %%j > svnstatus.txt
    setlocal enabledelayedexpansion
    find "@" svnstatus.txt > nul
    if !errorlevel! equ 0 (
        if %%i == ? (svn add -q "%%j@")
        if %%i == ! (svn del -q "%%j@")
    ) else (
        if %%i == ? (svn add -q "%%j")
        if %%i == ! (svn del -q "%%j")
    )
    endlocal
)

set /p text= Input Commit Message:
svn commit -q -m "[AutoCommit] %text%" %workDir%
echo "Commit OK"

pause