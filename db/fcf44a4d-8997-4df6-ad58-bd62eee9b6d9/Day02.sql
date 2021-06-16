use test_db2;
select database();

create table user
(
    id   int primary key auto_increment,
    name varchar(20)
);

create table orderList
(
    id     int primary key auto_increment,
    number varchar(20)
);

insert into user (id, name)
VALUES (null, '张三'),
       (null, '李四');

insert into orderList (id, number)
VALUES (null, 'test001'),
       (null, 'test002'),
       (null, 'test003'),
       (null, 'test004');

select *
from orderList;

alter table orderList
    add uid int;

insert into orderList (test_db2.orderList.uid)
values (1),
       (1),
       (2),
       (2);

delete
from orderList
where test_db2.orderList.uid = 1;
delete
from orderList
where test_db2.orderList.uid = 2;

update orderList
set test_db2.orderList.uid = 1
where id = 1;

update orderList
set test_db2.orderList.uid = 1
where id = 2;

update orderList
set test_db2.orderList.uid = 2
where id = 3;

update orderList
set test_db2.orderList.uid = 2
where id = 4;

alter table orderList
    add constraint ou_fk1 foreign key (uid) references user (id);

select *
from orderList;

alter table orderList
    drop foreign key ou_fk1;

alter table orderList
    add constraint ou_fk1 foreign key (uid) references user (id);

create table student
(
    id   int primary key auto_increment,
    name varchar(20)
);

create table course
(
    id   int primary key auto_increment,
    name varchar(20)
);

create table stu_course
(
    id  int primary key auto_increment,
    sid int,
    cid int,
    constraint sc_fk1 foreign key (sid) references student (id),
    constraint sc_fk2 foreign key (cid) references course (id)
);

insert into student (id, name)
VALUES (null, '张三'),
       (null, '李四');

insert into course (id, name)
VALUES (null, '语文'),
       (null, '数学');

insert into stu_course (id, sid, cid)
VALUES (null, 1, 1),
       (null, 1, 2),
       (null, 2, 1),
       (null, 2, 2);

select *
from student;

select *
from course;

select *
from stu_course;

alter table user
    add age int;

insert into user (id, name, test_db2.user.age)
values (null, '王五', 25),
       (null, '赵六', 26);

update user
set test_db2.user.age=23
where id = 1;

update user
set test_db2.user.age=24
where id = 2;

insert into orderList (id, number, test_db2.orderList.uid)
values (null, 'test005', 3),
       (null, 'test006', 3),
       (null, 'test007', null);

update orderList
set id=5
where number = 'test005';

update orderList
set id=6
where number = 'test006';

update orderList
set id=7
where number = 'test007';

create table category
(
    id   int primary key auto_increment,
    name varchar(20)
);

insert into category (id, name)
VALUES (null, '手机数码'),
       (null, '电脑办公'),
       (null, '烟酒茶糖'),
       (null, '鞋靴箱包');

create table product
(
    id   int primary key auto_increment,
    name varchar(20),
    cid  int,
    constraint cp_fk1 foreign key (cid) references category (id)
);

insert into product (id, name, cid)
VALUES (null, '华为手机', 1),
       (null, '小米手机', 1),
       (null, '联想电脑', 2),
       (null, '苹果电脑', 2),
       (null, '中华香烟', 3),
       (null, '玉溪香烟', 3),
       (null, '计生用品', null);

create table us_pro
(
    id  int primary key auto_increment,
    uid int,
    pid int,
    constraint up_fk1 foreign key (uid) references user (id),
    constraint up_fk2 foreign key (pid) references product (id)
);

insert into us_pro (id, uid, pid)
VALUES (null, 1, 1),
       (null, 1, 2),
       (null, 1, 3),
       (null, 1, 4),
       (null, 1, 5),
       (null, 1, 6),
       (null, 1, 7),
       (null, 2, 1),
       (null, 2, 2),
       (null, 2, 3),
       (null, 2, 4),
       (null, 2, 5),
       (null, 2, 6),
       (null, 2, 7),
       (null, 3, 1),
       (null, 3, 2),
       (null, 3, 3),
       (null, 3, 4),
       (null, 3, 5),
       (null, 3, 6),
       (null, 3, 7);

select *
from user
         inner join orderList on orderList.uid = user.id;

select u.name, o.number
from user as u
         inner join orderList as o on o.uid = u.id;

select u.name, o.number
from user as u
         left outer join orderList as o on o.uid = u.id;

select u.name, o.number
from user as u
         right outer join orderList as o on o.uid = u.id;

select name, age
from user
where user.age = (select max(user.age) from user);

select number
from orderList
where orderList.uid in (select id from user where name in ('张三', '李四'));

select user.name, orderList.number
from user
         inner join orderList on orderList.uid = user.id;

select u.name, o.number
from user as u
         inner join (select * from orderList where id > 4) as o on o.uid = u.id;

