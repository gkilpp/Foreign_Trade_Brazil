with via as(
    select * from {{source('dimension', 'VIA')}}
),
rename_cast_columns as(
    select

    CO_VIA as transportation_mode_code, 
    NO_VIA as trasportation_mode_description_pt, 
    CO_VIA_EN as transportation_mode_description_en
    from via
    )
    select * 
    from rename_cast_columns

