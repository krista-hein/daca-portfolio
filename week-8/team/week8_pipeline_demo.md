#  UrbanStyle.ltd: Automatiseeritud ETL Pipeline Demo

## Probleem ja väljakutse
Enne seda projekti kulutas tootehaldur Marko Saar igal esmaspäeval 4 tundi manuaalsele andmete töötlemisele (CSV eksport, puhastamine Excelis, manuaalsed RFM arvutused). Andmed olid esmaspäevaks juba vananenud ning inimlikud vead valemites vähendasid raportite usaldusväärsust.

## Lahendus
Lõime täielikult automatiseeritud Pythoni-põhise Extract-Transform-Load (ETL) süsteemi, mis asendab käsitöö reaalajas andmevooga.

**Süsteemi arhidektuur ja rollide jaotus**

**Roll A (Extract)**: data_fetcher.py — pärib andmed Supabase API-st, kasutades lehekülgedeks jagamist (pagination), mis võimaldab töödelda üle 11 000 müügirea.

**Roll B (Transform)**: transform.py — teostab automaatse puhastuse (duplikaadid, NULL väärtused) ja arvutab ärikriitilised KPI-d ning nädalased koondi.

**Roll C (Load/Visualize)**: visualize_export.py — genereerib interaktiivsed Plotly graafikud ja salvestab tulemused ajatempliga CSV-failidesse.

**Roll D (Orkestreerija)**: pipeline.py — ühendab kõik moodulid ühtseks tervikuks, lisab turvalise logimise ja käsurea parameetrid

## Peamised tulemused
Tänu süsteemi skaleeritavusele tuvastasime UrbanStyle'i tegeliku ulatuse: 

**Kogukäive: ~2,7 miljonit €** (kogu ajaloo vältel).

**Ajalooline tipphetk**: 2024. aasta detsembri alguses ulatus nädala tulu rekordilise **39 046 euroni**.

**Efektiivsus**: Pipeline sooritab kogu töö (pärimine, töötlemine, eksport) keskmiselt **3.80 sekundiga**.


