with urf as(
    select * from {{source('dimension', 'URF')}}
),
rename_cast_columns as(
    select

   CO_URF as customs_zone_code, 
   NO_URF as customs_zone_description_pt,
   URF_TYPE as customs_zone_type_pt,
   URF_NAME as customs_zone_name_pt
   from urf
    )
    select * 
    from rename_cast_columns