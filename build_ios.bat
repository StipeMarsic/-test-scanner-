@echo off
echo ========================================
echo INSTALACIJA NA iOS UREĐAJ
echo ========================================
echo.
echo NAPOMENA: Ova opcija zahtijeva macOS i Xcode!
echo.

echo 1. Provjera povezanih iOS uređaja:
flutter devices
echo.

echo 2. Izgradnja iOS aplikacije:
flutter build ios --release
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
echo IPA datoteka se nalazi u: build/ios/iphoneos/Runner.app
echo.
pause
