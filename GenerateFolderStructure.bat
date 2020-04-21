@echo off
setlocal EnableDelayedExpansion
chcp 65001

rem Getting the name of what should be the only csv in the current folder.
for /F "tokens=* USEBACKQ" %%F IN (`ls *.csv`) DO (
	set "var=%%F"
)

echo %var%

rem Detecting length of word used (varies with moodle locale).
for /l %%n in (1 1 30) do (
	set "c=0"
	for /f "usebackq skip=1 tokens=1-4 delims=," %%a  in ("%var%") do (
		set "m=%%a"
		set "nowChar=!m:~%%n,1!"
		IF 1!nowChar! NEQ +1!nowChar! (
			set /a wordSize=%%n+1
		) else (
			call :Process !wordSize!
		)		
	)
)

goto End

:Process
for /f "usebackq skip=1 tokens=1-4 delims=," %%a  in ("%var%") do (
 set "id=%%a"
 echo !id!
 echo %1
 set me=!id:~%1!
 echo !me!
 echo %%b
 call :Maa %%b !me!
)
goto End

:Maa
set name=%1
set name=%name:"=%
set "nfname=%name%_%2_assignsubmission_file_"
mkdir ".\Students\%nfname%"
goto :eof

:End
pause
exit