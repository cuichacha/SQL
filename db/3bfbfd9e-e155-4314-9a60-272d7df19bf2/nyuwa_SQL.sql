select *
from bc_base_user;



delete
from cc_base_component_dictionary
where id = '';

select *
from cc_firmware_version
where meter_type = 'T510T-1_0';



select *
from cc_base_component_dictionary;

select *
from dc_lock_user
where lock_id = 469657423934660608;

select *
from dc_lock_video_message
where video_conversion_status = 0
  and video_status = 1
order by create_date
limit 1 offset 0;

select c.id, c.user_id, u.nick_name as nickname, u.account as userPhone
from cc_user_config c
         left join uc_user u on c.user_id = u.id
where c.config_name = 'USER_VIEW_LOG_STATUS'
  and u.account like '%137%'
  and u.nick_name like '%枫%'
order by c.id desc;

select *
from cc_user_config
where user_id = '123';

delete
from cc_user_config
where user_id = '123'
  and lock_id is null
  and config_name = 'USER_SHAKE_OPEN_DOOR_ENABLE';

select *
from dc_lock_video_message
where lock_id = '469657423934660608'
  and video_status = 1
  and viewer_type = 1;

select *
from uc_message
order by create_date
limit 1 offset 0;

select *
from uc_message
order by create_date;

select distinct guid_type
from cc_base_device_info;

select id,
       create_date,
       update_date,
       version,
       a.name,
       firmware_version,
       firmware_type,
       a.url,
       state,
       spuer_type,
       content,
       base_device_id,
       url_key,
       share_meter_type,
       need_force,
       range_type,
       remind_type
from cc_firmware_version a
WHERE state = 1
  AND firmware_type = 2
  AND share_meter_type IS NOT NULL
  AND SUBSTRING(firmware_version, - 8) > SUBSTRING('X0.M.A15_20210519', - 8)
  AND share_meter_type LIKE concat('%', 'R7_0', '%')