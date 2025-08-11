# 🔧 RJEŠAVANJE PROBLEMA - TEST SCANNER

## 🚨 **PROBLEM 1: Mapa "2" ne postoji**

### **Rješenje: Kreirajte mapu "2" na desktopu**

#### **Korak 1: Idite na desktop**
```powershell
cd C:\Users\stmar\Desktop
```

#### **Korak 2: Kreirajte mapu "2"**
```powershell
mkdir 2
```

#### **Korak 3: Provjerite je li kreirana**
```powershell
dir
```

### **Alternativno: Koristite postojeću mapu**
Ako već imate Test Scanner datoteke negdje drugdje:
```powershell
cd "putanja-do-vase-mape"
```

## 🚨 **PROBLEM 2: Flutter nije instaliran**

### **Rješenje: Instalirajte Flutter**

#### **Korak 1: Preuzmite Flutter SDK**
1. **Idite na:** https://flutter.dev/docs/get-started/install/windows
2. **Kliknite "Flutter SDK"** za preuzimanje
3. **Preuzmite ZIP datoteku**

#### **Korak 2: Raspakujte Flutter**
1. **Kreirajte mapu:** `C:\flutter`
2. **Raspakujte ZIP** u `C:\flutter`
3. **Provjerite:** `C:\flutter\bin\flutter.bat` postoji

#### **Korak 3: Dodajte u PATH**
1. **Otvorite System Properties**
2. **Environment Variables**
3. **Path** > **Edit**
4. **Dodajte:** `C:\flutter\bin`
5. **OK** > **OK**

#### **Korak 4: Provjerite instalaciju**
```powershell
flutter --version
```

## 🚀 **BRZI NAČIN - BEZ FLUTTER-A**

### **Opcija 1: BlueStacks (NAJBRŽA)**

#### **Korak 1: Instalirajte BlueStacks**
1. **Idite na:** https://www.bluestacks.com
2. **Preuzmite i instalirajte**
3. **Pokrenite BlueStacks**

#### **Korak 2: Instalirajte APK**
1. **Preuzmite APK** s GitHub Actions
2. **Drag & drop** u BlueStacks
3. **Testirajte aplikaciju**

### **Opcija 2: Android Studio Emulator**

#### **Korak 1: Instalirajte Android Studio**
1. **Idite na:** https://developer.android.com/studio
2. **Preuzmite i instalirajte**
3. **Kreirajte emulator**

#### **Korak 2: Instalirajte APK**
```powershell
adb install app-release.apk
```

### **Opcija 3: Windows Subsystem for Android (WSA)**

#### **Korak 1: Instalirajte WSA**
1. **Microsoft Store** > **Windows Subsystem for Android**
2. **Instalirajte**
3. **Pokrenite i postavite**

#### **Korak 2: Instalirajte APK**
1. **Kopirajte APK** u WSA direktorij
2. **Instalirajte kroz WSA**

## 📋 **DETALJNE UPUTE ZA FLUTTER**

### **Ako želite instalirati Flutter:**

#### **Korak 1: Preuzimanje**
```powershell
# Kreirajte mapu
mkdir C:\flutter

# Preuzmite Flutter (ručno s web stranice)
# Raspakujte u C:\flutter
```

#### **Korak 2: PATH setup**
```powershell
# Dodajte u PATH
$env:PATH += ";C:\flutter\bin"

# Ili trajno kroz System Properties
```

#### **Korak 3: Provjera**
```powershell
flutter doctor
flutter --version
```

#### **Korak 4: Pokretanje**
```powershell
cd "C:\Users\stmar\Desktop\2"
flutter run -d chrome
```

## 🆘 **ALTERNATIVNI NAČINI TESTIRANJA**

### **Ako ne želite instalirati Flutter:**

1. **BlueStacks** - Besplatan Android emulator
2. **Android Studio** - Profesionalni emulator
3. **WSA** - Windows 11 Android podrška
4. **GitHub Actions** - Online build i testiranje

## 🎯 **PREPORUČENI NAČIN**

### **Za brzo testiranje:**
1. **Instalirajte BlueStacks**
2. **Preuzmite APK** s GitHub Actions
3. **Instalirajte u BlueStacks**
4. **Testirajte aplikaciju**

### **Za development:**
1. **Instalirajte Flutter**
2. **Kreirajte mapu "2"**
3. **Pokrenite Flutter web**
4. **Testirajte u browseru**

## 📞 **POMOĆ**

### **Ako i dalje imate problema:**
1. **Provjerite** jesu li sve putanje ispravne
2. **Restartajte** PowerShell nakon PATH promjena
3. **Provjerite** imate li administrator prava
4. **Pokušajte** alternativne načine testiranja

---

**Pokrenite `RIJESAVANJE_PROBLEMA.bat` za automatsko rješavanje!** 🚀
