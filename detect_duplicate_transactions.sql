select count(distinct id) as tx_count,
       type,
       payment_id
from transactions
group by type, payment_id
having count(distinct id) > 1
