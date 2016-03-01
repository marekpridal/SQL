create database dostihy default character set utf8 collate utf8_czech_ci;
use dostihy;

create table majitel
(
	id_majitel int not null primary key auto_increment,
    jmeno varchar(15) not null,
    prijmeni varchar(15) not null
);

create table kone
(
	id_kone int not null primary key auto_increment,
    id_majitel int not null,
    nazev varchar(15) not null,
    vaha varchar(3) not null,
    vyska varchar(4) not null,
    rok varchar(4) not null
);

alter table kone add constraint FK_ma_ko foreign key (id_majitel) references majitel(id_majitel) on delete cascade;

/*alter table kone drop foreign key FK_ma_ko;
drop table majitel;*/

create table zokej
(
	id_zokej int not null primary key,
    jmeno varchar(15) not null,
    prijmeni varchar(15) not null,
    rok_narozeni varchar(4) not null,
    vyska varchar (3) not null,
    vaha varchar (3) not null
);

create table vysledky
(
	id_kone int not null,
    id_zokej int not null,
    datum date not null,
    primary key(id_kone,id_zokej,datum),
    cas varchar (10) not null,
    rocnik varchar (4) not null
);

create table ko_zo
(
	id_kone int not null,
    id_zokej int not null,
    primary key(id_kone,id_zokej)
);

alter table ko_zo add constraint FK_ko_zo foreign key(id_kone) references kone(id_kone);
alter table ko_zo add constraint FK_zo_ko foreign key(id_zokej) references zokej(id_zokej);

alter table vysledky add constraint FK_ko_vy foreign key(id_kone) references ko_zo(id_kone) on delete cascade;
alter table vysledky add constraint FK_zo_vy foreign key(id_zokej) references ko_zo(id_zokej) on delete cascade;

/*drop database dostihy;*/
/*
drop table vysledky;

alter table vysledky drop foreign key FK_ko_vy;*/