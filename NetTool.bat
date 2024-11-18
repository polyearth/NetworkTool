@echo off
title Interneta Savienojums
echo Interneta informacijas ielade.....
:loop
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "SSID" ^| findstr /v "BSSID"') do set ssid=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Description"') do set adapter=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "State"') do set state=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Signal"') do set signal=%%a
for /f "tokens=4 delims==" %%a in ('ping -n 2 8.8.8.8 ^| find "Average"') do set ping=%%a
for /f "tokens=2" %%a in ('netstat -e ^| find "Bytes"') do (
    set /a rbytes=%%a
)

for /f "tokens=3" %%b in ('netstat -e ^| find "Bytes"') do (
    set /a sbytes=%%b
)

cls
echo Internets:
echo ----------
echo SSID:%ssid%
echo NIC:%adapter%
echo State:%state%
echo Signal:%signal%
echo.
echo Atrums:
echo -------
echo Ping:%ping%
echo Sanemti: %rbytes% bytes
echo Aizsutiti: %sbytes% bytes
goto loop
