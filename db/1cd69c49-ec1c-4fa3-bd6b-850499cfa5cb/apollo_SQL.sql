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
from sc_co_order
where (common_label & 32768) = 32768;

select seller_memo
from sc_co_order
where id = 491724042144579584;

select seller_memo
from sc_co_order
where id = 520172694915514369;

select *
from sc_co_order
where id = 492006900448886784;

update sc_co_order
set seller_memo = ((common_label & 32768) = 32768)
where id = 520172694915514369;

insert into sc_online_server (create_date, update_date, version, title, title_url, title_content, useful, useless,
                              parent_id, level, status, display, operator_id)
select create_date,
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
       operator_id
from sc_online_server
where id = 396;

select *
from w_wx_user
where id in (212234003674300416, 540108810598219776);

select *
from w_wx_user
group by phone
having count(phone) > 1;

select *
from w_wx_user
where phone = '18506826185';

delete
from mc_member
where id = 164753665666842624;