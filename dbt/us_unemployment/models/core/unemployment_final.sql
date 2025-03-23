{{ config(
    materialized='table'
) }}


SELECT 
    a.row_num,
    a.year,
    a.LAUS_Code AS laus_code,
    a.state_code,
    a.county_code,
    a.county_name,
    a.labor_force AS cnty_labor_force,
    a.employed AS cnt_employed,
    a.unemployed AS cnty_unemployed,
    a.unemployment_rate AS cnty_unemployment_rate,
    b.labor_force_pop as us_labor_force,
    b.employed_total as us_employed,
    b.unemployed_pop as us_unemployed,
    b.unemployed_pct as us_unemployment_rate,
    cast(a.labor_force /  b.labor_force_pop as FLOAT64) as pct_of_total_labor_force

FROM {{ ref('stg_unemployment') }} a
left join {{ ref('stg_unemployment_reference') }} b 
    on a.year = b.year 
