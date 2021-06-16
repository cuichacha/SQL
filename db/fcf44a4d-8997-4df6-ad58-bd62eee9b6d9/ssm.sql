create database db_ssm;

use db_ssm;

create table user
(
    id       int primary key auto_increment,
    username varchar(50),
    password varchar(50),
    realname varchar(50),
    gender   int,
    birthday date
);

insert into user (id, username, password, realname, gender, birthday)
VALUES (null, 'lala', '12345', 'Sam', 1, null),
       (null, 'lala', '12345', 'Sam', 1, null),
       (null, 'lala', '12345', 'Sam', 1, null),
       (null, 'lala', '12345', 'Sam', 1, null),
       (null, 'lala', '12345', 'Sam', 1, null)
;