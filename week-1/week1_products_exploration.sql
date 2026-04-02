-- Leian products andmestikus olevate toodete koguarvu.
select
  count(*) AS Toodete_arv
from products

-- Leian, milliseid tootekategooriad UrbaStyle müüb.
select distinct
  category
from
  products
  
-- Leian 10 kõige kallima omahinnaga toodet.
select
  product_name,
  category, 
  cost_price, 
  retail_price
from   products
Order by cost_price desc
limit 10

-- Leian 10 kõige kallima müüghinnaga toodet.
select
  product_name,
  category, 
  retail_price
from   products
Order by retail_price desc
limit 10

-- Leian 10 kõige odavama omahinnaga toodet.
select
  product_name,
  category, 
  retail_price,
  cost_price
from   products
Order by cost_price asc
limit 10

-- Leian 10 kõige odavama müüghinnaga toodet.
select
  product_name,
  category, 
  retail_price,
  cost_price
from   products
Order by retail_price asc
limit 10

-- Valin ühe toote kategooria, mida uurida
select *
from   products
where category = 'aksessuaarid'
order by retail_price desc

-- Leian puuduva omahinnaga tooted.
select
	count(*) AS toodete_koguarv,
	count(cost_price) AS omahinnaga_tooted,
	count(*) - count(cost_price) AS puuduvad_hinnad
From products

-- Leian puuduva müügihinnaga tooted.
select
	count(*) AS toodete_koguarv,
	count(retail_price) AS müügihinnaga_tooted,
	count(*) - count(retail_price) AS puuduvad_hinnad
From products

-- Leian puuduvate kategooriatega tooted.
select
	count(*) AS toodete_arv,
	count(category) AS määratud_kategooriad,
	count(*) - count(category) AS puuduvad_kategooriad
from products

-- Leian puuduvate alamkategooriatega tooted.
select
	count(*) AS toodete_arv,
	count(subcategory) AS määratud_alamkategooriad,
	count(*) - count(subcategory) AS puuduvad_alamkategooriad
from products

-- Leian puuduvate tarnijatega tooted.
select
	count(*) AS toodete_arv,
	count(supplier) AS tarnija,
	count(*) - count(supplier) AS puuduvad_tarnijad
from products

-- Leian puuduvate sertifikaatidega tooted.
select
	count(*) AS toodete_arv,
	count(eco_certified) AS sertifikaat,
	count(*) - count(eco_certified) AS puuduvad_sertifikaadid
from products

-- Leian minimaalsed, maksimaalsed ja keskmised tootehinnad.
select
	count(*) AS tooted,
	max(cost_price) AS max_omahind,
	min(cost_price) AS min_omahind,
	sum(cost_price) AS sum_omahind,
	sum(cost_price)/ count(*) AS kesk_omahind,
	max(retail_price) AS max_müügihind,
	min(retail_price) AS min_müügihind,
	sum(retail_price) AS sum_müügihind,
	sum(retail_price)/ count(*) AS kesk_müügihind
from products

-- Loe tooted kategooriati kokku
SELECT 
	category, 
COUNT(*) AS toodete_arv   
FROM products   
GROUP BY category   
ORDER BY toodete_arv DESC

-- Leian toodete marginaalid
SELECT 
    product_name, 
    retail_price, 
    cost_price,
    (retail_price - cost_price) AS absolute_margin, -- Rahaline kate eurodes
    ((retail_price - cost_price) / retail_price) * 100 AS margin_percentage, -- Kate protsentides
    created_at
FROM products
ORDER BY margin_percentage DESC

-- Leian kui paljudel toodete puhul on soetusmaksumus suurem kui müügihind.
select *
from products
where retail_price < cost_price


/*Uurisin products tabelit. 
Leidsin, et tabelis on 362 rida ja 9 veergu. Enamikus veergudes on kõik andmed olemas, kuid puudu on 18 toote sertifikaadi info.
Tabelis on 5 tootekategooriat ning igas kategooriates on keskmiselt 72 toodet. 
 - Toodete soetushind algvad 10.15€. 
 - Kõige kallima toote soetushind on 346.70€. 
	- Keskmine soetushind on ~109€.
 * Toodete müügihinnad algavad 13.53€. 
 * Kõige kallim toode on 434.08€. 
	* Keskmine müügihind on ~163€.

Keskmine kate toodetel on 33%, aga hulga toodete müügihind on tunduvalt madalam, kui soetushind. 
	- Tuleks uurida, mis põhjusel on toodete müügihind alla soetushinna. Kas tegu on veaga, või tooted ei müü ning on määratud suur allahindlus.

Väike märkamine. Kategooriate nimetustes on kirjaviga "jalanõusid" -> "Jalanõud".

Tootede tabel on üldiselt heas seisus, tuleks täpsustada 18 toote eco_sertifikaadi olemasolu ning üle vaadata probleemsete müügihindadega tooted.*/
