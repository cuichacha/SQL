use dsmzg_db;

select lock_id
from dc_lock_user
where user_id = 418918360592420864
  and role_type = 2
  and state = 1;

select *
from dc_lock
where id in (479802340979777536,
             506034534249144320,
             507449854574731264,
             507459909885894656,
             507465960626593792,
             507792132174520320
    );

select *
from dc_lock_third_info
where id in (479802340979777536,
             506034534249144320,
             507449854574731264,
             507459909885894656,
             507465960626593792,
             507792132174520320);

select id
from dc_lock
where id = 505966387496230912;

select *
from dc_lock_third_info
where id = 505966387496230912;

select *
from dc_lock_order_header
where buyer_id = 359190957825986560
  and iot_id = '5tsg9Z9El3EIUrJw3HVz000000'
  and status = 10;

select *
from dc_lock_order_header
where id = 140634;

select *
from dc_lock_order
where lock_order_header_id = 140634;

select *
from dc_lock_order
where buyer_id = 468267247048069120;

select *
from dc_lock_order_header
where buyer_id = 468267247048069120;

select *
from uc_user
where account = '18658508586';

select *
from uc_user_login_persist
where user_id = 468267247048069120;

select *
from dc_lock_order_header
where buyer_id = (select id from uc_user where account = '13271339890')
union
select *
from dc_lock_order_header
where buyer_id = 468267247048069120;

select *
from lock_device_info
where picture_path is null;

select *
from dc_lock_order_header
where buyer_id = (select id from uc_user where account = '13271339890');

select id
from dc_lock_order_header
where iot_id = '5tsg9Z9El3EIUrJw3HVz000000'
  and id not in (select lock_order_header_id from dc_lock_order where iot_id = '5tsg9Z9El3EIUrJw3HVz000000');

select id
from dc_lock_order
where iot_id = '5tsg9Z9El3EIUrJw3HVz000000';

select *
from dc_lock_order_header
where id = 140632;;

select *
from dc_lock_order
where lock_order_header_id = 140632;



select *
from uc_user
where account = '18501629799';

select *
from dc_lock_user
where user_id = 224524;

select *
from dc_lock
where id = (select lock_id
            from dc_lock_user
            where dc_lock_user.user_id = (select id from uc_user where uc_user.account = '18986037305'));

select *
from dc_lock
where id = (select lock_id
            from dc_lock_user
            where dc_lock_user.user_id = (select id from uc_user where uc_user.account = '18908545551'));

update dc_iot_key
set version=version + 1,
    update_date=now(),
    lock_mac=null
where lock_mac = 'E7:E5:65:20:F9:71';

select *
from dc_iot_key
where lock_mac = 'E7:E5:65:20:F9:71';

select *
from dc_lock_third_info
where sn = 'fa335c160ef7288f';

select *
from dc_lock
where id = 508091010773950464;

select *
from uc_user_login_persist
where token = '0bizP5913bWe74O3E553UCw1o85c4v7A';

select *
from dc_lock_user
where lock_id = 508091010773950464;

select *
from uc_user
where account = '18658508586';

select *
from uc_wx_user
where phone = '13271339890';

select *
from uc_wx_user
where phone = '13486314841';

select *
from dc_lock_user
where lock_mac = 'E1:31:8E:E9:DD:B4';

select *
from dc_lock_user
where lock_id = 125070731175272448;

select *
from cc_user_config
where lock_id = 422656629658361856
  and user_id = #{userId} and config_name = #{configName};

select *
from cc_banner
where position = 10
  and state = 10;

select *
from uc_user
where id = 455266818961969153;

select *
from uc_user
where account = '13271339890';

select *
from uc_user
where account = '18658508586';

select *
from dc_lock_user
where user_id = (select id from uc_user where uc_user.account = '13271339890');


select *
from uc_user_login_persist
where user_id = (select ID
                 from uc_user
                 where account = '13271339890')
  and status = 1;

