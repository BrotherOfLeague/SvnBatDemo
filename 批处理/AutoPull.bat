@echo off
echo ==========================================
echo =         Aladdin Version 1.0"            =
echo ==========================================

set workDir="dxw.test"

@echo updating from Server
svn update %workDir%

pause

svn 