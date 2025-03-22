{{ config(
    materialized='table'
) }}


SELECT 
    row_num,
    LAUS_Code AS laus_code,
    state_code,
    county_code,
    county_name,
    SAFE_CAST(year AS INT64) AS year,
    SAFE_CAST(labor_force AS INT64) AS labor_force,
    SAFE_CAST(employed AS INT64) AS employed,
    SAFE_CAST(unemployed AS INT64) AS unemployed,
    SAFE_CAST(unemployment_rate AS INT64) AS unemployment_rate
FROM {{ ref('stg_unemployment') }}
