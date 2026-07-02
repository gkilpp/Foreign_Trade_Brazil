with pais as(

    select * from {{source('dimension', 'PAIS')}}

),
rename_columns AS (
    select
    CO_PAIS as country_code,
    CO_PAIS_ISON3 as iso_numeric_code, 
    CO_PAIS_ISOA3 as iso_alpha3_code, 
    NO_PAIS as country_name_pt, 
    NO_PAIS_ING country_name_en
    from pais
    
)
select *
from rename_columns