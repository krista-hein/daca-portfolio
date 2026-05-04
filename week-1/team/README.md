# MEESKOND: Tooteanalüüsi osakond |  NÄDAL: 1  |  TEGELANE: Toomas Kask

## ANDMEMAASTIK (Data Landscape):

- **sales** (tehingud): 15234 rida, 11 veergu
  - *peamine leid* : 
    - kuupäevad on segaformaadis.
    - store_location puudub 5204 real (34%).
    - customer_id puudub 1487 real. See tähendab, et ligi 10% müükidest ei ole seostatavad püsiklientidega.
    - Tallinna vaade: Viimase 15 tehingu detailne kontroll paljastas süsteemseid duplikaate ja tühje väärtusi.
    - Müügisummade vahemik on ebatavaliselt suur:
      - suurim tehing oli summas 2 170.40 €.
      - väikseim väärtus oli -1 405.32 €. Negatiivsed summad vajavad täiendavat kontrolli - võivad tähendada tagastusi.
    - Kaupluste koormus:
      - Tallinn: 5 704 tehingut
      - Tartu: 2 708 tehingut
      - Pärnu: 1 618 tehingut

- **customers**: 3150 rida, 9 veergu
  - *Peamine leid*:
    - Enamik andmetest on täidetud, kuid puuduvad väärtused esinevad peamiselt veergudes:
      - email (380 puudu ehk 12,1% kliendibaasist; 510 dubleeritud ehk 16,2%) ning
      - loyalty_tier (1260 puudu ehk 40%).
    - Linnade (city) andmed ei ole ühises vormingus (suured/väikesed tähed, tühikud), mistõttu sama linn esineb mitmel erineval kujul.
    - Esimene klient registreeriti 02.01.2020 ja uusim 27.02.2025.
      - Viimase 6 kuu jooksul lisandus 325 uut klienti, mis moodustab 10,3% kogu kliendibaasist.
    - Andmestik on piisavalt kvaliteetne edasiseks analüüsiks. Kuigi customer_id väärtused on unikaalsed, vajavad täiendavat kontrolli kliendiandmed (nt nimi ja email) ning vajalik on andmete korrastamine ja puuduvate väärtuste täitmine.

- **products**: 362 rida, 9 veergu
  - *peamine leid* : 
    - Ühtegi tootekoodi ega tootenimetust ei esine tabelis üle ühe korra.
    - eco_sertificate puudub 18 real.
    - 10 toote on soetushind suurem kui müügihind.
    - Tootede tabel on üldiselt heas seisus, tuleks täpsustada 18 toote eco_sertifikaadi olemasolu ning üle vaadata probleemsete müügihindadega tooted, kas hind on valesti sisestatud või on olnud probleeme toodete müümisega, mille tulemusel oli vaja toodete hind tunduvalt alla lasta.
    - Tabelis võiks sisalduda ka toodete marginaal ning kogus laos

- **sales/stores**(kanalid/asukohad): 15234 rida, 11 veerg
  - *peamine leid* : 
    - stores tabel puudus andmestikus 
    - millised kauplused on ja mis andmed nende kohta
        - Kaupluse asukoht | Tehingute_arv |Kogukäive
        - Pärnu            | 1618          | 438 183.08 €
        - Tartu            | 2708          | 783 468.61 €
        - Tallinn          | 5704          | 1 626 303.81 €
    - Tallinn moodustab ligikaudu 57% kogukäibest ja tehingute arvust, mis on loogiline arvestades rahvaarvu ja turu suurust.
    - Eraldi kaupluste tabelit ei olnud, müügiandmete põhjal sai tuvastada 3 füüsilist kauplust: Tallinn, Tartu ja Pärnu. 
    

## SUURIM ÜLLATUS :
Müükide puhul negatiivsed müügisummad, toodete puhul soetusmaksumusest madalamad müügihinnad. Päris palju dubleeritud e-mail.

## SOOVITUS TOOMASELE :
Läbi vaadatud 3 tabelit on vaja puhastada ning sisestada puuduvad andmed. 

## PUUDUVAD ANDMED :
Tänase ülesande raames küll mittevajalik, aga edasipidi võiks olla eraldi stores tabel, kus on andmed kõikide kaupluste kohta - aadressid, ruutmeetrid, töötajate arv.  See võimaldaks Toomasel arvutada müüki ruutmeetri kohta või tulu ühe töötaja kohta, mis on äri laiendamiseks hädavajalik info.
Products tabel võiks sisaldada toodete marginaale ning koguseid.