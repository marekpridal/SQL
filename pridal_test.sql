use evidence_vlastniku_uctu;
/*úprava kódování*/
alter database evidence_vlastniku_uctu default char set utf8 collate utf8_czech_ci;
/*úprava enginu*/
alter table ucet engine=InnoDB;
alter table vlastnik engine=InnoDB;
/*přidání primary key */
alter table vlastnik add primary key (id);

alter table ucet add primary key (cislo);
/*auto increment */
ALTER TABLE vlastnik
MODIFY id int auto_increment;
/*přidání kolonky do účtu*/
alter table ucet add column sepsal varchar(20);
/*přidání kolonky pro cizí klíč*/
alter table ucet add column id_zakaznika int;
/*vložení záznamů*/
insert into vlastnik(id,jmeno,prijmeni) values(10,'Jirka','Novák');
/*import*/
use evidence_vlastniku_uctu;

insert into ucet(cislo,typ,datum_zalozeni,stav,id_zakaznika,sepsal)  
select cislo_uctu,typ_uctu,datum_zalozeni,stav,vlastnik,sepsal from data.ucty
where typ_uctu like 'běžný účet' OR typ_uctu like 'úvěrový účet';

insert into vlastnik select id,jmeno,prijmeni,ulice,mesto,psc,telefon from data.lide;
/*přidání cizího klíče*/
alter table ucet add constraint FK_zakaznik_ucet foreign key (id_zakaznika) references vlastnik(id) on delete cascade; 
/*kontokorent*/
alter table ucet add column kontokorent bool;
update ucet set kontokorent=true where typ like 'běžný účet';
update ucet set kontokorent=false where typ not like 'běžný účet';
/*stav běžného účtu*/
update ucet set stav=5000 where id_zakaznika=1;
/*smazaz zákazníka 2*/
delete from vlastnik where id=2;