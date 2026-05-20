## SQL Server – Kasutajate autentimine ja õiguste haldamine
Mis on autentimine SQL Serveris?
 ### Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverisse sisse logida.

## SQL Serveris kasutatakse kahte peamist autentimise tüüpi:

1. Windows Authentication
Selle puhul kasutatakse samu kasutajaandmeid, millega logitakse sisse Windows operatsioonisüsteemi.

>Kasutajanimi ja parool on seotud Windowsiga
>Turvalisem lahendus
>Paroole haldab Windows
>Kasutaja ei pea eraldi SQL Serveri parooli teadma

2. SQL Server Authentication
>Selle puhul luuakse kasutaja otse SQL Serverisse.
>Kasutaja ei ole seotud Windowsiga
>Määratakse eraldi kasutajanimi ja parool
>Sobib veebirakenduste jaoks: direktor dasa
>Näide kasutajast: DirectorNimi
>Parool: director
>Kasutaja loomine SQL Serveris

1. Serveritaseme kasutaja loomine (Login)
Sammud
Ava:
Security → Logins
Tee paremklikk ja vali:
New Login...
<img width="703" height="659" alt="{638799D5-D4F1-4890-9AC1-AB9D1795195A}" src="https://github.com/user-attachments/assets/49c791c8-6d56-4fd8-b33b-eabc8db272b2" />

>Harjutamiseks võib eemaldada linnukese:  User must change password at next login
Server Roles
Menüüst Server Roles saab määrata serveri üldised õigused.

>Tavaliselt piisab rollist: public
<img width="699" height="655" alt="{5FC69F94-B4D8-40F2-8237-9FA60B3FA3BD}" src="https://github.com/user-attachments/assets/0bbee161-b833-4c0d-9fda-03e18d9a5ff6" />
<img width="289" height="409" alt="{28134FBA-BC4A-4EF1-9D7B-08D0F6810F37}" src="https://github.com/user-attachments/assets/ef6a1e85-91d9-4fb0-b15e-5d428759cd8b" />
<img width="702" height="651" alt="{9974E757-71F9-4CD1-BD6A-F98786F34475}" src="https://github.com/user-attachments/assets/6cff3308-b514-4fe8-ba17-94bbfcee7b13" />


2. Andmebaasi kasutaja loomine (User)
Ava:
>Database → Security → Users
>Tee paremklikk:  New User...
>Seosta kasutaja loginiga
<img width="468" height="502" alt="{421F4D0A-A8B7-4185-8A1A-C151CBB45F94}" src="https://github.com/user-attachments/assets/a3e018e4-dacc-4c7a-a059-c43d82daa398" />
>Membership ja õigused
>Menüüst Membership saab määrata kasutaja rollid.
db_datareader → võib lugeda
db_datawriter → võib kirjutada
<img width="604" height="296" alt="{858051A5-3159-4479-852C-B22B88171BC3}" src="https://github.com/user-attachments/assets/8527e7c2-ffef-4626-8f01-ed637ee21737" />



SQL Server Authentication Mode muutmine
Kui ilmub viga: Error 18456, siis on tavaliselt lubatud ainult Windows Authentication.
Lahendus
Server → Properties
Security
Vali: SQL Server and Windows Authentication mode
GRANT käsud õiguste jagamiseks
GRANT käsuga antakse kasutajale õigused.

Käsk	Tähendus
SELECT	Lugemine
INSERT	Lisamine
UPDATE	Muutmine
DELETE	Kustutamine

<img width="517" height="237" alt="{B928F069-1CC9-431B-81B0-D7153D4D5697}" src="https://github.com/user-attachments/assets/4a0fcd4d-3d84-4cef-820c-cbc653eae6e4" />
<img width="568" height="266" alt="{52C4689D-0522-472F-AF92-7ECEE5120A27}" src="https://github.com/user-attachments/assets/f37fedee-3ae0-4d36-b94a-ba2a5f6736cd" />
<img width="712" height="241" alt="{1ED246AF-576E-43EE-A968-8CF518F28747}" src="https://github.com/user-attachments/assets/154dfd56-8a2e-4acc-9763-56030261b70d" />
<img width="600" height="240" alt="{52C8CA04-BC85-4DBC-A85E-702F8713DAAC}" src="https://github.com/user-attachments/assets/229ffc3a-1f94-4784-9adf-99400acd4f31" />
<img width="477" height="93" alt="{161FDA65-BF14-42F6-AFAE-1918082DC752}" src="https://github.com/user-attachments/assets/da6e516a-6d14-4cad-9f2e-f0f7a33f0908" />



