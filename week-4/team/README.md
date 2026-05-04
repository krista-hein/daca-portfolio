# Nädal 4 meeskonnatöö tulemused
# UrbanStyle Strateegiline Ärianalüüs: Andmetest Juhtimisotsusteni.

Käesoleva analüüsi eesmärk oli pakkuda tegevjuht Kristi Tammele ja turundusjuht Anna Metsale andmetel põhinevat vaadet ettevõtte seisukorrale juhatuse koosolekuks. Fookuses oli killustatud andmete (müük, kliendid, inventuur, veebilogid) konsolideerimine ja süvitsi minev analüüs, kasutades SQL-i keerukamaid funktsioone nagu CTE-d, GROUP BY, HAVING ja Window Functions
Meeskond analüüsis ettevõtte seisukorda viies võtmevaldkonnas, et valmistada CEO Kristi Tammele ette materjalid juhatuse koosolekuks

## Võtmeleiud domeenide kaupa
**1. Müük ja tootekategooriad (Roll A & C)**
Kogutulu: UrbanStyle'i aasta kogukäive on 2 190 113,51 € (7658 tehingut).
Sesoonsus: Parim müügikuu on detsember (kasv +61% võrreldes novembriga), madalpunkt on jaanuaris.
Kuldne kategooria: Jalanõud on suurim tuluallikas (keskmine hind 384 €) ja pakuvad keskmiselt 69 € marginaali toote kohta, mis on 2,5 korda kõrgem kui lasteriietel.
**2. Kliendiprofiilid (Roll B)**
Lojaalsus: 91% ettevõtte tulust tuleb püsiklientidelt (VIP ja Regular grupid).
VIP-kliendid: Moodustavad 46% kogutulust, kulutades keskmiselt 2780 € kliendi kohta.
Geograafia: Huvitava trendina asub 40% top 10 klientidest Pärnus.
**3. Turunduse ROI ja kanalid (Roll D)**
Efektiivseim kanal: Google Organic toob 27% kogukäibest. Üks Google Organicu kaudu tulnud klient on 5 korda väärtuslikum (6001 €) kui Instagrami kaudu tulnud klient (1144 €).
Sotsiaalmeedia: Facebook Ads näitas detsembris rekordilist 74%-list hüpet.
**4. Veebianalüütika (Roll E)**
Seadmed: Veebiliiklus on selgelt mobiilne (56% sessioonidest), kuid mobiili konversioonimäär (0,14%) on madalam kui desktopil (0.16%).
Anomaalia: Alates 2023. aasta jaanuarist on toimunud ebaloomulik hüpe sessioonide arvus (15-lt üle 400-le kuus), mis vajab täiendavat auditit robotsüsteemide osas.

## Tehniline lähenemine ja andmekvaliteet
Analüüsi käigus lahendati mitmeid andmekvaliteedi väljakutseid:
CTE ja Agregeerimine: Kasutasime CTE-sid, et "pakkida kokku" veebilogid sessiooni tasemele (keskmiselt 8 lehevaatamist ühe sessiooni kohta).
Andmete puhastamine: Turunduskanalite andmete puhastamine võimaldas siduda 286 500 € väärtuses tulu konkreetsete kanalitega, mis varem oli "määramata".
Kriitilised vead: Tuvastasime müügitabelis 5116 topelt-rida ja süsteemse puudujäägi — sales tabelis puudub session_id, mis takistab täpset konversioonianalüüsi.

## Strateegilised soovitused
**Mobiilne optimeerimine**: Kuna mobiilikasutajad konverteeruvad halvemini, tuleb parandada mobiilset ostukorvi ja kassat.
**SEO prioriteetsus**: Google Organicu kvaliteedi tõttu peab SEO jääma 2025. aasta põhifookuseks.
**Hinnapoliitika**: Revideerida marginaale, keskendudes jalanõude segmendi laiendamisele.
**IT-arendus**: Luua otselink veebisessioonide ja müügi vahel, et arvutada täpset ROI-d.

