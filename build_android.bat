@echo off
echo ========================================
echo INSTALACIJA NA ANDROID UREĐAJ
echo ========================================
echo.

echo 1. Provjera povezanih Android uređaja:
flutter devices
echo.

echo 2. Izgradnja APK datoteke:
flutter build apk --release
echo.

echo 3. Instalacija na povezani uređaj:
flutter install
echo.

echo 4. Pokretanje aplikacije:
flutter run --release
echo.

echo ========================================
echo INSTALACIJA ZAVRŠENA
echo ========================================
echo.
echo APK datoteka se nalazi u: build/app/outputs/flutter-apk/app-release.apk
echo.
pause
