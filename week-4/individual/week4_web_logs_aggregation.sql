-- N4 -- Veebianalüütika UrbaStyle web_logs põhjal

/*
Nädala äriprobleem: Kristi Tamm (CEO) vajab juhatuse koosolekuks koondnumbreid. Anna koordineerib: iga domeen (müük, kliendid, inventuur, turundus) peab andma oma koondandmed. Seekord ei piisa lihtsast SELECT-ist — vaja on GROUP BY, HAVING ja CTE-dega ehitatud ärianalüüse.

ROLL:     veebi külastuste koondandmed 
ÜLESANNE:	Koosta Kristile veebistatistika raport: koondnumbrid, kuised trendid. Kasuta GROUP BY, HAVING ja CTE-d.
SISEND: 	Tabelid: web_logs, sales
VÄLJUND:	3 SQL päringut + kokkuvõtlik tabel (peamised leiud 3-5 lauses)

Kas iga veebikülastus viis müügini?
Kui kaua veedab keskmine klient lehel aega?
Millised kanalid kasutatakse kõige rohkem ja kas nende kaudu tehakse ka oste?
*/

-- ---------------------------------------
-- Tutvun web_logs tabeliga
-- ---------------------------------------
-- Kontrollin ridade arvu - [50000]
SELECT count(*) FROM web_logs;
-- Vaatan veerge - [9]
SELECT * FROM web_logs LIMIT 5;

-- --------------------------------------------------------------------------------------
-- Töötan edasi web_logs koopiaga, kuna asendasin puhastamise käigus puuduvad customer_id = '0'. Muudatatused ei ole web_logs originaaltabelisse sisse viiud.
-- --------------------------------------------------------------------------------------

-- Leian mitu erinevat tüüpi seadet on tabelis nimetatud.
-- ------------------------------------------------------
SELECT 
  device_type, 
  COUNT(*) AS lehe_vaatamised,
  COUNT(distinct session_id)  AS ind_sessioonid
FROM web_logs_test
GROUP BY device_type HAVING COUNT(*) > 1;
-- Tabelis on kolm erinevat tüüpi seadmeid: mobile, desktop, tablet

-- Leian mitu erinevat allikat on tabelis nimetatud.
-- ------------------------------------------------------
SELECT source, COUNT(distinct session_id) FROM web_logs_test
GROUP BY source HAVING COUNT(*) > 1
ORDER BY count desc;
-- 10 erinevat allikat. Kõige populaarsem kanal on Google Organic. Samas hetkel on erinevate allikatena kirjas näiteks Facebook ja Facebook Ads.

-- Kontrollin ega ühtegi sessiooni ei ole tabelis topelt.
-- ------------------------------------------------------
SELECT session_id, COUNT(*) FROM web_logs_test
GROUP BY session_id HAVING COUNT(*) > 1;
-- leiti 9744 rida, mis on esindatud tabelis rohkem kui ühe korra. See tähendab, et iga sessiooni lõikes on iga lehe vaatamine tabelis eraldi reana.


-- Leian mitu erinevat riiki on tabelis nimetatud.
-- -----------------------------------------------
SELECT 
  country, 
  COUNT(*) AS lehe_vaatamisi, 
  COUNT(distinct session_id) AS ind_sessioonid
FROM web_logs_test
GROUP BY country HAVING COUNT(*) > 1
ORDER BY lehe_vaatamisi desc;
-- 4 erinevat riiki: Eesti, Soome, Läti, Leedu

-- -------------------------------------------------------------------------------------------------------
-- Selgitan välja, kes on kliendid, kes meie lehte kõige rohkem külastavad. Liikluse kvaliteet ja allikad.
-- -------------------------------------------------------------------------------------------------------
-- Milline turunduskanal (source) toob kõige aktiivsemaid külastajaid?
-- -------------------------------------------------------------------------------------------------------
SELECT
  --c.customer_id,
  w.source,
  round(AVG(w.duration_seconds),0) AS keskmine_aeg
FROM customers c
JOIN web_logs_test w
  ON w.customer_id = c.customer_id
