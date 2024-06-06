{{ config(materialized='table') }}

WITH wk_VISA_PMT_DATA AS (
    SELECT DISTINCT 
        emplid AS "Employee ID",
        country AS "Country ISO Code",
        visa_wrkpmt_nbr AS "Visa ID",
        visa_permit_type AS "Visa Type Name",
        dt_issued AS "Issued Date",
        entry_dt AS "Expiration Date",
        effdt AS "Verification Date"
    FROM
        PS_BRONZE_ZONE.PS_VISA_PMT_DATA
),
wk_PERS_NID AS (
    SELECT DISTINCT 
        emplid AS "Employee ID",
        country AS "Country ISO Code",
        national_id AS "National ID",
        national_id_type AS "National ID Type Code"
    FROM
        PS_BRONZE_ZONE.PS_PERS_NID
),
wk_DRIVERS_LIC AS (
    SELECT DISTINCT 
        emplid AS "Employee ID",
        country AS "Country ISO Code",
        drivers_lic_nbr AS "License ID",
        valid_from_dt AS "Issued Date",
        expiratn_dt AS "Expiration Date",
        "state" AS "Country Region",
        issued_by_fra AS "Authority Name"
    FROM
        PS_BRONZE_ZONE.PS_DRIVERS_LIC
),
wk_CITIZEN_PSSPRT AS (
    SELECT DISTINCT 
        emplid AS "Employee ID",
        country AS "Country ISO Code",
        passport_nbr AS "Passport Number",
        dt_issued AS "Issued Date",
        expiratn_dt AS "Expiration Date"
    FROM
        PS_BRONZE_ZONE.PS_CITIZEN_PSSPRT
),
wk_DRIVER_LTYP AS (
    SELECT DISTINCT 
        emplid AS "Employee ID",
        LICENSE_TYPE AS "License Type Name"
    FROM
        PS_BRONZE_ZONE.PS_DRIVER_LTYP
)
SELECT 
    v."Employee ID",
    v."Country ISO Code" AS "Visa_Country ISO Code",
    v."Visa ID",
    v."Visa Type Name",
    v."Issued Date" AS "Visa_Issued Date",
    v."Expiration Date" AS "Visa_Expiration Date",
    v."Verification Date" AS "Visa_Verification Date",
    p."Country ISO Code" AS "NID_Country ISO Code",
    p."National ID",
    p."National ID Type Code",
    d."Country ISO Code" AS "DL_Country ISO Code",
    d."License ID",
    d."Issued Date" AS "DL_Issued Date",
    d."Expiration Date" AS "DL_Expiration Date",
    d."Country Region" AS "DL_Country Region",
    d."Authority Name" AS "DL_Authority Name",
    c."Country ISO Code" AS "Passport_Country ISO Code",
    c."Passport Number",
    c."Issued Date" AS "Passport_Issued Date",
    c."Expiration Date" AS "Passport_Expiration Date",
    l."License Type Name"
FROM 
    wk_VISA_PMT_DATA v
LEFT JOIN 
    wk_PERS_NID p ON v."Employee ID" = p."Employee ID"
LEFT JOIN 
    wk_DRIVERS_LIC d ON v."Employee ID" = d."Employee ID"
LEFT JOIN 
    wk_CITIZEN_PSSPRT c ON v."Employee ID" = c."Employee ID"
LEFT JOIN 
    wk_DRIVER_LTYP l ON v."Employee ID" = l."Employee ID"