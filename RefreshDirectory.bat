@echo off
REM This batch file is used to create a mirror of the Lichdom mod and its files
REM in a separate directory, which makes generating the BSA archive much easier
REM as well as provides a backup of the files.

REM Path to the Skyrim Data directory
SET Skyrim=C:\Program Files (x86)\Steam\steamapps\common\skyrim\Data

REM Copy the .ESP file
ECHO Copying .ESP file...
XCOPY "%Skyrim%\Lichdom.esp" "%CD%\Lichdom.esp" /v /q /y

REM Now get the scripts
REM Compiled scripts
ECHO Copying compiled .PEX files...
XCOPY "%Skyrim%\scripts\Lich_*" "%CD%\scripts\" /v /q /y
XCOPY "%Skyrim%\scripts\QF_Lich_*" "%CD%\scripts\" /v /q /y
REM Script sources
ECHO Copying source .PSC files...
XCOPY "%Skyrim%\scripts\Source\Lich_*" "%CD%\scripts\Source\" /v /q /y
XCOPY "%Skyrim%\scripts\Source\QF_Lich_*" "%CD%\scripts\Source\" /v /q /y

PAUSE