GROUP BY source
ORDER BY keskmine_aeg desc;
-- Keskmine külastusaeg on kõikide kanalite puhul üpriski sarnane. Keskmine lehekülastus aeg varieerub erinevate kanalite puhul 127-136 sekundi vahel.

-- Kes on kliendid, kes meie lehte külastavad. Kust linnast nad pärit on?
-- -------------------------------------------
SELECT
    c.city AS linn,
  count(distinct w.customer_id) AS klientide_arv
FROM customers c
JOIN web_logs_test w
  ON w.customer_id = c.customer_id
GROUP BY  c.city
ORDER BY klientide_arv desc;
-- suurem osa veebi külastanud klientidest on päris Tallinnast. Järgnevad Tartu ja Pärnu, aga juba mitmekordselt väiksemate külastuste arvuga.

-- Küsimus: Kas meil on palju "vigasid" logides (nt 0-sekundilised sessioonid)?
-- Analüüs: Grupeerin sessiooni ID järgi ja kasuta HAVING filtrit, et leida ebaloomulikult lühikesed või pikad sessioonid, mis võivad viidata robotitele või logimise vigadele.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
  session_id,
  sum(duration_seconds) AS aeg
FROM web_logs_test
GROUP BY session_id
HAVING sum(duration_seconds) = 0;
-- leitud 80 sessiooni, kus aeg = 0 sekundit

-- Kas on sessioone, mis kestid üle 30 minuti?
SELECT 
  session_id,
  sum(duration_seconds) AS aeg
FROM web_logs_test
GROUP BY session_id
HAVING sum(duration_seconds) >= 1800;
-- Selliseid sessioone on 5


-- Küsimus: Millal on veebis kõige suurem koormus?
-- Analüüs: Kasutan DATE_TRUNC funktsiooni, et grupeerida külastused nädalapäevade kaupa.
-- ------------------------------------------------------------------------------------------------------
WITH sessiooni_koond AS (
  -- 1. Grupeerin andmed sessiooni ID järgi
  SELECT 
    session_id,
    MIN(visit_date) AS sessiooni_algus,
    SUM(duration_seconds) AS sessiooni_kogukestus,
    COUNT(page_viewed) AS lehevaatamisi_sessioonis
  FROM web_logs_test
  GROUP BY session_id
  -- 2. Filtreerin välja Toomase märgitud 0-sekundilised "vigased" sessioonid
  HAVING SUM(duration_seconds) > 0 
)
-- 3. Agregeerin puhastatud sessioonid kuude lõikes
SELECT 
    DATE_TRUNC('month', sessiooni_algus) AS Kuu,
    COUNT(session_id) AS unikaalseid_sessioone,
    SUM(sessiooni_kogukestus) AS kogu_kestvus_sekundites,
    ROUND(AVG(sessiooni_kogukestus), 0) AS keskmine_sessiooni_pikkus,
    ROUND(AVG(lehevaatamisi_sessioonis), 1) AS keskmine_lehti_sessioonis
FROM sessiooni_koond
GROUP BY 1
ORDER BY Kuu;
-- Alates 2023 aasta jaanuarist on sessioonide kestvus kuude lõikes mitmekordistunud võrreldes eelnevate kuudega.

-- Kontrollin kas 2023 aasta veebi koormuse hüpet võis mõjutada uue kanali lisandumine.
-- ------------------------------------------------------------------------------------
SELECT source, MIN(visit_date) FROM web_logs_test GROUP BY source;
-- Ei saanud mõttele kinnitust. Kõik kanalid on aktiivsed alates 2019 aastast.

-- Kui kaua klient tegelikult veebis viibis?
-- -----------------------------------------
WITH sessioonide_kestvused AS (
  SELECT
    session_id,
    sum(duration_seconds) AS sessiooni_kestvus
  FROM web_logs_test
  GROUP BY session_id
  ORDER BY sessiooni_kestvus DESC
)
SELECT 
  round(AVG(sessiooni_kestvus),0) AS keskmine_sessiooni_pikkus
FROM sessioonide_kestvused
-- kliendi sessiooni pikkus on keskmiselt 598 sekundit ehk ~10 minutit.

