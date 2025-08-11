@echo off
title Test Scanner - Docker Build
color 0E

echo ========================================
echo    TEST SCANNER - DOCKER BUILD
echo ========================================
echo.
echo Ova skripta će izgraditi APK koristeći Docker
echo bez potrebe za instalacijom Flutter-a lokalno.
echo.

echo Provjera Docker instalacije...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo GREŠKA: Docker nije instaliran!
    echo.
    echo Molimo instalirajte Docker Desktop s:
    echo https://www.docker.com/products/docker-desktop/
    echo.
    pause
    exit /b 1
)

echo Docker je instaliran. Nastavljam...
echo.

echo Kreiranje output direktorija...
if not exist "output" mkdir output
echo.

echo Izgradnja APK-a s Docker-om...
echo Ovo može potrajati nekoliko minuta...
echo.

docker run --rm -v "%cd%:/app" -v "%cd%/output:/output" -w /app cirrusci/flutter:stable bash -c "
flutter pub get &&
flutter build apk --release &&
cp build/app/outputs/flutter-apk/app-release.apk /output/test-scanner.apk &&
echo 'APK uspješno izgrađen!'
"

if %errorlevel% neq 0 (
    echo GREŠKA: Neuspješna izgradnja APK-a!
    pause
    exit /b 1
)

echo.
echo ========================================
echo APK JE USPIJEŠNO IZGRADEN!
echo ========================================
echo.
echo APK datoteka se nalazi u: output/test-scanner.apk
echo.

echo Što želite raditi sada?
echo.
echo 1. Instalirati APK na povezani uređaj (ADB)
echo 2. Kopirati APK na desktop
echo 3. Otvoriti output direktorij
echo 4. Izlaz
echo.

set /p choice="Unesite broj (1-4): "

if "%choice%"=="1" goto install_apk
if "%choice%"=="2" goto copy_apk
if "%choice%"=="3" goto open_output
if "%choice%"=="4" goto exit
goto menu

:install_apk
echo.
echo Instalacija APK-a na uređaj...
echo Provjerite jesu li omogućeni USB debugging i "Nepoznati izvori"
echo.
adb install output/test-scanner.apk
if %errorlevel% neq 0 (
    echo UPOZORENJE: Automatska instalacija nije uspjela.
    echo.
    echo RUČNA INSTALACIJA:
    echo 1. Kopirajte output/test-scanner.apk na mobitel
    echo 2. Instalirajte ručno kroz File Manager
)
pause
goto exit

:copy_apk
echo.
echo Kopiranje APK-a na desktop...
copy "output\test-scanner.apk" "%USERPROFILE%\Desktop\TestScanner.apk"
if %errorlevel% equ 0 (
    echo APK je kopiran na desktop kao TestScanner.apk
) else (
    echo GREŠKA: Neuspješno kopiranje!
)
pause
goto exit

:open_output
echo.
echo Otvaranje output direktorija...
explorer output
goto exit

:exit
echo.
echo Hvala na korištenju Docker build programa!
echo.
pause
