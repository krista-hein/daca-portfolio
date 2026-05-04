# Nädal 4 töö tulemused

## Veebianalüütika tulemuste kokkuvõte

# Vastused põhiküsimustele
 - **Kas iga veebikülastus viis müügini?** Ei, UrbanStyle'i veebipoes on konversioonimäär (veebikülastuste suhe müükidesse) hetkel väga madal. Analüüs näitas, et mobiilikasutajate konversioon on 0,14% ja desktopi kasutajatel 0,16%. See tähendab, et ainult murdosa tuhandetest sessioonidest lõppeb tehinguga. Samas tuleb arvestada, et tehnilise puudujäägi tõttu (müügitabelis puudub session_id) on müükide ja külastuste ühendamine täna vaid oletuslik, mis võib tegelikku müükide arvu analüüsis vähendada.
 - **Kui kaua veedab keskmine klient lehel aega?** Keskmise kliendi sessiooni pikkus on ligikaudu 10 minutit (598 sekundit). Üksikute lehevaatamiste lõikes viibivad kliendid lehel sarnaselt kõikide kanalite puhul, jäädes vahemikku 127–136 sekundit ühe kirje kohta. See näitab, et huvi toodete vastu on püsiv, kuid väljakutse on selle huvi konverteerimine ostuks.
 - **Millised kanalid on enim kasutusel ja kas sealt tulevad ka ostud?** Kõige populaarsemad sisenemiskanalid on Google Organic (3338 külastust), Direct (2093) ja Facebook Ads (1697). Külastajate aktiivsus on kanalite lõikes võrdlemisi ühtlane, kuid keskmiselt veedavad lehel kõige rohkem aega Google’i (136 sekundit) ning Google Adsi, Directi ja Tiktoki (kõik 134 sekundit) kaudu tulnud kasutajad. Ostude sidumisele konkreetsete kanalitega ei ole hetkel võimalik veebilogide põhjal täpset vastust anda. Analüüsi käigus tuvastati kriitiline puuduv otselink: kuigi müügitabelis on kirjas müügikanal (nt "online"), puudub seal session_id, mis viitaks konkreetsele veebikülastusele. Süsteemide killustatuse tõttu ei "räägi" Shopify e-pood ja veebianalüütika logid omavahel piisavalt detailselt, et jagada unikaalset sessioonitunnust müügihetkel, mistõttu ei saa kindlaks teha, milline veebikanal täpselt ostuni viis


# Muud olulised leiud
 - Andmete granulaarsus ja ahaa-moment: Tuvastasime, et UrbanStyle’i logides on üks rida tegelikult lehevaatamine, mitte sessioon. Üks keskmine sessioon koosneb kaheksast lehevaatamisest. Ilma andmete agregeerimiseta näeksime liiklust tegelikust 8 korda suuremana.
 - Mobiilne ülekaal: 56% kogu veebiliiklusest (5590 sessiooni) pärineb mobiilseadmetest. See on UrbanStyle’i jaoks peamine kokkupuutepunkt kliendiga.
 - Andmete anomaalia: Alates 2023. aasta jaanuarist on toimunud ebaloomulik hüpe, kus sessioonide arv kasvas ligi 30 korda ning kestus muutus mitmekordseks. See võib viidata tehnilisele muutusele logimises või robotsüsteemidele.
 - Geograafiline jaotus: Valdav osa veebiliiklusest ehk 47 495 lehevaatamist pärineb Eestist.

# Soovitused juhatusele
 1. Mobiilse ostuteekonna optimeerimine: Kuna mobiilikasutajaid on kõige rohkem (56%), aga nende ostuprotsent on madalam kui desktopil, tuleb prioritiseerida mobiilse kassa ja ostukorvi mugavuse parandamist.
 2. Süsteemide integratsioon: IT-direktor peab lisama müügitabelisse session_id tunnuse. Praegune süsteemide killustatus ei võimalda täpselt hinnata, milline kampaania viis millise ostuni.
 3. SEO fookuse hoidmine: Jätkata investeeringuid orgaanilisse nähtavusse (SEO), kuna Google Organic on tõestatult kõige kvaliteetsem ja tulusam kanal.
 4. 2023. aasta anomaalia auditeerimine: On vaja selgeks teha, kas 2023. aasta liikluse kasv on reaalne edu või andmeviga, et vältida moonutatud järeldusi investorite ees.