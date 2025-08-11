# 🚀 UPUTE ZA POKRETANJE BATCH DATOTEKA

## 🎯 **PROBLEM: PowerShell ne može pronaći batch datoteke**

### **Rješenje: Dodajte `.\` ispred imena datoteke**

## 📋 **KAKO POKRENUTI BATCH DATOTEKE**

### **Opcija 1: Dodajte `.\` (PREPORUČENO)**

```powershell
# Umjesto:
PRONALAZAK_DATOTEKA.bat

# Koristite:
.\PRONALAZAK_DATOTEKA.bat
```

### **Opcija 2: Koristite punu putanju**

```powershell
# Pokrenite s punom putanjom
C:\Users\stmar\2\PRONALAZAK_DATOTEKA.bat
```

### **Opcija 3: Promijenite direktorij i pokrenite**

```powershell
# Idite u direktorij s datotekama
cd "C:\Users\stmar\2"

# Pokrenite s .\
.\PRONALAZAK_DATOTEKA.bat
```

## 🔧 **RJEŠENJE ZA VAŠ PROBLEM**

### **Korak 1: Pokrenite pronalazak datoteka**
```powershell
.\PRONALAZAK_DATOTEKA.bat
```

### **Korak 2: Ako ne pronađe, kreirajte nove**
```powershell
.\KREIRAJ_NOVE_DATOTEKA.bat
```

### **Korak 3: Provjerite sadržaj**
```powershell
dir
```

## 📁 **KOJE DATOTEKE TREBATE POKRENUTI**

### **Glavne batch datoteke:**
- `.\PRONALAZAK_DATOTEKA.bat` - Pronalazi postojeće datoteke
- `.\KREIRAJ_NOVE_DATOTEKA.bat` - Kreira nove datoteke
- `.\KOPIRANJE_DATOTEKA.bat` - Kopira datoteke
- `.\BRZI_APK_GUIDE.bat` - Brzi APK guide
- `.\USB_INSTALACIJA.bat` - USB instalacija
- `.\TESTIRANJE_NA_LAPTOPU.bat` - Testiranje na laptopu
- `.\RIJESAVANJE_PROBLEMA.bat` - Rješavanje problema

## 🚀 **BRZI NAČIN**

### **Pokrenite ove komande redom:**

```powershell
# 1. Idite u mapu "2"
cd "C:\Users\stmar\2"

# 2. Pokrenite pronalazak
.\PRONALAZAK_DATOTEKA.bat

# 3. Ako ne pronađe, kreirajte nove
.\KREIRAJ_NOVE_DATOTEKA.bat

# 4. Provjerite sadržaj
dir
```

## 🆘 **AKO I DALJE IMATE PROBLEMA**

### **Problem: "Datoteka ne postoji"**
**Rješenje:**
```powershell
# Provjerite jesu li datoteke u direktoriju
dir *.bat
```

### **Problem: "Nema dozvole"**
**Rješenje:**
```powershell
# Pokrenite PowerShell kao Administrator
# Ili promijenite execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### **Problem: "Datoteke nisu kreirane"**
**Rješenje:**
```powershell
# Ručno kreirajte osnovne datoteke
echo @echo off > TEST.bat
echo echo Test datoteka >> TEST.bat
.\TEST.bat
```

## 🎯 **OČEKIVANI REZULTAT**

### **Nakon uspješnog pokretanja:**
- Skripta će se pokrenuti
- Vidjet ćete status svake operacije
- Datoteke će biti kopirane ili kreirane
- Možete nastaviti s GitHub Actions

## 📞 **POMOĆ**

### **Ako i dalje imate problema:**
1. **Provjerite** jesu li datoteke u pravom direktoriju
2. **Koristite** `.\` ispred imena datoteke
3. **Pokrenite** PowerShell kao Administrator
4. **Provjerite** execution policy

---

**Pokrenite `.\PRONALAZAK_DATOTEKA.bat` za pronalazak datoteka!** 🚀
