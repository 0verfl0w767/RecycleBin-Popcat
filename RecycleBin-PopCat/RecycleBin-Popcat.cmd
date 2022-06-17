@echo off

title RecycleBin-Popcat

echo.
echo            888                                               .d8888b.   .d8888b.  
echo          888                                               d88P  Y88b d88P  Y88b 
echo         888                                                     .d88P 888        
echo     .d88888  .d88b.  888  888        888  888 .d8888b         8888"  888d888b.  
echo   d88" 888 d8P  Y8b 888  888       888  888 88K               "Y8b. 888P "Y88b 
echo  888  888 88888888 Y88  88P      888  888 "Y8888b.      888    888 888    888 
echo  Y88b 888 Y8b.      Y8bd8P       Y88b 888      X88      Y88b  d88P Y88b  d88P 
echo  "Y88888  "Y8888    Y88P         "Y88888  88888P'       "Y8888P"   "Y8888P"  
echo                                     888                                       
echo                               Y8b d88P                                       
echo                                "Y88P"                                        
echo.
echo Author: dev-ys-36 ^| Sahmyook Univ. CE. 22.
echo Github: dev-ys-36 ^| https://github.com/dev-ys-36/RecycleBin-Popcat
echo License: MIT ^| https://github.com/dev-ys-36/RecyleBin-Popcat/blob/main/LICENSE
echo ReadMe: HOW TO USE ^| https://github.com/dev-ys-36/RecyleBin-Popcat/blob/main/README.md
echo Version: 1.0.0v ^| First Released.
echo.
echo The copyright indication and this authorization indication shall be
echo recorded in all copies or in important parts of the Software.
echo.

echo.
echo.
echo This program lets you change the RecycleBin icon!
echo.

for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
)
echo %ESC%[100mDefault Setting: 1 or Popcat Setting: 2%ESC%[0m
echo.

for /f "tokens=4-7 delims=[.] " %%i in ('ver') do (if %%i==Version (set version=%%j.%%k) else (set version=%%i.%%j))

IF %version% neq 10.0 goto BlockVersion

set /p mode=Input your setting (number): 

IF %mode% equ 1 goto DefaultSetting
IF %mode% equ 2 goto PopcatSetting

echo Your setting is %mode%, Unknown Mode.
echo Exits in 5 seconds.
echo.
echo.
timeout 5 >nul
exit

:BlockVersion
echo.
echo.
echo This program has only been tested in Windows 10 versions, so you cannot run any further versions.
echo Exits in 5 seconds.
echo.
echo.
timeout 5 >nul
exit

:DefaultSetting
echo.
echo Your setting is %mode%, DefaultSetting Mode.
echo.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /v "empty" /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\imageres.dll,-55" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /v "full" /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\imageres.dll,-54" /f
echo.
echo.
echo The operation completed successfully. Go to the desktop and do F5. Or Click the RecycleBin.
echo %ESC%[100mMode: Default%ESC%[0m
echo Exits in 5 seconds.
echo.
echo.
timeout 5 >nul
exit

:PopcatSetting
echo.
echo Your setting is %mode%, PopcatSetting Mode.
echo.
echo.
mkdir %USERPROFILE%\icon
xcopy icon %USERPROFILE%\icon
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /v "empty" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\icon\2.ico,0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /v "full" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\icon\1.ico,0" /f
echo.
echo.
echo The operation completed successfully. Go to the desktop and do F5. Or Click the RecycleBin.
echo %ESC%[100mMode: Popcat%ESC%[0m
echo Exits in 5 seconds.
echo.
echo.
timeout 5 >nul
exit

pause>nul