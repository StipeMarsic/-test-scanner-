# 💻 TESTIRANJE APLIKACIJE NA LAPTOPU

## 🎯 **CILJ: Testirati Test Scanner aplikaciju na laptopu**

### **Opcija 1: Android Emulator (NAJBRŽA)**

#### **Korak 1: Instalirajte Android Studio**
1. **Preuzmite Android Studio** s https://developer.android.com/studio
2. **Instalirajte** (besplatno)
3. **Pokrenite** Android Studio

#### **Korak 2: Kreirajte emulator**
1. **Kliknite "More Actions"** > **"Virtual Device Manager"**
2. **Kliknite "Create Device"**
3. **Odaberite uređaj** (npr. Pixel 4)
4. **Odaberite Android verziju** (API 30 ili noviji)
5. **Kliknite "Finish"**

#### **Korak 3: Pokrenite emulator**
1. **Kliknite play dugme** pored vašeg emulatora
2. **Sačekajte** da se emulator pokrene (2-3 minute)
3. **Emulator će se otvoriti** kao novi prozor

#### **Korak 4: Instalirajte APK**
```bash
adb install app-release.apk
```

### **Opcija 2: Flutter Web (BESPLATNO)**

#### **Korak 1: Pokrenite Flutter web**
```bash
cd 2
flutter run -d chrome
```

#### **Korak 2: Testirajte u browseru**
- Aplikacija će se otvoriti u Chrome
- Kamera će raditi preko web kamere
- OCR će raditi preko Google ML Kit

### **Opcija 3: Windows Subsystem for Android (WSA)**

#### **Korak 1: Instalirajte WSA**
1. **Otvorite Microsoft Store**
2. **Pretražite "Windows Subsystem for Android"**
3. **Instalirajte**
4. **Pokrenite** i postavite

#### **Korak 2: Instalirajte APK**
1. **Kopirajte APK** u WSA direktorij
2. **Instalirajte** kroz WSA
3. **Pokrenite** aplikaciju

### **Opcija 4: BlueStacks (Android Emulator)**

#### **Korak 1: Instalirajte BlueStacks**
1. **Preuzmite BlueStacks** s https://www.bluestacks.com
2. **Instalirajte** (besplatno)
3. **Pokrenite** BlueStacks

#### **Korak 2: Instalirajte APK**
1. **Drag & drop APK** u BlueStacks prozor
2. **Ili koristite APK installer** u BlueStacks
3. **Pokrenite** aplikaciju

## 🚀 **BRZI TEST - FLUTTER WEB**

### **Korak 1: Provjerite Flutter**
```bash
flutter doctor
```

### **Korak 2: Pokrenite web verziju**
```bash
cd 2
flutter run -d chrome
```

### **Korak 3: Testirajte funkcionalnosti**
- **Kamera:** Koristite web kameru
- **OCR:** Uploadajte sliku testa
- **AI analiza:** Testirajte s različitim odgovorima
- **Ocjenjivanje:** Provjerite grade calculation

## 📱 **TESTIRANJE FUNKCIONALNOSTI**

### **1. Kamera funkcionalnost**
- **Emulator:** Koristite virtualnu kameru
- **Web:** Koristite web kameru
- **WSA/BlueStacks:** Koristite laptop kameru

### **2. OCR testiranje**
- **Uploadajte sliku** testa
- **Provjerite** prepoznavanje teksta
- **Testirajte** s različitim rukopisima

### **3. AI analiza**
- **Unesite** različite odgovore
- **Provjerite** točnost ocjenjivanja
- **Testirajte** edge cases

### **4. Grade calculation**
- **Provjerite** različite scoring sustave
- **Testirajte** teacher corrections
- **Provjerite** grade history

## 🛠️ **SETUP ZA TESTIRANJE**

### **Android Studio Setup:**
```bash
# Instalirajte Android Studio
# Kreirajte emulator
# Pokrenite emulator
flutter run -d emulator-5554
```

### **Flutter Web Setup:**
```bash
# Provjerite Flutter
flutter doctor

# Pokrenite web verziju
flutter run -d chrome

# Ili za development
flutter run -d chrome --web-renderer html
```

### **BlueStacks Setup:**
```bash
# Instalirajte BlueStacks
# Pokrenite BlueStacks
# Drag & drop APK
# Testirajte aplikaciju
```

## 📋 **TEST SCENARIOS**

### **Scenario 1: Osnovno testiranje**
1. **Pokrenite aplikaciju**
2. **Testirajte kameru**
3. **Uploadajte test sliku**
4. **Provjerite OCR**
5. **Testirajte AI analizu**

### **Scenario 2: Edge cases**
1. **Loše osvijetljena slika**
2. **Ručno pisan tekst**
3. **Različiti fontovi**
4. **Djelomično vidljivi odgovori**

### **Scenario 3: Performance testiranje**
1. **Velike slike**
2. **Više testova za redom**
3. **Memory usage**
4. **Response time**

## 🆘 **RJEŠAVANJE PROBLEMA**

### **Problem: "Flutter nije instaliran"**
**Rješenje:**
1. Instalirajte Flutter SDK
2. Dodajte u PATH
3. Pokrenite `flutter doctor`

### **Problem: "Emulator ne radi"**
**Rješenje:**
1. Provjerite HAXM instalaciju
2. Omogućite virtualization u BIOS-u
3. Pokušajte drugi emulator

### **Problem: "Web kamera ne radi"**
**Rješenje:**
1. Provjerite dozvole u browseru
2. Omogućite kamera pristup
3. Pokušajte drugi browser

### **Problem: "APK se neće instalirati"**
**Rješenje:**
1. Provjerite APK integritet
2. Pokušajte drugi emulator
3. Provjerite Android verziju

## 🎉 **NAKON TESTIRANJA**

### **Što testirati:**
1. **UI/UX** - Je li intuitivno?
2. **Performance** - Brzo li radi?
3. **Accuracy** - Točno li prepoznaje?
4. **Stability** - Stabilno li radi?

### **Feedback:**
- **Zabilježite** probleme
- **Testirajte** s različitim scenarijima
- **Provjerite** sve funkcionalnosti

---

**Pokrenite `TESTIRANJE_NA_LAPTOPU.bat` za automatsko testiranje!** 🚀
