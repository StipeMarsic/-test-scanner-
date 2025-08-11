# Test Scanner - Brzi Test

## Što je ovo?

Ovo je minimalna verzija Test Scanner aplikacije koja će se sigurno buildati i instalirati na vaš mobitel.

## Datoteke koje trebate uploadati na GitHub:

1. **pubspec.yaml** - Osnovne postavke Flutter aplikacije
2. **lib/main.dart** - Glavna aplikacija s jednostavnim UI-jem
3. **README.md** - Opis aplikacije
4. **.github/workflows/build.yml** - GitHub Actions za automatski build
5. **android/** direktorij - Android konfiguracija

## Koraci za build:

### 1. Upload na GitHub
- Idite u vaš repository: https://github.com/StipeMarsic/-test-scanner-
- Kliknite "Add file" > "Upload files"
- Drag & drop sve datoteke iz mape "2"
- Kliknite "Commit changes"

### 2. Pokrenite GitHub Actions
- Idite na "Actions" tab
- Kliknite "Build Test Scanner APK"
- Kliknite "Run workflow"
- Sačekajte 5-10 minuta

### 3. Preuzmite APK
- Kada build završi, idite na "Releases"
- Kliknite na najnoviji release
- Preuzmite app-release.apk

## Instalacija na mobitel:

1. **Prebacite APK na mobitel**
   - Bluetooth
   - USB kabel
   - Email
   - Cloud storage

2. **Instalirajte APK**
   - Omogućite "Nepoznati izvori" u postavkama
   - Tapnite na APK datoteku
   - Slijedite upute za instalaciju

## Što aplikacija radi:

- Prikazuje osnovni UI s ikonom kamere
- Ima gumb "Skeniraj Test" koji prikazuje poruku
- Priprema je za dodavanje kamera funkcionalnosti

## Sljedeći koraci:

Nakon što se ova minimalna verzija uspješno builda i instalira, možemo dodati:
- Kamera funkcionalnost
- OCR prepoznavanje teksta
- AI analizu odgovora
- Sustav ocjenjivanja

## Rješavanje problema:

Ako build propadne:
1. Provjerite da su sve datoteke uploadane
2. Provjerite da nema grešaka u pubspec.yaml
3. Pokušajte ponovno pokrenuti workflow
4. Kontaktirajte podršku ako problem traje
