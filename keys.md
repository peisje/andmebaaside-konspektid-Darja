# Andmebaasi võtmed (Keys)

[Põhimõisted](README.md) | [Ptotseduurid](protseduur.md) | [Ptotseduurid-XAMPP](protseduurXAMPP.md) | [kasutajad](kasutaja.md) | [kasutajad-XAMPP](kasutajaXAMPP.md) | [trigerid](triger.md) | 
[kodutöö-keys](keys.md) | [hotelli-ruum](hotelliruum.md) | [DML-küsimused](kysimused.md) | [DDL-küsimused](kysimused2.md) | [retsept](retsepr.md) |

## 1. Primary Key (Primaarvõti)
* **Lühike definitsioon:** Veerg või veergude kogum, mis tuvastab üheselt iga rea tabelis.
* **Milleks kasutatakse:** Kirjete unikaalsuse tagamiseks ja kiireks otsinguks. Ei saa sisaldada NULL väärtusi.
* **Mille poolest erineb:** Tabelis saab olla ainult **üks** primaarvõti.

### Praktiline näide (SQL):
```sql
CREATE TABLE Tootajad (
    Tootaja_ID INT PRIMARY KEY,
    Eesnimi VARCHAR(50),
    Perekonnanimi VARCHAR(50)
);
```
<img width="282" height="200" alt="{4A2E0BC1-C580-4A25-907E-CA2CE042B196}" src="https://github.com/user-attachments/assets/1f428da0-a896-41ab-97fb-4176c3ca51c8" />

## 2. Foreign Key (Välisvõti)
* **Lühike definitsioon:** Veerg, mis loob seose teise tabeli primaarvõtmega.
* **Milleks kasutatakse:** Tabelitevahelise seose (andmete terviklikkuse ehk referential integrity) tagamiseks.
* **Mille poolest erineb:** Erinevalt primaarvõtmest võib välisvõti sisaldada korduvaid väärtusi ja NULL väärtusi.

### Praktiline näide (SQL):
```sql
CREATE TABLE Tellimused (
    Tellimus_ID INT PRIMARY KEY,
    Kuupaev DATE,
    Tootaja_ID INT,
    FOREIGN KEY (Tootaja_ID) REFERENCES Tootajad(Tootaja_ID)
);
```
<img width="474" height="229" alt="{54AE0A42-4669-4C96-BAE4-E45DF3B7B66A}" src="https://github.com/user-attachments/assets/308625a6-f245-4be5-ab86-f9c44666d62f" />

## 3. Unique Key (Unikaalne võti)
* **Lühike definitsioon:** Piirang, mis tagab, et kõik väärtused veerus on unikaalsed.
* **Milleks kasutatakse:** Andmete kordumise vältimiseks veergudes, mis ei ole primaarvõtmed (nt e-post, isikukood).
* **Mille poolest erineb:** Erinevalt primaarvõtmest võib unikaalne võti sisaldada NULL väärtust (tavaliselt ainult ühte) ja ühes tabelis võib olla mitu unikaalset võtit.

### Praktiline näide (SQL):
```sql
CREATE TABLE Kasutajad (
    Kasutaja_ID INT PRIMARY KEY,
    Kasutajanimi VARCHAR(50),
    Epost VARCHAR(100) UNIQUE
);
```
<img width="283" height="180" alt="{F9687F9B-329B-4C49-950E-15544D8A8D2B}" src="https://github.com/user-attachments/assets/00bdfdb0-694b-485d-b379-1b3ad1b28563" />

## 4. Simple Key (Lihtvõti)
* **Lühike definitsioon:** Võti (tavaliselt primaarvõti), mis koosneb ainult ühest ainukesest veerust.
* **Milleks kasutatakse:** Lihtsaks ja kiireks ridade tuvastamiseks, kui üks väli on piisav unikaalsuse tagamiseks.
* **Mille poolest erineb:** Koosneb rangelt ühest veerust, erinevalt liitvõtmetest (Composite/Compound).

### Praktiline näide (SQL):
```sql
CREATE TABLE Tooted (
    Toode_ID INT PRIMARY KEY, 
    TooteNimi VARCHAR(100)
);
```
<img width="234" height="204" alt="{B170F60A-68E6-4D71-9D1A-624054DF2981}" src="https://github.com/user-attachments/assets/ed8c6c7a-f5e5-4eb5-bb0b-0fb49b9bfa78" />

## 5. Composite Key (Liitvõti)
* **Lühike definitsioon:** Võti, mis koosneb kahest või enamast veerust, et tagada rea unikaalsus.
* **Milleks kasutatakse:** Olukordades, kus ükski veerg eraldi ei ole unikaalne, kuid nende kombinatsioon on.
* **Mille poolest erineb:** Koosneb mitmest veerust. Võtme osad võivad eraldi sisaldada korduvaid väärtusi.
* 

### Praktiline näide (SQL):
```sql
CREATE TABLE TellimuseRead (
    Tellimus_ID INT,
    Toode_ID INT,
    Kogus INT,
    PRIMARY KEY (Tellimus_ID, Toode_ID) 
);
```
<img width="361" height="225" alt="{4D9313F5-CD8F-4F30-AD47-BA1E3AC1DC96}" src="https://github.com/user-attachments/assets/0affa045-0155-4185-b52d-ce0fd307adc4" />

