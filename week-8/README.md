# Week 8: Production-Grade Automation Pipeline

## Ülevaade
Selle nädala eesmärk oli liikuda ad-hoc analüüsidelt üle professionaalsele süsteemiehitusele. Lõime moodulaarse andmepipeline'i UrbanStyle OÜ jaoks, mis automatiseerib kogu andmeanalüüsi protsessi.

## Tehniline spetsificatsioon

- **Keel**: Pyhton 3.11+
- **Andmeallikas**: Supabase REST API (PostgreSQL)
- **Teegid**: pandas, supbase, plotly, python-dotenv
- **Turvalisus**: API võtmeid hoitakse eraldi .env failis, mis on .gitignore abil peidetud.

## Minu roll: Roll D - Automatiseerimisskript
Minu ülesandeks oli ehitada süsteemi "aju" ehk pipeline.py, mis orkestreerib kogu andmevoogu.

**Tehtud arendused**:
* **Moodulite integratsioon**: Ühendasin andmete pärimise, töötluse ja ekspordi moodulid ühtseks run_pipeline() funktsiooniks.
* **Dünaamiline juhtimine**: Lisasin võimaluse määrata raporti kuupäeva käsurealt kasutades --start-date ja --date argumente.
* **Veakindlus**: Rakendasin try-except plokid, et süsteem ei krahhiks API tõrgete korral, vaid logiks vea ja peatuks turvaliselt.
* **Logimissüsteem**: Seadistasin automaatse logimise logs/ kausta, kus iga käivitus tekitab ajatempliga logifaili (nt pipeline_2026_05_22.log).

## Süsteemi käivitamine
1. Veendu, et on aktiveeritud virtuaalkeskkond.
2. .env failis on SUPABASE_URL ja SUPABASE_KEY seadistatud.
3. Käivita pipeline:
4. Tulemused ilmuvad automaatselt output/ kausta.

## AI Kasutamine
Selle nädala jooksul olid mulle suureks toeks NotebookLM ja Claude. NotebookLM-i kasutasin nagu tarka õpipartnerit, kellelt küsisin UrbanStyle'i kohta täpsustusi, et mu kood ei oleks lihtsalt rida käsklusi, vaid sobiks ka päriselt ettevõtte äriloogikaga. Claude aitas mul aga koodis "detektiivi" mängida — kui pipeline kokku jooksis, sain tema abil kiiresti sotti, kas viga oli minu kirjutatud loogikas või peitus probleem kuskil moodulitevahelises andmevahetuses.