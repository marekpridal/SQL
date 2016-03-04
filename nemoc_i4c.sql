create database nemoc_i4c default char set utf8 collate utf8_czech_ci;
use nemoc_i4c;
/*drop database nemoc_i4c;*/
create table lekar
(
	id_lekar int auto_increment not null primary key,
    jmeno varchar(10) not null,
    prijmeni varchar(10) not null,
    mesto varchar(10) not null,
    ulice varchar(10) not null,
    ordinace varchar(10) not null,
    telefon varchar(10) not null
)engine=InnoDB;

create table pojistovna
(
	id_poj varchar(4) not null primary key,
    nazev varchar(10) not null,
    mesto varchar(10) not null,
    ulice varchar(20) not null,
    telefon varchar(9) not null
)engine=InnoDB;

create table pacient
(
	id_pacient int not null auto_increment primary key,
    jmeno varchar(10) not null,
    prijmeni varchar(10) not null,
    mesto varchar(10) not null,
    ulice varchar(10) not null,
    rodne_cislo varchar(11) not null,
    telefon varchar(9) not null,
    id_poj varchar(4) not null,
    constraint foreign key FK_pojistovna_pacient (id_poj) references pojistovna (id_poj) on delete cascade
)engine=InnoDB;

create table navsteva
(
	id_lekar int not null,
    id_pacient int not null,
    primary key(id_lekar,id_pacient),
    datum date not null,
    duvod varchar(50),
    constraint foreign key FK_pacient_navsteva (id_pacient) references pacient(id_pacient) on delete cascade,
    constraint foreign key FK_lekar_navsteva (id_lekar) references lekar(id_lekar) on delete cascade
)engine=InnoDB;

create table lek_poj
(
	id_lekar int not null,
    id_poj varchar(4) not null,
    primary key(id_lekar,id_poj),
    constraint foreign key FK_lek_poj (id_lekar) references lekar(id_lekar) on delete cascade,
    constraint foreign key FK_poj_lek (id_poj) references pojistovna(id_poj) on delete cascade
)engine=InnoDB;