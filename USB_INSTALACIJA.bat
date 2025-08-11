@echo off
title Test Scanner - USB Instalacija
color 0B

echo ========================================
echo    TEST SCANNER - USB INSTALACIJA
echo ========================================
echo.
echo Ova skripta će instalirati APK direktno
echo na vaš mobitel preko USB kabela.
echo.

echo Provjera povezanih uređaja...
adb devices
echo.

echo Jeste li omogućili USB debugging na mobitelu?
echo - Postavke > O uređaju > Broj build-a (tapnite 7 puta)
echo - Postavke > Opcije programera > USB debugging
echo.
pause

echo.
echo Što želite raditi?
echo.
echo 1. Provjeri povezane uređaje
echo 2. Instaliraj APK (ako ga imate)
echo 3. Preuzmi APK s GitHub Actions
echo 4. Instaliraj s preuzetog APK-a
echo 5. Izlaz
echo.

set /p choice="Unesite broj (1-5): "

if "%choice%"=="1" goto check_devices
if "%choice%"=="2" goto install_existing
if "%choice%"=="3" goto download_apk
if "%choice%"=="4" goto install_downloaded
if "%choice%"=="5" goto exit
goto menu

:check_devices
echo.
echo ========================================
echo    PROVJERA POVEZANIH UREĐAJA
echo ========================================
echo.
echo Povezani uređaji:
adb devices
echo.
echo Ako vidite "device" pored vašeg uređaja,
echo uređaj je pravilno povezan.
echo.
pause
goto menu

:install_existing
echo.
echo ========================================
echo    INSTALACIJA POSTOJEĆEG APK-a
echo ========================================
echo.
echo Provjera postojećih APK datoteka...
if exist "*.apk" (
    echo Pronađene APK datoteke:
    dir *.apk
    echo.
    set /p apk_file="Unesite ime APK datoteke: "
    if exist "%apk_file%" (
        echo.
        echo Instalacija %apk_file%...
        adb install "%apk_file%"
        if %errorlevel% equ 0 (
            echo.
            echo APK je uspješno instaliran!
            echo Možete pokrenuti aplikaciju na mobitelu.
        ) else (
            echo.
            echo GREŠKA: Instalacija nije uspjela!
            echo Provjerite jesu li omogućeni "Nepoznati izvori".
        )
    ) else (
        echo GREŠKA: APK datoteka nije pronađena!
    )
) else (
    echo Nema pronađenih APK datoteka u trenutnom direktoriju.
    echo.
    echo Želite li preuzeti APK s GitHub Actions?
    set /p download="(d/n): "
    if /i "%download%"=="d" goto download_apk
)
echo.
pause
goto menu

:download_apk
echo.
echo ========================================
echo    PREUZIMANJE APK-a S GITHUB
echo ========================================
echo.
echo Da biste preuzeli APK, trebate:
echo 1. Imati GitHub račun
echo 2. Uploadati datoteke u repository
echo 3. Pokrenuti GitHub Actions
echo.
echo Želite li da vas vodim kroz proces?
set /p guide="(d/n): "
if /i "%guide%"=="d" (
    echo.
    echo Korak 1: Idite na https://github.com
    echo Korak 2: Registrirajte se (besplatno)
    echo Korak 3: Kreirajte novi repository "test-scanner"
    echo Korak 4: Uploadajte sve datoteke iz mape "2"
    echo Korak 5: Idite na Actions > Build Test Scanner APK
    echo Korak 6: Sačekajte 5-10 minuta
    echo Korak 7: Preuzmite app-release.apk
    echo.
    echo Nakon što preuzmete APK, vratite se ovdje
    echo i odaberite opciju 4 za instalaciju.
) else (
    echo.
    echo Možete koristiti alternativne načine:
    echo - Codemagic: https://codemagic.io
    echo - Appetize: https://appetize.io
)
echo.
pause
goto menu

:install_downloaded
echo.
echo ========================================
echo    INSTALACIJA PREUZETOG APK-a
echo ========================================
echo.
echo Provjera Downloads direktorija...
if exist "%USERPROFILE%\Downloads\*.apk" (
    echo Pronađene APK datoteke u Downloads:
    dir "%USERPROFILE%\Downloads\*.apk"
    echo.
    set /p apk_file="Unesite ime APK datoteke: "
    if exist "%USERPROFILE%\Downloads\%apk_file%" (
        echo.
        echo Instalacija %apk_file%...
        adb install "%USERPROFILE%\Downloads\%apk_file%"
        if %errorlevel% equ 0 (
            echo.
            echo APK je uspješno instaliran!
            echo Možete pokrenuti aplikaciju na mobitelu.
        ) else (
            echo.
            echo GREŠKA: Instalacija nije uspjela!
            echo Provjerite jesu li omogućeni "Nepoznati izvori".
        )
    ) else (
        echo GREŠKA: APK datoteka nije pronađena!
    )
) else (
    echo Nema pronađenih APK datoteka u Downloads.
    echo.
    echo Provjera trenutnog direktorija...
    if exist "*.apk" (
        echo Pronađene APK datoteke:
        dir *.apk
        echo.
        set /p apk_file="Unesite ime APK datoteke: "
        if exist "%apk_file%" (
            echo.
            echo Instalacija %apk_file%...
            adb install "%apk_file%"
            if %errorlevel% equ 0 (
                echo.
                echo APK je uspješno instaliran!
                echo Možete pokrenuti aplikaciju na mobitelu.
            ) else (
                echo.
                echo GREŠKA: Instalacija nije uspjela!
                echo Provjerite jesu li omogućeni "Nepoznati izvori".
            )
        ) else (
            echo GREŠKA: APK datoteka nije pronađena!
        )
    ) else (
        echo Nema pronađenih APK datoteka.
        echo.
        echo Trebate prvo preuzeti APK s GitHub Actions.
        echo Odaberite opciju 3 za preuzimanje.
    )
)
echo.
pause
goto menu

:exit
echo.
echo Hvala na korištenju USB instalacije!
echo.
pause
