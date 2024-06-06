{{ config(materialized='table') }}

WITH wk_DEPT_TBL  AS (
    SELECT DISTINCT 
        deptid AS "Cost Center ID",
        descr AS "Cost Center Name"
    FROM
        PS_BRONZE_ZONE.PS_DEPT_TBL
)
SELECT * FROM wk_DEPT_TBL