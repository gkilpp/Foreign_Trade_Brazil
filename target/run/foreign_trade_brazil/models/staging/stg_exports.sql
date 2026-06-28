

  create or replace view `foreign-trade-brazil`.`analytics`.`stg_exports`
  OPTIONS()
  as select * from `foreign-trade-brazil`.`Fact`.`EXP_2021`

union all

select * from `foreign-trade-brazil`.`Fact`.`EXP_2022`

union all

select * from `foreign-trade-brazil`.`Fact`.`EXP_2023`

union all

select * from `foreign-trade-brazil`.`Fact`.`EXP_2024`;

