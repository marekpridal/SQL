create view prumer_trid as
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