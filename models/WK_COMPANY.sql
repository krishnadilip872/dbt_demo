{{ config(materialized='table') }}

WITH wk_BUS_UNIT_TBL_HR  AS (
    SELECT DISTINCT 
        business_unit AS "Company ID",
        descr AS "Company Name"
    FROM
        PS_BRONZE_ZONE.PS_BUS_UNIT_TBL_HR
)
SELECT * FROM wk_BUS_UNIT_TBL_HR