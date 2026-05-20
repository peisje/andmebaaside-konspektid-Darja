- 1
  ```sql
  CREATE DATABASE kasutajaTITpv24;

USE kasutajaTITpv24;

CREATE TABLE loomad(
loomId int primary key identity(1,1),
loomNimi varchar(25) not null,
vanus int check(vanus>0),
chip  bit)

INSERT INTO loomad(loomNimi,vanus,chip)
VALUES ('kass dasa', 6, 1);

SELECT * FROM loomad;

--õiguste määramine
--GRANT - õiguste lubamine - разрешение прав пользователя
--DENY -kasutaja õiguste keelamine - запрет 

GRANT SELECT ON loomad TO direktorDasa;
GRANT INSERT ON loomad TO direktorDasa;
--or all together
GRANT SELECT, INSERT ON loomad TO direktorDasa;
--saab uuendada ainult vanus!!!
GRANT UPDATE(vanus) ON loomad TO direktorDasa;

DENY DELETE ON loomad TO direktorDasa;

  ```

- 2
  ```sql
  --Õiguste kontroll
--direktorDasa saab vaadata  tabelisisu
SELECT * FROM loomad;
--directorDasa saab lisada andmeid tabelisse loomad
INSERT INTO loomad(loomNimi,vanus,chip)
VALUES ('papagoi polina', 2, 0);


--direktorDasa ei saa kustutada tabelist
DELETE FROM loomad WHERE loomId=1


--ei saa tabeleid luua
CREATE TABLE test(id int);

--iga kasutaja ise saab kontrollida temale määratud õigused
SELECT * FROM fn_my_permissions('loomad','OBJECT')

--uuendamine vanus kus loomId=1
UPDATE loomad SET vanus=555 WHERE loomId=1;
UPDATE loomad SET chip=0 WHERE loomId=1;
  ```

- 3
  ```sql
  CREATE DATABASE MovieBase;

USE MovieBase;

CREATE TABLE movies(
movieId int primary key identity(1,1),
movieNimi varchar(25) not null,
moviesYear int not null,
movieDir varchar(30) not null,
movieCost decimal(15,1))

INSERT INTO movies(movieNimi,moviesYear,movieDir, movieCost)
VALUES ('Inception', 2010, 'Christopher Nolan', 170000000.00),
('The Matrix', 1999, 'Lana Wachowski', 67000000.00),
('Interstellar', 2014, 'Christopher Nolan', 111000000.00),
('Pulp Fiction', 1994, 'Quentin Tarantino', 8000000.00),
('Avatar', 2009, 'James Cameron', 228000000.00),
('Gladiator', 2000, 'Ridley Scott', 10000000.00),
('The Dark Knight', 2008, 'Christopher Nolan', 167000000.00);

SELECT * FROM movies;
SELECT * FROM guest;

CREATE TABLE guest(
guestid int primary key identity(1,1),
name VARCHAR(50) not null);

INSERT INTO guest (name)
VALUES ('dasa'), ('elina'), ('nastya'),
('karina'), ('polina'), ('liza'),('sasha');

  ```
