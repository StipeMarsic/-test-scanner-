@echo off
title Test Scanner - Kreiranje Novih Datoteka
color 0A

echo ========================================
echo    TEST SCANNER - KREIRANJE NOVIH DATOTEKA
echo ========================================
echo.
echo Ova skripta će kreirati sve Test Scanner
echo datoteke u mapi "2" ako nisu pronađene.
echo.

echo Kreiranje mape "2" ako ne postoji...
if not exist "C:\Users\stmar\2" (
    mkdir "C:\Users\stmar\2"
    echo Mapa "2" je kreirana.
) else (
    echo Mapa "2" već postoji.
)
echo.

echo Idite u mapu "2"...
cd /d "C:\Users\stmar\2"
echo.

echo Kreiranje osnovnih datoteka...
echo.

echo 1. Kreiranje README.md...
echo # Test Scanner - Aplikacija za Skeniranje Testova > README.md
echo. >> README.md
echo ## Opis >> README.md
echo Aplikacija za profesore koja omogućava skeniranje >> README.md
echo rukopisnih testova kamerom i automatsko ocjenjivanje. >> README.md
echo ✓ README.md kreiran

echo 2. Kreiranje pubspec.yaml...
echo name: test_scanner > pubspec.yaml
echo description: Aplikacija za skeniranje testova >> pubspec.yaml
echo version: 1.0.0 >> pubspec.yaml
echo. >> pubspec.yaml
echo environment: >> pubspec.yaml
echo   sdk: ^3.0.0 >> pubspec.yaml
echo. >> pubspec.yaml
echo dependencies: >> pubspec.yaml
echo   flutter: >> pubspec.yaml
echo     sdk: flutter >> pubspec.yaml
echo   camera: ^0.10.5+5 >> pubspec.yaml
echo   google_ml_kit: ^0.16.3 >> pubspec.yaml
echo   provider: ^6.1.1 >> pubspec.yaml
echo   shared_preferences: ^2.2.2 >> pubspec.yaml
echo ✓ pubspec.yaml kreiran

echo 3. Kreiranje lib direktorija...
mkdir lib
mkdir lib\screens
mkdir lib\services
mkdir lib\models
echo ✓ lib direktorij kreiran

echo 4. Kreiranje android direktorija...
mkdir android
mkdir android\app
mkdir android\app\src
mkdir android\app\src\main
mkdir android\app\src\main\res
mkdir android\app\src\main\res\xml
echo ✓ android direktorij kreiran

echo 5. Kreiranje .github direktorija...
mkdir .github
mkdir .github\workflows
echo ✓ .github direktorij kreiran

echo 6. Kreiranje batch datoteka...
echo @echo off > BRZI_APK_GUIDE.bat
echo echo Test Scanner - Brzi APK Guide >> BRZI_APK_GUIDE.bat
echo ✓ BRZI_APK_GUIDE.bat kreiran

echo @echo off > USB_INSTALACIJA.bat
echo echo Test Scanner - USB Instalacija >> USB_INSTALACIJA.bat
echo ✓ USB_INSTALACIJA.bat kreiran

echo @echo off > TESTIRANJE_NA_LAPTOPU.bat
echo echo Test Scanner - Testiranje na Laptopu >> TESTIRANJE_NA_LAPTOPU.bat
echo ✓ TESTIRANJE_NA_LAPTOPU.bat kreiran

echo @echo off > RIJESAVANJE_PROBLEMA.bat
echo echo Test Scanner - Rješavanje Problema >> RIJESAVANJE_PROBLEMA.bat
echo ✓ RIJESAVANJE_PROBLEMA.bat kreiran

echo @echo off > KOPIRANJE_DATOTEKA.bat
echo echo Test Scanner - Kopiranje Datoteka >> KOPIRANJE_DATOTEKA.bat
echo ✓ KOPIRANJE_DATOTEKA.bat kreiran

echo @echo off > PRONALAZAK_DATOTEKA.bat
echo echo Test Scanner - Pronalazak Datoteka >> PRONALAZAK_DATOTEKA.bat
echo ✓ PRONALAZAK_DATOTEKA.bat kreiran

echo @echo off > KREIRAJ_NOVE_DATOTEKE.bat
echo echo Test Scanner - Kreiranje Novih Datoteka >> KREIRAJ_NOVE_DATOTEKE.bat
echo ✓ KREIRAJ_NOVE_DATOTEKE.bat kreiran

