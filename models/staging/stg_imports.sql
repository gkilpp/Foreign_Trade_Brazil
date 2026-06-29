WITH imports_union AS(
    select * from {{ source('fact', 'IMP_2021') }}

union all

select * from {{ source('fact', 'IMP_2022') }}

union all

select * from {{ source('fact', 'IMP_2023') }}

union all

select * from {{ source('fact', 'IMP_2024') }}
),
rename_columns AS(
    select 
    CO_ANO as year,
    CO_MES as month,
    CO_PAIS as country_code,
    CO_NCM as ncm_code,
    VL_FOB as export_value_usd,
    KG_LIQUIDO as net_weight_kg,
    SG_UF_NCM as state_code,
    CO_VIA as transportation_mode_code,
    QT_ESTAT as statistical_quantity,
    VL_FRETE as freight_value,
    VL_SEGURO as insurance_value,
    CO_URF as customs_zone_code
from imports_union

)
select *
from rename_columns