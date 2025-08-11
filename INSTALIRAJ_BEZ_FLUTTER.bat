@echo off
title Test Scanner - Instalacija bez Flutter-a
color 0C

echo ========================================
echo    TEST SCANNER - INSTALACIJA BEZ FLUTTER-a
echo ========================================
echo.
echo Budući da Flutter nije instaliran, evo alternativnih načina
echo za instalaciju Test Scanner aplikacije na mobitel:
echo.

echo OPCIJA 1: INSTALACIJA FLUTTER-a
echo ================================
echo 1. Preuzmite Flutter SDK s: https://flutter.dev/docs/get-started/install/windows
echo 2. Raspakujte u C:\flutter
echo 3. Dodajte C:\flutter\bin u PATH varijablu
echo 4. Pokrenite flutter doctor
echo 5. Zatim pokrenite BRZI_START.bat
echo.

echo OPCIJA 2: PREUZIMANJE APK-a (PREPORUČENO)
echo ==========================================
echo Ako ne želite instalirati Flutter, možete:
echo 1. Preuzeti gotov APK s: https://github.com/flutter/flutter/releases
echo 2. Ili koristiti online Flutter build servis
echo 3. Ili me kontaktirati za gotov APK
echo.

echo OPCIJA 3: ONLINE BUILD
echo =======================
echo Možete koristiti online servise za izgradnju APK-a:
echo - Codemagic: https://codemagic.io/
echo - GitHub Actions
echo - Bitrise
echo.

echo OPCIJA 4: DOCKER (za napredne korisnike)
echo =========================================
echo docker run --rm -v %cd%:/app -w /app cirrusci/flutter:stable flutter build apk
echo.

echo ŠTO ŽELITE RADITI?
echo.
echo 1. Instalirati Flutter SDK
echo 2. Preuzeti gotov APK
echo 3. Koristiti online build servis
echo 4. Izlaz
echo.

set /p choice="Unesite broj (1-4): "

if "%choice%"=="1" goto install_flutter
if "%choice%"=="2" goto download_apk
if "%choice%"=="3" goto online_build
if "%choice%"=="4" goto exit
goto menu

:install_flutter
echo.
echo ========================================
echo INSTALACIJA FLUTTER SDK-a
echo ========================================
echo.
echo Koraci za instalaciju:
echo.
echo 1. Preuzmite Flutter SDK:
echo    https://flutter.dev/docs/get-started/install/windows
echo.
echo 2. Raspakujte u C:\flutter
echo.
echo 3. Dodajte u PATH:
echo    - Otvorite System Properties (Win + R, sysdm.cpl)
echo    - Environment Variables > System variables > Path > Edit
echo    - Dodajte: C:\flutter\bin
echo.
echo 4. Zatvorite Command Prompt i otvorite novi
echo.
echo 5. Pokrenite: flutter doctor
echo.
echo 6. Zatim pokrenite BRZI_START.bat
echo.
pause
goto menu

:download_apk
echo.
echo ========================================
echo PREUZIMANJE APK-a
echo ========================================
echo.
echo Nažalost, trenutno nemam gotov APK za preuzimanje.
echo.
echo Preporučujem da:
echo 1. Instalirate Flutter SDK (opcija 1)
echo 2. Ili koristite online build servis (opcija 3)
echo.
pause
goto menu

:online_build
echo.
echo ========================================
echo ONLINE BUILD SERVISI
echo ========================================
echo.
echo Možete koristiti sljedeće servise:
echo.
echo 1. Codemagic (https://codemagic.io/):
echo    - Besplatan za javne projekte
echo    - Automatska izgradnja APK-a
echo.
echo 2. GitHub Actions:
echo    - Kreirajte .github/workflows/flutter.yml
echo    - Automatska izgradnja na push
echo.
echo 3. Bitrise:
echo    - Besplatan tier dostupan
echo    - Jednostavna konfiguracija
echo.
echo 4. FlutterFlow:
echo    - Online Flutter builder
echo    - Izvoz u APK format
echo.
pause
goto menu

:exit
echo.
echo Hvala na korištenju Test Scanner instalacijskog programa!
echo.
pause
exit
