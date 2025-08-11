@echo off
echo ========================================
echo INSTALACIJA OVISNOSTI
echo ========================================
echo.

echo 1. Ulazak u direktorij projekta:
cd /d "%~dp0"
echo Trenutni direktorij: %CD%
echo.

echo 2. Instalacija Flutter ovisnosti:
flutter pub get
echo.

echo 3. Provjera instalacije:
flutter pub deps
echo.

echo ========================================
echo INSTALACIJA ZAVRŠENA
echo ========================================
pause
