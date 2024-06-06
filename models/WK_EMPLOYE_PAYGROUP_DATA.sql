{{ config(materialized='table') }}

with wk_assign_employeetopaygroup AS (
    SELECT DISTINCT 
	   emplid AS "Employee ID",
	   effdt AS "Effective Date",
       PayGroup AS "Pay Group ID"
    FROM
        PS_BRONZE_ZONE.PS_JOB
)
SELECT * FROM wk_assign_employeetopaygroup