-- Kas mobiilikasutajad konverteeruvad sama hästi kui desktopi kasutajad?
-- ----------------------------------------------------------------------
WITH sessioonide_koond AS (
  -- 1. Leian unikaalsete sessioonide arvu seadme tüübi kaupa
  SELECT 
    device_type, 
    COUNT(DISTINCT session_id) AS sessioonide_arv
  FROM web_logs_test
  WHERE device_type IN ('mobile', 'desktop')
  GROUP BY device_type
),
muugid_seadme_pohjal AS (
  -- 2. Ühendan müügid sessioonidega, mis toimusid samal päeval
  SELECT 
    w.device_type, 
    COUNT(DISTINCT s.invoice_id) AS muukide_arv
  FROM sales s
  JOIN web_logs_test w 
    ON s.customer_id = w.customer_id
  -- Kasutame aja komponenti ja tüübiteisendust
  WHERE s.sale_date::DATE = w.visit_date::DATE
    AND s.channel = 'online'
  GROUP BY w.device_type
)
-- 3. Arvutan konversioonimäära (müügid / sessioonid * 100)
SELECT 
  s.device_type AS seadme_tyyp,
  s.sessioonide_arv,
  COALESCE(m.muukide_arv, 0) AS muukide_arv,
  ROUND((COALESCE(m.muukide_arv, 0)::NUMERIC / s.sessioonide_arv) * 100, 2) AS konversiooni_protsent
FROM sessioonide_koond s
LEFT JOIN muugid_seadme_pohjal m ON s.device_type = m.device_type
ORDER BY konversiooni_protsent DESC;
/* Tulemused:
| seadme_tyyp | sessioonide_arv | muukide_arv | konversiooni_protsent |
| ----------- | --------------- | ----------- | --------------------- |
| desktop     | 4302            | 7           | 0.16                  |
| mobile      | 5590            | 7           | 0.13                  |
*/

-- Kas mobiilikasutajad konverteeruvad sama hästi kui desktopi kasutajad? Kasutame individuaalsete sessioonide lugemist.
-- ---------------------------------------------------------------------------------------------------------------------
WITH sessioonide_baas AS (
  -- 1. Agregeerin logid sessiooni tasemele, et igal sessioonil oleks üks seade ja klient
  SELECT 
    session_id,
    MAX(customer_id) AS customer_id, -- Täidab võimalikud lüngad (0 vs päris ID)
    MAX(device_type) AS device_type,
    MIN(visit_date)::DATE AS kupaev
  FROM web_logs_test
  WHERE device_type IN ('mobile', 'desktop')
    AND customer_id > 0 -- Võtan ainult tuvastatud kliendid, keda saab müügiga siduda
  GROUP BY session_id
),
sessioonide_koond AS (
  -- 2. Loen kokku unikaalsed sessioonid seadme kaupa
  SELECT 
    device_type, 
    COUNT(session_id) AS sessioonide_arv
  FROM sessioonide_baas
  GROUP BY device_type
),
muugid_seadme_pohjal AS (
  -- 3. Ühendan müügid ainult puhtalt agregeeritud sessioonidega
  SELECT 
    w.device_type, 
    COUNT(DISTINCT s.invoice_id) AS muukide_arv
  FROM sales s
  JOIN sessioonide_baas w ON s.customer_id = w.customer_id 
    AND s.sale_date::DATE = w.kupaev
  WHERE s.channel = 'online'
  GROUP BY w.device_type
)
-- 4. Lõplik konversiooni arvutus
SELECT 
  s.device_type,
  s.sessioonide_arv,
  COALESCE(m.muukide_arv, 0) AS muukide_arv,
  ROUND((COALESCE(m.muukide_arv, 0)::NUMERIC / s.sessioonide_arv) * 100, 2) AS konversiooni_protsent
FROM sessioonide_koond s
LEFT JOIN muugid_seadme_pohjal m ON s.device_type = m.device_type;
/* Tulemus: 
| device_type | sessioonide_arv | muukide_arv | konversiooni_protsent |
| ----------- | --------------- | ----------- | --------------------- |
| mobile      | 4957            | 7           | 0.14                  |
| desktop     | 3802            | 6           | 0.16                  |
*/

-- -------------------
select * from sales
select * from web_logs
select * from customers
-- -------------------


