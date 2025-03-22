{{ config(
    materialized='view'
) }}



with unemployment_data as 
(
  select
  ROW_NUMBER() OVER () AS row_num,
  *
  from {{ source('us_unemployment_data','unemployment_external') }}
  where laus_code is not null 
)


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
FROM unemployment_data


-- dbt build --select <model.sql> --vars '{'is_test_run: false}'
-- {% if var('is_test_run', default=true) %}

--   limit 100

-- {% endif %}

