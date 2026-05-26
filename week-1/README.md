# Nädal 1: SQL Põhitõed — UrbanStyle'i andmemaastiku avastamine

## Ülevaade
Nädala 1 eesmärk oli viia läbi UrbanStyle.ltd andmemaastiku esmane audit ja omandada SQL-i põhitõed. UrbanStyle on kiiresti kasvav Eesti moeettevõte, kus andmed on hetkel killustatud kolme eraldi süsteemi vahel, tekitades olukorra, mida IT-juht Toomas Kask nimetab "andmekaoseks". Kuna tegevjuht Kristi Tamm vajab investoritele esitlemiseks andmepõhist äriplaani, oli meie esimene samm mõista, millised andmed on üldse olemas ja mis on nende kvaliteet.

Meie meeskond kaardistas neli peamist andmevaldkonda :
* **Müügitehingud**: summad, kuupäevad ja maht.
* **Kliendiandmed**: nimed, asukohad ja registreerimisinfo.
* **Tooteandmed**: kategooriad, sortiment ja hinnad.
* **Müügikanalid ja asukohad**: e-poe ja füüsiliste kaupluste (Tallinn, Tartu, Pärnu) jaotus.


## Kausta struktuur
1. **individual** - Minu isiklik panus (Roll C: Tooteandmed): 
    - Minu SQL paringud -- daca-portfolio\week-1\team\individual\week1_products_exploration.sql 
    - Tulemuste pildid -- daca-portfolio\week-1\team\individual\week1_results_screenshot...png
2. **team** - **Data Landscape**: 
    - Meeskonna leiud -- daca-portfolio\week-1\team\Data Landscape slide.md        

## Kasutatud tehnoloogiad ja oskused
* **Keel**: SQL (PostgreSQL).
* **Tööriistad**: Supabase (andmebaas), VS Code, GitHub.
* **SQL funktsioonid**: SELECT, WHERE, DISTINCT, COUNT, ORDER BY, LIMIT.

## Peamised järeldused

### SUURIM ÜLLATUS :
Müükide puhul negatiivsed müügisummad, toodete puhul soetusmaksumusest madalamad müügihinnad. Päris palju dubleeritud e-mail.

### SOOVITUS TOOMASELE :
Läbi vaadatud 3 tabelit on vaja puhastada ning sisestada puuduvad andmed. 

### PUUDUVAD ANDMED :
Tänase ülesande raames küll mittevajalik, aga edasipidi võiks olla eraldi stores tabel, kus on andmed kõikide kaupluste kohta - aadressid, ruutmeetrid, töötajate arv.  See võimaldaks Toomasel arvutada müüki ruutmeetri kohta või tulu ühe töötaja kohta, mis on äri laiendamiseks hädavajalik info.


