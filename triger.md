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


