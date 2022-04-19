

select id,
       create_date,
       update_date,
       version,
       title,
       title_url,
       title_content,
       useful,
       useless,
       parent_id,
       level,
       status,
       display,
       operator_id,
       language_type
from sc_online_server
WHERE level = 2
  and display = 0
  and language_type = 2
order by id desc;

select *
from sc_co_order
where shop_name = '京东自营'
  and status = 1301
  and order_type = 110
  and waybill_status = 0
  and (common_label & 32768) = 32768
order by paid_date desc;

select *
from sc_co_order where (common_label & 32768) = 32768;

select seller_memo
from sc_co_order where id = 491724042144579584;

select seller_memo
from sc_co_order where id = 520172694915514369;

select *
from sc_co_order where id = 492006900448886784;

update sc_co_order set seller_memo = ((common_label & 32768) = 32768) where id = 520172694915514369;