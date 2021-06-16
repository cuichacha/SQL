show databases;
/*
 啦啦啦
 */
use test_db1;
select database();
create database test_db2;
use test_db2;
use mysql;
show tables;
desc user;
show table status from mysql like 'user';

create table product
(
    id      int,
    name    varchar(20),
    price   double(5, 2),
    stock   int,
    serving timestamp
);

desc product;

alter table product rename to product2;

alter table product2
    add color varchar(20);

desc product2;

# alter table product2 modify color int;
#
# alter table product2 change color address varchar(20);
#
# alter table product2 drop address;

drop table product2;

create table product
(
    id    int,
    name  varchar(20),
    price double,
    stock int
);

alter table product
    add serving timestamp;

desc product;

alter table product
    modify price double(6, 2);

insert into product (id, name, price, stock, serving)
VALUES (1, 'phone', 5999.99, 5, null);

desc product;

show tables;

insert into product (id, name, price)
values (2, 'laptop', 9999.99);

select *
from product;

insert into product (id, name, price, stock, serving)
VALUES (3, 'refrigerator', 7999.99, 2, null);

insert into product (id, name, price, stock, serving)
VALUES (4, 'dryer', 8999.99, 2, null),
       (5, 'microwave', 5999.99, 3, null);

update product
set price=3999.99
where name = 'phone';

update product
set price=8999.99,
    stock=6
where name = 'laptop';

delete
from product
where name = 'microwave';

delete
from product
where stock = 2;

insert into product (id, name, price, stock, serving)
VALUES (3, 'dryer', 5999.99, 3, null);

alter table product
    change stock brand   varchar(20),
    change serving stock int,
    add serving          timestamp;

alter table product
    modify price int;

insert into product (id, name, price, brand, stock, serving)
VALUES (1, 'huawei_phone', 3999, 'huawei', 23, null),
       (2, 'mi_phone', 2999, 'mi', 30, null),
       (3, 'iPhone', 5999, 'apple', 18, null),
       (4, 'huawei_laptop', 6999, 'huawei', 14, null),
       (5, 'mi_laptop', 4999, 'mi', 26, null),
       (6, 'apple_laptop', 8999, 'apple', 15, null),
       (7, 'lenovo_laptop', 7999, 'huawei', null, null);

select *
from product;

select name, price
from product;

select brand, price
from product;

select distinct brand
from product;

select brand, stock + 10
from product;

select brand, stock + 10 as stock
from product;

select ifnull(stock, 0) + 10
from product;

select ifnull(stock, 0) + 10 as stock
from product;

select *
from product
where stock > 20;

select *
from product
where brand = 'huawei';

select *
from product
where price between 4000 and 6000;

select *
from product
where stock = 14
   or stock = 30
   or stock = 23;

select *
from product
where stock in (14, 30, 23);

select *
from product
where stock is null;

select *
from product
where stock is not null;

select *
from product
where brand like 'mi%';

select *
from product
where brand like '___wei%';

select *
from product
where brand like '%e%';

select *
from product
where brand like '______';

select count(*)
from product;

select max(price)
from product;

select min(stock)
from product;

select sum(stock)
from product;

select sum(stock)
from product
where brand = 'apple';

select avg(price)
from product
where brand = 'mi';

desc product;

select *
from product
order by stock desc;

select *
from product
where name like '%phone%'
order by price desc;

select *
from product
order by price desc, stock desc;

select brand, sum(price)
from product
group by brand;

select name, max(price)
from product
group by name;

select brand, sum(price)
from product
where price > 4000
group by brand;

select brand, sum(price)
from product
where price > 4000
group by brand
having sum(price) > 7000;

select brand, sum(price) as getSum
from product
where price > 4000
group by brand
having getSum > 7000
order by getSum desc;

select *
from product
limit 0,3;

select max(price)
from product;

select name, price
from product
where price = (select max(price) from product);

create table student
(
    id   int primary key,
    name varchar(20),
    age  int
);

desc student;

insert into student (id, name, age)
VALUES (1, '张三', 23),
       (2, '李四', 24),
       (3, '王五', 25);

select *
from student;

alter table student
    drop primary key;

alter table student
    modify id int primary key;

drop table student;

create table student
(
    id   int primary key auto_increment,
    name varchar(20),
    age  int
);

insert into student (id, name, age)
VALUES (null, '张三', 23),
       (null, '李四', 24),
       (null, '王五', 25);

select *
from student;

alter table student
    modify id int;

desc student;

alter table student
    modify id int auto_increment;

select *
from student;

drop table student;

create table student
(
    id int primary key auto_increment,
    name varchar(20),
    age int,
    number int unique
);

desc student;

alter table student modify number int unique;

alter table student modify name int not null;

alter table student modify name int;