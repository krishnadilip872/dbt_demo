{{ config(materialized='table') }}

WITH wk_LOCATION_TBL AS (
    SELECT DISTINCT 
        "location" AS "Location ID",
        descr AS "Location Name",
        country AS "Country ISO Code",
        address1 AS "Address Line #1",
        address2 AS "Address Line #2",
        city AS "Municipality",
        "state" AS "Region",
        postal AS "Postal Code"
    FROM
        PS_BRONZE_ZONE.PS_LOCATION_TBL
)
SELECT * FROM wk_LOCATION_TBL