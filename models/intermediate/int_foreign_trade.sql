with union_exp_imp as (
    select
    year,
    month,
    country_code,
    ncm_code,
    value_usd,
    net_weight_kg,
    state_code,
    transportation_mode_code,
    statistical_quantity,
    customs_zone_code,
    type_operation
from {{ ref('stg_imports') }}

union all

select
year,
month,
country_code,
ncm_code,
value_usd,
net_weight_kg,
state_code,
transportation_mode_code,
statistical_quantity,
customs_zone_code,
type_operation
from {{ ref('stg_exports') }}
),
foreign_trade_with_exchange_rate as (
    select
    ce.*,
    tc.avg_buy_exchange_rate,
    tc.avg_sell_exchange_rate,
    
    case
    when ce.type_operation = 'Importação'
    then ce.value_usd * tc.avg_sell_exchange_rate
    when ce.type_operation = 'Exportação'
    then ce.value_usd * tc.avg_buy_exchange_rate
    end as value_brl
    
    from union_exp_imp ce
    left join {{ ref('int_exchange_rates') }} tc
    on ce.year = tc.year
   and ce.month = tc.month
)
select *
from foreign_trade_with_exchange_rate