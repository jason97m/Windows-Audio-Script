@(set /p varA=)<DayToPlay.txt
@(set /p varB=)<DayPlayCount.txt
rem @echo %varA%
rem @echo %varB%

if %varB% equ 1 if %varA% lss 96 goto FirstPlay
if %varB% equ 2 if %varA% lss 96 goto SecondPlay
if %varB% equ 1 if %varA% equ 96 goto FirstPlay
if %varB% equ 2 if %varA% equ 96 goto RestartPlay

:FirstPlay

start wmplayer "C:\Users\jason97m\Documents\Batch Script\%varA%.mp3"
set /a varB=%varB%+1
(echo %varB%) >DayPlayCount.txt
timeout /t 180
taskkill /im wmplayer.exe /f
goto Done

:SecondPlay
start wmplayer "C:\Users\jason97m\Documents\Batch Script\%varA%.mp3"
set /a varB=%varB%-1
(echo %varB%) >DayPlayCount.txt
set /a varA=%varA%+1 
(echo %varA%) >DayToPlay.txt
timeout /t 180
taskkill /im wmplayer.exe /f
goto Done

:RestartPlay
start wmplayer "C:\Users\jason97m\Documents\Batch Script\%varA%.mp3"
set /a varB=%varB%-1
(echo %varB%) >DayPlayCount.txt
set /a varA=%varA%-95 
(echo %varA%) >DayToPlay.txt 
timeout /t 180
taskkill /im wmplayer.exe /f
goto Done

:Done
exit
