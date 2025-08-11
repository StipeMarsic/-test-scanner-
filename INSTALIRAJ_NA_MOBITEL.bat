@echo off
title Test Scanner - Instalacija na Mobitel
color 0A

echo ========================================
echo    TEST SCANNER - INSTALACIJA NA MOBITEL
echo ========================================
echo.
echo Ova skripta će vas voditi kroz proces instalacije
echo Test Scanner aplikacije na vaš mobitel.
echo.

:menu
echo Odaberite opciju:
echo.
echo 1. Provjeri Flutter instalaciju
echo 2. Instaliraj ovisnosti
echo 3. Instaliraj na Android uređaj
echo 4. Instaliraj na iOS uređaj (samo macOS)
echo 5. Ručna instalacija APK
echo 6. Izlaz
echo.
set /p choice="Unesite broj (1-6): "

if "%choice%"=="1" goto check_flutter
if "%choice%"=="2" goto install_deps
if "%choice%"=="3" goto android_install
if "%choice%"=="4" goto ios_install
if "%choice%"=="5" goto manual_install
if "%choice%"=="6" goto exit
goto menu

:check_flutter
echo.
echo ========================================
echo PROVJERA FLUTTER INSTALACIJE
echo ========================================
call check_flutter.bat
goto menu

:install_deps
echo.
echo ========================================
echo INSTALACIJA OVISNOSTI
echo ========================================
call install_dependencies.bat
goto menu

:android_install
echo.
echo ========================================
echo INSTALACIJA NA ANDROID
echo ========================================
echo.
echo PRIJE INSTALACIJE:
echo 1. Povežite Android uređaj s računalom preko USB-a
echo 2. Omogućite USB debugging u Developer options
echo 3. Omogućite "Nepoznati izvori" u Postavke > Sigurnost
echo.
pause
call build_android.bat
goto menu

:ios_install
echo.
echo ========================================
echo INSTALACIJA NA iOS
echo ========================================
echo.
echo NAPOMENA: Ova opcija zahtijeva macOS i Xcode!
echo.
pause
call build_ios.bat
goto menu

:manual_install
echo.
echo ========================================
echo RUČNA INSTALACIJA
echo ========================================
echo.
echo Otvaram upute za ručnu instalaciju...
start notepad manual_install_guide.txt
goto menu

:exit
echo.
echo Hvala na korištenju Test Scanner instalacijskog programa!
echo.
pause
exit
