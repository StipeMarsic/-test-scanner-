@echo off
title Test Scanner - Pronalazak Datoteka
color 0F

echo ========================================
echo    TEST SCANNER - PRONALAZAK DATOTEKA
echo ========================================
echo.
echo Ova skripta će pronaći Test Scanner datoteke
echo i kopirati ih u mapu "2".
echo.

echo Trenutni direktorij: %CD%
echo.

echo Traženje Test Scanner datoteka...
echo.

echo 1. Provjera trenutnog direktorija...
if exist "README.md" (
    echo ✓ README.md pronađen u trenutnom direktoriju
    set "SOURCE_DIR=%CD%"
    goto copy_files
) else (
    echo ✗ README.md nije pronađen u trenutnom direktoriju
)

echo.
echo 2. Provjera OneDrive direktorija...
if exist "%USERPROFILE%\OneDrive\Desktop\1" (
    echo ✓ OneDrive Desktop\1 pronađen
    cd /d "%USERPROFILE%\OneDrive\Desktop\1"
    if exist "README.md" (
        echo ✓ Test Scanner datoteke pronađene u OneDrive
        set "SOURCE_DIR=%CD%"
        goto copy_files
    )
)

echo.
echo 3. Provjera lokalnog Desktop direktorija...
if exist "%USERPROFILE%\Desktop" (
    echo ✓ Desktop direktorij pronađen
    cd /d "%USERPROFILE%\Desktop"
    if exist "README.md" (
        echo ✓ Test Scanner datoteke pronađene na Desktop-u
        set "SOURCE_DIR=%CD%"
        goto copy_files
    )
)

echo.
echo 4. Provjera Downloads direktorija...
if exist "%USERPROFILE%\Downloads" (
    echo ✓ Downloads direktorij pronađen
    cd /d "%USERPROFILE%\Downloads"
    if exist "README.md" (
        echo ✓ Test Scanner datoteke pronađene u Downloads
        set "SOURCE_DIR=%CD%"
        goto copy_files
    )
)

echo.
echo 5. Provjera Documents direktorija...
if exist "%USERPROFILE%\Documents" (
    echo ✓ Documents direktorij pronađen
    cd /d "%USERPROFILE%\Documents"
    if exist "README.md" (
        echo ✓ Test Scanner datoteke pronađene u Documents
        set "SOURCE_DIR=%CD%"
        goto copy_files
    )
)

echo.
echo ========================================
echo    DATOTEKE NISU PRONAĐENE
echo ========================================
echo.
echo Test Scanner datoteke nisu pronađene u
echo standardnim lokacijama.
echo.
echo Molimo ručno pronađite direktorij gdje su
echo Test Scanner datoteke i pokrenite ponovno.
echo.
echo Ili pokrenite "KREIRAJ_NOVE_DATOTEKE.bat"
echo za kreiranje novih datoteka.
echo.
pause
goto exit

:copy_files
echo.
echo ========================================
echo    KOPIRANJE DATOTEKA
echo ========================================
echo.
echo Izvor: %SOURCE_DIR%
echo Odredište: C:\Users\stmar\2
echo.

echo Kreiranje mape "2" ako ne postoji...
if not exist "C:\Users\stmar\2" (
    mkdir "C:\Users\stmar\2"
    echo Mapa "2" je kreirana.
) else (
    echo Mapa "2" već postoji.
)
echo.

echo Kopiranje datoteka...
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

echo 9. Kopiranje Dockerfile...
if exist "Dockerfile" (
    copy "Dockerfile" "C:\Users\stmar\2\" >nul
    echo ✓ Dockerfile kopiran
) else (
    echo ✗ Dockerfile nije pronađen
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

:exit
echo.
echo Hvala na korištenju Test Scanner pronalaska datoteka!
echo.
pause
