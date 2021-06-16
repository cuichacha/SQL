create database db_bank;

use db_bank;

create table `account`
(
    `id`         int primary key auto_increment,
    `username`   varchar(50),
    `real_name`  varchar(50),
    `phone`      varchar(50),
    `account_id` varchar(50),
    `password`   varchar(6),
    `remaining`  decimal(7, 2)
);

alter table account
    add unique (account_id);

alter table account
    add unique (username);

create table `trade`
(
    id             int primary key auto_increment,
    `account_id`   varchar(50),
    `trade_type`   varchar(10),
    `trade_money`  decimal(7, 2),
    `trade_time`   datetime,
    `trade_digest` varchar(1024),
    constraint ta_fk1 foreign key (account_id) references account (account_id)
);

insert into account (id, username, real_name, phone, account_id, password, remaining)
VALUES (null, 'zhangsan', '张三', '13693984529', '5240941475817205', '123456', '1000.00'),
       (null, 'lisi', '李四', '18402429389', '9558824507055499', '654321', '1000.00');

insert into account (id, username, real_name, phone, account_id, password, remaining)
VALUES (null, 'zhangsan', '张三', '13693984529', '5240941475817206', '123456', '1000.00');

drop table trade;

insert into account (username, real_name, phone, account_id, password, remaining)
VALUES ('lisi', '李四', '18402429389', '9558824507055401', '654321', '1000.00');

insert into trade (account_id, trade_type, trade_money, trade_time, trade_digest)
VALUES ('5240941475817205', 'DEPOSIT', '100.00', '2020-02-02', '000');

update account set remaining = remaining + 100 where account_id = '5240941475817205';

select *
from trade where account_id= 5240941475817205 and trade_time between '2020-02-01' and '2020-12-25';
