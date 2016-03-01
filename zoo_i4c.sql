create database zoo_i4c default character set utf8 collate utf8_czech_ci;
use zoo_i4c;

create table zivocich(
	id_ziv int not null primary key auto_increment,
    trida varchar(10) not null,
	rod varchar(10) not null,
    druh varchar(10) not null
);

create table zvire
(
	id_zvi int not null primary key auto_increment,
    jmeno varchar(20) not null,
    pohlavi varchar(4) not null,
    vaha int not null,
    vyska int not null,
    rok_narozeni varchar(4)
);

alter table zvire add column id_ziv int not null;

alter table zvire add constraint FK_ziv_zvi foreign key (id_ziv) references zivocich(id_ziv) on delete cascade;

create table kotec
(
	id_kot int not null primary key auto_increment,
    max_velikost varchar(5) not null,
    typ varchar(10) not null
);

create table pavilon(
	id_pav int not null primary key auto_increment,
    nazev varchar(15) not null,
    typ varchar(15) not null,
    umisteni varchar(10) not null
);

alter table kotec add column  id_pav int not null;

alter table kotec add constraint FK_pav_kot foreign key (id_pav) references pavilon(id_pav) on delete cascade;

alter table zvire add column id_kot int not null;

alter table zvire add constraint FK_kotec_zvi foreign key (id_kot) references kotec(id_kot) on delete cascade;

create table ockovani(
	datum date not null,
    id_zvi int not null,
    druh int not null,
    primary key(datum,id_zvi,druh),
    constraint FK_zvi_ock foreign key(id_zvi) references zvire(id_zvi) on delete cascade
);