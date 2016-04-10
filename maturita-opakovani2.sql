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
