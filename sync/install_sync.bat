@echo off
:: Creates a startup shortcut so MicroSlate Sync runs on every login.
:: Double-click this file to install. Run uninstall_sync.bat to remove.

set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "SCRIPT=%~dp0microslate_sync.py"

:: Create a VBS helper to make the shortcut (avoids PowerShell execution policy issues)
set "VBS=%TEMP%\microslate_shortcut.vbs"
> "%VBS%" echo Set ws = CreateObject("WScript.Shell")
>>"%VBS%" echo Set s = ws.CreateShortcut("%STARTUP%\MicroSlate Sync.lnk")
>>"%VBS%" echo s.TargetPath = "pythonw.exe"
>>"%VBS%" echo s.Arguments = """%SCRIPT%"""
>>"%VBS%" echo s.Save
cscript //nologo "%VBS%"
del "%VBS%"

echo.
echo MicroSlate Sync will now start automatically on login.
echo Shortcut created in: %STARTUP%
echo.
echo To start it right now, run: python "%SCRIPT%"
echo.
pause
