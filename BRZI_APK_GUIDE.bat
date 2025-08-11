@echo off
echo ========================================
echo    TEST SCANNER - BRZI APK GUIDE
echo ========================================
echo.
echo Ova skripta će vas voditi kroz proces
echo dobivanja gotovog APK-a za instalaciju.
echo.
pause

echo.
echo ========================================
echo    GITHUB ACTIONS - BRZI APK
echo ========================================
echo.
echo Korak 1: Kreirajte GitHub račun
echo - Idite na https://github.com
echo - Kliknite "Sign up"
echo - Slijedite upute za registraciju
echo.
pause

echo.
echo Korak 2: Kreirajte repository
echo - Kliknite "+" > "New repository"
echo - Nazovite ga "test-scanner"
echo - Ostavite ga javnim (public)
echo - Kliknite "Create repository"
echo.
pause

echo.
echo Korak 3: Uploadajte datoteke
echo - U repository-ju kliknite "uploading an existing file"
echo - Drag & drop sve datoteke iz mape "2" na desktopu
echo - Kliknite "Commit changes"
echo.
pause

echo.
echo Korak 4: Pokrenite build
echo - Idite na "Actions" tab
echo - Kliknite "Build Test Scanner APK"
echo - Kliknite "Run workflow"
echo - Sačekajte 5-10 minuta
echo.
pause

echo.
echo Korak 5: Preuzmite APK
echo - Kada build završi, idite na "Releases"
echo - Kliknite na najnoviji release
echo - Preuzmite app-release.apk
echo.
echo APK je spreman za instalaciju!
echo.
pause

echo.
echo ========================================
echo    INSTALACIJA APK-a NA MOBITEL
echo ========================================
echo.
echo Korak 1: Prebacite APK na mobitel
echo - Bluetooth: Pošaljite preko Bluetooth
echo - USB: Kopirajte direktno
echo - Email: Pošaljite sebi na email
echo - Cloud: Uploadajte na Drive/Dropbox
echo.
pause

echo.
echo Korak 2: Omogućite "Nepoznati izvori"
echo - Postavke > Sigurnost
echo - Omogućite "Nepoznati izvori"
echo - Ili "Instalacija izvan Play Storea"
echo.
pause

echo.
echo Korak 3: Instalirajte APK
echo - Pronađite APK na mobitelu
echo - Tapnite na datoteku
echo - Slijedite upute za instalaciju
echo.
pause

echo.
echo Korak 4: Omogućite dozvole
echo - Pokrenite Test Scanner
echo - Omogućite dozvole za kameru
echo - Omogućite dozvole za datoteke
echo.
echo Aplikacija je spremna za korištenje!
echo.
pause

echo.
echo Hvala na korištenju Test Scanner APK Guide-a!
echo.
pause
