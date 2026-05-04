# Nädal 2: Andmete Puhastamine — UrbanStyle'i Kliendibaasi Korrastamine

Sel nädalal keskendusin "andmekaose" likvideerimisele kliendiandmetes.

## Tehnilised saavutused
- **Duplikaatide eemaldamine:** Tuvastasin ja eemaldasin klienditabelist korduvad kirjed, kasutades `GROUP BY` ja `HAVING` funktsioone.
- **Standardiseerimine:** Ühtlustasin linnade nimed ja kliendinimed (`INITCAP`, `TRIM`), tagades korrektse grupeerimise analüüsideks.
- **NULL väärtuste käsitlemine:** Kontrollisin puuduvate andmete olemasolu ning vajaliku koha peal tegin asendused.

## Puhastamise tulemused 
- Algne seis: 3150 rida.
- Lõplik seis: 3070 rida.

## Ärilised järeldused ja soovitused
- **Soovitus turundusele**: Kuna 12% klientidest on ilma e-mailita, tuleb kassasüsteemis muuta e-maili sisestamine kohustuslikuks või pakkuda soodustust andmete uuendamisel.
- **Kliendi lojaalsus**: Enne lojaalsustasemete (Bronze, Silver, Gold) lõplikku puhastamist on vaja täiendavat analüüsi koos müügiandmetega.

- [Vaata minu SQL skripti siit](individual/week2_customers_cleaning.sql)
- [Loe detailset puhastusraportit](individual/week2_customers_report.md)
- [Meeskonna ühine andmeaudit](team/week2_team_cleaning_report.md)

---
*Kõik muudatused teostati esmalt test-koopiates, järgides turvalise andmetöötluse põhimõtteid.*