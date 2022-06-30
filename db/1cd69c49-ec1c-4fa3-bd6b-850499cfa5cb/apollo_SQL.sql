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
where common_flag = 3
  and status is true
group by phone
having count(phone) > 1;

select *
from w_wx_user
where phone = '18506826185'
  and status is false;

delete
from mc_member
where id = 164753665666842624;

select *
from sc_install_appoint_info
where phone = '18506826185';

# 212234003674300416
# 201634596872519680

select *
from w_wx_user
where phone = '18506826185'
  and status is true
limit 1;

# 212234003674300416

select *
from sc_co_order
where customer_id = 212234003674300416;

select *
from sc_co_cloud_card
where card_id = 1110965215704371;

select *
from sc_co_cloud_card
where card_id in (select id from pc_card);

select *
from sc_co_order_sku
where id = 22943537;

select *
from sc_co_order
where id = 551694904310104064;

select *
from sc_install_appoint_pic
where channel_order_id = 104822459911393280;

select *
from sc_mot_judge
where lock_mac = 'C6:65:4A:18:B3:2B'
  and create_date < DATE_SUB(now(), interval 1 hour)
  and source_type = 1
  and status = 0
  and push_time < 5;

select *
from sc_co_order where channel_order_id = 554992941589594112;

select *
from sc_co_order where id = 554992941589594112;

select *
from erc_waybill_batch_detail where batch_no = 'http://dsmzg.com/app/?i=Q5M_0|888888|DSM-20180524161355335|lock|1';

select *
from sc_co_order where id = 504398058571431936;

select *
from sc_install_order_detail where co_order_id = 554992941589594112;

select *
from sc_install_order where id = 447701400891031552;

select *
from sc_co_order where customer_id = 212234003674300416;

SELECT * FROM sc_co_order_sku where co_order_id= 555036081696538624;

select *
from erc_part where inner_part_code = 'XN0001'