echo 7. Kreiranje markdown datoteka...
echo # Test Scanner - Upute > GOTOV_APK_UPUTE.md
echo ✓ GOTOV_APK_UPUTE.md kreiran

echo # Test Scanner - Gotov APK > README_GOTOV_APK.md
echo ✓ README_GOTOV_APK.md kreiran

echo # Testiranje na Laptopu > TESTIRANJE_NA_LAPTOPU.md
echo ✓ TESTIRANJE_NA_LAPTOPU.md kreiran

echo # USB Debugging - Upute > UPUTE_USB_DEBUGGING.md
echo ✓ UPUTE_USB_DEBUGGING.md kreiran

echo # Rješavanje Problema > RIJESAVANJE_PROBLEMA.md
echo ✓ RIJESAVANJE_PROBLEMA.md kreiran

echo # Kopiranje Datoteka - Upute > UPUTE_ZA_KOPIRANJE.md
echo ✓ UPUTE_ZA_KOPIRANJE.md kreiran

echo # Pronalazak Datoteka - Upute > UPUTE_ZA_PRONALAZAK.md
echo ✓ UPUTE_ZA_PRONALAZAK.md kreiran

echo 8. Kreiranje txt datoteka...
echo Test Scanner - Upute > UPUTE.txt
echo ✓ UPUTE.txt kreiran

echo Test Scanner - Instalacija > INSTALACIJA.txt
echo ✓ INSTALACIJA.txt kreiran

echo Test Scanner - Upute za Korisnika > UPUTE_ZA_KORISNIKA.txt
echo ✓ UPUTE_ZA_KORISNIKA.txt kreiran

echo Manual Install Guide > manual_install_guide.txt
echo ✓ manual_install_guide.txt kreiran

echo 9. Kreiranje Dockerfile...
echo FROM cirrusci/flutter:stable > Dockerfile
echo WORKDIR /app >> Dockerfile
echo COPY . . >> Dockerfile
echo RUN flutter build apk --release >> Dockerfile
echo ✓ Dockerfile kreiran

echo 10. Kreiranje GitHub Actions...
echo name: Build Test Scanner APK > .github\workflows\build.yml
echo on: [push] >> .github\workflows\build.yml
echo jobs: >> .github\workflows\build.yml
echo   build: >> .github\workflows\build.yml
echo     runs-on: ubuntu-latest >> .github\workflows\build.yml
echo ✓ GitHub Actions kreiran

echo 11. Kreiranje Android manifest...
echo ^<?xml version="1.0" encoding="utf-8"?^> > android\app\src\main\AndroidManifest.xml
echo ^<manifest xmlns:android="http://schemas.android.com/apk/res/android"^> >> android\app\src\main\AndroidManifest.xml
echo   ^<uses-permission android:name="android.permission.CAMERA" /^> >> android\app\src\main\AndroidManifest.xml
echo   ^<uses-permission android:name="android.permission.INTERNET" /^> >> android\app\src\main\AndroidManifest.xml
echo ^</manifest^> >> android\app\src\main\AndroidManifest.xml
echo ✓ Android manifest kreiran

echo 12. Kreiranje file_paths.xml...
echo ^<?xml version="1.0" encoding="utf-8"?^> > android\app\src\main\res\xml\file_paths.xml
echo ^<paths^> >> android\app\src\main\res\xml\file_paths.xml
echo   ^<external-path name="external_files" path="."/^> >> android\app\src\main\res\xml\file_paths.xml
echo ^</paths^> >> android\app\src\main\res\xml\file_paths.xml
echo ✓ file_paths.xml kreiran

echo.
echo ========================================
echo    PROVJERA KREIRANIH DATOTEKA
echo ========================================
echo.

echo Sadržaj mape "2":
dir
echo.

echo ========================================
echo    SLJEDEĆI KORACI
echo ========================================
echo.
echo Sada možete:
echo.
echo 1. Instalirati BlueStacks (najbrže)
echo    - Idite na: https://www.bluestacks.com
echo    - Preuzmite i instalirajte
echo.
echo 2. Preuzeti APK s GitHub Actions
echo    - Uploadajte datoteke na GitHub
echo    - Pokrenite Actions
echo    - Preuzmite APK
echo.
echo 3. Testirati aplikaciju
echo    - Drag & drop APK u BlueStacks
echo    - Instalirajte i pokrenite
echo.
echo Želite li da otvorim BlueStacks stranicu?
set /p open="(d/n): "
if /i "%open%"=="d" (
    echo.
    echo Otvaranje BlueStacks stranice...
    start https://www.bluestacks.com
)
echo.
pause
