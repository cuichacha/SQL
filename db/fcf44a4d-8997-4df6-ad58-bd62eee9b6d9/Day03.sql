create database test_db3;
use test_db3;
select database();

delimiter $
create procedure pro_var1()
begin
    declare a int default 0;
    set a = a + 10;
    select a;
end $
delimiter ;

call pro_var1();

create table student
(
    id     int primary key auto_increment,
    name   varchar(20),
    age    int,
    gender varchar(20),
    score  int
);

insert into student (id, name, age, gender, score)
VALUES (null, '张三', 23, '男', 95),
       (null, '李四', 24, '男', 95),
       (null, '王五', 25, '女', 95),
       (null, '赵六', 26, '女', 95),
       (null, '田七', 27, '男', 95);

delimiter $
create procedure pro_var2()
begin
    declare a,b,c int;
    select max(age) into a from student;
    select min(age) into b from student;
    select avg(age) into c from student;
    select a, b, c;
end $
delimiter ;

drop procedure pro_var2;

call pro_var2();

delimiter $
create procedure pro_var3(in num int, out info varchar(30))
begin
    declare result int default 0;
    declare temp int default 1;
    if num < 1
    then
        set info = '数据不合法';
    else
        while temp <= num
            do
                if temp % 2 != 0
                then
                    set result = result + temp;
                end if;
                set temp = temp + 1;
            end while;
        set info = concat('1-', num, '的奇数和为：', result);
    end if;
end $
delimiter ;

drop procedure pro_var3;

call pro_var3(5, @info);

select @info;

delimiter $
create function fun_var1(num int)
    returns varchar(20)
begin
    declare info varchar(20);
    declare temp int default num - 1;
    declare result int default 0;
    if
        num > (select count(id) from student)
    then
        set info = '没有这条数据';
    else
        set result = (select distinct score from student order by score desc limit temp,1);
        set info = concat('成绩第', num, '高的分数是：', result);
    end if;
    return info;
end $
delimiter ;

drop function fun_var1;

select fun_var1(30);


