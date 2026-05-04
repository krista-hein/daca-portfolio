-- Roll - Urbanstyle kliendiandmete puhastamine
-- Üleasanne - Leia duplikaatsed e-mailid, puuduvad nimed ja ebajärjekindlad linnanimed customers tabelis. Loo test koopia, puhasta ja dokumenteeri.
-- Sisend - Tabel: customers
-- Väljund: Puhastamisraport (duplikaadid leitud, NULL-id leitud, formaadivead, soovitused) + SQL skript
-- Autor: Krista Hein


/*Toomas Kask (IT Director, UrbanStyle.ltd):
"Leidsin just 847 duplikaattelimust! Kui palju neid igas domeenis on?
Eilses mentorsessioonis ma näitasin teile, kuidas DELETE ja UPDATE töötavad — ja miks need on OHTLIKUD. Nüüd tuleb päris töö.
Meie andmebaasis on NELI kriitilist domeeni, mida tuleb puhastada: müügiandmed, kliendiandmed, inventuuriandmed ja turundusandmed. Iga domeen vajab oma puhastamisplaani.
Reegel: TEST KOOPIA KÕIGEPEALT. Siis puhasta. Siis kontrolli. Siis dokumenteeri.
Juhatuse koosolek on 2 nädala pärast — Kristi tahab puhtaid numbreid. Ärge laske mind alt!"
*/

-- Loon customers tabeli test koopia - Ridade arv = 3150
CREATE TABLE customers_test AS 
  SELECT * FROM customers;
SELECT 
  COUNT(*) AS ridade_arv 
FROM customers_test;

-- Leian duplikaatsed e-mailid  - 129 e-maili esineb andmestikus rohkem kui 1 kord. 128 neist on reaalsed e-eaili aadressid, 1 rida esindab puuduvaid emaili aadresseid. / peale puhastamist 59 rida
SELECT email, COUNT(*) AS koopiate_arv
FROM customers_test
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;

-- Leian duplikaatsed telefonid  - 147 telefoni numbrit on andmestikus esindatud rohkem, kui korra. / peale puhastamist 70 rida
SELECT phone, COUNT(*) AS koopiate_arv
FROM customers_test
GROUP BY phone
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;

-- Leian puuduvad nimed - Mitte ühtegi puuduvat ees-ega perekonnanime ei ole.
SELECT
    COUNT(*) FILTER (WHERE first_name IS NULL OR first_name = '') AS null_eesnimi,
    COUNT(*) FILTER (WHERE last_name IS NULL OR last_name = '') AS null_perenimi
FROM customers_test;

-- Kontrollin linnade nimekujusid — kas on ebajärjekindlusi?
SELECT city, COUNT(*) AS arv
FROM customers_test
GROUP BY city
ORDER BY city;

-- Leian kui mitmel eri kujul on linnade nimed kirjutatud. - VASTUS: 43
SELECT city, COUNT(*) FROM customers_test
GROUP BY city HAVING COUNT(*) > 1;

SELECT
    INITCAP(TRIM(city)) AS puhas_linn,
    COUNT(*) AS kliente,
    COUNT(DISTINCT city) AS erinevaid_kirjaviise,
    STRING_AGG(DISTINCT city, ', ' ORDER BY city) AS algkirjaviisid
FROM customers_test
WHERE city IS NOT NULL
GROUP BY INITCAP(TRIM(city))
ORDER BY kliente DESC;

-- Kontrollin kontaktandmeid — puuduvad telefoninumbrid ja e-mailid  - puuduva telefoni numbriga pole ühtegi rida, e-mail puudub 380'l real
SELECT
    COUNT(*) FILTER (WHERE phone IS NULL OR phone = '') AS null_telefon,
    COUNT(*) FILTER (WHERE email IS NULL OR email = '') AS null_email
FROM customers_test;


-- EDASIJÕUDNUTE TASE 

-- Asenda NULL nimed -- Ühtegi puuduva eesnimega rida tabelis ei ole.
UPDATE customers_test
SET first_name = 'Tundmatu'
WHERE first_name IS NULL OR first_name = '';

-- Ühtlusta linnanimed INITCAP + TRIM abil -- Alles jääb 12 linna
UPDATE customers_test
SET city = INITCAP(TRIM(city))
WHERE city != INITCAP(TRIM(city));

-- Kontrolli tulemust
SELECT city, COUNT(*) AS arv
FROM customers_test
GROUP BY city ORDER BY city;

-- Standardiseeri e-mailid väiketähtedeks
UPDATE customers_test
SET email = LOWER(TRIM(email))
WHERE email != LOWER(TRIM(email));

-- Ühtlustan eesnimed  INITCAP + TRIM abil
UPDATE customers_test
SET first_name = INITCAP(TRIM(first_name))
WHERE first_name != INITCAP(TRIM(first_name));

-- Kontrolli tulemust - enne 174 rida, pärast 80 rida
SELECT first_name, COUNT(*) AS arv
FROM customers_test
GROUP BY first_name ORDER BY first_name;

-- Ühtlustan perenimed  INITCAP + TRIM abil
UPDATE customers_test
SET last_name = INITCAP(TRIM(last_name))
WHERE last_name != INITCAP(TRIM(last_name));

-- Kontrolli tulemust - enne 80 rida, pärast 60 rida
SELECT last_name, COUNT(*) AS arv
FROM customers_test
GROUP BY last_name ORDER BY last_name;


-- standardiseeri telefoninumbrid
SELECT phone,
    CASE
        WHEN phone LIKE '+372%' THEN phone
        WHEN phone LIKE '372%' THEN '+' || phone
        WHEN LENGTH(phone) = 7 THEN '+372' || phone
        ELSE phone
    END AS standardne_telefon
FROM customers_test
WHERE phone IS NOT NULL
LIMIT 10;

-- Asendan NULL e-maili aadressid
UPDATE customers_test
SET email = 'puudub@unknown.ee'
WHERE email IS NULL OR email = '';

--Leian duplikaatsed read - Leitud 79 rida
SELECT 
    first_name, last_name, email, phone, city, loyalty_tier, birth_year,
    COUNT(*) AS koopiate_arv
FROM customers_test
GROUP BY 
    first_name, last_name, email, phone, city, loyalty_tier, birth_year
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;


-- Enne kustutamist - ridade arv - 3150
select * from customers_test;

-- Lisan tabelisse rea indikaatori
ALTER TABLE customers_test
ADD COLUMN id SERIAL;

-- Kustutan tabelist duplikaatread.
DELETE 
-- Select * 
FROM customers_test
WHERE id IN (
    SELECT id
    FROM (
        SELECT id ,
               ROW_NUMBER() OVER (
                   PARTITION BY first_name, last_name, email, phone, city, loyalty_tier, birth_year
                   ORDER BY id
               ) AS rn
        FROM customers_test
    ) duplikaadid
    WHERE rn > 1 -- kustutamisele minevad read
);

-- peale kustutamist - ridade arv - 3070
select * from customers_test;

--Kontroll:
select 3150 - 3070 AS duplikaatide_arv;

