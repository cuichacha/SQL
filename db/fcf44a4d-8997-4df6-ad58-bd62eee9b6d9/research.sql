create database db_ajax;

use db_ajax;

create table relevant_results
(
    id int primary key auto_increment,
    name varchar(20),
    age int,
    search_count int
);

INSERT INTO relevant_results VALUES (NULL,'张三',23,25),(NULL,'李四',24,5),(NULL,'王五',25,3)
,(NULL,'赵六',26,7),(NULL,'张三丰',93,20),(NULL,'张无忌',18,23),(NULL,'张强',33,21),(NULL,'张果老',65,6);

select * from relevant_results where name like concat('张', '%') order by search_count desc limit 4