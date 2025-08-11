# 📁 KOPIRANJE DATOTEKA - UPUTE

## 🎯 **CILJ: Kopirati sve Test Scanner datoteke u mapu "2"**

### **Status:**
✅ **Mapa "2" je kreirana** u `C:\Users\stmar\2`

### **Sljedeći korak: Kopiranje datoteka**

## 📋 **KAKO KOPIRATI DATOTEKE**

### **Opcija 1: Automatsko kopiranje (PREPORUČENO)**

#### **Korak 1: Pokrenite skriptu**
```powershell
# Idite u direktorij gdje su Test Scanner datoteke
cd "putanja-do-test-scanner-datoteka"

# Pokrenite kopiranje
KOPIRANJE_DATOTEKA.bat
```

#### **Korak 2: Pratite upute**
- Skripta će automatski kopirati sve datoteke
- Pokazat će status svake datoteke
- Provjerit će sadržaj mape "2"

### **Opcija 2: Ručno kopiranje**

#### **Korak 1: Kopirajte glavne datoteke**
```powershell
# Kopirajte u mapu "2"
copy "README.md" "C:\Users\stmar\2\"
copy "pubspec.yaml" "C:\Users\stmar\2\"
```

#### **Korak 2: Kopirajte direktorije**
```powershell
# Kopirajte lib direktorij
xcopy "lib" "C:\Users\stmar\2\lib\" /E /I /Y

# Kopirajte android direktorij
xcopy "android" "C:\Users\stmar\2\android\" /E /I /Y

# Kopirajte .github direktorij
xcopy ".github" "C:\Users\stmar\2\.github\" /E /I /Y
```

#### **Korak 3: Kopirajte batch datoteke**
```powershell
# Kopirajte sve .bat datoteke
copy "*.bat" "C:\Users\stmar\2\"

# Kopirajte sve .md datoteke
copy "*.md" "C:\Users\stmar\2\"

# Kopirajte sve .txt datoteke
copy "*.txt" "C:\Users\stmar\2\"
```

## 📁 **KOJE DATOTEKE TREBATE KOPIRATI**

### **Glavne datoteke:**
- `README.md`
- `pubspec.yaml`
- `Dockerfile`

### **Direktoriji:**
- `lib/` - Glavni kod aplikacije
- `android/` - Android konfiguracija
- `.github/` - GitHub Actions

### **Batch datoteke:**
- `BRZI_APK_GUIDE.bat`
- `USB_INSTALACIJA.bat`
- `TESTIRANJE_NA_LAPTOPU.bat`
- `RIJESAVANJE_PROBLEMA.bat`
- `KOPIRANJE_DATOTEKA.bat`

### **Markdown datoteke:**
- `GOTOV_APK_UPUTE.md`
- `README_GOTOV_APK.md`
- `TESTIRANJE_NA_LAPTOPU.md`
- `UPUTE_USB_DEBUGGING.md`
- `RIJESAVANJE_PROBLEMA.md`
- `UPUTE_ZA_KOPIRANJE.md`

### **Tekst datoteke:**
- `UPUTE.txt`
- `INSTALACIJA.txt`
- `UPUTE_ZA_KORISNIKA.txt`
- `manual_install_guide.txt`

## 🔍 **PROVJERA KOPIRANJA**

### **Nakon kopiranja, provjerite:**
```powershell
# Idite u mapu "2"
cd "C:\Users\stmar\2"

# Provjerite sadržaj
dir

# Provjerite ima li sve potrebne datoteke
dir *.md
dir *.bat
dir *.txt
dir lib
dir android
dir .github
```

### **Očekivani rezultat:**
```
Directory of C:\Users\stmar\2

README.md
pubspec.yaml
Dockerfile
BRZI_APK_GUIDE.bat
USB_INSTALACIJA.bat
TESTIRANJE_NA_LAPTOPU.bat
RIJESAVANJE_PROBLEMA.bat
KOPIRANJE_DATOTEKA.bat
GOTOV_APK_UPUTE.md
README_GOTOV_APK.md
TESTIRANJE_NA_LAPTOPU.md
UPUTE_USB_DEBUGGING.md
RIJESAVANJE_PROBLEMA.md
UPUTE_ZA_KOPIRANJE.md
UPUTE.txt
INSTALACIJA.txt
UPUTE_ZA_KORISNIKA.txt
manual_install_guide.txt
lib/ (direktorij)
android/ (direktorij)
.github/ (direktorij)
```

## 🚀 **NAKON KOPIRANJA**

### **Sljedeći koraci:**
1. **Instalirajte BlueStacks** (najbrže)
2. **Uploadajte datoteke** na GitHub
3. **Pokrenite GitHub Actions**
4. **Preuzmite APK**
5. **Testirajte aplikaciju**

## 🆘 **AKO IMATE PROBLEMA**

### **Problem: "Datoteke nisu pronađene"**
**Rješenje:**
- Provjerite jesu li u pravom direktoriju
- Provjerite jesu li datoteke stvarno kreirane
- Pokušajte ručno kopiranje

### **Problem: "Nema dozvole za kopiranje"**
**Rješenje:**
- Pokrenite PowerShell kao Administrator
- Provjerite imate li dozvole za mapu "2"

### **Problem: "Neke datoteke nedostaju"**
**Rješenje:**
- Kopirajte ručno nedostajuće datoteke
- Provjerite jesu li sve datoteke kreirane

---

**Pokrenite `KOPIRANJE_DATOTEKA.bat` za automatsko kopiranje!** 🚀
