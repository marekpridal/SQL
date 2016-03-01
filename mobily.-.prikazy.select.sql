use mobily;

SELECT * from objednavky;
SELECT * from mobily;
SELECT * from obsah;
SELECT * from zakaznici;
/*	1.	Vytvořte dotaz, který vypíše výrobce a typ (spojte), cenu bez DPH a vypočítá cenu s DPH. Zobrazte pouze telefony od firem: HTC, Sony a Apple (množina hodnot).
	2.	Výsledky seřaďte podle ceny.
*/
SELECT CONCAT(Vyrobce," ",Typ)AS 'Výrobce a typ',CONCAT(ROUND(Cena_bez_DPH,2)," Kč") AS 'Cena bez DPH', CONCAT((ROUND(Cena_bez_DPH*1.21,2))," Kč") AS 'Cena s DPH' 
from mobily
where  Vyrobce in ("HTC","APPLE","Sony")
ORDER BY Cena_bez_DPH ASC;
/*3.	Vytvořte dotaz, který vypíše objednávky z aktuálního měsíce.*/
SELECT * FROM objednavky
WHERE month(Datum_zadani) like (month(now())-1) 
and year(Datum_zadani) like year(now());
/*4.	Vytvořte dotaz, aby byly zobrazeny pouze telefony, které si někdy někdo koupil. (zobrazte každý mobil jen 1x)*/
SELECT distinct CONCAT(Vyrobce," ",Typ) AS 'Vyrobce a typ' FROM obsah
inner join mobily using (Kod_telefonu);
/*5.	Vytvořte dotaz, který vypíše telefony, které byly prodány v posledních 12 týdnech.*/
SELECT distinct CONCAT(Vyrobce," ",Typ)AS 'Vyrobce a typ',Datum_zadani  FROM obsah
inner join mobily using (Kod_telefonu) 
inner join objednavky using (Kod_objednavky)
where subdate(Datum_zadani,0) >= subdate(now(),7*12);
/*	7.	Vytvořte dotaz, který vypíše objednávky ze září loňského roku.*/
select * from objednavky where month(Datum_zadani) = (9) and year(Datum_zadani) = year(now())-1;
/*8.	Vytvořte dotaz, který vypíše zákazníky, kteří zakoupili telefony v letošním roce.*/
select Jmeno,Prijmeni,Kod_objednavky,Datum_zadani  from zakaznici
inner join objednavky using (Kod_zakaznika)
where year(Datum_zadani) = year(now());
/*9.	Zobrazte 5 nejdražších telefonů.*/
select * from mobily
Order BY Cena_bez_DPH DESC
LIMIT 5;
/*10.	Vytvořte dotaz, který vypíše objednávky zákazníků, které byly zadány v tomto čtvrtletí.*/
select * from objednavky
where quarter(Datum_zadani) = quarter(now());
/*11.	Vytvořte dotaz, který vypíše zákazníky z Ostravy a Havířova (i částí), kteří si zakoupili zboží během posledních 2 měsíců.*/
select * from zakaznici
where Mesto like ("Ostrava%") or Mesto like ("Havirov%");
/*12.	Vytvořte dotaz, který vypíše zákazníky a počty jejich objednávek.*/
select Jmeno,Prijmeni,COUNT(o.Kod_zakaznika),o.Datum_zadani from zakaznici z
inner join objednavky o on (z.Kod_zakaznika=o.Kod_zakaznika)
Group by o.Kod_zakaznika,z.Jmeno,z.Prijmeni;
/*13.	Doplňte dotaz o podmínku z letošního roku.*/
select Jmeno,Prijmeni,COUNT(o.Kod_zakaznika),o.Datum_zadani from zakaznici z
inner join objednavky o on (z.Kod_zakaznika=o.Kod_zakaznika)
where year(o.Datum_zadani) = year(now())
Group by o.Kod_zakaznika,z.Jmeno,z.Prijmeni;
/*14.	Doplňte dotaz tak, aby zobrazoval pouze zákazníky u měst na O.*/
select Jmeno,Prijmeni,COUNT(o.Kod_zakaznika),o.Datum_zadani,z.Mesto from zakaznici z
inner join objednavky o on (z.Kod_zakaznika=o.Kod_zakaznika)
where year(o.Datum_zadani) = year(now()) and Mesto like ("O%")
Group by o.Kod_zakaznika,z.Jmeno,z.Prijmeni;
/*15.	Vytvořte dotaz, který vypíše telefony, cenu bez DPH a vypočítá cenu s DPH. Ke každému telefonu vypočítá, na kolika objednávkách se nacházel a v jakém počtu byl prodán, jaká byla celková tržba za jeho prodej. */
select m.Kod_telefonu,o.Kod_objednavky,concat(m.Vyrobce," ",m.Typ), m.Cena_bez_DPH,ROUND(m.Cena_bez_DPH*1.21,2),COUNT(o.Kod_objednavky),COUNT(o.Pocet_kusu),ROUND(SUM(Cena_bez_DPH*1.21)-SUM(Cena_bez_DPH),2) from mobily m
inner join obsah o on (m.Kod_telefonu=o.Kod_telefonu)
group by m.Typ;
/*16.	Zobrazte od nejlépe prodávaného (největší tržba).*/
select m.Kod_telefonu,o.Kod_objednavky,concat(m.Vyrobce," ",m.Typ) AS 'Výrobce a typ', m.Cena_bez_DPH,ROUND(m.Cena_bez_DPH*1.21,2) AS 'Cena s DPH',COUNT(o.Kod_objednavky) AS 'Počet objednání',SUM(o.Pocet_kusu) AS 'Počet prodaných kusů',ROUND(SUM(Cena_bez_DPH*1.21)-SUM(Cena_bez_DPH),2) AS 'Celkové tržby' from mobily m
inner join obsah o on (m.Kod_telefonu=o.Kod_telefonu)
/*where o.Kod_telefonu = 1005;*/
group by m.Kod_telefonu
ORDER by ROUND(SUM(Cena_bez_DPH*1.21)-SUM(Cena_bez_DPH),2) DESC;