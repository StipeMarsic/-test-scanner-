@echo off
title Test Scanner - Kopiranje Datoteka
color 0D

echo ========================================
echo    TEST SCANNER - KOPIRANJE DATOTEKA
echo ========================================
echo.
echo Ova skripta će kopirati sve Test Scanner
echo datoteke u mapu "2" na vašem računalu.
echo.

echo Trenutni direktorij: %CD%
echo.

echo Kreiranje mape "2" ako ne postoji...
if not exist "C:\Users\stmar\2" (
    mkdir "C:\Users\stmar\2"
    echo Mapa "2" je kreirana.
) else (
    echo Mapa "2" već postoji.
)
echo.

echo Kopiranje svih Test Scanner datoteka...
echo.

echo 1. Kopiranje README.md...
if exist "README.md" (
    copy "README.md" "C:\Users\stmar\2\" >nul
    echo ✓ README.md kopiran
) else (
    echo ✗ README.md nije pronađen
)

echo 2. Kopiranje pubspec.yaml...
if exist "pubspec.yaml" (
    copy "pubspec.yaml" "C:\Users\stmar\2\" >nul
    echo ✓ pubspec.yaml kopiran
) else (
    echo ✗ pubspec.yaml nije pronađen
)

echo 3. Kopiranje lib direktorija...
if exist "lib" (
    xcopy "lib" "C:\Users\stmar\2\lib\" /E /I /Y >nul
    echo ✓ lib direktorij kopiran
) else (
    echo ✗ lib direktorij nije pronađen
)

echo 4. Kopiranje android direktorija...
if exist "android" (
    xcopy "android" "C:\Users\stmar\2\android\" /E /I /Y >nul
    echo ✓ android direktorij kopiran
) else (
    echo ✗ android direktorij nije pronađen
)

echo 5. Kopiranje .github direktorija...
if exist ".github" (
    xcopy ".github" "C:\Users\stmar\2\.github\" /E /I /Y >nul
    echo ✓ .github direktorij kopiran
) else (
    echo ✗ .github direktorij nije pronađen
)

echo 6. Kopiranje batch datoteka...
for %%f in (*.bat) do (
    copy "%%f" "C:\Users\stmar\2\" >nul
    echo ✓ %%f kopiran
)

echo 7. Kopiranje markdown datoteka...
for %%f in (*.md) do (
    copy "%%f" "C:\Users\stmar\2\" >nul
    echo ✓ %%f kopiran
)

echo 8. Kopiranje txt datoteka...
for %%f in (*.txt) do (
    copy "%%f" "C:\Users\stmar\2\" >nul
    echo ✓ %%f kopiran
)

echo.
echo ========================================
echo    PROVJERA KOPIRANIH DATOTEKA
echo ========================================
echo.

echo Sadržaj mape "2":
dir "C:\Users\stmar\2"
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
