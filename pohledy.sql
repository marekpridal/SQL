use prospech;

create view prumer_trid as
/*Vytvořte dotaz, který vybere všechny třídy, které mají stejný průměr jako třída Ep3A (tuto nevypisovat).*/
select t.IDtridy,t.nazevtridy,SUM(h.znamka)/COUNT(s.IDs) as 'Průměr třídy' from trida t
inner join student s using (IDtridy)
inner join hodnoceni h using (IDs)
where t.nazevtridy not like 'E3A'
group by t.IDtridy
having (SUM(h.znamka)/COUNT(s.IDs)) = 
	(
    select SUM(h2.znamka)/COUNT(s2.IDs) from trida t2
	inner join student s2 on t2.IDtridy=s2.IDtridy
	inner join hodnoceni h2 on h2.IDs=s2.IDs
    where t2.nazevtridy like 'E3A'
    );
    
show create view prumer_trid;
select * from prumer_trid;

/* NEFUNKCNI Vytvořte dotaz, který vypíše všechny studenty třídy Ep3B, kteří nemají žádnou absenci v tomto pololetí (VD- pomocí operátorů IN, ALL a EXISTS).*/
select s.IDs,s.prijmeni,s.jmeno,t.nazevtridy,a.duvod from student s
left join trida t using (IDtridy)
left join absence a using (IDs)
where NOT exists
(
	select a.duvod from student
    inner join absence a using (IDs)
);

/*insert into student (IDs,prijmeni,jmeno,IDtridy,RodCislo) VALUES(500,'Přidal','Marek',1,'961129/0000');*/

/*Vytvořte pohled stud_v, který zobrazí informace o studentech třídy E3A-vytvořte sloupce (cislo, jmeno, prijmeni, trida)*/
create view stud_v as
select s.IDs,s.jmeno,s.prijmeni,t.nazevtridy from student s
inner join trida t using (IDtridy)
where t.nazevtridy like 'E3A';

/*Ověřte vytvořený pohled stud_v*/
show create view stud_v;
select * from stud_v;
/*Proveďte aktualizaci studenta s číslem 34- změna jméno na Pavelec - pohledu stud_v*/
update stud_v
set prijmeni='Pavelec'
where IDs=34;

/*Vytvořte pohled, který zobrazí základní údaje o studentech- bez data narození a RČ. Vyberte studenty ze třídy s ID 1.*/
create view student_e3a as
select s.IDs,s.prijmeni,s.jmeno,t.nazevtridy from student s
inner join trida t using(IDtridy)
where IDtridy=1;

/*Ověřte vytvořený pohled.*/
show create view student_e3a;
select * from student_e3a;

/*Upravte pohled tak, aby zobrazil IDS jako číslo, příjmení sloučil se jménem a přejmenoval na student. Vyberte studenty ze třídy E3B. (2 způsoby)*/
create view student_e3a_e3b as
select s.IDs,concat(s.prijmeni," ",s.jmeno),t.nazevtridy from student s
inner join trida t using(IDtridy)
where t.nazevtridy like 'E3B';

/*Vytvořte pohled, který bude zobrazovat absencí třídy*/
create or replace view E3B_absence as
select t.IDtridy,t.nazevtridy,SUM(pocethod) as 'Absence' from trida t
inner join student s using (IDtridy)
inner join absence a using (IDs)
where nazevtridy like 'E3B'
group by t.IDtridy,t.nazevtridy;
/*S využitím vytvořeného pohledu vypočtěte průměrnou absenci*/
select ROUND(e.Absence/COUNT(s.IDs),2) from E3B_absence e
inner join student s using (IDtridy);
/* NEFUNKCNI Vytvořte tabulku na základě dotazu, přičemž do tabulky uložte veškerá data z tabulky absence, která jsou z loňského roku. Uložte i jméno a příjmení studenta.*/
create or replace view veskera_absence as
select * from absence
where (adddate(datum,365))>=now();
/*create table table_veskera_absence();*/
select * into table_veskera_absence from veskera_absence;
/*Vytvořte pohled s názvem akt_mesic, který zobrazí všechny studenty včetně třídy, kteří mají absenci v aktuálním měsíci.*/
select * from student s
inner join absence a using (IDs)
inner join trida using (IDtridy)
where month(datum)=adddate(now(),-1);