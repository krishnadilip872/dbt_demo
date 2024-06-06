{{ config(materialized='table') }}

WITH wk_JOB AS (
    SELECT DISTINCT 
        DESCR AS "Job Title",
        MANAGER_LEVEL AS "Management Level",
        JOB_FAMILY AS "Job Family",
        JOB_FUNCTION AS "Job Classification",
        SETID,
        JOBCODE
    FROM
        PS_BRONZE_ZONE.PS_JOBCODE_TBL
)
SELECT 
    CONCAT(SETID, JOBCODE) AS "JOBCODE",
    "Job Title",
    "Management Level",
    "Job Family",
    "Job Classification"
FROM wk_JOB
