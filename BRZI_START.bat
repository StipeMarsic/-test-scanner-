@echo off
title Test Scanner - Brzi Start
color 0A

echo ========================================
echo    TEST SCANNER - BRZI START
echo ========================================
echo.
echo Ova skripta će automatski:
echo 1. Provjeriti Flutter instalaciju
echo 2. Instalirati ovisnosti
echo 3. Pokrenuti aplikaciju
echo.

echo Provjera Flutter instalacije...
flutter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo GREŠKA: Flutter nije instaliran!
    echo Molimo instalirajte Flutter SDK s: https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)

echo Flutter je instaliran. Nastavljam...
echo.

echo Instalacija ovisnosti...
flutter pub get
if %errorlevel% neq 0 (
    echo GREŠKA: Neuspješna instalacija ovisnosti!
    pause
    exit /b 1
)

echo Ovisnosti su instalirane.
echo.

echo Provjera dostupnih uređaja...
flutter devices
echo.

echo Pokretanje aplikacije...
echo Ako imate povezan uređaj, aplikacija će se pokrenuti na njemu.
echo Inače će se pokrenuti u emulatoru ili vas uputiti kako povezati uređaj.
echo.

flutter run

echo.
echo Aplikacija je završila s radom.
pause
