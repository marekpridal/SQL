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
/*19*/
select m.Kod_telefonu,m.vyrobce,m.typ,o.datum_zadani from mobily m
inner join obsah using(Kod_telefonu)
inner join objednavky o using(Kod_objednavky)
where adddate(182,datum_zadani)>now();

insert into obsah values(1,1,10);

insert into objednavky(Kod_objednavky,Kod_zakaznika,Datum_zadani) values (500,0002,now());

select * from zakaznici;