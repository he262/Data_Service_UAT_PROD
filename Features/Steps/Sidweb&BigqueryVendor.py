from pathlib import Path
from behave import *
import pandas as pd
from urllib.parse import urlencode
import requests
from pandas.testing import assert_frame_equal
import json
from datetime import datetime
from io import BytesIO
from logging import basicConfig, DEBUG, info, debug

basicConfig(level=DEBUG, format="%(levelname)s %(asctime)s : %(message)s")



@then("Fetch the bigquery vendor json from {Bigquery_body_json} at {Cutoff_Date}")
def bquery_vendor(context, Bigquery_body_json, Cutoff_Date: str):
    with open(Path(Bigquery_body_json), "r") as fp:
        context.Bigquery_json = json.load(fp)
        context.Bigquery_json["payload"]["cutoffDate"] = datetime.strptime(
            Cutoff_Date, "%Y%m%d"
        ).strftime("%Y-%m-%d")
        context.Bigquery_json["payload"]["stoxxId"] = context.stoxxid_list


@when("Make an vendor api request for bigquery")
def api_request(context):
    context.bquery_response = requests.post(
        context.bigquery_base_url,
        json=context.Bigquery_json["payload"],
        headers=context.Bigquery_json["headers"],
        proxies={
            "http": "http://webproxy-fra.deutsche-boerse.de:8080",
            "https": "http://webproxy-fra.deutsche-boerse.de:8080",
        },
    )
    print("Total Elapsed Time: ", context.bquery_response.elapsed.total_seconds())
    if context.bquery_response.status_code!=200:
        raise ValueError(context.bquery_response.text)
    
    context.bquery_vendor_response = context.bquery_response.content


@then("save the big query api response at {Bigquery_api_response}")
def save_api_response(context, Bigquery_api_response: str):

    context.Bquery_vendor_df = pd.read_csv(
        BytesIO(context.bquery_vendor_response),encoding='ansi',na_filter=False
    )
    context.Bquery_vendor_df.to_csv(Path(Bigquery_api_response),index=False)

@when('Make list of itemname for sidweb')
def itemname(context):
    context.bigquery_itemname = [col.replace('@ISS','') for col in context.Bquery_vendor_df.columns if col!='stoxxId']


@given("Fetch the json from {sid_web_body_json} at {Cutoff_Date}")
def sidweb_json(context, sid_web_body_json: str, Cutoff_Date: str):
    with open(Path(sid_web_body_json), "r") as fp:
        context.sid_post_json = json.load(fp)
        context.sid_post_json["payload"]["secAttrDate"] = datetime.strptime(
            Cutoff_Date, "%Y%m%d"
        ).strftime("%Y-%m-%d")
        context.sid_post_json["payload"]["compDate"] = datetime.strptime(
            Cutoff_Date, "%Y%m%d"
        ).strftime("%Y-%m-%d")
        context.sid_post_json["payload"]["stoxxID"] = context.stoxxid_list
        context.sid_post_json["payload"]["vendorItems"] = context.bigquery_itemname


@when("Make an api request for sid web")
def api_request(context):
    context.response = requests.post(
        context.sid_base_url,
        json=context.sid_post_json["payload"],
        headers=context.sid_post_json["headers"],
    )
    print("Total Elapsed Time: ", context.response.elapsed.total_seconds())
    if context.response.status_code!=200:
        raise ValueError(context.response.text)

    context.sid_vendor_response = context.response.content


@then("save sid web api response")
def save_api_response(context):
    context.sid_vendor_data = pd.read_csv(
        BytesIO(context.sid_vendor_response), na_filter=False, dtype={"internalId": str}
    )
    # context.sid_vendor_data['item'] = context.sid_vendor_data['item'].str.replace('@ISS','')


@when("pivot the sid web data at {sid_web_api_response}")
def pivot_sid_web_data(context, sid_web_api_response: str):
    # context.sid_vendor_df = context.sid_vendor_data.pivot(index='internalId',columns ='item',values ='value').reset_index()
    context.sid_vendor_data.to_csv(Path(sid_web_api_response),index=False)


@then("Validate the data of {Bigquery_api_response} with {sid_web_api_response}")
def validate_data(context, Bigquery_api_response: str, sid_web_api_response: str):
    context.sid_web_df = pd.read_csv(Path(sid_web_api_response), na_filter=False)
    context.bigquery_df = pd.read_csv(Path(Bigquery_api_response), na_filter=False)
    # context.sid_web_df = context.sid_vendor_data.copy()
    # context.bigquery_df = context.Bquery_vendor_df.copy()
    context.sid_web_df = context.sid_web_df.rename(columns={"internalId": "stoxxId"})
    columns_to_convert = [col for col in context.bigquery_df.columns]
    for col in columns_to_convert:
        context.sid_web_df[col] = pd.to_numeric(
            context.sid_web_df[col], errors="coerce"
        ).fillna(context.sid_web_df[col])
        context.bigquery_df[col] = pd.to_numeric(
            context.bigquery_df[col], errors="coerce"
        ).fillna(context.bigquery_df[col])

    context.sid_web_df = context.sid_web_df.astype({"stoxxId": str})
    context.bigquery_df = context.bigquery_df.astype({"stoxxId": str})
    # context.sid_web_df=context.sid_web_df[context.sid_web_df['stoxxId']!='269954.0']
    # context.bigquery_df=context.bigquery_df[context.bigquery_df['stoxxId']!='269954.0']

    context.bigquery_df = context.bigquery_df.sort_values(by="stoxxId").reset_index(
        drop=True
    )
    context.sid_web_df = context.sid_web_df.sort_values(by="stoxxId").reset_index(
        drop=True
    )

    assert_frame_equal(
        context.sid_web_df, context.bigquery_df, check_like=True, check_dtype=False
    )
