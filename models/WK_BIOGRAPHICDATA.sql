{{ config(materialized='table') }}

WITH wk_biographic_data AS (
    SELECT DISTINCT 
        EMPLID AS "Employee ID",
        BIRTHSTATE AS "Region of Birth",
        BIRTHDATE AS "Date of Birth",
        SEX AS "Gender_Description",
        "disabled" AS "Disability Name",
        SMOKER AS "Uses_Tobacco"
    FROM
        PS_BRONZE_ZONE.PS_PERSONAL_DATA
)
SELECT 
    "Employee ID",
    "Region of Birth",
    "Date of Birth",
    "Disability Name",
    "Uses_Tobacco",
    CASE 
        WHEN "Gender_Description" = 'M' THEN 'Male'
        WHEN "Gender_Description" = 'F' THEN 'Female'
        WHEN "Gender_Description" = 'U' THEN 'Undisclosed'
        WHEN "Gender_Description" IS NULL THEN 'NA'
    END AS gender_description
FROM wk_biographic_data