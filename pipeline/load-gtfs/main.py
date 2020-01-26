"""
Pipeline to load GTFS file into main ('dbo') tables.
"""
import petl
import os
import sys
import pyodbc
import logging

source_directory = '../../data/raw/beaver_gtfs/'
db_server = 'transitmgr.database.windows.net'
db_name = 'Transit'
db_user = 'application_sa'
db_password = '^iRoenJirE8X*LbzgHCR'
db_conn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={db_server};DATABASE={db_name};UID={db_user};PWD={db_password}')

"""
accepted_datasets = ['agency', 'calendar_dates', 'routes', 'shapes', 'stops', 'stop_times', 'trips']
for dataset in accepted_datasets:
    logging.info(f'Loading {dataset}.txt')
    csv_path = os.path.join(source_directory, dataset + '.txt')
    table = petl.fromcsv(csv_path)
    sql_table_name = dataset.replace('_', '')
    logging.info(f'Loading gtfs.{dataset} table')
    petl.io.db.todb(table, db_conn, sql_table_name, schema='gtfs')
"""


db_conn.close()