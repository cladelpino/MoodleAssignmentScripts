@echo off
setlocal EnableDelayedExpansion
chcp 65001

REM get nFiles in pool and fill "array".
set cnt=0
for %%A in (.\Pool\*) do (
	set "arr[!cnt!]=%%A"
	set /a cnt+=1
)

echo File count = %cnt%

REM for each folder draw a random number and call the assignment function.
for /f "delims=" %%f in ('dir .\Students\ /b /ad') do (
	set beb=.\Students\^"%%f^"
	echo !beb!
	SET /A test=!RANDOM! * %cnt% / 32768
	call :Foo !beb! !test!
)

goto End

:Foo
echo %1
echo %2
set "rout=!arr[%2]!"
echo %rout%
IF NOT %1 == "Pool" copy "%rout%" %1
goto :eof

:End
pause