select *
from uc_user_login_persist
where token = '87L60iV92P5QiZVLxySp1830fF09te4B';

select *
from uc_user_login_persist
where user_id = 506094465115492352
  and status is true;

select *
from dc_lock_user
where user_id = 506094465115492352;

select *
from uc_user_login_persist
where user_id = 378502582957510656;

select *
from uc_user
where id = (select user_id
            from uc_user_login_persist
            where token = '0T1GRFi75y66HXmz05I2807248wRlFMH');

select *
from dc_lock_open_door_log_new_plus
where lock_id = 125070731175272448
order by id desc;

select *
from dc_lock_alarm_log;

select *
from uc_user
where id = 369977762301087744;

select *
from uc_user
where id = 123348898570833920;

select *
from dc_lock
where id = 369978586888675328;

select count(*)
from dc_lock_local_user u
         left join dc_lock_user_note n on u.id = n.note_user_id
where u.nick_name != n.note;

select *
from uc_wx_user
where phone = '15991190790';

select id, lock_id, send_state
from dc_lock_open_door_log_new_plus
where lock_id = 143591471843385344
  and left(id, 8) >= '20220530'
  and left(id, 8) <= '20220630'
order by id;


select *
from dc_lock
where id = 512546627949436928;

select *
from cc_lock_base_info
where lock_mac = 'FA:E1:50:BA:B9:2A';

select *
from dc_guide_video
where status = 1;

select id, lock_id, send_state
from dc_lock_open_door_log_new_plus
where lock_id = 143591471843385344
  and left(id, 8) >= 20220530
  and left(id, 8) <= 20220630
order by id
limit 500;

select count(*)
from cc_firmware_version;

select *
from uc_user
where account = '11112000001';


select *
from uc_user
where account = '18930953585';

select *
from cc_lock_base_info
where lock_mac = 'D1:3D:90:C3:BB:CF';

select *
from dc_lock_user
where account = '16642608469';

select *
from dc_lock
where id = 512546627949436928;

select *
from dc_lock_open_door_log_new_plus
where lock_id = 512546627949436928
limit 10;

select *
from cc_lock_base_info
where lock_mac = 'FB:B1:66:14:24:E7';

select *
from cc_base_device_info
where meter_type like 'K10%';

select *
from cc_base_firmware_info
where meter_type like 'K10%';

select count(uu.account)
from dc_lock_user dlu
         left join uc_user uu on dlu.user_id = uu.id
         left join dc_lock dl on uu.account != dl.manage_account
where dlu.role_type = 2;

select account
from dc_lock_user
where role_type = 2
limit 500;

select dl.manage_account, dlu.account
from dc_lock dl
         left join dc_lock_user dlu on dl.id = dlu.lock_id
where dl.manage_account != dlu.account
  and dlu.role_type = 2
limit 20;

select *
from dc_lock_user
where lock_id = 322902461180289024;

select *
from dc_lock_user
where user_id = (select id from uc_user where uc_user.account = '15592606216');

select *
from dc_lock
where id = 244295337819250688;

select *
from cc_user_config
where lock_id = 244295337819250688
  and user_id = 241727794512400384
  and config_name = 'USER_PHONE_OPEN_DOOR_STATUS';

select *
from cc_user_config
where lock_id = 244295337819250688
#   and user_id = 241727794512400384
  and config_name = 'USER_PHONE_OPEN_DOOR_STATUS';

select *
from cc_user_config
where lock_id = 244295337819250688
  and config_name = 'USER_PHONE_ALL_OPEN_DOOR_STATUS';

select *
from uc_user
where id in (441148661171228673,
             466416650522988545,
             468546804460294145,
             258742264002514945,
             492443119933984769
    );

select *
from cc_lock_base_info where lock_mac = 'DF:6A:75:DA:3F:33';

select *
from dc_lock where lock_mac = 'DF:6A:75:DA:3F:33';