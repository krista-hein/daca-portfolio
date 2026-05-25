"""ALAÜLESANDE KAART - Roll D: Automation Script"""

"""ÜLESANNE:
Ühenda rollide A, B ja C moodulid üheks pipeline'iks. Lisa
logimine ja ajastamisloogika. Marko tahab, et kogu protsess
käivituks ühe käsuga.

SISEND: Rollide A, B, C funktsioonid (import)
VÄLJUND: pipeline.py — orkestreeija: extract -> transform -> export
"""
import time
from datetime import datetime
import logging
import sys
import os
from pathlib import Path

# --- LOGGING SETUP ---
log_dir = "logs"
os.makedirs(log_dir, exist_ok=True)

log_filename = os.path.join(log_dir, f"pipeline_{datetime.now().strftime('%Y_%m_%d')}.log")

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)-8s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S',
    handlers=[
        logging.FileHandler(log_filename), 
        logging.StreamHandler(sys.stdout)
    ]
)
logger = logging.getLogger(__name__)

# --- DATE ARGUMENT PARSING ---
# Käsurealt saab määrata:
#   --start-date YYYY-MM-DD   raporti alguskuupäev (vaikimisi: 2023-01-01)
#   --date       YYYY-MM-DD   raporti lõppkuupäev  (vaikimisi: tänane päev)
def get_date_arg(flag, default):
    if flag in sys.argv:
        return sys.argv[sys.argv.index(flag) + 1]
    return default
 
start_date = get_date_arg("--start-date", "2023-01-01")                                        ## ⚠️ Vaikimisi alguskuupäev — muuda vastavalt vajadusele või kasuta --start-date
report_date = get_date_arg("--date", datetime.now().strftime('%Y-%m-%d'))

logger.info(f"Report period: {start_date} - {report_date}")

# --- IMPORTS ---
from data_fetcher import fetch_sales, fetch_customers, fetch_products                           ## impordin rolli A funktsioonid
from transform import clean_data, calculate_kpis, merge_datasets, calculate_weekly_aggregates   ## impordin rolli B funktsioonid
from visualize_export import create_weekly_chart, create_kpi_summary, export_results            ## impordin rolli C funktsioonid

# --- PIPELINE FUNCTION ---
# --- RUN ---
def run_pipeline():
    output_path = Path("output")
    start_time = time.time()
    logger.info("Starting pipeline execution")
    try:
        # --- Samm 1: Extract ---
        logger.info("Extract: get data from source")       
        end_date = report_date
        df_sales = fetch_sales(start_date, end_date)
        df_customers = fetch_customers()
        df_products = fetch_products()
        logger.info("Data extraction completed")

        # --- Validate Extraxt ---
        logger.info("Validate Extract: No issues identified")
        if df_sales.empty or df_customers.empty or df_products.empty:
            logger.error("Validate Extract: One or more dataframes are empty.")
            return

        # --- Samm 2: Transform ---
        logger.info("Transform: Start cleaning and processing data")
        # Clean required tables
        logger.info("Cleaning: customers")
        df_customers_clean = clean_data(df_customers)
        logger.info("Cleaning: sales")
        df_sales_clean = clean_data(df_sales)
        logger.info("Tables cleaned successfully")
        # Merge data tables
        df_merged = merge_datasets(df_sales_clean, df_customers_clean)
        logger.info("Tables merged successfully")
        # Calculate KPIs
        df_kpis = calculate_kpis(df_merged)
        df_weekly = calculate_weekly_aggregates(df_merged)
        logger.info("Calculations executed successfully")
        logger.info("Data transformation completed")

        # --- Validate transform---
        logger.info("Validate: check data quality")
        if df_merged.empty or df_weekly.empty:
            logger.error("VALIDATE: One or more dataframes are empty.")
            return

        # --- Samm 3: Load/Export ---
        logger.info("Load: create visualizations and export results to output directory")
        # A. Visualization
        try: 
            create_weekly_chart(df_weekly)
            create_kpi_summary(df_kpis)
            logger.info("Visualizations created successfully")
        except Exception as e:
            logger.warning(f"Error occurred while creating visualizations: {str(e)}. Continuing with export.")
        # B Export
        try:
            export_results(df_weekly, df_kpis, output_dir=output_path)
            logger.info(f"Results exported successfully to: {output_path}")
        except Exception as e:
            logger.error(f"Error occurred while exporting results: {str(e)}")
            return                                                                  ## Siit edasi ei lähe, sest eksport on pipeline'i lõpp-punkt, kui on ebaõnnestunud.

        elapsed_time = time.time() - start_time
        logger.info(f"Pipeline execution completed in ({elapsed_time:.2f}s)")

        # KPI kokkuvõte terminalis
        print("\n========== KPI KOKKUVÕTE ==========")
        for key, value in df_kpis.items():
            print(f"  {key:<25} {value}")
        print("====================================\n")

    except Exception as e:
        logger.error(f"Pipeline execution failed: {str(e)}")


# --- MAIN ---
if __name__ == "__main__":
    run_pipeline()

