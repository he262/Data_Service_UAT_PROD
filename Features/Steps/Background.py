from pathlib import Path
from behave import *
import pandas as pd
from datetime import datetime
import pyodbc


@given("Fetch the sid web base url {sid_web_base_url}")
def sidweb_url(context, sid_web_base_url: str):
    context.sid_base_url = sid_web_base_url


@given("Fetch the bigquery base url {bigquery_base_url}")
def bquery_url(context, bigquery_base_url: str):
    context.bigquery_base_url = bigquery_base_url



@given("Fetch the active stoxxid {active_stoxxid}")
def active_stoxxid(context, active_stoxxid: str):
    context.active_stoxxid_list = active_stoxxid


@given("Fetch the stoxxid list active at {Cutoff_Date}")
def fetch_stoxxid(context, Cutoff_Date: str):
    with open(Path(context.active_stoxxid_list), "r") as fp:
        context.stoxxid_list = fp.read().format(Cutoff_Date)
    connection_string = (
        "Driver={SQL Server};"
        + "Server={};Database={};Trusted_Connection=yes".format(
            "brutus1.bat.ci.dom", "SIDExternal"
        )
    )
    cnxn = pyodbc.connect(connection_string)
    context.stoxxid_list = pd.read_sql(context.stoxxid_list, cnxn)["STOXXID"].drop_duplicates().to_list()
