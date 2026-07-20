select
    year,
    month,
    country_code,
    ncm_code,
    value_usd,
    freight_value,
    insurance_value
from {{ ref('stg_imports') }}