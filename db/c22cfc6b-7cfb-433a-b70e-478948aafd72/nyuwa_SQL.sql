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
  AND share_meter_type LIKE concat('%', 'R7_0', '%');

drop table dc_movement_detection_sync;

select *
from cc_firmware_version
order by create_date desc
limit 1;

select *
from cc_firmware_version
where create_date > DATE_SUB(now(), interval 15 day);

update cc_firmware_version
set state = 0
where meter_type = 'ALI_eques';

update cc_firmware_version
set state = case when id = 282 then 1 else 0 end
where meter_type = 'XM_eques';

SELECT token
from uc_user u
         LEFT JOIN uc_user_login_persist p ON u.id = p.user_id
WHERE u.account = '13271339890'
  and p.`status` = 1;

select *
from uc_user_login_persist
where token = '73bP4517TJ8m1JKeB5J16F4d018Q9423';

alter table cc_lock_mask
    auto_increment = 20;

select value
from cc_base_component_dictionary
where code = 'BatteryLevel'
  and state = 1
  and `key` <= 832
order by `key` desc
limit 1;

select *
from uc_offline_message
where id < 2022060811000000001
  and id > 2021111115123800001
  and account = '16642608469';

select value
from cc_base_component_dictionary
where code = 'BatteryLevel'
  and state = 1
  and `key` <= 0
order by `key` desc
limit 1;

select openway
from dc_lock_open_door_log_new_plus;

select lock_id
from dc_lock_user
where user_id = 422643952080916480
  and role_type = 2
  and state = 1;
SELECT *
FROM uc_user
where account = '13271339890';
select *
from dc_lock
where id in (470468754430500864,
             489599832302821376,
             507717616505200640
    );

select *
from dc_lock
where id in (481387951549325312,
             274777124236173312
    );

select *
from dc_lock_third_info
where id = 481387951549325312;

select *
from dc_lock_order_header
where id = 137801;

select *
from dc_lock_order_header
where buyer_id = 216360614493163520;

select *
from dc_lock_order
where buyer_id = 216360614493163520;

select *
from dc_lock_user
where user_id = 216360614493163520;

select *
from dc_lock_order
where id = 508164168713588736;

select *
from uc_user
where id = 216360614493163520;

select *
from dc_lock
where lock_mac = 'CA:1A:10:5C:9B:57';

select lock_id
from dc_lock_user
where user_id = 216360614493163520
  and role_type = 2
  and state = 1;

select *
from dc_lock_third_info
where id = 508137491644030976;

select *
from dc_lock_third_info
where sn = 'fa335c160ef7288f';

select *
from dc_lock
where lock_mac = 'E7:E5:65:20:F9:71';

select *
from dc_lock_order_header
where iot_id = 'c365c88e19d87b9c';

select *
from dc_lock_order
where iot_id = 'c365c88e19d87b9c';

select *
from dc_lock_local_user
where id = 509992583108300800;

select *
from dc_lock_user
where user_id = 509992583108300800;

select *
from dc_lock_user_note
where note_user_id = 509992583108300800;


select *
from dc_lock_user
where id = 510355394258812928;

select *
from dc_lock_face
where lock_id = 510355391939354624;

select *
from dc_lock
where id = 510355391939354624;

select *
from uc_user_login_persist
where user_id = 185215651743272960;

select *
from dc_lock_user
where user_id = 185215651743272960;

select id, lock_id, send_state
from dc_lock_open_door_log_new_plus
where lock_id = 434898463776317440
  and id >= 202201190000000000
  and id <= 202206200000000000
order by id;

select id, lock_id, send_state
from dc_lock_open_door_log_new_plus
where lock_id = 148599227918852096
  and left(id, 8) >= 20220118
  and left(id, 8) <= 20220120
limit 500;

select *
from dc_lock_open_door_log_new_plus
where lock_id = 148599227918852096
  and left(id, 8) >= 20220118
  and left(id, 8) <= 20220120
limit 500;

select *
from dc_guide_video
where status = 1;

select *
from dc_lock
where id = 510786244880375808;

select distinct lock_id
from dc_lock_open_door_log_new_plus;

select count(*)
from dc_lock_open_door_log_new_plus
where lock_id = 148599227918852096
limit 1;

select *
from uc_user
where account = '16642608469';

select *
from dc_lock_user
where account = '16642608469';

select *
from dc_lock
where lock_mac = 'FB:B1:66:14:24:E7';

select *
from uc_user
where id = 216748611357118464;

select *
from cc_lock_base_info
where lock_mac = 'FB:B1:66:14:24:E7';

select *
from bc_user_role
where user_id = 2;

select *
from bc_roles;

select *
from dc_lock_face;

select *
from uc_wx_user
where phone = '16642608469';

select *
from uc_user where account = '13812341234';