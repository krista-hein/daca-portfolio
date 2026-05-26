# Nädal 2: Andmete Puhastamine — UrbanStyle'i Kliendibaasi Korrastamine

## Ülevaade

Selle nädala fookuses oli UrbanStyle.ltd andmete süsteemne puhastamine. Eelmise nädala audit tuvastas kriitilisi vigu — üle 5000 duplikaadi müügitabelis, puuduvad kliendiandmed ja ebakorrektsed kuupäevad. Kuna tegevjuht Kristi Tamm vajab investorite jaoks usaldusväärseid numbreid, oli meie eesmärk liikuda "andmekaosest" "tootmisvalmis" andmeteni.

Kasutasime distsiplineeritud protsessi:
* **Test-koopia loomine**: Töötasime vaid koopiatel, mitte algandmetel.
* **Diagnostika**: Probleemide ulatuse täpne mõõtmine.
* **Puhastamine**: Duplikaatide eemaldamine, NULL-väärtuste asendamine ja formaatide ühtlustamine.
* **Kontroll ja logimine**: Iga muudatuse dokumenteerimine audit logi abil

## Kausta struktuur
* **individual** - Minu isiklik panus andmete puhastamisel:
    - week2_customers_cleaning.sql — Minu koostatud puhastamisskript.
    - week2_customers_report.md — Detailne enne/pärast raport leitud vigade kohta.
* **team** - Data Quality Report:
    - Meeskonna ühine koondraport UrbanStyle'i andmete puhtuse kohta.

## Kasutatud tehnoloogiad ja oskused
* **Keel**: SQL (PostgreSQL).
* **Käsud**: DELETE, UPDATE, GROUP BY + HAVING (duplikaatide leidmiseks), COALESCE (NULL-ide asendamiseks), CASE WHEN (valideerimiseks), INITCAP/TRIM (teksti puhastamiseks).
* **Meetod**: Test, Verify, Log, Commit töövoog.



## Ärilised järeldused ja soovitused
- **Soovitus turundusele**: Kuna 12% klientidest on ilma e-mailita, tuleb kassasüsteemis muuta e-maili sisestamine kohustuslikuks või pakkuda soodustust andmete uuendamisel.
- **Kliendi lojaalsus**: Enne lojaalsustasemete (Bronze, Silver, Gold) lõplikku puhastamist on vaja täiendavat analüüsi koos müügiandmetega.


