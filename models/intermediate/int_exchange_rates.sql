with ptax as (

    select *
    from {{ ref('stg_usd_brl_exchange_rate') }}

),

rename_cast_columns as (

    select
    year,
    month,
        avg(buy_exchange_rate) as avg_buy_exchange_rate,
        avg(sell_exchange_rate) as avg_sell_exchange_rate
    from ptax
    group by
        year,
        month

)

select *
from rename_cast_columns