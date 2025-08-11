# 📱 USB DEBUGGING - UPUTE ZA OMOGUĆAVANJE

## 🎯 **CILJ: Omogućiti direktnu instalaciju APK-a preko USB-a**

### **Korak 1: Omogućite Opcije programera**

1. **Idite u Postavke**
2. **Pronađite "O uređaju"** (na dnu liste)
3. **Tapnite na "Broj build-a" 7 puta**
4. **Vidjet ćete poruku "Sada ste programer!"**

### **Korak 2: Omogućite USB debugging**

1. **Vratite se u Postavke**
2. **Pronađite "Opcije programera"** (novo pojavljena opcija)
3. **Omogućite "Opcije programera"**
4. **Omogućite "USB debugging"**

### **Korak 3: Povežite uređaj**

1. **Povežite mobitel s računalom USB kabelom**
2. **Na mobitelu će se pojaviti obavijest**
3. **Odaberite "Dopusti USB debugging"**
4. **Označite "Uvijek dopusti s ovog računala"**

## 🔧 **PROVJERA POVEZANOSTI**

### **Na računalu:**
```bash
adb devices
```

### **Očekivani rezultat:**
```
List of devices attached
XXXXXXXX    device
```

- **"device"** = uređaj je pravilno povezan
- **"unauthorized"** = trebate dopustiti na mobitelu
- **"offline"** = uređaj nije dostupan

## 📲 **INSTALACIJA APK-a**

### **Korak 1: Pokrenite USB instalaciju**
```bash
USB_INSTALACIJA.bat
```

### **Korak 2: Odaberite opciju**
- **Opcija 1:** Provjeri povezane uređaje
- **Opcija 2:** Instaliraj postojeći APK
- **Opcija 3:** Preuzmi APK s GitHub
- **Opcija 4:** Instaliraj preuzeti APK

### **Korak 3: Pratite upute**
- Skripta će vas voditi kroz proces
- Automatski će instalirati APK
- Pokazat će rezultat instalacije

## 🆘 **RJEŠAVANJE PROBLEMA**

### **Problem: "adb nije prepoznat"**
**Rješenje:**
1. Instalirajte Android SDK Platform Tools
2. Dodajte u PATH varijablu
3. Ili koristite punu putanju do adb.exe

### **Problem: "unauthorized"**
**Rješenje:**
1. Provjerite jesu li omogućeni "Opcije programera"
2. Provjerite jesu li omogućeni "USB debugging"
3. Dopustite USB debugging na mobitelu

### **Problem: "device offline"**
**Rješenje:**
1. Provjerite USB kabel
2. Pokušajte drugi USB port
3. Pokušajte drugi kabel
4. Restartajte mobitel

### **Problem: "Nepoznati izvori"**
**Rješenje:**
1. Postavke > Sigurnost
2. Omogućite "Nepoznati izvori"
3. Ili "Instalacija izvan Play Storea"

## 📋 **ALTERNATIVNI NAČINI**

### **Ako USB debugging ne radi:**

1. **Bluetooth instalacija:**
   - Pošaljite APK preko Bluetooth
   - Instalirajte ručno

2. **Email instalacija:**
   - Pošaljite APK sebi na email
   - Preuzmite i instalirajte

3. **Cloud instalacija:**
   - Uploadajte APK na Drive/Dropbox
   - Preuzmite s mobitela

## 🎉 **NAKON USPIJEŠNE INSTALACIJE**

1. **Pronađite Test Scanner** u listi aplikacija
2. **Pokrenite aplikaciju**
3. **Omogućite dozvole** za kameru i datoteke
4. **Testirajte funkcionalnost**

## 📞 **POMOĆ**

### **Ako i dalje imate problema:**
1. Provjerite Android verziju (minimalno 5.0)
2. Provjerite ima li dovoljno prostora
3. Pokušajte s drugim USB kabelom
4. Restartajte i mobitel i računalo

---

**Pokrenite `USB_INSTALACIJA.bat` za automatsku instalaciju!** 🚀
