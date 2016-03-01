create database  nemoc_I4C default character set utf8 collate utf8_czech_ci;
use nemoc_i4c;

create table lekar
(
		id_lekar int not null primary key auto_increment,
        jmeno varchar(20) not null,
        prijmeni varchar(20) not null,
        mesto varchar(20) not null,
        ulice varchar(20) not null,
        ordinace varchar(10) not null,
        telefon varchar(9) not null
);

show create table lekar;

create table pacient
(
		id_pacient int not null primary key auto_increment,
        jmeno varchar(10) not null,
        prijmeni varchar(10) not null,
        mesto varchar(20) not null,
        ulice varchar(20) not null,
        rodne_cislo int not null,
        telefon varchar(9) not null
);

create table pojistovna
(
		id_poj varchar(4) not null primary key,
        nazev varchar(20) not null,
        mesto varchar(20) not null,
        ulice varchar(20) not null,
        telefon varchar(9) not null
);

/*drop table doktor;*/

alter table pacient add id_poj varchar(4) not null;

alter table pacient add constraint FK_pac_poj foreign key(id_poj) references pojistovna(id_poj);

create table navsteva
(
	id_lekar int not null,
	id_pacient int not null,
    datum date not null,
    duvod varchar(50),
    primary key(id_lekar,id_pacient,datum),
	constraint FK_pac_nav foreign key(id_pacient) references pacient(id_pacient),
	constraint FK_lek_nav foreign key(id_lekar) references lekar(id_lekar)    
);

create table lek_poj
(
	id_lekar int not null,
    id_poj varchar(4) not null,
    primary key(id_lekar,id_poj),
    constraint FK_lek_poj foreign key (id_lekar) references lekar(id_lekar),
    constraint FK_poj_lek foreign key (id_poj) references pojistovna(id_poj)
);

/*alter table lekar add zamereni varchar(15) not null;

alter table lekar drop column zamereni;*/