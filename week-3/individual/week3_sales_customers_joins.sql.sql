-- N3 Grupitöö - JOIN

/*
Anna: "Ma tahan teada, millised kliendid pole kunagi midagi ostnud. 
Ja millised tooted pole kunagi müüdud! 
Ma tahan teada KÕIKE! 
Kes on parimad kliendid? 
Millised tooted müüvad? 
Kust kliendid tulevad? 
Ja... kes on need kliendid, kes registreerusid aga pole kunagi ostnud?!"
Toomas: "Rahunege. Jagage ülesanded omavahel. Kasutage JOIN-lauseid. Dokumenteerige kõik."

Nädala äriprobleem: UrbanStyle.ltd andmed on erinevates tabelites (sales, customers, products, inventory). 
Anna vajab vastuseid, mis nõuavad mitme tabeli ühendamist: kes ostab, kes ei osta, mis müüb, mis ei müü, ja millised müügikanalid töötavad.

Seos Sessioon 1 materjaliga: INNER JOIN, LEFT JOIN, RIGHT JOIN, PRIMARY KEY / FOREIGN KEY — kõik need oskused tulevad nüüd kasutusse reaalse äriprobleemi lahendamiseks.

*/

/*
ROLL	Roll A:             Müügi ja klientide ühendamine
ÜLESANNE	INNER JOIN:     millised kliendid on ostnud ja kui palju? Leia TOP kliendid kogumüügi järgi. Koosta Anna jaoks parimade klientide ülevaade.
SISEND	Tabelid:          sales, customers
VÄLJUND:	                SQL päringud (.sql fail) + tulemuste screenshot + lühike kokkuvõte Annale
*/

-- Lihtne INNER JOIN: kliendid, kes on ostnud    
SELECT        
  c.first_name,        
  c.last_name,        
  c.email,        
  c.city,        
  s.sale_id,        
  s.sale_date,        
  s.total_price    
FROM sales s    
INNER JOIN customers c ON s.customer_id = c.customer_id    
LIMIT 20;    

-- ------------------------------------
-- Leia TOP 10 klienti kogumüügi järgi:
-- ------------------------------------
SELECT        
  c.first_name || ' ' || c.last_name AS klient,        
  c.city,        COUNT(DISTINCT s.sale_id) AS ostude_arv,        
  SUM(s.total_price) AS kogumüük    
FROM sales s    
INNER JOIN customers c ON s.customer_id = c.customer_id    
GROUP BY c.customer_id, c.first_name, c.last_name, c.city    
ORDER BY kogumüük DESC    
LIMIT 10;    

-- ------------------------------------
-- Analüüsi linnade kaupa:
-- ------------------------------------
-- Müük linnade kaupa    
SELECT        
  c.city,        
  COUNT(DISTINCT c.customer_id) AS kliente,        
  COUNT(s.sale_id) AS oste,        
  SUM(s.total_price) AS kogumüük    
FROM sales s    
INNER JOIN customers c 
  ON s.customer_id = c.customer_id    
GROUP BY c.city    
ORDER BY kogumüük DESC;

-- ------------------------------------
-- Uuri loyalty_tier jaotust:
-- ------------------------------------
-- Müük lojaalsustasemete kaupa    
SELECT        
  c.loyalty_tier,        
  COUNT(DISTINCT c.customer_id) AS kliente,        
  SUM(s.total_price) AS kogumüük    
FROM sales s    
INNER JOIN customers c 
  ON s.customer_id = c.customer_id    
GROUP BY c.loyalty_tier    
ORDER BY kogumüük DESC;

-- Kirjuta kokkuvõte Annale (3-5 lauset): kes on parimad kliendid? Millisest linnast tuleb enim müüke? Milline loyalty_tier on kõige kasumlikum?
/*
Tallinnast on tulnud enim müüke - 3601 müüki summas 1 006 252,88
Järgmisel kohal on Tartu 1764 müügiga (523 286,64)
kolmandal kohal Pärnu 1231 müügiga (374 005,86)
Kõik teised linnad jäävad juba alla tuhande müügi.

Parimad kliendid top 10:
peaaegu kõik on teinud üle 70 ostu ning kogumüük jääb vahemikku 20 124,61 - 27 688,02 €.
On pärit peaagu pooled on Pärnust.

Loyality tier - 
on ~1000 klienti, kellel on loyality tier puudu - müük 1 071 805,32
Silver - 560 - 593 470, 07
gold - 491 - 533 601,64
bronz - 476 - 423 854,75

*/

-- ------------------------------------
-- Edasijõudnute tase (Roll A)
-- ------------------------------------
-- Lisa alamjärjepäring (subquery): leia kliendid, kelle kogumüük on üle keskmise:
SELECT       
  c.first_name || ' ' || c.last_name AS klient,       
  SUM(s.total_price) AS kogumüük   
FROM sales s   
INNER JOIN customers c 
  ON s.customer_id = c.customer_id   
GROUP BY c.customer_id, c.first_name, c.last_name   
HAVING SUM(s.total_price) > (       
  SELECT AVG(kliendi_müük)       
  FROM (           
    SELECT SUM(total_price) AS kliendi_müük           
    FROM sales           
    GROUP BY customer_id       
    ) AS keskmised   
  )   
ORDER BY kogumüük DESC;   
-- ●	Äriline järeldus: mitu protsenti klientidest moodustavad üle keskmise kulutajad? Mida see UrbanStyle jaoks tähendab?

-- kontrollin klientide koguarvu
Select * from customers;

-- arvutan üle keskmise kulutajate protsendi
SELECT 
    762.0 / 3150 * 100 AS protsent;