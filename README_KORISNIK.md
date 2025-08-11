# 📱 TEST SCANNER - UPUTE ZA KORISNIKA

## 🎯 ŠTO JE TEST SCANNER?

Test Scanner je mobilna aplikacija koja omogućava profesorima da skeniraju rukom pisane testove kamerom mobitela i automatski dobiju ocjene za učenike. Aplikacija koristi naprednu AI tehnologiju za prepoznavanje teksta i analizu odgovora.

## 🚀 BRZI START

### Za najjednostavniju instalaciju:

1. **Pokrenite `BRZI_START.bat`** - automatski će sve napraviti
2. **Ili pokrenite `INSTALIRAJ_APK.bat`** - za direktnu instalaciju APK-a
3. **Slijedite upute na ekranu**

---

## 📱 INSTALACIJA NA MOBITEL

### OPCIJA 1: Automatska instalacija (preporučeno)

1. Povežite Android mobitel s računalom preko USB-a
2. Omogućite "USB debugging" u Developer options
3. Omogućite "Nepoznati izvori" u Postavke > Sigurnost
4. Pokrenite `BRZI_START.bat` ili `INSTALIRAJ_APK.bat`
5. Slijedite upute na ekranu

### OPCIJA 2: Ručna instalacija

1. Pokrenite `INSTALIRAJ_NA_MOBITEL.bat`
2. Odaberite opciju 3 za Android
3. Kopirajte APK datoteku na mobitel
4. Instalirajte ručno kroz File Manager

### OPCIJA 3: Napredne opcije

- `check_flutter.bat` - Provjera Flutter instalacije
- `install_dependencies.bat` - Instalacija ovisnosti
- `build_android.bat` - Izgradnja APK datoteke
- `manual_install_guide.txt` - Detaljne upute za ručnu instalaciju

---

## 🔧 PRIJE INSTALACIJE

### Android uređaj:
- [ ] USB debugging omogućen
- [ ] "Nepoznati izvori" omogućen
- [ ] Uređaj povezan s računalom
- [ ] Dovoljno prostora na uređaju

### Računalo:
- [ ] Flutter SDK instaliran
- [ ] Android SDK instaliran
- [ ] USB kabel za povezivanje

---

## 📖 KAKO KORISTITI APLIKACIJU

### 1. Pokretanje aplikacije
- Tapnite na ikonu Test Scanner na mobitelu
- Aplikacija će tražiti dozvole za kameru i datoteke
- Omogućite sve potrebne dozvole

### 2. Skeniranje testa
- Tapnite "Skeniraj Test"
- Postavite test u okvir kamere
- Osigurajte dovoljno svjetla
- Tapnite crveni gumb za snimanje
- Ili odaberite "Odaberi iz Galerije" za postojeću sliku

### 3. Unos informacija
- Unesite ime učenika
- Unesite naziv testa
- Postavite točne odgovore (A, B, C, D) za svako pitanje
- Pregledajte prepoznate odgovore učenika
- Ispravite greške ako ih ima

### 4. Analiza i ocjenjivanje
- Tapnite "Analiziraj Test"
- Pregledajte rezultate analize
- Provjerite detaljnu analizu po pitanjima
- Ispravite AI greške ako ih ima
- Spremite konačnu ocjenu

---

## 🎯 PREPORUČENI FORMAT TESTA

### Za najbolje rezultate:
- **Jasno pisana pitanja** s brojevima (1., 2., 3., itd.)
- **Odgovori označeni slovima** (A, B, C, D)
- **Dovoljno svjetla** i kontrasta
- **Test postavljen na ravnu površinu**
- **Bez sjaja i sjene** na tekstu
- **Čitljiv rukopis** učenika

### Primjer formata:
```
1. Koji je glavni grad Hrvatske?
   A) Split
   B) Zagreb
   C) Rijeka
   D) Osijek

2. Koliko je 2 + 2?
   A) 3
   B) 4
   C) 5
   D) 6
```

---

## 📊 SUSTAV OCJENJIVANJA

| Rezultat | Ocjena | Opis |
|----------|--------|------|
| 90-100% | Odličan (5) | Izvrsno razumijevanje gradiva |
| 80-89% | Vrlo dobar (4) | Vrlo dobro razumijevanje gradiva |
| 70-79% | Dobar (3) | Dobro razumijevanje gradiva |
| 60-69% | Dovoljan (2) | Osnovno razumijevanje gradiva |
| 0-59% | Nedovoljan (1) | Potrebna dodatna pomoć |

---

## 🛠️ RJEŠAVANJE PROBLEMA

### Aplikacija se neće instalirati:
- Provjerite jesu li omogućeni "Nepoznati izvori"
- Pokušajte s ADB instalacijom: `adb install app-release.apk`
- Provjerite ima li dovoljno prostora na uređaju
- Provjerite Android verziju (minimalno 5.0)

### Aplikacija se neće pokrenuti:
- Provjerite jesu li kamera dozvole omogućene
- Restartajte mobitel
- Provjerite jesu li sve dozvole omogućene u Postavke > Aplikacije

### Skeniranje ne radi dobro:
- Osigurajte dovoljno svjetla
- Postavite test na ravnu površinu
- Provjerite jesu li pitanja jasno vidljiva
- Pokušajte s različitim kutom kamere
- Provjerite jesu li odgovori jasno označeni

### OCR ne prepoznaje tekst:
- Provjerite kvalitetu slike
- Osigurajte dovoljno kontrasta
- Pokušajte ponovno skenirati
- Provjerite jesu li slova jasno pisana

---

## 📞 PODRŠKA

### Ako imate problema, provjerite:

1. **Flutter instalaciju:**
   ```bash
   flutter doctor
   ```

2. **Dostupne uređaje:**
   ```bash
   flutter devices
   ```

3. **Logove aplikacije:**
   ```bash
   flutter logs
   ```

4. **Provjeru ovisnosti:**
   ```bash
   flutter pub get
   ```

### Dodatne datoteke za pomoć:
- `UPUTE_INSTALACIJA.md` - Detaljne upute za instalaciju
- `manual_install_guide.txt` - Ručna instalacija
- `UPUTE_ZA_KORISNIKA.txt` - Jednostavne upute

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

## 🔮 BUDUĆE FUNKCIONALNOSTI

- Podrška za različite tipove pitanja
- Izvoz rezultata u PDF/Excel
- Statistike i analitika
- Više jezika
- Cloud sinkronizacija
- Napredne AI mogućnosti

---

**Hvala na korištenju Test Scanner aplikacije! 📚✨**
