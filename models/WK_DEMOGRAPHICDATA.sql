WITH wk_personal AS (
    SELECT DISTINCT 
        EMPLID AS "Employee ID",
        MAR_STATUS AS "Marital Status Name",
        MAR_STATUS_DT AS "Marital Status Date",
        MILITARY_STATUS AS "Military Status Name"
    FROM
        PS_BRONZE_ZONE.PS_PERSONAL_DATA
),
wk_citizenship AS (
    SELECT DISTINCT 
        EMPLID AS "Employee ID",
        CITIZENSHIP_STATUS AS "Address Line #1",
        COUNTRY AS "Country ISO Code"
    FROM
        PS_BRONZE_ZONE.PS_CITIZENSHIP
),
wk_drivers_ethnic AS (
    SELECT DISTINCT 
        EMPLID AS "Employee ID",
        ETHNIC_GRP_CD AS "Ethnicity Name"
    FROM
        PS_BRONZE_ZONE.PS_DIVERS_ETHNIC
),
wk_PERS_DATA_USA AS (
    SELECT DISTINCT 
        EMPLID AS "Employee ID",
        EFFDT AS "Military Discharge Date"
    FROM
        PS_BRONZE_ZONE.PS_PERS_DATA_USA
),
wk_DIVERS_RELIGION AS (
    SELECT DISTINCT 
        EMPLID AS "Employee ID",
        RELIGION_CD AS "Religion Name"
    FROM
        PS_BRONZE_ZONE.PS_DIVERS_RELIGION
)
SELECT distinct 
    p."Employee ID",
    p."Marital Status Name",
    p."Marital Status Date",
    p."Military Status Name",
    c."Address Line #1",
    c."Country ISO Code",
    e."Ethnicity Name",
    d."Military Discharge Date",
    r."Religion Name"
FROM 
    wk_personal p
LEFT JOIN 
    wk_citizenship c ON p."Employee ID" = c."Employee ID"
LEFT JOIN 
    wk_drivers_ethnic e ON p."Employee ID" = e."Employee ID"
LEFT JOIN 
    wk_PERS_DATA_USA d ON p."Employee ID" = d."Employee ID"
LEFT JOIN 
    wk_DIVERS_RELIGION r ON p."Employee ID" = r."Employee ID"