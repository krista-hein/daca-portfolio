# Nädal 7: Python Pandas — RFM kliendisegmenteerimine

## Projekti ülevaade
Sel nädalal liikus UrbanStyle.ltd analüüs SQL-i ja staatiliste dashboard’ide juurest Pythoni ja pandas töövoogu. Tootehaldur Marko Saar vajas kõhutunde asendamiseks andmepõhist vaadet: kes on meie kõige väärtuslikumad kliendid ning kes on ohus poodi hüljata? Vastuseks viisime läbi RFM (Recency, Frequency, Monetary) analüüsi, mis võimaldab turundusmeeskonnal saata personaliseeritud pakkumisi vastavalt klientide tegelikule käitumisele.

## Kaustade struktuur
1. **individual** - Minu isiklik panus (Roll A: andmete laadimine ja tabelite ühendamine): Minu alaülesande kood week7_rfm_RollA.ipynb
2. **team** - Meeskonna terviklik notebook week7_rfm_complete.ipynb

## Kasutatud tööriistad ja oskused
* Python ja pandas: Andmete laadimine, puhastamine ja keeruliste skooride arvutamine.
* Plotly Express: Interaktiivsete visualiseerimiste loomine segmentide jaotuse ja kliendidünaamika esitlemiseks.
* Jupyter Notebook: Analüüsiprotsessi dokumenteerimine ja reprodutseeritava koodi loomine.

## Metoodika: RFM Analüüs
Kliendid jagati kvintiilide (skoorid 1–5) alusel kolmes dimensioonis:
* Recency (R): Päevade arv viimasest ostust.
* Frequency (F): Tehtud ostude koguarv.
* Monetary (M): Klientide kogukulutus eurodes.
Koondskoori põhjal defineerisime kuus peamist segmenti: VIP Champions, Loyal Customers, Regular Customers, New Customers, At Risk ja Lost.

## AI kasutamine
Selle projekti raames kasutasin AI-d rohkelt debugimisel ja loogika struktureerimisel.
1. Süntaksi ja loogika "tõlkimine" - vajasin abi SQL loogika ülekandmisel pandas DataFrame'i maailma
2. Tehniliste tõrgete lahendamine: Kasutasin AI-d kiire esmaabina veateadete puhul.
3. Visualiseerimise peenhäälestamine: Kuigi minu roll ei olnud seotud visualisseerimisega, katsetasin ka roll D üleasannet. Selle asemel, et kulutada aega Plotly mahuka dokumentatsiooni sirvimisele, andsin AI-le sisendiks UrbanStyle'i brändiraamatu värvid (Teal #009B8D) ja palusin genereerida täpsed koodiparameetrid.

