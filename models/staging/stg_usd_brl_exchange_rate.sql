with ptax as(

    select * from {{source('fact', 'PTAX')}}

),
rename_cast_columns AS (
    select
    cotacaoCompra as buy_exchange_rate,
    cotacaoVenda as sell_exchange_rate,
    cast(dataHoraCotacao as date) as exchange_rate_date
    from ptax

    
)
select *
from rename_cast_columns
