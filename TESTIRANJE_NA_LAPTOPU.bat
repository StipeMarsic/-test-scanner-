@echo off
title Test Scanner - Testiranje na Laptopu
color 0C

echo ========================================
echo    TEST SCANNER - TESTIRANJE NA LAPTOPU
echo ========================================
echo.
echo Ova skripta će vas voditi kroz testiranje
echo Test Scanner aplikacije na vašem laptopu.
echo.

echo Koju opciju želite koristiti?
echo.
echo 1. Flutter Web (NAJBRŽA - u browseru)
echo 2. Android Emulator (Android Studio)
echo 3. BlueStacks (Android emulator)
echo 4. Windows Subsystem for Android (WSA)
echo 5. Provjeri Flutter instalaciju
echo 6. Izlaz
echo.

set /p choice="Unesite broj (1-6): "

if "%choice%"=="1" goto flutter_web
if "%choice%"=="2" goto android_emulator
if "%choice%"=="3" goto bluestacks
if "%choice%"=="4" goto wsa
if "%choice%"=="5" goto check_flutter
if "%choice%"=="6" goto exit
goto menu

:flutter_web
echo.
echo ========================================
echo    FLUTTER WEB - TESTIRANJE
echo ========================================
echo.
echo Provjera Flutter instalacije...
flutter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo GREŠKA: Flutter nije instaliran!
    echo.
    echo Molimo instalirajte Flutter SDK s:
    echo https://flutter.dev/docs/get-started/install
    echo.
    pause
    goto menu
)

echo Flutter je instaliran. Nastavljam...
echo.

echo Pokretanje Flutter web aplikacije...
echo Ovo će otvoriti aplikaciju u vašem browseru.
echo.

cd /d "%~dp0"
flutter run -d chrome

echo.
echo Aplikacija je pokrenuta u browseru!
echo.
echo Što možete testirati:
echo - Kamera funkcionalnost (web kamera)
echo - Upload slika testova
echo - OCR prepoznavanje teksta
echo - AI analiza odgovora
echo - Grade calculation
echo.
pause
goto menu

:android_emulator
echo.
echo ========================================
echo    ANDROID EMULATOR - SETUP
echo ========================================
echo.
echo Da biste koristili Android emulator:
echo.
echo 1. Instalirajte Android Studio
echo    - Preuzmite s: https://developer.android.com/studio
echo    - Instalirajte (besplatno)
echo.
echo 2. Kreirajte emulator
echo    - Pokrenite Android Studio
echo    - Tools > AVD Manager
echo    - Create Virtual Device
echo    - Odaberite Pixel 4 + API 30
echo.
echo 3. Pokrenite emulator
echo    - Kliknite play dugme
echo    - Sačekajte 2-3 minute
echo.
echo 4. Instalirajte APK
echo    - adb install app-release.apk
echo.
echo Želite li da vas vodim kroz proces?
set /p guide="(d/n): "
if /i "%guide%"=="d" (
    echo.
    echo Otvaranje Android Studio download stranice...
    start https://developer.android.com/studio
    echo.
    echo Nakon instalacije Android Studio-a, vratite se ovdje
    echo i pokrenite emulator.
)
echo.
pause
goto menu

:bluestacks
echo.
echo ========================================
echo    BLUESTACKS - ANDROID EMULATOR
echo ========================================
echo.
echo BlueStacks je besplatan Android emulator.
echo.
echo Koraci za instalaciju:
echo.
echo 1. Preuzmite BlueStacks
echo    - Idite na: https://www.bluestacks.com
echo    - Kliknite "Download BlueStacks"
echo.
echo 2. Instalirajte BlueStacks
echo    - Pokrenite installer
echo    - Slijedite upute
echo.
echo 3. Pokrenite BlueStacks
echo    - Sačekajte da se pokrene
echo    - Postavite Google račun
echo.
echo 4. Instalirajte APK
echo    - Drag & drop APK u BlueStacks
echo    - Ili koristite APK installer
echo.
echo Želite li da otvorim BlueStacks stranicu?
set /p open="(d/n): "
if /i "%open"=="d" (
    echo.
    echo Otvaranje BlueStacks stranice...
    start https://www.bluestacks.com
)
echo.
pause
goto menu

:wsa
echo.
echo ========================================
echo    WINDOWS SUBSYSTEM FOR ANDROID
echo ========================================
echo.
echo WSA omogućava pokretanje Android aplikacija
echo direktno na Windows 11.
echo.
echo Koraci za instalaciju:
echo.
echo 1. Otvorite Microsoft Store
echo 2. Pretražite "Windows Subsystem for Android"
echo 3. Instalirajte aplikaciju
echo 4. Pokrenite i postavite
echo.
echo 5. Instalirajte APK
echo    - Kopirajte APK u WSA direktorij
echo    - Instalirajte kroz WSA
echo.
echo Napomena: WSA je dostupan samo na Windows 11.
echo.
pause
goto menu

:check_flutter
echo.
echo ========================================
echo    PROVJERA FLUTTER INSTALACIJE
echo ========================================
echo.
echo Provjera Flutter verzije...
flutter --version
echo.

echo Provjera Flutter doctor...
flutter doctor
echo.

echo Provjera dostupnih uređaja...
flutter devices
echo.

echo Ako vidite Chrome u listi uređaja,
echo možete pokrenuti Flutter web verziju.
echo.
pause
goto menu

:exit
echo.
echo Hvala na korištenju Test Scanner testiranja!
echo.
pause
