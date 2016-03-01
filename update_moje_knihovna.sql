use mobily;

SELECT * from objednavky;
SELECT * from mobily;
SELECT * from obsah;
SELECT * from zakaznici;

SELECT CONCAT(Vyrobce," ",Typ)AS 'Výrobce a typ',CONCAT(ROUND(Cena_bez_DPH,2)," Kč") AS 'Cena bez DPH', CONCAT((ROUND(Cena_bez_DPH*1.21,2))," Kč") AS 'Cena s DPH' 
from mobily
where  Vyrobce in ("HTC","APPLE","Sony")
ORDER BY Cena_bez_DPH ASC;

SELECT * FROM objednavky
WHERE month(Datum_zadani) = month(now()) and year(Datum_zadani) = year(now());

SELECT distinct CONCAT(Vyrobce," ",Typ) AS 'Vyrobce a typ' FROM obsah
inner join mobily using (Kod_telefonu);

SELECT distinct CONCAT(Vyrobce," ",Typ)AS 'Vyrobce a typ',Datum_zadani  FROM obsah
inner join mobily using (Kod_telefonu) 
inner join objednavky using (Kod_objednavky)
where subdate(Datum_zadani,0) >= subdate(now(),7*12);

select * from objednavky where month(Datum_zadani) = (9) and year(Datum_zadani) = year(now())-1;

select Jmeno,Prijmeni,Kod_objednavky,Datum_zadani  from zakaznici
inner join objednavky using (Kod_zakaznika)
where year(Datum_zadani) = year(now());

select * from mobily
Order BY Cena_bez_DPH DESC
LIMIT 5;

select * from objednavky
where quarter(Datum_zadani) = quarter(now());

select * from zakaznici
where Mesto like ("Ostrava%") or Mesto like ("Havirov%");

select Jmeno,Prijmeni,COUNT(o.Kod_zakaznika) from zakaznici z
inner join objednavky o on (z.Kod_zakaznika=o.Kod_zakaznika)
Group by o.Kod_zakaznika,z.Jmeno,z.Prijmeni;