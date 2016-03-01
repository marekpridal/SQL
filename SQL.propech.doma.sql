use prospech;

/*pocet studentů v databázi*/
select count(IDs) AS 'Počet studentů' from student;

/*počet studentů v jednotlivých třídách*/
select t.nazevtridy,COUNT(s.IDs) as 'Počet studentů ve třídě' from trida t
left join student s using (IDtridy)
group by t.nazevtridy,t.IDtridy;

/*počet studentů v jednotlivých třídách včetně prázdných tříd*/
select t.nazevtridy,COUNT(s.IDs) as 'Počet studentů ve třídě' from trida t
left join student s using (IDtridy)
group by t.nazevtridy,t.IDtridy;

/*Vypiš absenci u jednotlivých studentů*/
select s.jmeno,s.prijmeni,SUM(a.pocethod) as 'Celková absence' from student s
left join absence a using (IDs)
group by IDs;

/*Počet hodin u každé třídy*/
select t.nazevtridy, SUM(a.pocethod) as 'Celková absence třídy' from trida t
left join student s using (IDtridy)
	left join absence a using (IDs)
group by t.nazevtridy,IDtridy;

/*Počet průměrné absence na žáka*/
select (select SUM(pocethod) from absence)/count(IDs) as 'Průměrná absence na žáka' from student;