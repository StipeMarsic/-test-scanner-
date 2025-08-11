@echo off
title Test Scanner - Instalacija APK
color 0B

echo ========================================
echo    TEST SCANNER - INSTALACIJA APK
echo ========================================
echo.
echo Ova skripta će kreirati APK datoteku i instalirati je na mobitel.
echo.

echo PRIJE POČETKA:
echo 1. Povežite Android mobitel s računalom preko USB-a
echo 2. Omogućite USB debugging u Developer options
echo 3. Omogućite "Nepoznati izvori" u Postavke > Sigurnost
echo.

set /p confirm="Jeste li spremni? (y/n): "
if /i not "%confirm%"=="y" (
    echo Instalacija otkazana.
    pause
    exit /b 0
)

echo.
echo Provjera Flutter instalacije...
flutter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo GREŠKA: Flutter nije instaliran!
    echo Molimo instalirajte Flutter SDK s: https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)

echo Flutter je instaliran.
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

echo Provjera povezanih uređaja...
flutter devices
echo.

echo Izgradnja APK datoteke...
flutter build apk --release
if %errorlevel% neq 0 (
    echo GREŠKA: Neuspješna izgradnja APK!
    pause
    exit /b 1
)

echo APK je uspješno kreiran!
echo.

echo Instalacija na mobitel...
flutter install
if %errorlevel% neq 0 (
    echo UPOZORENJE: Automatska instalacija nije uspjela.
    echo.
    echo RUČNA INSTALACIJA:
    echo 1. Pronađite APK datoteku u: build/app/outputs/flutter-apk/app-release.apk
    echo 2. Kopirajte je na mobitel (USB, email, cloud, itd.)
    echo 3. Na mobitelu tapnite na APK datoteku za instalaciju
    echo.
    echo Ili pokušajte s ADB komandom:
    echo adb install build/app/outputs/flutter-apk/app-release.apk
else
    echo APK je uspješno instaliran na mobitel!
    echo.
    echo Pokretanje aplikacije...
    flutter run --release
)

echo.
echo Instalacija završena!
echo APK datoteka se nalazi u: build/app/outputs/flutter-apk/app-release.apk
echo.
pause
