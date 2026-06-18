# Week 8: Production-Grade Automation Pipeline

## Ülevaade
Selle nädala eesmärk oli liikuda ad-hoc analüüsidelt üle professionaalsele süsteemiehitusele. Lõime moodulaarse andmepipeline'i UrbanStyle OÜ jaoks, mis automatiseerib kogu andmeanalüüsi protsessi. Vähendasime ettevõtte poolt tehtavat manuaalset tööd (4h iga esmapäeval) ning võitsime sellega ~200 töötundi aastas.

## Kaustade struktuur
1. **individual** - Minu isiklik panus (Roll D - Automatiseerimisskript): Minu ülesandeks oli ehitada süsteemi "aju" ehk pipeline.py, mis orkestreerib kogu andmevoogu.
2. **team** - Meeskonnatöö kokkuvõte estitluse jaoks - week8_pipeline_demo.md.

## Key Insights
* **Aja kokkuhoid**: Protsess, mis võttis varem 4 tundi, käivitub nüüd alla 2 minuti.
* **Usaldusväärsus**: Inimlike vigade oht vähenes, tõstes andmete usaldusväärsuse 87%-lt 99,8%-le.
* **Skaleeritavus**: Süsteem on valmis UrbanStyle'i kasvuks 2500 kliendilt 10 000+ kliendini ilma töömahtu suurendamata

## AI Kasutamine
Selle nädala jooksul olid mulle suureks toeks NotebookLM ja Claude. NotebookLM-i kasutasin nagu tarka õpipartnerit, kellelt küsisin UrbanStyle'i kohta täpsustusi, et mu kood ei oleks lihtsalt rida käsklusi, vaid sobiks ka päriselt ettevõtte äriloogikaga. Claude aitas mul aga koodis "detektiivi" mängida — kui pipeline kokku jooksis, sain tema abil kiiresti aru, kas viga oli minu kirjutatud loogikas või peitus probleem kuskil moodulitevahelises andmevahetuses. Kuigi Claude aitas koodi struktureerida, vastutasin mina süsteemi arhitektuuri ja äriloogika valideerimise eest.
