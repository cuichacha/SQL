create table gz_wifi
(
    id          int auto_increment
        primary key,
    create_date datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    update_date datetime                           not null comment '最后修改时间',
    version     bigint   default 200               not null,
    account     varchar(16)                        not null comment '账号',
    password    varchar(16)                        not null comment '密码'
)
    charset = utf8;


# 视频留言相关开始---------------------------------------------------------------------------------------------------------

create table dc_lock_video_message
(
    id                      bigint
        primary key,
    create_date             datetime     not null comment '创建时间',
    update_date             datetime     null comment '最后修改时间',
    version                 bigint       not null comment '版本号',
    lock_id                 bigint       not null comment '锁具Id',
    old_video_url           varchar(255) null comment '原始视频链接',
    new_video_url           varchar(255) null comment '转换后视频链接',
    thumbnail_url           varchar(255) null comment '封面链接',
    video_type              tinyint      not null comment '1:出门视频；2:进门视频',
    start_date              datetime     null comment '视频开始时间',
    end_date                datetime     null comment '视频结束时间',
    video_status            tinyint      not null comment '视频状态：0-无效；1-有效',
    video_conversion_status tinyint      not null comment '转换视频状态：0-未转换；1-已转换；2-转换失败',
    viewer_type             tinyint      null comment '观看用户：0-首个进门用户观看；1-指定用户观看',
    played                  tinyint      null comment '是否播放：0-未播放，1-已播放',
    play_loop               tinyint      null comment '是否循环播放：0-不循环；1-循环',
    creator                 bigint       not null comment '创建用户Id'
)
    charset = utf8;

create index INDEX_video_message_lock_id
    on dc_lock_video_message (lock_id);

create table dc_lock_video_message_account_relation
(
    id               bigint
        primary key,
    create_date      datetime     not null comment '创建时间',
    update_date      datetime     null comment '最后修改时间',
    version          bigint       not null comment '版本号',
    video_id         bigint       not null comment '视频留言Id',
    viewer_id        bigint       not null comment '观众id',
    viewer_name      varchar(255) not null comment '观众名称',
    viewer_finger_id bigint       not null comment '观众指纹Id'
)
    charset = utf8;

create index INDEX_video_message_account_relation_video_id
    on dc_lock_video_message_account_relation (video_id);

alter table lock_info
    add play_exit_video tinyint(1);

