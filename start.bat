@echo off
setlocal enabledelayedexpansion
set countArtifact=0
set countServer=0

for /d %%d in ([ARTIFACT]/*) do (
    if /i not "%%d"=="txData" (
        set /a countArtifact=countArtifact+1
        set choiceArtifact[!countArtifact!]=%%d
    )
)

echo.
echo Select ARTIFACT:
echo.

for /l %%d in (1,1,!countArtifact!) do (
    echo %%d: !choiceArtifact[%%d]!
)
echo.

set /p selectArtifact=?
echo.

echo You chose !choiceArtifact[%selectArtifact%]!

echo.
echo.

for /d %%d in ([SERVER]/*) do (
    set /a countServer=countServer+1
    set choiceServer[!countServer!]=%%d
)

echo.
echo Select SERVER:
echo.

for /l %%d in (1,1,!countServer!) do (
    echo %%d: !choiceServer[%%d]!
)
echo.

set /p selectServer=?
echo.

echo You chose !choiceServer[%selectServer%]!

"%cd%""/[ARTIFACT]/"!choiceArtifact[%selectArtifact%]!"//FXServer.exe" +set serverProfile !choiceServer[%selectServer%]!

pause
