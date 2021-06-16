create database db_jdbc;

use db_jdbc;

create table student
(
    sid      int primary key auto_increment,
    name     varchar(20),
    age      int,
    birthday date
);

insert into student (name, age, birthday)
VALUES ('张三',23,'1999-09-23'),
       ('李四',24,'1998-08-10'),
       ('王五',25,'1996-06-06'),
       ('赵六',26,'1994-10-20');

select *
from student;