## 6. Compound Key 
* **Lühike definitsioon:** Liitvõtme alaliik, kus kõik võtme koosseisu kuuluvad veerud on ise eraldiseisvalt välisvõtmed (Foreign Keys) teistes tabelites.
* **Milleks kasutatakse:** Tavaliselt vahetabelites (mitu-mitmele seosed ehk many-to-many), et siduda kaks olemit.
* **Mille poolest erineb:** Kõik Composite võtmed ei pruugi olla välisvõtmed, kuid Compound võtme puhul on see kohustuslik.

### Praktiline näide (SQL):
```sql
CREATE TABLE Tudeng_Kursus (
    Tudeng_ID INT,
    Kursus_ID INT,
    PRIMARY KEY (Tudeng_ID, Kursus_ID), -- Compound Key
    FOREIGN KEY (Tudeng_ID) REFERENCES Tudengid(Tudeng_ID),
    FOREIGN KEY (Kursus_ID) REFERENCES Kursused(Kursus_ID)
);
```
<img width="440" height="253" alt="{5D3B1462-C363-4BFC-9D98-DCABBF4C6610}" src="https://github.com/user-attachments/assets/49d046ee-8f6f-47b5-b995-eb0a29558fe0" />

## 7. Superkey (Supervõti)
* **Lühike definitsioon:** Veergude kogum, mis tuvastab unikaalselt tabeli kirjed, kuid võib sisaldada ka üleliigseid (mittevajalikke) veerge.
* **Milleks kasutatakse:** Teoreetiline mõiste andmebaasi disainis, millest tuletatakse kandidaatvõtmed.
* **Mille poolest erineb:** Sisaldab "liigset" infot. Näiteks (Isikukood, Eesnimi) on supervõti, sest isikukoodist üksi juba piisaks.

### Praktiline näide (SQL):
```sql
CREATE TABLE Kliendid (
    Kliendi_ID INT PRIMARY KEY,
    Isikukood VARCHAR(11) UNIQUE,
    Telefon VARCHAR(20)
);
```
<img width="343" height="237" alt="{E3814162-B480-4440-A498-749C11273DAC}" src="https://github.com/user-attachments/assets/228687d9-8dcb-4b84-9b3a-f9d12d3af414" />

## 8. Candidate Key (Kandidaatvõti)
* **Lühike definitsioon:** Minimaalne supervõti (veerg või veergude kogum), mis tuvastab unikaalselt iga rea tabelis, ilma et sisaldaks üleliigseid andmeid.
* **Milleks kasutatakse:** Seda kasutatakse potentsiaalse kandidaadina tabeli primaarvõtme (Primary Key) kohale. Disainer valib kõigi kandidaatvõtmete seast ühe, millest saab reaalne primaarvõti.
* **Mille poolest erineb:** Erinevalt supervõtmest ei tohi kandidaatvõtmes olla ühtegi "üleliigset" veergu (kui eemaldame kas või ühe veeru, kaob unikaalsus). Tabelis võib olla mitu kandidaatvõtit.

## 9. Alternate Key (Alternatiivvõti)
* **Lühike definitsioon:** Kandidaatvõti, mida andmebaasi projekteerimisel ei valitud tabeli primaarvõtmeks.
* **Milleks kasutatakse:** Kirjete täiendavaks unikaalseks tuvastamiseks. Andmebaasis realiseeritakse see tavaliselt `UNIQUE` piirangu (constraint) abil.
* **Mille poolest erineb:** See on otsene "asendaja" või alternatiiv primaarvõtmele. Kui primaarvõti on unikaalne ja kohustuslik, siis alternatiivvõti tagab samuti unikaalsuse, kuid võib tehniliselt lubada ka NULL väärtust (sõltuvalt reeglitest).

### Praktiline näide (SQL):
```sql
CREATE TABLE Kliendi (
    Kliendi_ID INT PRIMARY KEY,        
    Isikukood VARCHAR(11) UNIQUE,       
    Eesnimi VARCHAR(50),
    Perekonnanimi VARCHAR(50)
);

SELECT Kliendi_ID, Isikukood FROM Kliendi;
```
<img width="365" height="217" alt="{2BD52053-E4EC-43D6-96A9-8701904C3FA2}" src="https://github.com/user-attachments/assets/8a5a9891-36b9-4bbc-8aad-dd27667e717f" />

### Selgitus näite põhjal:
 - Selles tabelis on kaks kandidaatvõtit (Candidate Key): Kliendi_ID ja Isikukood.
 - Kuna me määratlesime Kliendi_ID kui PRIMARY KEY, siis Isikukood muutus automaatselt alternatiivvõtmeks (Alternate Key), mille unikaalsust tagab märksõna UNIQUE.

## Kasutatud allikad
1. https://www.geeksforgeeks.org/dbms/difference-between-primary-key-and-foreign-key/ 
2. https://en.wikipedia.org/wiki/Unique_key
3. https://www.theknowledgeacademy.com/blog/keys-in-sql/
4. https://dba.stackexchange.com/questions/3134/in-sql-is-it-composite-or-compound-keys
5. https://medium.com/@dewmithranaweera/different-types-of-database-keys-8ec93f5d3726














