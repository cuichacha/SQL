create database db_mybatis;

use db_mybatis;

create table student
(
    sid         int primary key auto_increment,
    name        varchar(20),
    age         int,
    insert_time date
);

insert into student (name, age, insert_time)
VALUES ('张三', 23, '2020-11-06'),
       ('李四', 24, '2020-11-06'),
       ('王五', 25, '2020-11-06');

select *
from student;

drop table student;

CREATE TABLE person
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(20),
    age  INT
);
INSERT INTO person
VALUES (NULL, '张三', 23);
INSERT INTO person
VALUES (NULL, '李四', 24);
INSERT INTO person
VALUES (NULL, '王五', 25);

CREATE TABLE card
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    number VARCHAR(30),
    pid    INT,
    CONSTRAINT cp_fk FOREIGN KEY (pid) REFERENCES person (id)
);
INSERT INTO card
VALUES (NULL, '12345', 1);
INSERT INTO card
VALUES (NULL, '23456', 2);
INSERT INTO card
VALUES (NULL, '34567', 3);

select *
from person;

select *
from student;

CREATE TABLE classes
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(20)
);
INSERT INTO classes
VALUES (NULL, '黑马一班');
INSERT INTO classes
VALUES (NULL, '黑马二班');

CREATE TABLE learner
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(30),
    age  INT,
    cid  INT,
    CONSTRAINT cl_fk FOREIGN KEY (cid) REFERENCES classes (id)
);
INSERT INTO learner
VALUES (NULL, '张三', 23, 1);
INSERT INTO learner
VALUES (NULL, '李四', 24, 1);
INSERT INTO learner
VALUES (NULL, '王五', 25, 2);
INSERT INTO learner
VALUES (NULL, '赵六', 26, 2);

select *
from learner;

select c.id, c.number, p.id, p.NAME, p.age
from card as c,
     person as p
where c.pid = p.id;

select *
from classes;

select c.id as cid, c.NAME as cname, l.id as lid, l.NAME as lname, l.age as lage
from classes as c,
     learner as l
where c.id = l.cid;

select c.id, c.NAME as cname, s.sid, s.NAME as lname, s.age
from classes as c,
     student as s
where c.id = s.sid;

CREATE TABLE course(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20)
);
INSERT INTO course VALUES (NULL,'语文');
INSERT INTO course VALUES (NULL,'数学');


CREATE TABLE stu_cr(
	id INT PRIMARY KEY AUTO_INCREMENT,
	sid INT,
	cid INT,
	CONSTRAINT sc_fk1 FOREIGN KEY (sid) REFERENCES student(sid),
	CONSTRAINT sc_fk2 FOREIGN KEY (cid) REFERENCES course(id)
);
INSERT INTO stu_cr VALUES (NULL,1,1);
INSERT INTO stu_cr VALUES (NULL,1,2);
INSERT INTO stu_cr VALUES (NULL,2,1);
INSERT INTO stu_cr VALUES (NULL,2,2);

select s.sid, s.name as sname, s.age, c.id, c.NAME as cname
from student as s,
     course as c,
     stu_cr as sc
where s.sid = sc.sid
  and c.id = sc.cid;