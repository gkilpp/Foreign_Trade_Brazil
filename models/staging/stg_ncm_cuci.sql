with ncm_cuci as(

    select * from {{source('dimension', 'NCM_CUCI')}}

),
rename_columns AS (
    select
    CO_CUCI_ITEM as sitc_item_code, --Standard International Trade Classification (SITC)
    CO_CUCI_SUB as sitc_subgroup_code,
    NO_CUCI_SUB as sitc_subgroup_description,
    CO_CUCI_GRUPO as sitc_group_code, 
    NO_CUCI_GRUPO as sitc_group_description, 
    CO_CUCI_DIVISAO as sitc_division_code, 
    NO_CUCI_DIVISAO as sitc_division_description,
    CO_CUCI_SEC as sitc_section_code,
    NO_CUCI_SEC as sitc_section_description
from ncm_cuci
    
)
select *
from rename_columns