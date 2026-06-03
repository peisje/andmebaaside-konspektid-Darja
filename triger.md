## Trigger - triger - päästik
- andmebaasi objekt, mis automaatselt käivitud tabeli sündmused (INSERT, UPDATE, DELETE).

```sql
create database trigertitpv24;
USE trigertitpv24;
--
Create table linnad(
linnID int PRIMARY KEY IDENTITY (1,1),
linnanimi varchar(15) NOT NULL,
rahvaarv int);
 
--tabel, mis täidab triger
Create table logi(
id int PRIMARY KEY IDENTITY (1,1),
kasutaja varchar(25),
aeg DATETIME,
toiming  varchar(100),
andmed TEXT --triger automaatselt lisab mida sekretaar lisas/kustutas tabelisse linnad
)

select * from linnad;
select * from logi;

--Trigger lisatud kirjeid jälgimiseks tabelis “linnad” – INSERT
--Jälgib andmete sisestamine tabelis linnad ja teeb vastava kirje tabelis logi

CREATE TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, --kasutaja
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
inserted.linnanimi  --andmed
FROM inserted;

-- Trigeri tegevuse kontroll
INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Tartu', 2500000);
SELECT * FROM linnad;
SELECT * FROM logi;


-- trigeri muutmine
ALTER TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, --kasutaja
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
CONCAT ('linn: ',inserted.linnanimi, ' rahvaarv: ', inserted.rahvaarv)  --andmed
FROM inserted;

INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Pärnu', 500000);
SELECT * FROM linnad;
SELECT * FROM logi;
```
<img width="618" height="298" alt="{47D88254-E70B-4B18-8FB1-B579A1C5BD43}" src="https://github.com/user-attachments/assets/e0631679-4d84-48fa-b9c6-769ba10d5d23" />

- delete triger
```sql
CREATE TRIGGER linnaKustutamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR DELETE
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, --kasutaja
GETDATE(),  --aeg
'on tehtud DELETE käsk',  --toiming
CONCAT ('linn: ',deleted.linnanimi, ' rahvaarv: ', deleted.rahvaarv)  --andmed
FROM deleted;

-- Trigeri tegevuse kontroll --kustutada tabelist linnad
DELETE FROM linnad WHERE linnID=1;
SELECT * FROM linnad;
SELECT * FROM logi;

```
- update triger
```sql
CREATE TRIGGER linnaUuendamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR UPDATE
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, --kasutaja
GETDATE(),  --aeg
'on tehtud UPDATE käsk',  --toiming
CONCAT ('VANAD: linn: ',deleted.linnanimi, ' rahvaarv: ', deleted.rahvaarv,
' ||| UUED: linn: ',inserted.linnanimi, ' rahvaarv: ', inserted.rahvaarv)  --andmed
FROM deleted INNER JOIN inserted
ON deleted.linnID=inserted.linnID;


-- kontrollimiseks tuleb uuendada tabeli linn
UPDATE linnad SET linnanimi='pärnu väike', rahvaarv=50 WHERE linnID=2

SELECT * FROM linnad;
SELECT * FROM logi;
```
<img width="875" height="324" alt="{CA673345-A587-4D4E-9244-A5668340C7DE}" src="https://github.com/user-attachments/assets/200fb3a9-6bd9-48d3-9977-9d03360c90bc" />

```sql
DISABLE TRIGGER linnaLisamine ON linnad;
DISABLE TRIGGER linnaKustutamine ON linnad;

--kombineerime insert ja delete triger
CREATE TRIGGER linnaLisaKustut
ON linnad --tabelinimi, mis on vaja jälgida
FOR DELETE, INSERT
AS
BEGIN
	INSERT INTO logi(kasutaja, aeg, toiming, andmed)
	SELECT
	SYSTEM_USER, --kasutaja
	GETDATE(),  --aeg
	'on tehtud DELETE käsk',  --toiming
	CONCAT ('linn: ',deleted.linnanimi, ' rahvaarv: ', deleted.rahvaarv)  --andmed
	FROM deleted

	UNION ALL 

	SELECT
	SYSTEM_USER, --kasutaja
	GETDATE(),  --aeg
	'on tehtud INSERT käsk',  --toiming
	CONCAT ('linn: ',inserted.linnanimi, ' rahvaarv: ', inserted.rahvaarv)  --andmed
	FROM inserted;
END;

INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('yallinn', 650000);

DELETE FROM linnad WHERE linnID=2;

SELECT * FROM linnad;
SELECT * FROM logi;

--kasutaja dasasekretar õigused - lisamine, kustutamine ja ueendamine tabelis linnad,
--ei näe tabeli logi ja ei saa muuta trigerid

```




