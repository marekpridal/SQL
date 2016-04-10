create database kinofilm default char set utf8 collate utf8_czech_ci;
use kinofilm;

create table film
(
	id_film int not null auto_increment primary key,
	nazev varchar(20) not null,
	zanr varchar(10),
	rok int
)engine=InnoDB;

create table kino
(
	id_kino int not null auto_increment primary key,
	nazev varchar(20) not null,
	mesto varchar(20) not null,
	PSC varchar (5) not null,
	kapacita int
)engine=InnoDB;

create table kino_film
(
	id_kino int not null,
	id_film int not null,
	primary key(id_kino,id_film)
)engine=InnoDB;

alter table kino_film add constraint fk_kino_film foreign key (id_kino) references kino(id_kino) on delete cascade;
alter table kino_film add constraint fk_film_kino foreign key (id_film) references film(id_film) on delete cascade;

insert into film(nazev,zanr,rok) values ('Romeo a Julie','Tragedie',1992);
select * from film;

insert into kino(nazev,mesto,PSC) values ('BIO Oko','Praha',14000);
select * from kino;

insert into kino_film(ID_kino,ID_film) values (1,2);
select * from kino_film;

select film.nazev,kino.nazev from film
right join kino_film using (id_film)
right join kino using (id_kino);

alter table film add column cena int;
select * from film;

update film 
set cena=100
where id_film=1;

delete from film where id_film=5;

alter table film drop column cena;

create user 'fan@localhost'
identified by 'heslo';

grant select
on kinofilm.film
to 'fan@localhost';

grant insert
on kinofilm.film
to 'fan@localhost';

revoke insert
on kinofilm.film
from 'fan@localhost';

create view kino_mesto as
select nazev,mesto from kino;

select * from kino_mesto;

create or replace view vlozit_film as
select nazev,zanr,rok from film;

insert into vlozit_film values ('Deadpool','',2016);

select * from film;

drop user 'fan@localhost';

create table kopie_film as (select * from film);

select * from kopie_film;