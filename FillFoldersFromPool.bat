@echo off
setlocal EnableDelayedExpansion
chcp 65001
set "logFile=file_assignment.log"
rm !logFile!

REM get nFiles in pool and fill "array".
set cnt=0
for %%A in (.\Pool\*) do (
	set "arr[!cnt!]=%%A"
	set /a cnt+=1
)

echo File count = %cnt%
echo Nombre,Archivo>>!logFile!
REM for each folder draw a random number and call the assignment function.
for /f "delims=" %%f in ('dir .\Students\ /b /ad') do (
	set beb=.\Students\^"%%f^"
	set /A test=!RANDOM! * %cnt% / 32768
	call :Foo !beb! !test!
)

goto End

:Foo
for /f "tokens=3 delims=_\" %%a in ("%1%") do (
  set "AF=%%a"
)
set  nowname=%AF:"=%
set "rout=!arr[%2]!"
for /f "tokens=3 delims=\" %%a in ("%rout%") do (
	set nowfile="%%a"
)
echo !nowname!,!nowfile!>>!logFile!
IF NOT %1 == "Pool" copy "%rout%" %1
set "nowroute=%1\!nowfile!"
ren !nowroute! "!nowname!.pdf"
goto :eof

:End
pause
echo File %logFile% contains your information
exit