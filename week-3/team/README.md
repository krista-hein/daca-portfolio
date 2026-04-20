# Nädal 3: SQL JOIN analüüs - Urbanstyle. ltd äriandmete ühendamine

## Projekti ülevaade
Sel nädalal oli meie meeskonna ülesandeks lahendada UrbanStyle.ltd äriprobleemid, kus vajalikud andmed asusid erinevates tabelites (sales, customers, products, inventory). 
Kasutasime SQL JOIN lauseid, et ühendada killustatud andmed ja pakkuda turundusjuht Anna Metsale ning IT-direktor Toomas Kasele terviklikku vaadet ettevõtte käekäigust.

## Meeskondlik tööprotsess
Töötasime **JAGA-TEE-KOGU-ESITLE** raamistiku alusel.
1. Jaga: Jaotasime rollid (A, B, C, D), kus iga liige keskendus konkreetsele JOIN-tüübile ja ärivaldkonnale.
2. Tee: Sooritasime iseseisvad SQL päringud Supabase keskkonnas.
3. Kogu: Sünteesisime individuaalsed leiud ühtseks aruandeks.
4. Esitle: Koostasime juhatusele suunatud esitluse koos strateegiliste soovitustega.

## Peamised tulemused ja analüüs
1. **Müük ja kliendilojaalsus** (Roll A)
Regionaalne liider: Enim müüke tuleb Tallinnast (3601 müüki summas 1 006 252,88 €).
Pärnu fenomen: Kuigi Pärnu on mahult kolmas, on sealsed kliendid kõige lojaalsemad – keskmiselt 4,7 ostu kliendi kohta.
Kuldne segment: Kõige efektiivsem on Gold-tase, kus müügi ja klientide arvu suhe on parim, kuigi tase puudub ligi 1000 kliendil.
Märkus: Selles analüüsis kasutati klientide tabelit, kus duplikaadid olid veel eemaldamata.

2. **"Kadunud" klientide tuvastamine** (Roll B)
Tuvastasime 513 klienti, kes on konto loonud, kuid pole sooritanud ühtegi ostu.
Suurim osa passiivsetest klientidest asub Tallinnas (212) ja Tartus (123).
Vanhimad ootel registreeringud pärinevad jaanuarist 2020, mis viitab vajadusele kiire "win-back" kampaania järele.

3. **Tooted ja inventuuri kriitilised kohad** (Roll C)
Müügihitt: Jalanõud on edukaim kategooria (käive üle 774 000 €), tipptooteks on "Õhulised sünteetilised sporditossud".
Surnud laoseis: Leidsime 12 toodet, mida pole kunagi müüdud ja mille laoseis on 0 (nt eksperimentaalsed tooted nagu puust müts).
Kriitiline viga: Tuvastasime populaarse toote ("Õhuline polüester cargo püksid"), mille laoseis on langenud -46 ühikuni.

4. **Müügikanalite efektiivsus** (Roll D)
Kanalite jaotus: 66% müügist (1,9 miljonit €) tuleb füüsilistest poodidest ja 34% (1 miljon €) online-kanalist.
E-pood kui kasvulava: Online-kanal on tehingute arvult suuruselt teine "asukoht" kohe Tallinna järel, näidates suurt kasvupotentsiaali.

## Meie soovitused juhatusele
**Turundusfookus**: Käivitada "win-back" e-maili kampaania (-15% esimeselt ostult) 513 passiivsele kliendile.
**Tootehaldus**: Eemaldada süsteemist 12 müümata ja laoseisuta toodet ning korrigeerida kahjumliku hinnastusega vintage-tooted.
**Logistika**: Prioritiseerida miinuses olevate toodete (cargo-püksid) ja jalanõude juurde tellimist.
**Investeeringud**: Suunata turunduseelarve online-kanalisse ja Pärnu piirkonna digireklaami, et suunata sealsed aktiivsed kliendid e-poodi.

## Kasutatud tehnoloogiad
 - **SQL JOIN-tüübid**: INNER JOIN, LEFT JOIN, LEFT JOIN + IS NULL filter.
 - **Funktsioonid**: COUNT, SUM, AVG, GROUP BY, HAVING.
