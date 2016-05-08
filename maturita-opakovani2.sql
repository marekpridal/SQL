use mobily;
/*12*/
select concat(jmeno," ",prijmeni) as 'Zákazník',mesto from zakaznici
where mesto like "Ostrava%";
/*13*/
select jmeno,prijmeni,mesto from zakaznici
where mesto like "Ostrava%" OR mesto like "Havírov%" OR mesto like "Karviná%";
/*14*/
select concat(cena_bez_dph," Kč"),concat(ROUND((cena_bez_dph*0.15))," Kč") as 'DPH',concat(ROUND((cena_bez_dph*1.15))," Kč") as 'Cena s DPH' from mobily;
/*15*/
select z.jmeno,z.prijmeni,o.Kod_objednavky,date_format(o.Datum_zadani,"%d.%m.%Y") from zakaznici z
inner join objednavky o using(Kod_zakaznika);
/*16*/

/*17*/
select z.jmeno,z.prijmeni,o.Kod_objednavky from zakaznici z
left join objednavky using (Kod_zakaznika)
left join obsah o using (Kod_objednavky)
where Kod_objednavky is null;
/*18*/
select m.Kod_telefonu,m.vyrobce,m.typ,o.datum_zadani from mobily m
inner join obsah using(Kod_telefonu)
inner join objednavky o using(Kod_objednavky)
where month(datum_zadani)=month(now()) and year(datum_zadani)=year(now());
/*19*//*nefunguje*/
select m.Kod_telefonu,m.vyrobce,m.typ,o.datum_zadani from mobily m
inner join obsah using(Kod_telefonu)
inner join objednavky o using(Kod_objednavky)
where adddate(182,o.datum_zadani)<now();
/*22*/
/*insert into mobily(Vyrobce,Typ,Cena_bez_DPH) values ("Samsung","Galaxy S6",18000);*/
select * from mobily m
left join obsah o using(Kod_telefonu)
where o.Kod_objednavky is null and Vyrobce like "Samsung";
/*23*/
select * from mobily m
left join obsah o using(Kod_telefonu)
left join objednavky b using(Kod_objednavky)
where o.Kod_objednavky is null and month(b.Datum_zadani)=month(now());
/*24*/
select Jmeno,Prijmeni,COUNT(o.Kod_objednavky) from zakaznici
left join objednavky o using(Kod_zakaznika)
having (count(o.Kod_objednavky)>10);
/*25*/
select * from mobily
where Cena_bez_DPH>(select avg(Cena_bez_DPH) from mobily);
/*26*/
select * from mobily
where Cena_bez_DPH>(select avg(Cena_bez_DPH) from mobily where Vyrobce like "Samsung");
/*27*//*nefunguje*/
select * from mobily
where Cena_bez_DPH>(select sum(Cena_bez_DPH) from mobily where Vyrobce like "Samsung");
/*28*/
select b.Kod_objednavky,b.Kod_zakaznika,SUM(o.Pocet_kusu*m.Cena_bez_DPH),b.Datum_zadani as 'Celková cena' from objednavky b
inner join obsah o using(Kod_objednavky)
inner join mobily m using(Kod_telefonu)
where year(b.Datum_zadani)=(year(now())-1)
group by Kod_objednavky,Kod_zakaznika
having (SUM(o.Pocet_kusu*m.Cena_bez_DPH)) >10000;