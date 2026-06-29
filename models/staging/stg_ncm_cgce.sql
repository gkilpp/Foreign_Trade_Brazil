with ncm_cgce as(

    select * from {{source('dimension', 'NCM_CGCE')}}

),
rename_columns AS (
    select
    CO_CGCE_N3 as bec_level_3_code, --BEC(Broad Economic Categories)
    NO_CGCE_N3 as bec_level_3_description,
    NO_CGCE_N3_ING as bec_level_3_description_en,
    CO_CGCE_N2 as bec_level_2_code,
    NO_CGCE_N2 as bec_level_2_description,
    NO_CGCE_N2_ING as bec_level_2_description_en,
    CO_CGCE_N1 as bec_level_1_code,
    NO_CGCE_N1 as bec_level_1_description, 
    NO_CGCE_N1_ING as bec_level_1_description_en
    from ncm_cgce
  
)
select *
from rename_columns