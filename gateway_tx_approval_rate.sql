with windowed_gateway_tx as (
    select *,
           last_value(id) over (
               partition by transaction_uuid
               order by created_at
               rows between
                   unbounded preceding
                   and unbounded following
               ) as last_id,
           first_value(created_at) over (
               partition by transaction_uuid
               order by created_at
               rows between
                   unbounded preceding
                   and unbounded following
               ) as first_created_at,
           rank() over (
               partition by transaction_uuid
               order by created_at
               ) as attempt_number
    from gateway_transactions
    ),
     final_gateway_tx as (
         select *,
                created_at - first_created_at as elapsed_time
         from windowed_gateway_tx
         where id = last_id
         ),
     stats as (
         select count(id), status
         from final_gateway_tx
         group by status
         )
-- select * from final_gateway_tx
select avg(elapsed_time), avg(attempt_number)
from final_gateway_tx
