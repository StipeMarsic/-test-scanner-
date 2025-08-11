# 🧭 UPUTE ZA NAVIGACIJU - TEST SCANNER

## 🎯 **PROBLEM: Niste u pravom direktoriju**

### **Trenutno ste u:** `C:\Users\stmar`
### **Trebate biti u:** `C:\Users\stmar\2`

## 📋 **KAKO NAVIGIRATI DO PRAVOG DIREKTORIJA**

### **Korak 1: Idite u mapu "2"**
```powershell
cd 2
```

### **Korak 2: Provjerite jesu li tamo batch datoteke**
```powershell
dir *.bat
```

### **Korak 3: Ako nema batch datoteka, kreirajte ih**
```powershell
# Kreirajte osnovnu batch datoteku
echo @echo off > PRONALAZAK_DATOTEKA.bat
echo echo Test Scanner - Pronalazak Datoteka >> PRONALAZAK_DATOTEKA.bat
echo pause >> PRONALAZAK_DATOTEKA.bat
```

## 🚀 **BRZI NAČIN - SVE U JEDNOM**

### **Pokrenite ove komande redom:**

```powershell
# 1. Idite u mapu "2"
cd 2

# 2. Provjerite sadržaj
dir

# 3. Ako je prazno, kreirajte osnovne datoteke
echo @echo off > PRONALAZAK_DATOTEKA.bat
echo echo Test Scanner - Pronalazak Datoteka >> PRONALAZAK_DATOTEKA.bat
echo echo Trenutni direktorij: %%CD%% >> PRONALAZAK_DATOTEKA.bat
echo echo Traženje Test Scanner datoteka... >> PRONALAZAK_DATOTEKA.bat
echo pause >> PRONALAZAK_DATOTEKA.bat

# 4. Pokrenite batch datoteku
.\PRONALAZAK_DATOTEKA.bat
```

## 🔧 **ALTERNATIVNI NAČIN - RUČNO KREIRANJE**

### **Ako batch datoteke ne postoje, kreirajte ih ručno:**

```powershell
# Idite u mapu "2"
cd 2

# Kreirajte osnovnu strukturu
mkdir lib
mkdir android
mkdir .github

# Kreirajte README.md
echo # Test Scanner > README.md
echo Aplikacija za skeniranje testova >> README.md

# Kreirajte pubspec.yaml
echo name: test_scanner > pubspec.yaml
echo version: 1.0.0 >> pubspec.yaml

# Kreirajte batch datoteku
echo @echo off > BRZI_APK_GUIDE.bat
echo echo Test Scanner - Brzi APK Guide >> BRZI_APK_GUIDE.bat
echo echo Idite na: https://www.bluestacks.com >> BRZI_APK_GUIDE.bat
echo pause >> BRZI_APK_GUIDE.bat
```

## 📁 **OČEKIVANA STRUKTURA**

### **Nakon uspješnog kreiranja, trebali biste imati:**

```
C:\Users\stmar\2\
├── README.md
├── pubspec.yaml
├── PRONALAZAK_DATOTEKA.bat
├── BRZI_APK_GUIDE.bat
├── lib\
├── android\
└── .github\
```

## 🎯 **SLJEDEĆI KORACI**

### **Nakon što imate datoteke:**

1. **Instalirajte BlueStacks**
   - Idite na: https://www.bluestacks.com
   - Preuzmite i instalirajte

2. **Uploadajte na GitHub**
   - Kreirajte GitHub račun
   - Uploadajte datoteke

3. **Pokrenite GitHub Actions**
   - Idite na Actions tab
   - Pokrenite build

4. **Preuzmite APK**
   - Preuzmite iz Releases

## 🆘 **AKO I DALJE IMATE PROBLEMA**

### **Problem: "cd 2 ne radi"**
**Rješenje:**
```powershell
# Koristite punu putanju
cd "C:\Users\stmar\2"
```

### **Problem: "Nema dozvole"**
**Rješenje:**
```powershell
# Pokrenite PowerShell kao Administrator
# Ili promijenite execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### **Problem: "Datoteke se ne kreiraju"**
**Rješenje:**
```powershell
# Provjerite imate li dozvole za mapu
dir
# Ako je prazno, kreirajte ručno
echo Test > test.txt
```

## 📞 **POMOĆ**

### **Ako i dalje imate problema:**
1. **Provjerite** jesu li u pravom direktoriju (`cd 2`)
2. **Provjerite** sadržaj (`dir`)
3. **Kreirajte** datoteke ručno ako ne postoje
4. **Pokrenite** PowerShell kao Administrator

---

**Pokrenite `cd 2` pa zatim `dir` za provjeru sadržaja!** 🚀
