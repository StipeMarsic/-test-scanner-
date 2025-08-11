# 📱 TEST SCANNER - INSTALACIJA BEZ FLUTTER-a

## 🚨 PROBLEM: Flutter nije instaliran

Vidim da Flutter nije instaliran na vašem računalu. Evo nekoliko načina kako možete instalirati Test Scanner aplikaciju bez instalacije Flutter-a:

---

## 🎯 OPCIJA 1: INSTALACIJA FLUTTER-a (PREPORUČENO)

### Koraci za instalaciju Flutter SDK-a:

1. **Preuzmite Flutter SDK:**
   - Idite na: https://flutter.dev/docs/get-started/install/windows
   - Preuzmite "Flutter SDK" za Windows

2. **Raspakujte datoteku:**
   - Raspakujte u `C:\flutter`
   - Ili u drugu mapu po vašem izboru

3. **Dodajte u PATH:**
   - Pritisnite `Win + R`, upišite `sysdm.cpl`
   - Kliknite "Environment Variables"
   - U "System variables" pronađite "Path" i kliknite "Edit"
   - Kliknite "New" i dodajte: `C:\flutter\bin`
   - Kliknite "OK" na svim prozorima

4. **Provjerite instalaciju:**
   - Zatvorite sve Command Prompt prozore
   - Otvorite novi Command Prompt
   - Pokrenite: `flutter doctor`

5. **Pokrenite Test Scanner:**
   - Vratite se u mapu "2"
   - Pokrenite `BRZI_START.bat`

---

## 🐳 OPCIJA 2: DOCKER BUILD (NAJBOLJA ALTERNATIVA)

### Koraci za Docker build:

1. **Instalirajte Docker Desktop:**
   - Preuzmite s: https://www.docker.com/products/docker-desktop/
   - Instalirajte i pokrenite Docker Desktop

2. **Pokrenite Docker build:**
   ```bash
   # U mapi "2" pokrenite:
   build_with_docker.bat
   ```

3. **Rezultat:**
   - APK će biti kreiran u `output/test-scanner.apk`
   - Možete ga kopirati na mobitel i instalirati

---

## ☁️ OPCIJA 3: ONLINE BUILD SERVISI

### GitHub Actions (Besplatno):

1. **Kreirajte GitHub repozitorij:**
   - Uploadajte sve datoteke iz mape "2" na GitHub
   - GitHub Actions će automatski izgraditi APK

2. **Preuzmite APK:**
   - Idite u "Actions" tab
   - Preuzmite izgrađeni APK

### Codemagic (Besplatno za javne projekte):

1. **Povežite GitHub repozitorij:**
   - Idite na: https://codemagic.io/
   - Povežite vaš GitHub repozitorij

2. **Konfigurirajte build:**
   - Dodajte `codemagic.yaml` datoteku
   - Automatska izgradnja APK-a

---

## 📦 OPCIJA 4: GOTOV APK

### Ako imate pristup gotovom APK-u:

1. **Preuzmite APK datoteku**
2. **Omogućite "Nepoznati izvori" na Android uređaju:**
   - Postavke > Sigurnost > Omogućite "Nepoznati izvori"
3. **Instalirajte APK:**
   - Tapnite na APK datoteku
   - Slijedite upute za instalaciju

---

## 🔧 RUČNA INSTALACIJA APK-a

### Koraci za instalaciju na Android uređaj:

1. **Priprema uređaja:**
   - Omogućite "Developer options" (7 puta tapnite na "Build number")
   - Omogućite "USB debugging"
   - Omogućite "Nepoznati izvori"

2. **Povežite uređaj:**
   - Povežite mobitel s računalom preko USB-a
   - Odaberite "File transfer" mod

3. **Kopirajte APK:**
   - Kopirajte APK datoteku na mobitel
   - Ili koristite ADB: `adb install test-scanner.apk`

4. **Instalirajte:**
   - Na mobitelu pronađite APK datoteku
   - Tapnite za instalaciju
   - Slijedite upute na ekranu

---

## 🛠️ RJEŠAVANJE PROBLEMA

### Docker ne radi:
- Provjerite jesu li Docker Desktop pokrenut
- Provjerite jesu li WSL2 omogućeni (Windows 10/11)

### GitHub Actions ne radi:
- Provjerite jesu li sve datoteke uploadane
- Provjerite jesu li dozvole ispravno postavljene

### APK se neće instalirati:
- Provjerite jesu li "Nepoznati izvori" omogućeni
- Provjerite Android verziju (minimalno 5.0)
- Provjerite ima li dovoljno prostora

---

## 📞 PODRŠKA

### Ako i dalje imate problema:

1. **Instalirajte Flutter SDK** (Opcija 1) - najpouzdaniji način
2. **Koristite Docker** (Opcija 2) - najjednostavniji bez instalacije
3. **Kontaktirajte podršku** za dodatnu pomoć

### Korisne komande:

```bash
# Provjera Flutter instalacije
flutter doctor

# Provjera Docker instalacije
docker --version

# Provjera povezanih uređaja
adb devices

# Instalacija APK-a
adb install test-scanner.apk
```

---

## 🎉 USPIJEŠNA INSTALACIJA!

Nakon uspješne instalacije možete:

✅ **Skenirati testove** kamerom mobitela  
✅ **Automatski prepoznati** odgovore učenika  
✅ **Dobiti AI analizu** rezultata  
✅ **Pregledati detaljne** rezultate po pitanjima  
✅ **Spremiti ocjene** s objašnjenjima  
✅ **Pratiti povijest** ocjenjivanja  

---

**Preporučujem Opciju 2 (Docker) ako ne želite instalirati Flutter! 🐳✨**
