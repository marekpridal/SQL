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

alter table zamestnanci convert to char set utf8 collate utf8_czech_ci;

alter table kraj drop column id_sklad;

alter table sklad add column id_kraj int not null;

alter table sklad add constraint FK_sklad_kraj foreign key (id_kraj) references kraj(id) on delete cascade;

create table sklad_zam
(
		id_zam int not null,
        id_sklad int not null,
        primary key(id_zam,id_sklad),
        constraint FK_sklad_zam foreign key(id_zam) references Zamestnanci(id) on delete cascade,
        constraint FK_zam_sklad foreign key(id_sklad) references Sklad(id) on delete cascade
)engine = innodb charset utf8 collate utf8_czech_ci;

/*drop table sklad_zam;*/

alter table Zbozi add column id_dod int not null;
alter table Zbozi add constraint FK_dod_zbozi foreign key(id_dodavatel) references dodavatel(id) on delete cascade;
/*alter table Zbozi drop column id_dod;
alter table Zbozi drop foreign key FK_dod_zbozi;*/
alter table zbozi change column id_dodavatel id_dodavatel int not null;
alter table Zbozi engine = InnoDB;

create table zbo_dod
(
	id_zbo int not null,
    id_dodavka int not null,
    /*datum date not null,*/
    primary key(id_zbo,id_dodavka)
)engine = innodb charset utf8 collate utf8_czech_ci;

/*drop table zbo_dod;*/

create table dodavka
(
	id_dodavka int not null,
    datum date not null,
    splatnost date not null,
    id_dod int not null,
    primary key(id_dodavka),
    constraint FK_dodavka_dod foreign key (id_dod) references dodavatel(id) on delete cascade
);

alter table zbo_dod add constraint FK_dodavka foreign key (id_dodavka) references dodavka(id_dodavka) on delete cascade;
alter table zbo_dod add constraint FK_zbo foreign key (id_zbo) references Zbozi(id) on delete cascade;