alter view dc_lock as
    select `dsmzg_db`.`lock_info`.`id`                         AS `id`,
           `dsmzg_db`.`lock_info`.`parentId`                   AS `white_list`,
           `dsmzg_db`.`lock_info`.`time`                       AS `create_date`,
           `dsmzg_db`.`lock_info`.`update_date`                AS `update_date`,
           `dsmzg_db`.`lock_info`.`version`                    AS `version`,
           `dsmzg_db`.`lock_info`.`lockseq`                    AS `lock_mac`,
           `dsmzg_db`.`lock_info`.`lockmac`                    AS `lock_mac_old`,
           `dsmzg_db`.`lock_info`.`type`                       AS `type`,
           `dsmzg_db`.`lock_info`.`metertype`                  AS `meter_type`,
           `dsmzg_db`.`lock_info`.`channelPassword`            AS `channel_password`,
           `dsmzg_db`.`lock_info`.`manageaccount`              AS `manage_account`,
           `dsmzg_db`.`lock_info`.`manageaccountname`          AS `manage_nick_name`,
           `dsmzg_db`.`lock_info`.`user_id`                    AS `user_id`,
           `dsmzg_db`.`lock_info`.`lockname`                   AS `lock_name`,
           `dsmzg_db`.`lock_info`.`routerId`                   AS `open_door_log_upload_flag`,
           `dsmzg_db`.`lock_info`.`opentype_finger`            AS `open_door_finger_flag`,
           `dsmzg_db`.`lock_info`.`opentype_phone`             AS `open_door_phone_flag`,
           `dsmzg_db`.`lock_info`.`opentype_key`               AS `open_door_bluetooth_key_flag`,
           `dsmzg_db`.`lock_info`.`hardware_version`           AS `hardware_version`,
           `dsmzg_db`.`lock_info`.`software_version`           AS `software_version`,
           `dsmzg_db`.`lock_info`.`item2`                      AS `seid`,
           `dsmzg_db`.`lock_info`.`fingeruserdnum`             AS `finger_used_num`,
           `dsmzg_db`.`lock_info`.`fingerunuserdnum`           AS `finger_unused_num`,
           `dsmzg_db`.`lock_info`.`phoneuserdnum`              AS `phone_used_num`,
           `dsmzg_db`.`lock_info`.`phoneunuserdnum`            AS `phone_unused_num`,
           `dsmzg_db`.`lock_info`.`keyuserdnum`                AS `bluetooth_key_used_num`,
           `dsmzg_db`.`lock_info`.`keyunyserdnum`              AS `bluetooth_key_unused_num`,
           `dsmzg_db`.`lock_info`.`lock_password`              AS `lock_password`,
           `dsmzg_db`.`lock_info`.`lock_alarmpassword`         AS `lock_alarm_password`,
           `dsmzg_db`.`lock_info`.`lock_managepwd`             AS `lock_manage_password`,
           `dsmzg_db`.`lock_info`.`lock_passwordstate`         AS `lock_password_state`,
           `dsmzg_db`.`lock_info`.`lock_alarmpasswordstate`    AS `lock_alarm_password_state`,
           `dsmzg_db`.`lock_info`.`lock_wifistate`             AS `lock_wifi_state`,
           `dsmzg_db`.`lock_info`.`lock_wifissid`              AS `lock_wifi_ssid`,
           `dsmzg_db`.`lock_info`.`lock_wifipwd`               AS `lock_wifi_password`,
           `dsmzg_db`.`lock_info`.`battery_status`             AS `battery_level`,
           `dsmzg_db`.`lock_info`.`state`                      AS `state`,
           `dsmzg_db`.`lock_info`.`remark`                     AS `remark`,
           `dsmzg_db`.`lock_info`.`lock_lat`                   AS `latitude`,
           `dsmzg_db`.`lock_info`.`lock_lon`                   AS `longitude`,
           `dsmzg_db`.`lock_info`.`network_mode`               AS `network_mode`,
           `dsmzg_db`.`lock_info`.`network_signal`             AS `network_signal`,
           `dsmzg_db`.`lock_info`.`snr`                        AS `snr`,
           `dsmzg_db`.`lock_info`.`tx_power`                   AS `tx_power`,
           `dsmzg_db`.`lock_info`.`cell_id`                    AS `cell_id`,
           `dsmzg_db`.`lock_info`.`family_setting`             AS `family_setting`,
           `dsmzg_db`.`lock_info`.`alarm_setting`              AS `alarm_setting`,
           `dsmzg_db`.`lock_info`.`device_id`                  AS `device_id`,
           `dsmzg_db`.`lock_info`.`open_door_type`             AS `open_door_type`,
           `dsmzg_db`.`lock_info`.`open_door_mode`             AS `open_door_mode`,
           `dsmzg_db`.`lock_info`.`face_unused_num`            AS `face_unused_num`,
           `dsmzg_db`.`lock_info`.`ir_distance`                AS `ir_distance`,
           `dsmzg_db`.`lock_info`.`doorbell_status`            AS `doorbell_status`,
           `dsmzg_db`.`lock_info`.`firmware_version_status`    AS `firmware_version_status`,
           `dsmzg_db`.`lock_info`.`battery_update_time`        AS `battery_update_time`,
           `dsmzg_db`.`lock_info`.`face_software_version`      AS `face_software_version`,
           `dsmzg_db`.`lock_info`.`face_alarm_status`          AS `face_alarm_status`,
           `dsmzg_db`.`lock_info`.`sn`                         AS `sn`,
           `dsmzg_db`.`lock_info`.`iot_id`                     AS `iot_id`,
           `dsmzg_db`.`lock_info`.`sleep_status`               AS `sleep_status`,
           `dsmzg_db`.`lock_info`.`cateye_battery`             AS `cateye_battery`,
           `dsmzg_db`.`lock_info`.`door_unclosed_alarm_status` AS `door_unclosed_alarm_status`,
           `dsmzg_db`.`lock_info`.`current_voice_package`      AS `current_voice_package`,
           `dsmzg_db`.`lock_info`.`face_open_switch`           AS `face_open_switch`,
           `dsmzg_db`.`lock_info`.`video_display`              AS `video_display`,
           `dsmzg_db`.`lock_info`.`play_exit_video`            AS `play_exit_video`
    from `dsmzg_db`.`lock_info`;

# 视频留言相关结束---------------------------------------------------------------------------------------------------------


# 蓝牙蒙版繁体字开始————————————————————————————————————————————————————————————————————————————————————————————————————————
alter table cc_lock_mask
    add language_type tinyint comment '语言类型';

update cc_lock_mask
set language_type = 1;

alter table cc_lock_mask
    add parent_id bigint comment '父Id，用于多语言查询';

update cc_lock_mask
set parent_id = id;
# 蓝牙蒙版繁体字结束————————————————————————————————————————————————————————————————————————————————————————————————————————

# 固件强制覆盖开始——————————————————————————————————————————————————————————————————————————————————————————————————————————

create table app_firmware_version_new
(
    id               bigint auto_increment
        primary key,
    create_date      datetime      not null comment '创建时间',
    update_date      datetime      null comment '最后修改时间',
    version          bigint        not null comment '版本号',
    firmware_version varchar(50)   null comment '版本号',
    firmware_type    int           null comment '1:APP软件版本 2:锁具固件版本 3,4. 室内机下载程序 5.手环更新程序 6. 猫眼更新程序',
    url              varchar(1024) null comment 'URL',
    state            int           null comment '0:无效 1：有效',
    url_key          varchar(255)  null comment 'oss下载url key',
    creator          bigint        null comment '创建者'
);

create table app_firmware_version_account_relation_new
(
    id                      bigint auto_increment
        primary key,
    create_date             datetime    not null comment '创建时间',
    update_date             datetime    null comment '最后修改时间',
    version                 bigint      not null comment '版本号',
    app_firmware_version_id bigint      not null comment '固件版本id',
    account                 varchar(50) not null comment '用户账号',
    user_id                 bigint      not null comment '用户Id',
    lock_id                 bigint      not null comment '锁Id'

)
    charset = utf8;


