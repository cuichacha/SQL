# 1） 创建数据库名称：Book_Sys
create database Book_Sys;

use Book_Sys;

# 学生信息表：student
create table student
(
    stuID   varchar(10) primary key,
    stuName varchar(10),
    major   varchar(50)
);

# 图书表：book
create table book
(
    BID    varchar(10) primary key,
    title  varchar(50),
    author varchar(20)
);

# 借书信息表：borrow
create table borrow
(
    borrowID varchar(10) primary key,
    stuID    varchar(10),
    BID      varchar(10),
    T_Time   date,
    B_Time   date,
    constraint fk_1 foreign key (stuID) references student (stuID),
    constraint fk_2 foreign key (BID) references book (BID)
);

# 1. 图书表book，数据如下：
insert into book (BID, title, author)
VALUES ('B001', '人生若只如初见', '安意如'),
       ('B002', '入学那天遇见你', '晴空'),
       ('B003', '感谢折磨你的人', '如娜'),
       ('B004', '我不是教你诈', '刘庸'),
       ('B005', '英语四级', '白雪');

# 2. 学生信息表student，数据如下：
insert into student (stuID, stuName, major)
VALUES ('1001', '林林', '计算机'),
       ('1002', '白杨', '计算机'),
       ('1003', '虎子', '英语'),
       ('1004', '北漂的雪', '工商管理'),
       ('1005', '五月', '数学');

# 3. 借阅信息表borrow，数据如下：
insert into borrow (borrowID, stuID, BID, T_Time, B_Time)
VALUES ('T001', '1001', 'B001', '2017-12-26 00:00:00', null),
       ('T002', '1004', 'B003', '2018-01-05 00:00:00', null),
       ('T003', '1005', 'B001', '2017-10-08 00:00:00', '2017-12-25 00:00:00'),
       ('T004', '1005', 'B002', '2017-12-16 00:00:00', '2018-01-07 00:00:00'),
       ('T005', '1002', 'B004', '2017-12-22 00:00:00', null),
       ('T006', '1005', 'B005', '2018-01-06 00:00:00', null),
       ('T007', '1002', 'B001', '2017-09-11 00:00:00', null),
       ('T008', '1005', 'B004', '2017-12-10 00:00:00', null),
       ('T009', '1004', 'B005', '2017-10-16 00:00:00', '2017-12-18 00:00:00'),
       ('T010', '1002', 'B002', '2017-09-15 00:00:00', '2018-01-05 00:00:00'),
       ('T011', '1004', 'B003', '2017-12-28 00:00:00', null),
       ('T012', '1002', 'B003', '2017-12-30 00:00:00', null);

# 4）查询“计算机”专业学生在“2017-12-15”至“2018-1-8”时间段内借书的学生编号、 学生名称、图书编号、图书名称、借出日期；
create view question4 (学生编号, 学生名称, 图书编号, 图书名称, 借出日期) as
select student.stuID, student.stuName, book.BID, book.title, borrow.T_Time
from student,
     book,
     borrow
where student.major = '计算机'
  and student.stuID = borrow.stuID
  and book.BID = borrow.BID
  and borrow.T_Time > '2017-12-15 00:00:00'
  and borrow.T_Time < '2018-01-08 00:00:00';

select *
from question4;


# 5） 查询所有借过图书的学生编号、学生名称、专业；要求采用两种方式实现

# 方式一
create view question5_1 (学生编号, 学生名称, 专业) as
select student.stuID, student.stuName, student.major
from student,
     borrow
where student.stuID = borrow.stuID
group by student.stuID;

select *
from question5_1;

# 方式二

create view question5_2 (学生编号, 学生名称, 专业) as
select distinct student.stuID, student.stuName, student.major
from student,
     borrow
where student.stuID = borrow.stuID;

select *
from question5_2;


# 6）查询借过作者为“安意如”的图书的学生姓名、图书名称、借出日期、归还日期；
create view question6 (学生姓名, 图书名称, 借出日期, 归还日期) as
select student.stuName, book.title, borrow.T_Time, borrow.B_Time
from borrow,
     book,
     student
where book.author = '安意如'
  and borrow.stuID = student.stuID
  and borrow.BID = book.BID
order by student.stuID;

select *
from question6;

# 7）查询目前借书但未归还图书的学生名称及未还图书数量；
create view question7 (学生名称, 未还数量) as
select student.stuName, count(borrow.stuID)
from student,
     borrow
where student.stuID = borrow.stuID
  and borrow.B_Time is null
group by borrow.stuID;

select *
from question7;