CREATE DATABASE VYUKA_I4C;
Use vyuka_I4C;

Create table Zamestnanci(
id int not null PRIMARY KEY auto_increment,
jmeno varchar(50) not null,
prijmeni varchar(50) not null,
dochazka varchar(50) not null,
id_sklad int not null) charset = latin2 collate latin2_czech_cs;

Create table Sklad(
id int not null PRIMARY KEY auto_increment,
zbozimnozstvi int(50) not null,
nazevbudovy varchar(50) not null
);


 
Create table Zbozi(
id int not null PRIMARY KEY auto_increment,
nazev varchar(50) not null,
hodnota varchar(50) not null,
id_dodavatel varchar(3) not null) engine = myisam;








Create table kraj(
id int not null PRIMARY KEY auto_increment,
nazev_kraje varchar(50) not null,
id_sklad int not null);

  Create table dodavatel(
id int not null PRIMARY KEY auto_increment,
nazev_firmy varchar(50) not null);