with ptax as (

    select *
    from {{ source('fact', 'PTAX') }}

),

parsed_ptax as (

    select
        cotacaoCompra,
        cotacaoVenda,
        parse_datetime('%Y-%m-%d %H:%M:%E*S', dataHoraCotacao) as exchange_datetime
    from ptax

),

rename_columns as (

    select
        cotacaoCompra as buy_exchange_rate,
        cotacaoVenda as sell_exchange_rate,
        date(exchange_datetime) as exchange_rate_date,
        extract(year from exchange_datetime) as year,
        extract(month from exchange_datetime) as month
    from parsed_ptax

)

select *
from rename_columns
