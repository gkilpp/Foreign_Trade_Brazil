with ncm as(

    select * from {{source('dimension', 'NCM')}}

),
rename_cast_columns AS (
    select
    CO_NCM as ncm_code,
    CO_CUCI_ITEM as sitc_item_code,
    CO_CGCE_N3 as bec_level_3_code,
    SAFE_CAST(CO_SIIT AS INT64) as siit_code,
    CO_ISIC_CLASSE as isic_class_code,
    SAFE_CAST(CO_EXP_SUBSET AS INT64) as export_subset_code,
    NO_NCM_POR as ncm_description_pt,
    NO_NCM_ING as ncm_description_en
    from ncm
       )
       select *
       from rename_cast_columns