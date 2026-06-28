with ptax as(

    select * from {{source('fact', 'PTAX')}}

)
rename_columns AS (

    
)