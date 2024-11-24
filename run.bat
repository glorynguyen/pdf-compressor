@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------   
rem create a variable to store the log file name
set "logFile=log.txt"

rem write the date and time of the execution to the log file
echo [%DATE% %TIME%] Starting the batch file >> "%logFile%" 2>&1

rem check if the user provided an input file as an argument
if "%~1" == "" goto NOINPUT

rem get the file name without extension from the input file argument
set "fName=%~n1"

rem get the file extension from the input file argument
set "fExt=%~x1"

rem concatenate the file name, the "-output" suffix, and the file extension to form the output file name
set "output=%fName%-output%fExt%"

rem write the output file path to the log file
echo Output file: "%output%" >> "%logFile%" 2>&1

rem run the gswin64.exe command with the input and output file parameters and log the output
"C:\Program Files\gs\gs10.04.0\bin\gswin64.exe" -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="%output%" "%~1" >> "%logFile%" 2>&1

rem write the input file path to the log file
echo Input file: "%~1" >> "%logFile%" 2>&1
goto END

:NOINPUT
rem call the filechooser.vbs file using cscript.exe and log the output
for /f "delims=" %%I in ('cscript //nologo filechooser.vbs') do set "input=%%I"
@REM set "input=C:\Program Files\gs\gs10.04.0\bin\test.pdf"

rem check if the user canceled the dialog
if "%input%" == "" goto CANCEL
rem split the input file string by \ and get the last index
for %%a in ("%input%") do set "fName1=%%~nxa"
for /f "delims=." %%a in ("%fName1%") do set "fName=%%a"
setlocal enabledelayedexpansion
set "input1=%input%"
set "text=%fName%.pdf"
set "input1=!input1:%text%=!"
for /f "delims=" %%a in ("%input1%") do (
set "firstpart=%%a"
)
set "output=%firstpart%%fName%-compressed.pdf"

rem write the output file path to the log file
echo Output file: "%output%" >> "%logFile%" 2>&1

rem write the input file path to the log file
echo Input file: "%input%" >> "%logFile%" 2>&1

rem run the gswin64.exe command with the input and output file parameters and log the output
"C:\Program Files\gs\gs10.04.0\bin\gswin64.exe" -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="%output%" "%input%" >> "%logFile%" 2>&1
goto END

:CANCEL
rem write a custom message to the log file
echo [%DATE% %TIME%] No file was selected >> "%logFile%" 2>&1
rem exit the batch file with an error message
echo No file was selected.
goto END

:END
rem write the end of the execution to the log file
echo [%DATE% %TIME%] Finished the batch file >> "%logFile%" 2>&1
@REM "C:\Program Files\gs\gs10.04.0\bin\gswin64.exe" -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="C:\Program Files\gs\gs10.04.0\bin\converted.pdf" "C:\Program Files\gs\gs10.04.0\bin\input.pdf"