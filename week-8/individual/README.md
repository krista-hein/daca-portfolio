# Week 8: Production-Grade Automation Pipeline
## Minu roll: Roll D - Automatiseerimisskript


## Tehtud arendused ja äriline mõju:
* **Moodulite integratsioon**: Ühendasin andmete pärimise, töötluse ja ekspordi moodulid ühtseks run_pipeline() funktsiooniks. Süsteemis, kus Extract, Transform ja Load on eraldatud, säilib võimalus isoleerida vigu - kui API on maas, peatub protsess logidesse veateate jätmisega, rikkumata olemasolevaid raporteid.
* **Dünaamiline juhtimine**: Lisasin võimaluse määrata raporti kuupäeva käsurealt kasutades --start-date ja --date argumente.
* **Veakindlus**: Rakendasin try-except plokid, et süsteem ei krahhiks API tõrgete korral, vaid logiks vea ja peatuks turvaliselt. Erinevalt print() käskudest jäävad logifailid alles ka pärast terminali sulgemist, pakkudes Toomas Kasele täielikku auditeeritavus.
* **Logimissüsteem**: Seadistasin automaatse logimise logs/ kausta, kus iga käivitus tekitab ajatempliga logifaili (nt pipeline_2026_05_22.log).
  <img width="1666" height="362" alt="image" src="https://github.com/user-attachments/assets/b8c773b5-5318-4b21-b26f-1a878c001c46" />

  <img width="1141" height="290" alt="image" src="https://github.com/user-attachments/assets/a7778797-04d6-4453-a83d-ddb3a7797cb7" />


## Süsteemi käivitamine
1. Loo virtuaalkeskkond python -m venv .venv ja aktiveeri see.
2. Installi vajalikud teegid: pip install -r requirements.txt.
3. .env failis on SUPABASE_URL ja SUPABASE_KEY seadistatud.
4. Käivita python pipeline.py --start-date 2024-01-01
5. Kontrolli output/ kausta värskete CSV ja HTML raportite jaoks ning logs/ kausta süsteemi tervise kontrollimiseks.


## Tehniline spetsificatsioon

- **Keel**: Python 3.11+
- **Andmeallikas**: Supabase REST API (PostgreSQL)
- **Teegid**: pandas, supbase, plotly, python-dotenv
- **Turvalisus**: API võtmeid hoitakse eraldi .env failis, mis on .gitignore abil peidetud.
