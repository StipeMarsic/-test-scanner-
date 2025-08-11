# 📱 UPUTE ZA INSTALACIJU TEST SCANNER APLIKACIJE NA MOBITEL

## 🎯 BRZI START

### Za Android uređaje:
1. Pokrenite `INSTALIRAJ_NA_MOBITEL.bat`
2. Odaberite opciju 3 "Instaliraj na Android uređaj"
3. Slijedite upute na ekranu

### Za iOS uređaje (samo macOS):
1. Pokrenite `INSTALIRAJ_NA_MOBITEL.bat`
2. Odaberite opciju 4 "Instaliraj na iOS uređaj"
3. Slijedite upute na ekranu

---

## 🔧 DETALJNE UPUTE PO PLATFORMAMA

### 📱 ANDROID INSTALACIJA

#### Metoda 1: Automatska instalacija (preporučeno)
```bash
# 1. Povežite uređaj s računalom
# 2. Omogućite USB debugging
# 3. Pokrenite:
flutter build apk --release
flutter install
```

#### Metoda 2: Ručna instalacija APK
1. **Izgradnja APK datoteke:**
   ```bash
   flutter build apk --release
   ```

2. **Pronađite APK datoteku:**
   - Lokacija: `build/app/outputs/flutter-apk/app-release.apk`

3. **Prebacivanje na mobitel:**
   - USB kabel
   - Email
   - Cloud storage (Google Drive, Dropbox)
   - ADB komanda: `adb push app-release.apk /sdcard/`

4. **Instalacija na mobitel:**
   - Postavke > Sigurnost > Omogućite "Nepoznati izvori"
   - Pronađite APK u File Manageru
   - Tapnite za instalaciju

#### Metoda 3: ADB instalacija
```bash
# Povežite uređaj i pokrenite:
adb install build/app/outputs/flutter-apk/app-release.apk
```

### 🍎 iOS INSTALACIJA

#### Preduvjeti:
- macOS računalo
- Xcode instaliran
- Apple Developer račun (za produkciju)
- iOS uređaj povezan s računalom

#### Koraci:
```bash
# 1. Izgradnja iOS aplikacije
flutter build ios --release

# 2. Instalacija
flutter install

# 3. Pokretanje
flutter run --release
```

---

## 🛠️ RJEŠAVANJE PROBLEMA

### Android problemi:

#### "Nepoznati izvori" nije dostupan
- **Android 8.0+**: Omogućite "Instalacija izvan Play Storea" za specifičnu aplikaciju
- **Starije verzije**: Omogućite "Nepoznati izvori" globalno

#### Aplikacija se neće instalirati
- Provjerite jesu li sve dozvole omogućene
- Pokušajte s ADB instalacijom
- Provjerite ima li dovoljno prostora na uređaju

#### Aplikacija se neće pokrenuti
- Provjerite jesu li kamera dozvole omogućene
- Restartajte uređaj
- Provjerite Android verziju (minimalno 5.0)

### iOS problemi:

#### "Untrusted Developer" greška
- Postavke > Općenito > Upravljanje uređajem
- Odaberite vaš Apple ID
- Tapnite "Vjeruj"

#### Aplikacija se neće instalirati
- Provjerite jesu li svi certifikati ispravni
- Provjerite jesu li provisioning profili ispravni
- Provjerite ima li dovoljno prostora

---

## 📋 CHECKLISTA PRIJE INSTALACIJE

### Android:
- [ ] USB debugging omogućen
- [ ] "Nepoznati izvori" omogućen
- [ ] Uređaj povezan s računalom
- [ ] Flutter SDK instaliran
- [ ] Android SDK instaliran
- [ ] Dovoljno prostora na uređaju

### iOS:
- [ ] Xcode instaliran
- [ ] Apple Developer račun (opcijalno)
- [ ] Uređaj povezan s računalom
- [ ] Flutter SDK instaliran
- [ ] iOS SDK instaliran
- [ ] Dovoljno prostora na uređaju

---

## 🔒 SIGURNOSNE NAPOMENE

### Android:
- Aplikacija nije potpisana, pa će Android prikazati upozorenje
- To je normalno za aplikacije izvan Play Storea
- Aplikacija zahtijeva dozvole za kameru i datoteke

### iOS:
- Aplikacija mora biti potpisana za produkciju
- Za testiranje možete koristiti development certifikat
- Aplikacija zahtijeva dozvole za kameru i datoteke

---

## 📞 PODRŠKA

Ako imate problema s instalacijom:

1. **Provjerite Flutter instalaciju:**
   ```bash
   flutter doctor
   ```

2. **Provjerite dostupne uređaje:**
   ```bash
   flutter devices
   ```

3. **Pokušajte s debug verzijom:**
   ```bash
   flutter run
   ```

4. **Provjerite logove:**
   ```bash
   flutter logs
   ```

---

## 🎉 USPIJEŠNA INSTALACIJA

Nakon uspješne instalacije:

1. **Pokrenite aplikaciju** na mobitelu
2. **Omogućite dozvole** za kameru i datoteke
3. **Testirajte funkcionalnost** skeniranjem testa
4. **Provjerite sve funkcije** aplikacije

Aplikacija je spremna za korištenje! 📚✨
