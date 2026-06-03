## Retsepti raamat database

[Põhimõisted](README.md) | [Ptotseduurid](protseduur.md) | [Ptotseduurid-XAMPP](protseduurXAMPP.md) | [kasutajad](kasutaja.md) | [trigerid](triger.md) | 
[kodutöö-keys](keys.md) | [hotelli-ruum](hotelliruum.md) | [DML-küsimused](kysimused.md) | [DDL-küsimused](kysimused2.md) | [retsept](retsepr.md) |
```sql
create database retseptiRaamat2;
use RetseptiRaamat2;

CREATE TABLE kasutaja(
kasutajaID int primary key identity(1,1),
eesnimi varchar(25) not null,
perenimi varchar(30) not null,
email varchar(35) not null);
SELECT * FROM kasutaja;

INSERT INTO kasutaja
VALUES ('Dasa', 'Jushinskaja', 'dasa@gmail.com'),
('Elina', 'Kotsur', 'elina@gmail.com'),
('Nastya', 'Petrova', 'nastya@gmail.com'),
('Polina', 'Sidorova', 'polina@gmail.com'),
('Karina', 'Ivanova', 'karina@gmail.com');

CREATE TABLE kategooria(
kategooriaID int primary key identity(1,1),
kagegooriaNimi varchar(50) not null);
SELECT * FROM kategooria;

INSERT INTO kategooria 
VALUES ('Supid'),('Magustoidud'),('Salatid'),
('Prantsuse köök'),('Hommikusöögid');

CREATE TABLE toiduaine(
toiduaineID int primary key identity(1,1),
toiduaineNimi varchar(50) not null);
SELECT * FROM toiduaine;

INSERT INTO toiduaine 
VALUES ('Suhkur'),('Piim'),
('Jahu'),('Kartul'),('Muna');

CREATE TABLE yhik(
yhikID int primary key identity(1,1),
yhikNimi varchar(50) not null);
SELECT * FROM yhik;

INSERT INTO yhik
VALUES ('gr'),('ml'),('tk'),('spl'),('tl');

CREATE TABLE retsept(
retseptID int primary key identity(1,1),
retseptiNimi varchar(100) not null,
kirjeldus varchar(200),
juhend varchar(500),
sisestatud_kp date,
kasutajaID int,
kategooriaID int,
FOREIGN KEY (kasutajaID) REFERENCES kasutaja(kasutajaID),
FOREIGN KEY (kategooriaID) REFERENCES kategooria(kategooriaID));
SELECT * FROM retsept;


INSERT INTO retsept 
VALUES ('Pannkoogid', 'Maitsvad pannkoogid', 'Sega ja prae', '2026-01-10', 1, 5),
('Kartulisalat', 'Klassikaline salat', 'Haki ja sega hapukoorega', '2026-02-15', 2, 3),
('Kanalihasupp', 'Kuum supp', 'Keeda kana ja köögiviljad', '2026-03-20', 3, 1),
('Küpsised', 'Magusad küpsised', 'Küpseta ahjus 180 kraadi juures', '2026-04-05', 4, 2),
('Omlett', 'Kiire hommikusöök', 'Klopi munad piimaga и prae', '2026-05-12', 5, 5);



CREATE TABLE koostis(
koostisID int primary key identity(1,1),
kogus int not null,
retsept_retsept_id int,
toiduaineID int,
yhikID int,
FOREIGN KEY (retsept_retsept_id) REFERENCES retsept(retseptID),
FOREIGN KEY (toiduaineID) REFERENCES toiduaine(toiduaineID),
FOREIGN KEY (yhikID) REFERENCES yhik(yhikID));
SELECT * FROM koostis;

INSERT INTO koostis
VALUES (200, 1, 3, 1), 
(300, 1, 2, 2), 
(2, 1, 5, 3),   
(4, 2, 4, 3),   
(3, 5, 5, 3);


CREATE TABLE tehtud(
tehtudID int primary key identity(1,1),
tehtud_kp date not null,
retseptID int,
FOREIGN KEY (retseptID) REFERENCES retsept(retseptID));
SELECT * FROM tehtud;

INSERT INTO tehtud 
VALUES ('2026-01-11', 1),('2026-02-16', 2),
('2026-03-22', 3),('2026-04-10', 4),('2026-05-13', 5);

--1
CREATE PROCEDURE muudaTabeliNim
@vanaNimi varchar(50),
@uusNimi varchar(50)
AS
BEGIN
EXEC sp_rename @vanaNimi, @uusNimi;

SELECT name FROM sys.tables;
END
EXEC muudaTabeliNim 'kasutaja', 'kasutaja2';


--2
CREATE PROCEDURE lisaVeerg
@tabel varchar(50),
@veeruNimi varchar(50),
@tyyp varchar(50)
AS
BEGIN
DECLARE @sql varchar(200);
SET @sql = 'ALTER TABLE ' + @tabel + ' ADD ' + @veeruNimi + ' ' + @tyyp;
EXEC(@sql);
SELECT name FROM sys.columns WHERE object_id = OBJECT_ID(@tabel);
END
EXEC lisaVeerg 'kasutaja2', 'telefon', 'varchar(20)';


--3
CREATE PROCEDURE muudaVeer
@tabel varchar(50),
@veerg varchar(50),
@uusTyyp varchar(50)
AS
BEGIN
DECLARE @sql varchar(200);
SET @sql = 'ALTER TABLE ' + @tabel + ' ALTER COLUMN ' + @veerg + ' ' + @uusTyyp;
EXEC(@sql);
SELECT name, system_type_id
FROM sys.columns
WHERE object_id = OBJECT_ID(@tabel) AND name=@veerg;
END

EXEC muudaVeer 'kasutaja2', 'email', 'varchar(100)';

EXEC sp_help 'kasutaja2';


CREATE TABLE lemmikretsept (
    lemmikID INT IDENTITY(1,1) PRIMARY KEY,
    lisamise_kp DATE NOT NULL,
    kasutajaID INT,
    retseptID INT,
    FOREIGN KEY (kasutajaID) REFERENCES kasutaja2(kasutajaID), 
    FOREIGN KEY (retseptID) REFERENCES retsept(retseptID)
);
SELECT * FROM lemmikretsept;

INSERT INTO lemmikretsept 
VALUES ('2026-01-15', 1, 1), 
('2026-02-20', 2, 2), 
('2026-03-25', 3, 3), 
('2026-04-12', 4, 4), 
('2026-05-18', 5, 5); 

--1
CREATE PROCEDURE lisaLemmik
    @kp DATE,
    @kID INT,
    @rID INT
AS
BEGIN
    INSERT INTO lemmikretsept (lisamise_kp, kasutajaID, retseptID) 
    VALUES (@kp, @kID, @rID);
END;

EXEC lisaLemmik @kp = '2026-05-27', @kID = 1, @rID = 3;

SELECT * FROM lemmikretsept;

--2
CREATE PROCEDURE kustutaLemmikID
    @id INT
AS
BEGIN
    DELETE FROM lemmikretsept WHERE lemmikID = @id;
END;

EXEC kustutaLemmikID @id = 6;

SELECT * FROM lemmikretsept;

--õigused staff
GRANT SELECT, INSERT ON toiduaine TO staff2;
GRANT SELECT, INSERT ON kategooria TO staff2;

DENY UPDATE, DELETE ON toiduaine TO staff2;
DENY UPDATE, DELETE ON kategooria TO staff2;

GRANT SELECT ON kasutaja2 TO staff2;
DENY INSERT, UPDATE, DELETE ON kasutaja2 TO staff2;

-- õigused manager
GRANT SELECT ON kasutaja2 TO manager2;
GRANT SELECT ON kategooria TO manager2;
GRANT SELECT ON yhik TO manager2;
GRANT SELECT ON tehtud TO manager2;
GRANT SELECT ON lemmikretsept TO manager2;
GRANT SELECT ON toiduaine TO manager2;

DENY INSERT, UPDATE, DELETE ON toiduaine TO manager2;
DENY INSERT, UPDATE, DELETE ON kasutaja2 TO manager2;

GRANT SELECT, INSERT, UPDATE, DELETE ON retsept TO manager2;
GRANT SELECT, INSERT, UPDATE, DELETE ON koostis TO manager2;




```
<img width="973" height="846" alt="{7B6E8C3D-6BB7-4102-BF35-D802BDD741C7}" src="https://github.com/user-attachments/assets/41cdb75b-c977-437e-90f5-dc808a9e54ff" />

