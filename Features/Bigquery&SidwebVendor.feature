Feature: Validate the data of big query vendor data with sid web vendor api 

    Background: Fetch the api base url
    Given Fetch the sid web base url http://brutus2.bat.ci.dom/sidwebapi/api/Index/FetchVendorData
    Given Fetch the bigquery base url https://index-sid-vendor-api-6csp6gomwa-ez.a.run.app/GetVendorData 
    Given Fetch the active stoxxid Features\Data\activestoxxid.sql
    
    Scenario Outline: validate the data
    Given Fetch the stoxxid list active at <Cutoff_Date>
    Then Fetch the bigquery vendor json from <Bigquery_body_json> at <Cutoff_Date>
    When Make an vendor api request for bigquery
    Then save the big query api response at <Bigquery_api_response>
    When Make list of itemname for sidweb
    Given Fetch the json from <Sid_web_body_json> at <Cutoff_Date>
    When Make an api request for sid web
    Then save sid web api response
    When pivot the sid web data at <sid_web_api_response>                                                      
    Then Validate the data of <Bigquery_api_response> with <sid_web_api_response>

   Examples:
        | Cutoff_Date | Sid_web_body_json                   | Bigquery_body_json                      | sid_web_api_response                   | Bigquery_api_response                   |
        | 20140829    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20141128    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20150227    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20150529    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20150831    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20151130    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20160229    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20160531    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20160831    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20161130    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20170228    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20170531    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20170831    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20171130    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20180228    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20180531    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20180831    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20181130    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20190228    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20190531    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20190830    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20191129    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20200228    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210730    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210630    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210531    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210430    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210331    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210226    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210129    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20201231    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20201130    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20200831    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20201130    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20201231    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210129    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210226    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210331    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210430    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210531    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210630    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210730    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210831    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20210930    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20211029    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20211130    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20211231    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20220131    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20220228    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20220331    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20220429    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20220531    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20220630    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20220729    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20220831    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20220930    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20221031    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20221130    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20221230    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20230131    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20230228    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20230331    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20230428    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20230531    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20230630    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20230731    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20230831    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20230929    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20231031    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20231130    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20231229    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20240830    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20240731    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20240531    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20240430    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20240328    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20240229    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20240131    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20231130    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20231031    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20240628    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |    
        | 20221230    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |
        | 20230131    | Features\Data\SidwebBodyparams.json | Features\\Data\\BigqueryBodyparams.json | Features\Data\SId_web_api_response.csv | Features\Data\Bigquery_api_response.csv |