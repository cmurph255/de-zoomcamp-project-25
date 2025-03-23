{{ config(
    materialized='view'
) }}



with unemployment_reference_data as 
(
  select
  ROW_NUMBER() OVER () AS row_num,
  *
  from {{ source('us_unemployment_data','unemployment_reference_external') }}
  where year is not null 
)


SELECT 
    row_num,
    year ,
    total_population ,
    labor_force_pop ,
    labor_force_pct ,
    employed_total ,
    employed_pct ,
    agri_total ,
    non_agri_total ,
    unemployed_pop ,
    unemployed_pct ,
    total_not_in_labor 
FROM unemployment_reference_data


-- dbt build --select <model.sql> --vars '{'is_test_run: false}'
-- {% if var('is_test_run', default=true) %}

--   limit 100

-- {% endif %}

