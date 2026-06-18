# Krista Hein - Data Analytics Portfolio 

An intensive, project-driven Data Analytics portfolio developed during the **Data Analyst Career Accelerator (DACA)** program. This repository demonstrates my technical execution and ability to transform raw, unstructured retail data into actionable strategic insights that support executive decision-making.

 **Programm:** Data Analyst Career Accelerator (DACA) 
 
 **Program Timeline:** 24.03.2026 - 05.06.2026

##  👤  Profile and Business Context

In this portfolio, I act as a Data Analyst for **UrbanStyle Ltd**, a fashion retail company preparing for a **€500,000 business expansion investment**. To minimize investment risk, the company's executive leadership required trustworthy data regarding customer behavior, channel performance, and marketing efficiency. 

My role was to audit, clean, model, and automate UrbanStyle's data pipelines from scratch—moving from corrupt database fragments to verified customer analytics, automated APIs, and interactive dashboards designed for stakeholder review.


## :page_facing_up: Portfolio Business Thread

The structure of this portfolio replicates an enterprise data pipeline lifecycle, answering a critical business question at every stage:

| Stage | Business question | Technical focus & Method | Portfolio Evidence| 
| :--- | :--- | :--- | :--- |
| **Data Quality** | Can UrbanStyle's sales and revenue numbers be trusted? | SQL Auditing, Duplicate Isolation,  & Clean-up | Week 1-2 |
| **Business Reporting** | What is currently happening across sales, customers, products and channels?| Relational Database Modeling and SQL Aggregations | Week 3-4 |
| **Data Storytelling** | What is the key takeaway and stratgic recommendation for management?  | Power BI Dashboard Engineering & Storytelling | Week 5-6 |
| **Customer Analysis**| Who are UrbanStyle's VIP clients, and which groups face churn? | Python Pandas & RFM Customer Segmentation | Week 7 |
| **Automation** | How can we refresh analytics without manual CSV extraction and data processing? | Modular Python API Pipelines and Error Logging | Week 8 |


## :notebook: Week-by-week Project Breakdown

### Week 0: Onboarding & Architecture Setup

**🎯 Objectives:** Environment initialization, analytics workflow setup, and team alignment.

**💎 Key Outcomes:** 
* Configured a local development stack utilizing VS Code, Python, Supabase (PostgreSQL), Git, and Power BI.
* Learned about UrbanStyle business case and project context.
* Co-authored the formal Analytics Team Charter and defined baseline business KPIs for UrbanStyle's expansion framework.

### Week 1: SQL Fundamentals and Data Exploration

**🎯 Objectives:** Initial structural database profiling and data volume auditing.

**💎 Key Outcomes:** 
* Applied `SELECT`, `WHERE`, `ORDER BY`, and `LIMIT` to audit raw transaction and customer tables.
* Succcessfully mapped out data fragmentation, missing indices, and formatting inconsistencies across transactional records.
 

### Week 2: SQL Data Cleaning & Quality Assurance

**🎯 Objectives:** Systematic database cleanup, data preservation, and strict audit logging.

**💎 Key Outcomes:** **Identified and removed 5,116 duplicate rows (representing 33.58% of total database volume)** originating from repetitive entries. Prevented executive misdirection by **eliminating approximately €286,000 in overstated revenue**. Handled `NULL` values via `COALESCE`, standardized city names with `CASE WHEN`, and documented actions in an immutable audit log.


### Week 3: SQL JOINs and Relational Data Integration

**🎯 Objectives:** Combining fragmented data silos into an operational single source of truth.

**💎 Key Outcomes:**
* Engineered multi-table `INNER JOIN` and `LEFT JOIN` structures to link `sales`, `customers`, and `products`.
* Mapped out cross-channel performance trends and identified non-performing inventory items with zero historical sales to optimize holding costs.


### Week 4: SQL Aggregation and Advanced Business KPIs

**🎯 Objectives:** Transforming granular transactions into macro-level business intelligence.

