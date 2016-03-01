use prospech;

select * from student;
/*pocet studentů v databázi*/
select COUNT(IDs)from student; 
/*počet studentů v jednotlivých třídách*/
select t.nazevtridy as 'Název třídy', count(s.IDs) as 'Počet studentů' from trida t 
inner join student s on t.IDtridy=s.IDtridy
group by t.IDtridy,t.nazevtridy /*musí být taky IDtridy, protože nazevtridy není vždy jedinečný*/
order by t.IDtridy;
/*počet studentů v jednotlivých třídách včetně prázdných tříd*/
select t.nazevtridy as 'Název třídy', count(s.IDs) as 'Počet studentů' from trida t 
left join student s on t.IDtridy=s.IDtridy
group by t.IDtridy,t.nazevtridy /*musí být taky IDtridy, protože nazevtridy vždy jedinečný*/
order by t.IDtridy;

select * from trida;

insert into trida values(11,"I1A","I");
/*Vypiš absenci u jednotlivých studentů*/
select a.ids,concat(s.jmeno," ",s.prijmeni) as 'Student', SUM(a.pocethod)
from absence a
	inner join student s using (IDs)
where důvod like "zaspal"
group by a.ids,s.jmeno,s.prijmeni;
/*Počet hodin u každé třídy*/
select t.nazevtridy,SUM(pocethod) as 'Počet hodin'
from (trida t left join student s using (IDtridy)) left join absence a using (IDs)
group by nazevtridy,IDtridy;
/*Počet průměrné absence na žáka*/
select SUM(pocethod)/(select count(ids) from student)
from absence;

select idtridy,count(ids)
from student
group by IDtridy;

select s.idtridy, sum(a.pocethod) as 'Celkový počet hodin'
from student s inner join absence a using (ids)
group by s.idtridy;