@echo off
echo ========================================
echo    TEST SCANNER - BRZI TEST
echo ========================================
echo.
echo Ova skripta će testirati minimalnu verziju
echo Test Scanner aplikacije.
echo.
pause

echo.
echo ========================================
echo    PROVJERA DATOTEKA
echo ========================================
echo.
echo Provjeravam da li postoje potrebne datoteke...
echo.

if exist "pubspec.yaml" (
    echo ✅ pubspec.yaml - POSTOJI
) else (
    echo ❌ pubspec.yaml - NEDOSTAJE
)

if exist "lib\main.dart" (
    echo ✅ lib\main.dart - POSTOJI
) else (
    echo ❌ lib\main.dart - NEDOSTAJE
)

if exist "README.md" (
    echo ✅ README.md - POSTOJI
) else (
    echo ❌ README.md - NEDOSTAJE
)

echo.
pause

echo.
echo ========================================
echo    GITHUB ACTIONS BUILD
echo ========================================
echo.
echo Korak 1: Uploadajte datoteke na GitHub
echo - Idite u vaš repository
echo - Kliknite "Add file" > "Upload files"
echo - Drag & drop sve datoteke iz mape "2"
echo - Kliknite "Commit changes"
echo.
pause

echo.
echo Korak 2: Pokrenite build
echo - Idite na "Actions" tab
echo - Kliknite "Build Test Scanner APK"
echo - Kliknite "Run workflow"
echo - Sačekajte 5-10 minuta
echo.
pause

echo.
echo Korak 3: Preuzmite APK
echo - Kada build završi, idite na "Releases"
echo - Kliknite na najnoviji release
echo - Preuzmite app-release.apk
echo.
echo APK je spreman za instalaciju!
echo.
pause

echo.
echo ========================================
echo    INSTALACIJA NA MOBITEL
echo ========================================
echo.
echo Korak 1: Prebacite APK na mobitel
echo - Bluetooth: Pošaljite preko Bluetooth
echo - USB: Kopirajte direktno
echo - Email: Pošaljite sebi na email
echo.
pause

echo.
echo Korak 2: Instalirajte APK
echo - Omogućite "Nepoznati izvori"
echo - Tapnite na APK datoteku
echo - Slijedite upute za instalaciju
echo.
echo Aplikacija je spremna za testiranje!
echo.
pause

echo.
echo Hvala na korištenju Test Scanner Brzi Test-a!
echo.
pause
