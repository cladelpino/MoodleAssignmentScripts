@echo off
setlocal EnableDelayedExpansion
chcp 65001

set "logFile=folder_structure.log"

rm !logFile!

rem Getting the name of what should be the only csv in the current folder.
for /F "tokens=* USEBACKQ" %%F IN (`dir /B *.csv`) DO (
	set "var=%%F"
)

mkdir Students

echo %var%
pause

rem Detecting length of word used (varies with moodle locale).
for /l %%n in (1 1 30) do (
	set "c=0"
	for /f "usebackq skip=1 tokens=1-4 delims=," %%a  in ("%var%") do (
		set "m=%%a"
		set "nowChar=!m:~%%n,1!"
		if 1!nowChar! NEQ +1!nowChar! (
			set /a wordSize=%%n+1
		) else (
			echo Wordsize,id,detected,fullname>>!logFile!
			call :Process !wordSize!
		)
	)
)

goto End

:Process
for /f "usebackq skip=1 tokens=1-4 delims=," %%a  in ("%var%") do (
 set "id=%%a"
 set me=!id:~%1!
 echo %1,!id!,!me!,%%b>>!logFile!
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
echo File %logFile% contains your information
pause
exit