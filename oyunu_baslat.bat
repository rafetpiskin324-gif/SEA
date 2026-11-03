@echo off
chcp 65001 >nul
cd /d "%~dp0"
title SEA OF LEGENDS - Oyun Sunucusu
where py >nul 2>nul
if %errorlevel%==0 goto USE_PY
where python >nul 2>nul
if %errorlevel%==0 goto USE_PYTHON
echo.
echo HATA: Python bilgisayarda bulunamadi.
echo Python kurulu degilse python.org adresinden Python 3 kurun.
echo Kurulumda "Add Python to PATH" secenegini isaretleyin.
echo.
pause
exit /b 1
:USE_PY
start "SEA OF LEGENDS SERVER" cmd /k "cd /d "%~dp0" ^&^& py -m http.server 8000"
goto WAIT
:USE_PYTHON
start "SEA OF LEGENDS SERVER" cmd /k "cd /d "%~dp0" ^&^& python -m http.server 8000"
:WAIT
timeout /t 3 /nobreak >nul
start "" "http://127.0.0.1:8000/sea_of_legends.html"
echo.
echo Oyun sunucusu ayri pencerede acik kalmalidir.
echo Oyunu kapatirken sunucu penceresini de kapatabilirsiniz.
exit /b
