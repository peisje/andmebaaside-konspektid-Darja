## Andmebaaside konspektid | Darja 

[Põhimõisted](README.md). | [Ptotseduurid](protseduur.md).

andmebaasidega seotud SQL kood ja konspektid
## Sisukord
- [Põhimõisted](#põhimõisted)
- [Andmetüübid](#andmetüübid)
- [SQL structure Query Language](#SQL-structure-Query-Language)
- [Seosed (tabelivahelised seosed)](#seosed-tabelivahelised-seosed)
- [PIIRANGUD](#PIIRANGUD)
- [ALTER TABLE](#ALTER-TABLE)






## Põhimõisted
- andmebaas - struktureeritut andmete kogum
- tabel = olem -сущность -entity
- veerg = väli - поле *cтолбец
- rida = kirje - записи
- andmebaasi haldussüstem - tarkvara, millega abil saab luua andmebaas: mariaDB / XAMPP, SQL SERVER managment Studio.
- <img width="300" height="350" alt="{834C33C7-CB56-413D-9248-9F789C51D8B1}" src="https://github.com/user-attachments/assets/8b04ad1b-8269-49c1-ad9d-95daa1b65247" />

- primaarne võti -PRIMARY KEY - veerg(tavaliselt id nimega), unikaalne identifikaator, mis eristab iga kirje.
- välisvõti - FOREIGN KEY -FK- veerg, mis loob seos teise tabeli primaarvõtmega.
- päring -QUERY - запрос

## Andmetüübid
```
1. Numbrilised: INT, SmallINT, float, decimal(5,2)
2. Tekst/sümboolised: varchar(255), char(5), TEXT
3. Loogilised: boolean, true/false , bit, bool
4. Kuupäeva: date, time, datetime
```

## SQL structure Query Language
- Tabeli loomine
```sql
  CREATE DATABASE kovalenkobaas;

--ab kustutamine
DROP DATABASE TITpv24kovalenko;

use kovalenkobaas;
--tabeli loomine
CREATE TABLE opilan(
opilanID int Primary key identity(1,1), --automaatselt täidab numbritega
eesnimi varchar(25),
perenimi varchar(30) NOT NULL,
synniaeg DATE,
stip bit,
mobiil varchar(13),
aadres TEXT,
keskmineHinne decimal(2,1) );--(2--kokku, 1- peale komat nt 4.5)

SELECT * FROM opilan;
```
- Andmete sisetamine tabelisse
```sql 
--tabeli täitmine
INSERT INTO opilan
VALUES ('dasa','kovalenko', '2008-08-10', 1, '+493080', 'talinn', 4.5);

INSERT INTO opilan(perenimi, eesnimi, keskmineHinne)
VALUES ('sereda', 'ivan', 4.2),
('holovanov', 'ivan', 4.2),
('suvorov', 'marko', 5.0);

--andmete uuendamine tabelis
UPDATE opilan SET stip=1, aadres='tallinn'

UPDATE opilan SET stip=1, aadres='tartu' WHERE opilanID=5;

--kustutamine
--tabeli kustutamine
DROP TABLE opilan;
--andmete kustutamine tabelis
DELETE FROM opilan WHERE opilanID=1;
Select * from opilan;
```

## Seosed (tabelivahelised seosed)
- üks-ühele (nt mees-naine)
- üks-mitmele (nt ema-lapsed)
<img width="490" height="269" alt="{51DEA6FB-D670-4F79-BB39-69DA04B62102}" src="https://github.com/user-attachments/assets/5e60df58-bab8-4567-913c-963f281c6b24" />
- mitu-mitele (nt õpilased - õpetajad)

## PIIRANGUD 
constraint- ограничения (5)
1. PRIMARY KEY
2. FOREIGN KEY
3. CHECK
4. NOT NULL
5. UNIQUE

<img width="311" height="314" alt="{958EFC41-C171-4C84-B686-7D464D9BB09B}" src="https://github.com/user-attachments/assets/46552190-c07b-4a9b-996f-186376aaaffa" />


```sql
--FOREIGN KEY
CREATE TABLE opetamine(
opetamineId int PRIMARY KEY identity(1,1),
kuupaev DATE,
oppeaine varchar(30),
opilanID int,
FOREIGN KEY (opilanID) REFERENCES opilan(opilanID),
hinne int CHECK(hinne<=5));

SELECT * FROM opetamine;
SELECT * FROM opilan;
--täidame tabeli
INSERT INTO opetamine
VALUES ('2026-04-16', 'andmebaasid', 4, 5)
```

## ALTER TABLE 
-tabeli struktuuri muutmine (struktuur: veerudenimed, andmetüübid, piirangud)

```sql
--uue veeru lisamine
ALTER TABLE opilane ADD isikukood varchar(11);

--veeru kustutamine 
ALTER TABLE opilane DROP COLUMN isikukood; 

--andmetüübi muutmine varchar(11)-->char(11)
ALTER TABLE opilane ALTER COLUMN isikukood char(11);

--sisseehitatud protseduur, mis näitab tabeli struktuur
sp_help opilane;
```

```sql
--piirangute lisamine
CREATE TABLE ryhm(
ryhmID int not null,
ryhmNimi char(10));

--
drop table ryhm;

sp_help ryhm;

--PK lisamine
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm PRIMARY KEY (ryhmID);
--UNIQUE lisamine
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE (ryhmNimi);

--kontrollimiseks täidame tabelit ryhm
SELECT * FROM ryhm;
INSERT INTO ryhm (ryhmID, ryhmNimi)
VALUES (1, 'TITpv24');

INSERT INTO ryhm (ryhmID, ryhmNimi)
VALUES (2, 'TITpe24');

--lisame Foreign Key - võõrvõti-välisvõti
ALTER TABLE opilane ADD ryhmID int;
SELECT * FROM opilane;
SELECT * FROM ryhm;
ALTER TABLE opilane ADD CONSTRAINT fk_ryhm 
FOREIGN KEY (ryhmID) REFERENCES ryhm(ryhmID);

--kontrollimiseks- täidame tabeli opilane
INSERT INTO opilane
VALUES ('dasa','kovalenko', '2008-08-10', 1, '+493080', 'talinn', 4.5, '5667777', 2),
('elina','kotsur', '2008-04-28', 1, '+408354', 'talinn', 4.4, '3849473', 1);
```























