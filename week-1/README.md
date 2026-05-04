# Nädal 1: SQL Põhitõed — UrbanStyle'i andmemaastiku avastamine

## Individuaalsed saavutused
## Mida ma tegin (Roll C: Tooteandmed)
- Uurisin products tabelit SQL paringutega. Kasutasin SQL käske (SELECT, WHERE, DISTINCT, COUNT).
- Leidsin, et 18 tootel on puudu sertifikaadi info, 10 toote puhul on soetushind suurem, kui müügihind ning puudub informatsioon üldisest laoseisust. 
- Osalesin meeskonna andmemaastiku koostamisel

## Peamised opid
- Tuletasin meelde, kuidas luua ühendus isikliku arvutis oleva kausta ja GitHub'i vahel, et faile sünkroonida.
- Lisaks grupitöö juhendis Alaülesandekaartidel olnud SQL päringutele proovisin kasutada veel erinevaid päringuid olemasoleva info põhjal, et tutvuda rohkem SQL võimalustega.

## Failid
- `week1_products_exploration.sql` -- minu SQL paringud
- `week1_results_screenshot...png` -- tulemuste pildid


## Meeskonna tulemused

**Meeskonnatöö tulemus: Data Landscape**: daca-portfolio\week-1\team\Data Landscape slide.md

## SUURIM ÜLLATUS :
Müükide puhul negatiivsed müügisummad, toodete puhul soetusmaksumusest madalamad müügihinnad. Päris palju dubleeritud e-mail.

## SOOVITUS TOOMASELE :
Läbi vaadatud 3 tabelit on vaja puhastada ning sisestada puuduvad andmed. 

## PUUDUVAD ANDMED :
Tänase ülesande raames küll mittevajalik, aga edasipidi võiks olla eraldi stores tabel, kus on andmed kõikide kaupluste kohta - aadressid, ruutmeetrid, töötajate arv.  See võimaldaks Toomasel arvutada müüki ruutmeetri kohta või tulu ühe töötaja kohta, mis on äri laiendamiseks hädavajalik info.
Products tabel võiks sisaldada toodete marginaale ning koguseid.

