```sql
CREATE DATABASE IsikuteAndmebaas;
USE IsikuteAndmebaas;

CREATE TABLE AADRESS (
aadress_ID INT PRIMARY KEY IDENTITY(1,1), 
riik VARCHAR(30),
linn VARCHAR(30),
tanav VARCHAR(30),
maja VARCHAR(10),
korter VARCHAR(10),
postiindeks VARCHAR(15)
)

CREATE TABLE ISIK (
isik_ID INT PRIMARY KEY IDENTITY(1,1),
eesnimi VARCHAR(25) NOT NULL,
perenimi VARCHAR(30) NOT NULL,
isikukood CHAR(11) UNIQUE NOT NULL, 
sugu VARCHAR(10)
);


CREATE TABLE ELAMINE (
elamine_ID INT PRIMARY KEY IDENTITY(1,1),
isik_ID INT,
aadress_ID INT,
alates DATE,
kuni DATE,
kommentaar TEXT,
FOREIGN KEY (isik_ID) REFERENCES ISIK(isik_ID),
FOREIGN KEY (aadress_ID) REFERENCES AADRESS(aadress_ID)
);

SELECT * FROM AADRESS;
SELECT * FROM ISIK;
SELECT * FROM ELAMINE;
SELECT * FROM logi;

GRANT SELECT, INSERT, UPDATE ON ISIK TO isikNimi;
GRANT SELECT, INSERT, UPDATE ON ELAMINE TO isikNimi;
GRANT SELECT ON AADRESS TO isikNimi;

DENY ALTER TO isikNimi;
DENY ALTER ANY DATABASE DDL TRIGGER TO isikNimi;

DENY SELECT, INSERT, UPDATE, DELETE ON logi TO isikNimi;

CREATE TABLE logi (
id INT PRIMARY KEY IDENTITY(1,1),
kasutaja VARCHAR(30),
kuupaev DATETIME,
sisestatudAndmed TEXT
);


--1
CREATE TRIGGER elamineUuendamine
ON ELAMINE
FOR UPDATE
AS
BEGIN
INSERT INTO logi(kasutaja, kuupaev, sisestatudAndmed)
SELECT 
SYSTEM_USER, 
GETDATE(),   
CONCAT(
'on tehtud UPDATE käsk | ',
'tegevus: UPDATE в Elamine. ID kirjed: ', d.elamine_ID,
' ||| vana: Isik_ID=', d.isik_ID, ', Aadress_ID=', d.aadress_ID,
' ||| uus: Isik_ID=', i.isik_ID, ', Aadress_ID=', i.aadress_ID)
FROM deleted d
INNER JOIN inserted i ON d.elamine_ID = i.elamine_ID;
END;

--2
ALTER TRIGGER elamineLisamine
ON ELAMINE
FOR INSERT
AS
BEGIN
INSERT INTO logi(kasutaja, kuupaev, sisestatudAndmed)
SELECT 
SYSTEM_USER,
GETDATE(),
CONCAT(
'tegevus: INSERT Elamine. loodi uus ID: ', i.elamine_ID,
' ||| seotud Isik_ID: ', i.isik_ID,
' ||| seotud Aadress_ID: ', i.aadress_ID, a.linn,
' ||| alguskuupäev: ', i.alates, ISIK.perenimi
        )
FROM inserted i
INNER JOIN ISIK ON isik.isik_ID = i.isik_ID
INNER JOIN AADRESS a ON i.aadress_ID = a.aadress_ID;
END;

SELECT * FROM logi;


--1
CREATE PROCEDURE otsingPerenimi
@taht char(1)
AS
BEGIN
    SELECT * FROM ISIK WHERE perenimi LIKE @taht + '%'; 
END;

EXEC otsingPerenimi 'k'

--2
CREATE PROCEDURE lisaIsik
@uusnimi varchar(25),
@uusPerenimi varchar(30),
@isikukood char(11),
@sugu varchar(10)
AS
BEGIN
	INSERT INTO ISIK(eesnimi, perenimi, isikukood, sugu)
	VALUES (@uusnimi, @uusPerenimi, @isikukood, @sugu);
	SELECT * FROM ISIK;
END;

EXEC lisaIsik 'polina', 'Kov', '409896634', 'naine';

--3
CREATE PROCEDURE kustutaIsik
@kustutaID int
AS
BEGIN
	SELECT * FROM ISIK
	DELETE FROM ISIK WHERE isik_ID=@kustutaID;
	SELECT * FROM ISIK
END;

EXEC kustutaIsik 9;


--12
CREATE TRIGGER isikuKustutamine
ON ISIK 
FOR DELETE
AS
INSERT INTO logi(kasutaja, kuupaev, sisestatudAndmed)
SELECT 
    SYSTEM_USER, 
    GETDATE(),   
    CONCAT('on tehtud DELETE käsk | eesnimi: ', deleted.eesnimi, ' perenimi: ', deleted.perenimi, ' isikukood: ', deleted.isikukood) 
FROM deleted;

--


DELETE FROM ISIK WHERE isik_ID = 2;

SELECT * FROM ISIK;
SELECT * FROM logi;

INSERT INTO ISIK 
VALUES ('nstya', 'jushik', '8888891234', 'naine');

INSERT INTO AADRESS (riik, linn, tanav, maja, korter, postiindeks)
VALUES ('Eesti', 'Tallinn', 'Sõpruse pst', '12', '4', '13411');


SELECT * FROM logi;

INSERT INTO ELAMINE 
VALUES (5, 1, '2024-01-10', NULL, 'test');

DELETE FROM ISIK WHERE isik_ID=6;

UPDATE ELAMINE 
SET kommentaar = 'Uus muudetud aadress' 
WHERE elamine_ID = 2;


SELECT * FROM AADRESS;
SELECT * FROM ISIK;
SELECT * FROM ELAMINE;
SELECT * FROM logi;

--11
CREATE VIEW [kuvaKoikAndmedKorraga] 
AS
SELECT 
    i.isik_ID, i.eesnimi, i.perenimi, i.isikukood, i.sugu,
    e.elamine_ID, e.alates, e.kuni, e.kommentaar,
    a.aadress_ID, a.riik, a.linn, a.tanav, a.maja, a.korter, a.postiindeks
FROM ELAMINE e
INNER JOIN ISIK i ON e.isik_ID = i.isik_ID
INNER JOIN AADRESS a ON e.aadress_ID = a.aadress_ID;


SELECT * FROM [kuvaKoikAndmedKorraga];

```
