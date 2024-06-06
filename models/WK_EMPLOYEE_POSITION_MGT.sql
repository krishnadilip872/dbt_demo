{{ config(materialized='table') }}

WITH wk_JOB AS (
    SELECT DISTINCT 
        emplid AS "Employee ID",
        REG_TEMP AS "Employee Type Name",
        --HIRE_DT AS "Hire Date",
        --LAST_HIRE_DT AS "Continuous Service Date",
        --TERMINATION_DT AS "End Employment Date",
        --ASGN_START_DT AS "Position Start Date for Conversion",
        SUPERVISOR_ID AS "Manager ID",
        DEPTID AS "Cost Center ID",
        BUSINESS_UNIT AS "Company ID",
        REG_REGION AS "Region ID",
        JOBCODE AS "Job Code",
        "location" AS "Location ID",
        FULL_PART_TIME AS "Time Type",
        STD_HOURS AS "Default Weekly Hours",
        STD_HOURS AS "Scheduled Weekly Hours",
        EMPL_TYPE AS "Pay Type Name"
    FROM
        PS_BRONZE_ZONE.PS_JOB
),
wk_EMPLOYMENT AS (
    SELECT DISTINCT 
        emplid AS "Employee ID",
        PROBATION_DT AS "Probation Start Date",
        SERVICE_DT AS "Benefit Service Date",
        CMPNY_SENIORITY_DT AS "Company Service Date",
        BUSINESS_TITLE AS "Business Title"
    FROM
        PS_BRONZE_ZONE.PS_EMPLOYMENT
),
wk_JOBCODE_TBL AS (
    SELECT DISTINCT 
        JOBCODE AS "Job Code",
        JOB_FAMILY AS "Additional Job Classification Name"
    FROM
        PS_BRONZE_ZONE.PS_JOBCODE_TBL
)
SELECT 
    j."Employee ID",
    j."Employee Type Name",
    j."Manager ID",
    j."Cost Center ID",
    j."Company ID",
    j."Region ID",
    j."Job Code",
    j."Location ID",
    j."Time Type",
    j."Default Weekly Hours",
    j."Scheduled Weekly Hours",
    j."Pay Type Name",
    e."Probation Start Date",
    e."Benefit Service Date",
    e."Company Service Date",
    e."Business Title",
    jt."Additional Job Classification Name"
FROM 
    wk_JOB j
LEFT JOIN 
    wk_EMPLOYMENT e ON j."Employee ID" = e."Employee ID"
LEFT JOIN 
    wk_JOBCODE_TBL jt ON j."Job Code" = jt."Job Code"