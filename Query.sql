select c.first_name, c.last_name, (select sum(price) from transactions where customer_id = c.customer_id) as total_purchases
from transactions tr
join stores s using(store_id)
join products pr using(product_id)
join customers c using(customer_id)
join (SELECT customer_id, store_id, max(transaction_date) as last_date FROM transactions group by customer_id, store_id) tr2 on tr.customer_id=tr2.customer_id and tr.store_id = tr2.store_id
and tr.transaction_date = last_date
where s.name = 'King St'
and pr.name = 'cappuccino'
order by total_purchases desc;



#58 - k112 -> x
#60 - k111 -> x
# 61 - k110
#59 - k107
# 63 - k105

