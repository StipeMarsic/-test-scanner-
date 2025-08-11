@echo off
title Test Scanner - Rješavanje Problema
color 0E

echo ========================================
echo    TEST SCANNER - RJEŠAVANJE PROBLEMA
echo ========================================
echo.
echo Ova skripta će vam pomoći riješiti
echo probleme s Test Scanner aplikacijom.
echo.

echo Koji problem imate?
echo.
echo 1. Mapa "2" ne postoji
echo 2. Flutter nije instaliran
echo 3. Instaliraj BlueStacks (NAJBRŽA)
echo 4. Instaliraj Android Studio
echo 5. Provjeri sve probleme
echo 6. Izlaz
echo.

set /p choice="Unesite broj (1-6): "

if "%choice%"=="1" goto create_folder
if "%choice%"=="2" goto install_flutter
if "%choice%"=="3" goto install_bluestacks
if "%choice%"=="4" goto install_android_studio
if "%choice%"=="5" goto check_all
if "%choice%"=="6" goto exit
goto menu

:create_folder
echo.
echo ========================================
echo    KREIRANJE MAPE "2" NA DESKTOPU
echo ========================================
echo.
echo Kreiranje mape "2" na desktopu...
cd /d "%USERPROFILE%\Desktop"
if not exist "2" (
    mkdir 2
    echo Mapa "2" je uspješno kreirana!
) else (
    echo Mapa "2" već postoji.
)
echo.
echo Trenutni direktorij: %CD%
echo Sadržaj desktopa:
dir
echo.
pause
goto menu

:install_flutter
echo.
echo ========================================
echo    INSTALACIJA FLUTTER SDK
echo ========================================
echo.
echo Da biste instalirali Flutter:
echo.
echo 1. Preuzmite Flutter SDK s:
echo    https://flutter.dev/docs/get-started/install/windows
echo.
echo 2. Raspakujte u C:\flutter
echo.
echo 3. Dodajte C:\flutter\bin u PATH
echo.
echo Želite li da otvorim Flutter download stranicu?
set /p open="(d/n): "
if /i "%open%"=="d" (
    echo.
    echo Otvaranje Flutter download stranice...
    start https://flutter.dev/docs/get-started/install/windows
    echo.
    echo Nakon instalacije Flutter-a, vratite se ovdje
    echo i pokrenite provjeru.
)
echo.
pause
goto menu

:install_bluestacks
echo.
echo ========================================
echo    INSTALACIJA BLUESTACKS
echo ========================================
echo.
echo BlueStacks je besplatan Android emulator
echo koji možete koristiti za testiranje APK-a.
echo.
echo Koraci:
echo 1. Preuzmite BlueStacks
echo 2. Instalirajte
echo 3. Pokrenite
echo 4. Drag & drop APK
echo.
echo Želite li da otvorim BlueStacks stranicu?
set /p open="(d/n): "
if /i "%open%"=="d" (
    echo.
    echo Otvaranje BlueStacks stranice...
    start https://www.bluestacks.com
    echo.
    echo Nakon instalacije BlueStacks-a, možete
    echo instalirati APK i testirati aplikaciju.
)
echo.
pause
goto menu

:install_android_studio
echo.
echo ========================================
echo    INSTALACIJA ANDROID STUDIO
echo ========================================
echo.
echo Android Studio je profesionalni IDE
echo koji uključuje Android emulator.
echo.
echo Koraci:
echo 1. Preuzmite Android Studio
echo 2. Instalirajte
echo 3. Kreirajte emulator
echo 4. Instalirajte APK
echo.
echo Želite li da otvorim Android Studio stranicu?
set /p open="(d/n): "
if /i "%open%"=="d" (
    echo.
    echo Otvaranje Android Studio stranice...
    start https://developer.android.com/studio
    echo.
    echo Nakon instalacije Android Studio-a,
    echo kreirajte emulator i instalirajte APK.
)
echo.
pause
goto menu

:check_all
echo.
echo ========================================
echo    PROVJERA SVIH PROBLEMA
echo ========================================
echo.
echo Provjera mape "2"...
cd /d "%USERPROFILE%\Desktop"
if exist "2" (
    echo ✓ Mapa "2" postoji
) else (
    echo ✗ Mapa "2" ne postoji
    echo Kreiranje mape "2"...
    mkdir 2
    echo ✓ Mapa "2" kreirana
)
echo.

echo Provjera Flutter instalacije...
flutter --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Flutter je instaliran
    flutter --version
) else (
    echo ✗ Flutter nije instaliran
    echo Preuzmite s: https://flutter.dev/docs/get-started/install/windows
)
echo.

echo Provjera BlueStacks...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\BlueStacks" >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ BlueStacks je instaliran
) else (
    echo ✗ BlueStacks nije instaliran
    echo Preuzmite s: https://www.bluestacks.com
)
echo.

echo Provjera Android Studio...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\AndroidStudio" >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Android Studio je instaliran
) else (
    echo ✗ Android Studio nije instaliran
    echo Preuzmite s: https://developer.android.com/studio
)
echo.

echo ========================================
echo PREPORUČENI NAČIN ZA TESTIRANJE:
echo ========================================
echo.
echo 1. Instalirajte BlueStacks (najbrže)
echo 2. Preuzmite APK s GitHub Actions
echo 3. Drag & drop APK u BlueStacks
echo 4. Testirajte aplikaciju
echo.
pause
goto menu

:exit
echo.
echo Hvala na korištenju Test Scanner rješavanja problema!
echo.
pause
