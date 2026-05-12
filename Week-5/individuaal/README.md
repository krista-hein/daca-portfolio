# Nädal 5 töö tulemused

# UrbanStyle Turundusanalüüs: Kanalite Efektiivsus ja Kliendihankimine (Roll B)
## Ülevaade
Käesolev projekt on osa UrbanStyle.ltd investorite dashboard’ist, kus minu ülesandeks oli luua turundusjuht Anna Metsale suunatud vaade. Fookuses on küsimus: "Kas turundus töötab ja millised kanalid on kõige tulemuslikumad?".
## Loodud visuaalid
Vastavalt Roll B soovitustele lõin kaks peamist diagrammi, mis aitavad mõista müügikanalite osakaalu ja uute klientide lisandumise dünaamikat:
1. **Müügikanalite efektiivsus (Tulpdiagramm)**: Võrdleb tulu ja klientide arvu erinevates kanalites (Pood vs Online).
2. **Klientide lisandumine ajas (Joondiagramm/Area chart)**: Näitab uute klientide liitumise trendi aastate lõikes, et tuvastada kasvufaase ja langustrende.

## Disainiotsuste selgitus
Dashboard'i loomisel lähtusin järgmistest andmevisualiseerimise põhiprintsiipidest:
* **Diagrammitüüpide valik**:
  * Kasutasin tulpdiagrammi kanalite võrdlemiseks, kuna inimsilm suudab tulpade pikkusi võrrelda palju täpsemalt kui sektordiagrammi nurki.
  * Kliendihankimise trendi jaoks valisin joondiagrammi, kuna see on parim valik muutuste näitamiseks ajas ja võimaldab intuitiivselt tajuda trendi suunda.
* **Visuaalne hierarhia (F-muster)**: Paigutasin kõige olulisemad müüginumbrid (KPI kaardid) üles vasakule ja peamised trendid lehe keskossa. See järgib inimaju loomulikku liikumist, tagades, et oluline info on haaratav 10 sekundiga.
* **Data-ink ratio (Tufte põhimõte)**: Eemaldasin graafikutelt üleliigsed ruudustikujooned (gridlines) ja 3D-efektid, mis ei lisa väärtust. Iga piksel ekraanil peab teenima eesmärki andmete mõistmiseks.
* **Värviteooria ja bränding**: Kasutasin UrbanStyle'i brändivärve — teal (#009B8D) peamise aktsendina ja navy (#1A1A2E) teksti jaoks. See loob professionaalse ja ühtse terviku.
* **Andmete puhastamine**: Professionaalsema ilme saavutamiseks standardiseerisin kanalite nimed ("pood" -> "Pood"), et need vastaksid juhtkonna ootustele ja disainerimõtlemise standarditele.

## Äritõlgendus Anna Metsale
Analüüs näitab, et füüsiline pood on endiselt suurim tuluallikas (1,9M EUR), kuid klientide hankimise kiirus on pärast 2022. aasta tippu hakanud langema.

**Soovitus**: Anna, kuna kliendihankimine on 2024. aastal aeglustunud, tuleks suunata turunduseelarvet suurema kasvupotentsiaaliga online-kanalisse ning optimeerida kampaaniad piirkondadesse, kus püsiklientide osakaal on kõrge, et toetada korduvoste.

## Kasutatud tööriistad ja tehnoloogiad
* **Andmeallikas**: SQL (Supabase) – andmete agregeerimine ja puhastamine.
* **Visualiseerimine**: Power BI.
* **AI abi**: Kasutasin AI abi DAX-mõõdikute (nt SAMEPERIODLASTYEAR ja ALL) koostamisel ning tekstide lihvimisel, et need vastaksid juhtkonna ootustele.