**💎 Key Outcomes:**
* Developed complex analytical queries utilizing `GROUP BY`, `HAVING`, and Common Table Expressions (CTEs).
* Formulated core organizational metrics, including Average Order Value (AOV), Customer Lifetime Value (CLV), and monthly category growth trends.


### Week 5 & 6: Data Visualization & Stakeholder Storytelling (Power BI)

**🎯 Objectives:** Executive-level UI/UX dashboard design and data-to-insight synthesis

**💎 Key Outcomes:** 
* Designed interactive business dashboards in Power BI. Focused heavily on optimal data-ink ratios, intuitive visual hierarchies, and contextual annotations.
* Translated dense data views into clear executive summaries tailored specifically for presentation to stakeholders overseeing the €500k investment fund.


### Week 7: Python Pandas & RFM Customer Segmentation

**🎯 Objectives:**  Transitioning from database queries to programmatic statistical customer profiling.

**💎 Key Outcomes:** 
* Migrated the data stack from SQL to a Python environment to perform an RFM (Recency, Frequency, Monetary) segmentation analysis.
* **Isolated 245 high-value VIP Champions who generate 42% of total company revenue**, giving marketing teams a laser-focused target list for retention campaigns.


### Week 8: APIs and Automated Data Pipelines

**🎯 Objectives:**  Production automation, modular script engineering, and data pipeline orchestration.

**💎 Key Outcomes:** 
* Built an end-to-end automated data pipeline connecting Python directly to the Supabase REST API.
* Engineered automated data fetching, continuous cleaning rules, and automated Plotly dashboard exports.
* Applied error handling, and logging.
* **The complete pipeline processes data seamlessly in just 2.32 seconds, saving an estimated 4 hours of manual labor per week.**


### Week 9 & 10: Career Integration and Portfolio Optimization

**🎯 Objectives:**  Shifting from a technical analyst to a strategic partner by translating code into commercial business value. This phase focused on professional positioning, portfolio auditing, and preparing for executive-level communication.

**💎 Key Outcomes:** 
* Developed a **Data Analyst Recruitment Guide** from an employer's perspective.
* Engineered a **7-minute "Board Meeting" presentation** for UrbanStyle leadership, successfully passing the "So What?" test.
* Mapped 8 weeks of technical milestones (from SQL cleaning to API automation) into high-impact **STAR-method narratives** (Situation, Task, Action, Result) for technical interviews.
* Optimized the **GitHub Profile README and Pinned Repositories** to pass the "30-second recruiter test," ensuring technical progression and business impact are visible at first glance



## 🛠️ Technical Stack & Core Competencies

- **SQL (PostgreSQL):** Advanced Querying (`SELECT`, `WHERE`), Aggregations (`GROUP BY`, `HAVING`), Relational Modeling (`JOINs`), Database Clean-up (`COALESCE`, `CASE WHEN`), and Performance Optimization (CTEs).
- **Python & Data Science:** Pandas DataFrames, automated data cleaning, statistical data aggregation, and modular script orchestration.
- **Visualization & Business Intelligence:** Power BI (DAX modeling, layout architecture), Plotly Python library, clutter reduction, and audience-centric business storytelling.
- **Infrastructure & Workflows:** Git, GitHub, REST APIs, Supabase, VS Code, automated system logging, and environment management.


## 🤖 Responsible AI Integration 

I utilize advanced AI tools (including ChatGPT, Claude, and NotebookLM) as an acceleration and optimization layer for my workflow. I deploy AI primarily for debugging complex code snippets, and refining business explanations. Crucially, I maintain complete human ownership over analytical logic, manual data validation, and final business recommendations.

--- 

## Contact

- **GitHub:**  [github.com/krista-hein](https://github.com/krista-hein)
- **LinkedIN:** [linkedin.com/krista-hein](https://www.linkedin.com/in/krista-hein/)
- **Email:** [kristahein.mail@gmail.com](mailto:kristahein.mail@gmail.com)

