# Nädal 2: Roll B - Kliendiandmete puhastamine

### Mida ma tegin
- **Andmeohutus**: Enne puhastamist lõin customers_test koopia, et vältida algandmete rikkumist ja järgida *Test, Verify, Log, Commit* töövoogu
- **Duplikaatide eemaldamine:** Tuvastasin ja eemaldasin klienditabelist korduvad kirjed, kasutades `GROUP BY` ja `HAVING` funktsioone.
- **Standardiseerimine:** Ühtlustasin linnade nimed ja kliendinimed (`INITCAP`, `TRIM`), tagades korrektse grupeerimise analüüsideks.
- **NULL väärtuste käsitlemine:** Kontrollisin puuduvate andmete olemasolu ning vajaliku koha peal tegin asendused.

### Puhastamise tulemused 
Tänu puhastusprotsessile vähenes ridade arv 3150-lt 3070-ni, mis tähendab, et eemaldasime 80 puhast müra-rida (otsesed duplikaadid).
- Algne seis: 3150 rida.
- Lõplik seis: 3070 rida.

| Kategooria | Leitud probleeme | Pärast puhastamist | Äriline tähendus|
|------------|-----------------|-------------------|-----------|
| Duplikaatsed e-mailid | 129 | 59 | Vähenenud oht saata samale kliendile topelt turundusmeile|
| Duplikaatsed telefonid | 147 | 70 | Paranenud SMS-teavituste täpsus ja vähendatud kulu. |
| Ebajärjekindlad linnanimed | 43 | 12 | Võimaldab nüüd korrektset müügianalüüsi linnade kaupa.|
| NULL telefon/e-mail | 0/380 | 0/380 | Tuvastatud 12% kliendibaasist, kellega UrbanStyle ei saa hetkel ühendust. |
| **KOKKU** | **699** | **509** | |


### Peamised õppetunnid ja järeldused
1.  **Andmekaos on reaalne**: 380 klienti ilma e-mailita on märk sellest, et UrbanStyle vajab kassasüsteemis kohustuslikku sisestuskontrolli.
2.  **SQL-i täpsus**: Õppisin, et COUNT(*) ja COUNT(veerg) vahe on oluline indikaator NULL-väärtuste leidmisel.
3.  **Äriline soovitus**: Soovitan Annale algatada kampaaniat nende 380 kliendi andmete uuendamiseks (nt sooduskood andmete lisamise eest), et taastada turunduskanal nendega.


---
*Kõik muudatused teostati esmalt test-koopiates, järgides turvalise andmetöötluse põhimõtteid.*