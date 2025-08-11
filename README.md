# Test Scanner - Aplikacija za Automatsko Ocjenjivanje Testova

## Opis
Test Scanner je Flutter mobilna aplikacija namijenjena profesorima za automatsko skeniranje i ocjenjivanje rukom pisanih testova. Aplikacija koristi kameru mobitela za fotografiranje testa, OCR tehnologiju za prepoznavanje teksta, i AI za analizu i predlaganje ocjene.

## Glavne Funkcionalnosti
- 📸 **Skeniranje Kamere**: Fotografiranje testova direktno kamerom mobitela
- 🖼️ **Odabir iz Galerije**: Učitavanje postojećih fotografija testova
- 🔍 **OCR Prepoznavanje**: Automatsko prepoznavanje rukom pisanog teksta
- 🤖 **AI Analiza**: Inteligentna analiza odgovora i predlaganje ocjene
- 📊 **Sustav Ocjenjivanja**: Automatsko izračunavanje ocjene s mogućnošću ručnih korekcija
- 💾 **Spremanje Rezultata**: Lokalno spremanje povijesti ocjenjivanja
- 📱 **Intuitivno Sučelje**: Jednostavan i korisnički prijateljski dizajn

## Tehnologije
- **Flutter**: Cross-platform mobilni framework
- **Google ML Kit**: OCR za prepoznavanje teksta
- **Camera Plugin**: Upravljanje kamerom
- **Provider**: State management
- **Shared Preferences**: Lokalno spremanje podataka

## Struktura Projekta
```
TestScanner/
├── lib/
│   ├── main.dart                 # Glavna aplikacija
│   ├── screens/                  # UI ekrani
│   │   ├── home_screen.dart      # Početni ekran
│   │   ├── camera_screen.dart    # Ekran kamere
│   │   ├── scan_result_screen.dart # Rezultati skeniranja
│   │   └── grading_screen.dart   # Ekran ocjenjivanja
│   ├── services/                 # Poslovna logika
│   │   ├── camera_service.dart   # Upravljanje kamerom
│   │   ├── ocr_service.dart      # OCR funkcionalnost
│   │   ├── ai_service.dart       # AI analiza
│   │   └── grading_service.dart  # Sustav ocjenjivanja
│   └── models/                   # Podatkovni modeli
│       ├── test_result.dart      # Model rezultata testa
│       └── grade.dart           # Model ocjene
├── android/                      # Android konfiguracija
├── ios/                         # iOS konfiguracija
├── pubspec.yaml                 # Flutter dependencies
└── README.md                    # Dokumentacija
```

## Preduvjeti
- Flutter SDK (3.0.0 ili noviji)
- Android Studio / VS Code
- Android SDK (za Android)
- Xcode (za iOS)
- Fizički uređaj ili emulator

## Instalacija

### 1. Provjera Flutter instalacije
```bash
flutter doctor
```

### 2. Kloniranje projekta
```bash
git clone <repository-url>
cd TestScanner
```

### 3. Instalacija dependencies
```bash
flutter pub get
```

### 4. Provjera dostupnih uređaja
```bash
flutter devices
```

### 5. Pokretanje aplikacije
```bash
flutter run
```

## Kako Koristiti

### 1. Pokretanje Skeniranja
- Otvorite aplikaciju
- Odaberite "Skeniraj Test" za kameru ili "Odaberi iz Galerije"
- Postavite test na ravnu površinu s dovoljno svjetla

### 2. Fotografiranje
- Usmjerite kameru na test
- Osigurajte da je cijeli test vidljiv
- Pritisnite gumb za fotografiranje

### 3. Unos Informacija
- Unesite ime učenika i naziv testa
- Postavite točne odgovore za svako pitanje
- Pregledajte prepoznati tekst i po potrebi ispravite

### 4. Analiza i Ocjenjivanje
- Pritisnite "Analiziraj Test"
- Pregledajte AI analizu
- Po potrebi ispravite AI procjene
- Spremite konačnu ocjenu

## Preporučeni Format Testa
- Jasno rukom pisani tekst
- Numerirana pitanja (1., 2., 3., itd.)
- Odgovori označeni slovima (A, B, C, D) ili brojevima
- Dovoljno svjetla za fotografiranje
- Ravna površina bez sjaja

## Sustav Ocjenjivanja
- **Hrvatski sustav**: 1-5 (1 = nedovoljan, 5 = odličan)
- **Postotak**: 0-100%
- **Bodovi**: 0-100 bodova
- **Prilagođeno**: Prema potrebama profesora

## Rješavanje Problema

### Česti Problemi
1. **Kamera se ne pokreće**
   - Provjerite dozvole za kameru
   - Restart aplikacije

2. **OCR ne prepoznaje tekst**
   - Poboljšajte osvjetljenje
   - Osigurajte jasno pisanje
   - Provjerite fokus kamere

3. **Aplikacija se ruši**
   - Provjerite Flutter verziju
   - Očistite cache: `flutter clean`
   - Ponovno instalirajte dependencies

### Debugging
```bash
flutter logs
flutter doctor -v
```

## Sigurnost
- Sve podaci se spremaju lokalno na uređaju
- Nema slanja podataka na vanjske servere
- Kamera se koristi samo za fotografiranje testova
- Dozvole su minimalne i potrebne za funkcionalnost

## Budući Razvoj
- [ ] Podrška za više jezika
- [ ] Cloud sinkronizacija
- [ ] Napredniji AI modeli
- [ ] Izvoz u PDF/Excel
- [ ] Statistike i analitika
- [ ] Offline mod

## Doprinosi
Doprinosi su dobrodošli! Molimo vas da:
1. Fork repozitorija
2. Kreirajte feature branch
3. Napravite commit promjena
4. Push na branch
5. Otvorite Pull Request

## Podrška
Za podršku i pitanja:
- Otvorite issue na GitHub-u
- Kontaktirajte razvojni tim
- Pregledajte dokumentaciju

## Licenca
Ovaj projekt je licenciran pod MIT licencom.

---

**Napomena**: Ova aplikacija je namijenjena kao pomagalo za profesore. Konačne ocjene uvijek trebaju biti potvrđene od strane profesora.
