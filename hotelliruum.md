## Andmebaas Hotelliruumi reserveerimine

[Põhimõisted](README.md) | [Ptotseduurid](protseduur.md) | [Ptotseduurid-XAMPP](protseduurXAMPP.md) | [kasutajad](kasutaja.md) | [trigerid](triger.md) | 
[kodutöö-keys](keys.md) | [hotelli-ruum](hotelliruum.md) | [DML-küsimused](kysimused.md) | [DDL-küsimused](kysimused2.md) | [retsept](retsepr.md) |

CTRL + E
```sql
create database hotellDasa;
use hotellDasa;

--1. guest
CREATE TABLE guest(
guestID int Primary key identity(1,1),
firstname varchar(80),
lastname varchar(80)not null,
memberSince DATE);

SELECT * FROM guest;

INSERT INTO guest
VALUES ('nastya', 'jushinskaja','2025-07-30');
```
<img width="296" height="78" alt="{AFFD3B43-1744-4ECD-AEA9-F49169F57900}" src="https://github.com/user-attachments/assets/ba80a811-d547-400a-82ea-93c456bd7bc4" />

```sql
--2. reservation

CREATE TABLE reservation(
reservationID int PRIMARY KEY identity(1,1),
date_in DATE,
date_out DATE,
made_by varchar(20),
guestID int,
FOREIGN KEY (guestID) REFERENCES guest(guestID));

SELECT * FROM reservation;

INSERT INTO reservation
VALUES ('2023-01-1','2025-11-20', 'admin', 4);
```

<img width="371" height="82" alt="{0C63D184-56BF-4F70-9E48-2A74A5104247}" src="https://github.com/user-attachments/assets/504343a9-1f41-44c6-b179-7a3b415397d5" />

```sql
--3. room_type

CREATE TABLE room_type(
room_typeID int primary key identity(1,1),
descriptionn varchar(80),
max_capacity int);

SELECT * FROM room_type;

INSERT INTO room_type
VALUES ('double room', 2);
```

<img width="272" height="79" alt="{0266A37B-F171-4E13-B710-77D49855747E}" src="https://github.com/user-attachments/assets/f57485c2-afae-4dc9-8f3c-46fe7280bb7c" />

```sql
--4. room

CREATE TABLE room(
roomID int primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_typeID int,
FOREIGN KEY (room_typeID) REFERENCES room_type(room_typeID));


SELECT * FROM room;

INSERT INTO room
VALUES ('B149', 'bad', 'hoivatud', 2, 3);
```

<img width="364" height="77" alt="{1185EBA6-0CC5-4D8D-9ACF-D0BF4FA42EE1}" src="https://github.com/user-attachments/assets/f70d784d-4ba8-4486-a2de-452e3eb364f3" />

```sql
--5. reserved_room

CREATE TABLE reserved_room(
reserved_roomID int primary key identity(1,1),
number_of_rooms int,
room_typeID int,
reservationID int,
FOREIGN KEY (room_typeID) REFERENCES room_type(room_typeID),
FOREIGN KEY (reservationID) REFERENCES reservation(reservationID),
status varchar(20));

SELECT * FROM reserved_room

INSERT INTO reserved_room
VALUES (1,3,4, 'not ready');
```

<img width="433" height="104" alt="{FA0BA43E-096D-4258-A973-D47A481525F9}" src="https://github.com/user-attachments/assets/db36e511-bfd3-4fb8-8c8b-64d73159228e" />

```sql
--6. occupied_room
CREATE TABLE occupied_room(
occupied_roomID int PRIMARY KEY identity(1,1),
check_in DATE,
check_out DATE,
roomID int,
reservationID int,
FOREIGN KEY (roomID) REFERENCES room(roomID),
FOREIGN KEY (reservationID) REFERENCES reservation(reservationID));

SELECT * FROM occupied_room

INSERT INTO occupied_room
VALUES ('2019-06-09', '2020-07-10',3,4);
```

<img width="415" height="101" alt="{AE430B46-2804-4599-8294-7A8EF58B9AE7}" src="https://github.com/user-attachments/assets/8b6c287e-1fbf-4c0b-9965-63d7939d2e18" />

```sql
--7. hosted_at

CREATE TABLE hosted_at(
hosted_atID int PRIMARY KEY identity(1,1),
guestID int,
occupied_roomID int,
FOREIGN KEY (guestID) REFERENCES guest(guestID),
FOREIGN KEY (occupied_roomID) REFERENCES occupied_room(occupied_roomID));

SELECT * FROM hosted_at

INSERT INTO hosted_at
VALUES (4,4);
```

<img width="292" height="88" alt="{2F30FD53-568F-4CB8-958A-51AFC5C75244}" src="https://github.com/user-attachments/assets/e18c9ab2-fb63-4833-895a-31c634a8d00e" />

## Diagramm
<img width="1008" height="793" alt="{0EE6FCFD-C97E-43D9-891C-0248E003B013}" src="https://github.com/user-attachments/assets/80428044-960b-4386-949b-d7ec2b922353" />