create index INDEX_app_firmware_version_id
    on app_firmware_version_account_relation_new (app_firmware_version_id);

# 固件强制覆盖结束——————————————————————————————————————————————————————————————————————————————————————————————————————————————

# dc_lock_location_new开始————————————————————————————————————————————————————————————————————————————————————————————————————

CREATE TABLE `dc_lock_location_new`
(
    `id`       bigint(20) unsigned NOT NULL,
    `lock_mac` bigint(20)  DEFAULT NULL,
    `ip`       bigint(20)  DEFAULT NULL,
    `province` varchar(16) DEFAULT NULL,
    `city`     varchar(16) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `i_mac_long_on_dlln` (`lock_mac`) USING HASH
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448426, 252140895889011, 3084106820, '江苏省', '镇江市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448425, 261631177725666, 3085100716, '重庆市', '重庆市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448424, 222607591121424, 1875313755, '北京市', '北京市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448423, 278169839357416, 1933332911, '河南省', '郑州市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448418, 218252504935431, 1900529103, '广东省', '佛山市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448417, 268777365370732, 3085291718, '重庆市', '重庆市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448416, 217604867379207, 979674477, '浙江省', '杭州市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448415, 272646822198429, 1894093126, '山东省', '济南市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448414, 279681305950733, 3746493271, '山东省', '潍坊市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448413, 223511359251126, 1987360323, '四川省', '宜宾市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448412, 269589746910405, 3755307004, '广东省', '深圳市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448411, 224342135242469, 3084999672, '云南省', '玉溪市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448410, 275967484503318, 3079696085, '浙江省', '绍兴市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448409, 230631811777394, 3084446061, '江西省', '赣州市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448408, 213175982952216, 829838623, '新疆维吾尔自治区', '乌鲁木齐市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448407, 253508772453511, 3055557873, '山东省', '济南市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448406, 236347702550572, 1912263784, '重庆市', '重庆市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448405, 248609728784779, 3664626061, '浙江省', '杭州市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090410448404, 260527048847491, 2028288446, '[]', '[]');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448445, 229114976758131, 1879684699, '山东省', '青岛市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448444, 231981354897361, 2071355877, '北京市', '北京市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448443, 211853494006097, 710630694, '甘肃省', '兰州市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448442, 214077097696739, 666663452, '浙江省', '宁波市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448441, 236244392175540, 976400844, '湖北省', '宜昌市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448440, 216448121315424, 2029314727, '北京市', '北京市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448439, 231176102908135, 1017750884, '安徽省', '芜湖市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448438, 244769023213755, 466422628, '山东省', '潍坊市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448433, 252477241608819, 2029174331, '安徽省', '合肥市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448432, 275922743027386, 3751167516, '湖南省', '常德市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448431, 227929039603719, 977000731, '广西壮族自治区', '南宁市');
INSERT INTO `dsmzg_db`.`dc_lock_location_new` (`id`, `lock_mac`, `ip`, `province`, `city`)
VALUES (1773685090409448430, 242215221539425, 1910698624, '辽宁省', '大连市');

# dc_lock_location_new结束————————————————————————————————————————————————————————————————————————————————————————————————————

# 移动侦测开始——————————————————————————————————————————————————————————————————————————————————————————————————————————————————
create table dsmzg_db.dc_movement_detection_sync
(
    id                          bigint auto_increment
        primary key,
    create_date                 datetime not null comment '创建时间',
    update_date                 datetime null comment '最后修改时间',
    version                     bigint   not null comment '版本号',
    lock_id                     bigint   not null comment '锁Id',
    movement_detection_switch   tinyint  null comment '移动侦测开关；0-关；1-开',
    movement_detection_distance tinyint  null comment '移动侦测触发距离；1-近距离；2-中距离；3-远距离',
    movement_detection_duration tinyint  null comment '移动侦测时长'

)
    charset = utf8;

create index INDEX_lock_id
    on dc_movement_detection_sync (lock_id);

# 移动侦测结束——————————————————————————————————————————————————————————————————————————————————————————————————————————————————

# 锁具工装检测配置表 增加字段——————————————————————————————————————————————————————————————————————————————————————————————————————
# alter table cc_lock_base_info
#     add lock_gz_test_config int comment '锁具工装检测配置表';
#
# alter table cc_lock_base_info
#     drop lock_gz_test_config;

alter table cc_lock_base_info
    modify lock_function_config3 int(6);


# 锁具虹膜—————————————————————————————————————————————————————————————————————————————————————————————————————————————————————

create table dc_lock_iris
(
    id          bigint auto_increment
        primary key,
    create_date datetime           null,
    update_date datetime           null,
    version     bigint default 200 null,
    lock_id     bigint             null comment '锁具id',
    iris_id     varchar(50)        null comment '虹膜id',
    user_id     bigint             null comment '用户id'
)
    charset = utf8;

alter table lock_info
    add column iris_unused_num tinyint;