```sql
--manager

SELECT * FROM lemmikretsept;
SELECT * FROM yhik;
INSERT INTO retsept (retseptiNimi, kirjeldus, juhend, sisestatud_kp, kasutajaID, kategooriaID)
VALUES ('Manageri Kook', 'Test', 'Sega ja küpseta', '2026-05-27', 1, 2);
UPDATE retsept SET kirjeldus = 'Uuendatud kirjeldus manageri poolt' WHERE retseptiNimi = 'Manageri Kook';
DELETE FROM retsept WHERE retseptiNimi = 'Manageri Kook';



INSERT INTO toiduaine (toiduaineNimi) VALUES ('Manageri-Karri');
DELETE FROM kasutaja2 WHERE kasutajaID = 1;



INSERT INTO yhik (yhikNimi) VALUES ('kg');
```

```sql
--staff 
SELECT * FROM toiduaine;
INSERT INTO toiduaine (toiduaineNimi) VALUES ('Test-Sool-Staff');
SELECT * FROM kategooria;
INSERT INTO kategooria (kagegooriaNimi) VALUES ('Test-Supp-Staff');
SELECT * FROM kasutaja2;



DELETE FROM toiduaine WHERE toiduaineID = 1;
UPDATE kategooria SET kagegooriaNimi = 'Häkitud' WHERE kategooriaID = 1;
INSERT INTO kasutaja2 (eesnimi, perenimi, email) VALUES ('Häkker', 'Test', 'h@h.ee');


SELECT * FROM retsept;
```
