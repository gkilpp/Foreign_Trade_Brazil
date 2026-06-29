WITH export_union AS (
    select * from {{ source('fact', 'EXP_2021') }}

union all

select * from {{ source('fact', 'EXP_2022') }}

union all

select * from {{ source('fact', 'EXP_2023') }}

union all

select * from {{ source('fact', 'EXP_2024') }}

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
    CO_URF as customs_zone_code
    from export_union
)
SELECT *
FROM rename_columns