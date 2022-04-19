select *
from (select *,
             count(id) over (
                 partition by payment_id, type
                 rows between
                     unbounded preceding
                     and unbounded following
                 ) as partition_count
      from transactions
      ) q
-- need to use subquery + where since postgres doesn't have a "qualify" statement
where partition_count > 1
