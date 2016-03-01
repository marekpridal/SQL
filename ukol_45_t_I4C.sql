create database firma_I4C;
/*engine = InnoDB char set uft8 collate utf8_czech_ci;*/

use firma_I4C;  

create table os_kr (
id int not null primary key auto_increment,
nazev varchar(30) not null,
velikost int not null,
stat_m varchar(30)
);

INSERT INTO os_kr (nazev, velikost, stat_m) 
VALUES ("Moravskoslezský",5427,"Ostrava"),
("Olomoucký",5267 ,"Olomouc"),
("Zlínský",3964,"Zlín"),
("Jihomoravský",7196,"Brno"),
("Vysočina",6795,"Jihlava"); 

create table Kraje (
id int not null primary key auto_increment,
nazev varchar(30) not null,
velikost int not null,
statutarni_mesto varchar(30)
);

create table sklady(
id int not null primary key auto_increment,
velikost int not null,
druh varchar(30),
id_kraje int not null,
id_zbozi int not null
);

create table zbozi(
id int not null primary key auto_increment,
nazev varchar(30) not null,
velikost int not null,
hmotnost int not null,
druh varchar(30) not null,
pocet int not null,
id_sklady int not null,
id_dodavatele int not null
);

create table dodavatele(
id int not null primary key auto_increment,
nazev varchar(30) not null,
druh_zbozi varchar(30) not null,
id_zbozi int not null
);

ALTER TABLE sklady add foreign key(id_kraje) references kraje(id);
ALTER TABLE sklady add foreign key(id_zbozi) references zbozi(id);
ALTER TABLE zbozi add foreign key(id_sklady) references sklady(id);
ALTER TABLE zbozi add foreign key(id_dodavatele) references dodavatele(id);
ALTER TABLE dodavatele add foreign key(id_zbozi) references zbozi(id);


alter table sklady drop foreign key sklady_ibfk_2;

show create table sklady;

create table zbo_dod
(
	id_zbo int not null,
    id_dod int not null,
    primary key(id_zbo,id_dod)
)engine = InnoDB char set utf8 collate utf8_czech_ci;
/*drop table zbo_dod;*/

alter table zbo_dod add constraint FK_zbo_dod foreign key (id_zbo) references zbozi(id) on delete cascade;
alter table zbo_dod add constraint FK_dod_zbo foreign key (id_dod) references dodavatele(id) on delete cascade;

create table skl_zbo
(
	id_skl int not null,
    id_zbo int not null,
    primary key(id_skl,id_zbo)
)engine = InnoDB char set utf8 collate utf8_czech_ci;

alter table skl_zbo add constraint FK_skl_zbo foreign key (id_skl) references sklady(id);
alter table skl_zbo add constraint FK_zbo_skl foreign key (id_zbo) references zbozi(id);

alter table dodavatele convert to char set utf8 collate utf8_czech_ci;
alter table kraje convert to char set utf8 collate utf8_czech_ci;
alter table sklady convert to char set utf8 collate utf8_czech_ci;
alter table zbozi convert to char set utf8 collate utf8_czech_ci;
alter table zbo_dod convert to char set utf8 collate utf8_czech_ci;
alter table skl_zbo convert to char set utf8 collate utf8_czech_ci;

select * from os_kr;

insert into kraje select * from os_kr;

select * from kraje;

show create table dodavatele;

insert into dodavatele (nazev,zbozi) values ("PPL","PC")