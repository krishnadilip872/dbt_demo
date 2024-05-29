{{ config(
    materialized='table',
) }}

WITH wk_addresses AS (
    SELECT DISTINCT
        EMPLID AS "Employee ID",
        COUNTRY AS "Country ISO Code",
        ADDRESS1 AS "Address Line #1",
        ADDRESS2 AS "Address Line #2",
        CITY AS "Municipality",
        'STATE' AS "Region",
        POSTAL AS "Postal Code"
    FROM
        ORACLE_TEST.PS_ADDRESSES
    WHERE address_type IN ('HOME')
),
wk_addresses1 AS (
    SELECT DISTINCT
	    NULL AS "Employee ID",
        COUNTRY AS "Country ISO Code",
        ADDRESS1 AS "Address Line #1",
        ADDRESS2 AS "Address Line #2",
        CITY AS "Municipality",
        'STATE' AS "Region",
        POSTAL AS "Postal Code"
     FROM
        ORACLE_TEST.PS_ADDRESSES
     WHERE address_type IN ('MAIL', 'OTH', 'PERM', 'LEGL')
 ),
wk2 as(
SELECT * FROM wk_addresses
UNION ALL
SELECT * FROM wk_addresses1)
select * from wk2