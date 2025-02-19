# MultiCS - CCcam, Oscam & CSP Bin and Configuration Install Package

Ovaj repozitorij sadrži sveobuhvatni instalacijski paket za MultiCS, CCcam, Oscam i CSP, uključujući pripremljene binarne datoteke, konfiguracijske fajlove i skripte za automatizaciju instalacije, ažuriranja, provjere statusa i backup podataka. Namijenjen je korisnicima koji žele brzo i efikasno postaviti i održavati svoje sustave za dekodiranje i pristup digitalnim signalima.

---

## Sadržaj

- [Opis projekta](#opis-projekta)
- [Značajke](#značajke)
- [Preduvjeti](#preduvjeti)
- [Instalacija](#instalacija)
- [Upotreba](#upotreba)
- [Konfiguracija](#konfiguracija)
- [Održavanje i ažuriranje](#održavanje-i-ažuriranje)
- [Backup i vraćanje podataka](#backup-i-vraćanje-podataka)
- [Rješavanje problema](#rješavanje-problema)
- [Doprinos](#doprinos)
- [Licenca](#licenca)

---

## Opis projekta

Ovaj paket je razvijen kako bi pojednostavio instalaciju i konfiguraciju MultiCS sustava zajedno s CCcam, Oscam i CSP komponentama. Pored osnovnih binarnih datoteka, repozitorij uključuje konfiguracijske fajlove i niz skripti koje omogućuju:
- Automatsku instalaciju i konfiguraciju
- Redovitu provjeru statusa servisa
- Jednostavno ažuriranje i nadogradnju
- Backup postojećih konfiguracija i podataka

Svrha je osigurati robustan, skalabilan i lako održiv sustav za korisnike koji se bave digitalnim signalima.

---

## Značajke

- **Automatizirana instalacija:** Glavna skripta `MulticsCCcamOscamInstall.sh` pokreće instalacijski proces i postavlja sve potrebne komponente.
- **Provjera statusa:** Skripte poput `CCcamCheck.sh`, `OscamCheck.sh` i `multicsCheck.sh` omogućuju redovitu provjeru rada servisa.
- **Ažuriranja:** Automatizirani alati kao što su `keyupdater.sh` i `configupdate.sh` osiguravaju da su binarne datoteke i konfiguracije uvijek ažurne.
- **Backup i restauracija:** Skripte `multics-backup.sh` i `oscam-backup.sh` omogućuju pravovremeno čuvanje konfiguracijskih datoteka.
- **Fleksibilna konfiguracija:** Više konfiguracijskih fajlova (npr. `CCcam.cfg`, `oscam.conf`, `multics.cfg`) omogućavaju prilagodbu sustava potrebama korisnika.

---

## Preduvjeti

Prije instalacije, osigurajte da vaš sustav ispunjava sljedeće zahtjeve:
- **Operativni sustav:** Linux distribucije (preporučeno Ubuntu, Debian, CentOS)
- **Dozvole:** Root pristup ili sudo privilegije
- **Ovisnosti:** 
  - Bash shell
  - Coreutils (za izvršavanje skripti)
  - Internet konekcija (za preuzimanje ažuriranja, ukoliko je primjenjivo)

Preporučuje se da izvršite backup postojećih konfiguracijskih datoteka prije pokretanja instalacijskih skripti.

---

## Instalacija

1. **Preuzimanje repozitorija:**

   Klonirajte repozitorij na svoj server:
   ```bash
   git clone https://github.com/adis992/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package.git
   cd MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package
   ```

2. **Pokretanje instalacije:**

   Izvršite glavnu instalacijsku skriptu:
   ```bash
   sudo bash MulticsCCcamOscamInstall.sh
   ```
   Skripta će automatski prepoznati arhitekturu vašeg sustava (x32/x64) i instalirati odgovarajuće binarne datoteke i konfiguracije.

3. **Verifikacija instalacije:**

   Nakon završetka instalacije, pokrenite provjeru statusa:
   ```bash
   bash CCcamCheck.sh
   bash OscamCheck.sh
   bash multicsCheck.sh
   ```
   Provjerite izlaz kako biste osigurali da su svi servisi ispravno pokrenuti.

---

## Upotreba

### Pokretanje i upravljanje servisima

- **CCcam:** Koristite `CCcamCheck.sh` za provjeru statusa i eventualno ponovno pokretanje servisa.
- **Oscam:** Skripta `OscamCheck.sh` pomaže pri nadzoru Oscam servisa.
- **MultiCS:** Skripta `multicsCheck.sh` pruža pregled stanja MultiCS sustava.

### Ažuriranje i konfiguracija

- **Ažuriranje binarnih datoteka:** Skripta `keyupdater.sh` automatski preuzima najnovije verzije.
- **Ažuriranje konfiguracija:** Koristite `configupdate.sh` kako biste primijenili nove konfiguracijske postavke bez potrebe za ručnom intervencijom.

---

## Konfiguracija

Repozitorij sadrži nekoliko konfiguracijskih fajlova koje možete prilagoditi:
- **CCcam.cfg** – Osnovna konfiguracija za CCcam.
- **oscam.conf** – Glavni konfiguracijski fajl za Oscam.
- **multics.cfg** – Postavke za MultiCS sustav.
- **baddcw.cfg** – Dodatne konfiguracijske opcije (npr. blokiranje neispravnih dekodera).

Savjetujemo da pregledate i uredite ove datoteke prema specifičnim potrebama vašeg okruženja prije pokretanja instalacijskih skripti.

---

## Održavanje i ažuriranje

Za redovno održavanje sustava, preporučujemo sljedeće korake:
- **Provjera servisa:** Periodično pokretanje `*_Check.sh` skripti.
- **Ažuriranje:** Redovito pokretanje `keyupdater.sh` i `configupdate.sh` skripti za osiguranje najnovijih poboljšanja i sigurnosnih zakrpa.
- **Backup:** Automatizirajte backup koristeći `multics-backup.sh` i `oscam-backup.sh` kako biste osigurali da su konfiguracije sigurne.

---

## Backup i vraćanje podataka

Backup skripte omogućuju redovito čuvanje konfiguracijskih datoteka i bitnih podataka:
- **Backup:** Izvršite skripte `multics-backup.sh` i `oscam-backup.sh` prema potrebi.
- **Restauracija:** U slučaju problema, koristite prethodno spremljene backup datoteke za vraćanje sustava u funkcionalno stanje.

---

## Rješavanje problema

Ako dođe do problema tijekom instalacije ili rada sustava, slijedite ove korake:
1. **Provjera log datoteka:** Pregledajte logove (npr. log datoteke definirane u konfiguracijama) kako biste identificirali greške.
2. **Ponovno pokretanje servisa:** Koristite odgovarajuće `*_Check.sh` skripte za ponovno pokretanje servisa.
3. **Konzultacija dokumentacije:** Pregledajte konfiguracijske fajlove i skripte za komentare i upute.
4. **Pomoć zajednice:** Ako i dalje imate problema, razmotrite kontaktiranje developera ili potražite pomoć u relevantnim forumima i zajednicama.

---

## Doprinos

Vaši prijedlozi i poboljšanja su dobrodošli! Ako želite doprinijeti razvoju ovog projekta:
1. Forkajte repozitorij.
2. Napravite svoje izmjene u zasebnoj grani.
3. Pošaljite Pull Request s detaljnim opisom promjena.

Molimo da se pridržavate postojećeg stila i komentara u kodu.

---

## Licenca

Ovaj projekt je objavljen pod [MIT licencom](LICENSE). Slobodno koristite, mijenjajte i distribuirajte ovaj kod u skladu s uvjetima licence.

---

*Napomena:* Prije pokretanja bilo kojeg dijela ovog paketa, preporučuje se detaljno čitanje konfiguracijskih datoteka i skripti kako biste osigurali kompatibilnost sa vašim sustavom i specifičnim zahtjevima.

---

© 2025 - MultiCS Development Team

---
