create database db_spring;

use db_spring;

create table account (
    id int primary key auto_increment,
    name varchar(50),
    money float
);

insert into account (id, name, money) VALUES
    (null, 'Mike', 888.88),
    (null, 'Jock', 666.66);

select *
from account;

insert into account (id, name, money) VALUES
    (null, 'Sam', 1000),
    (null, 'Tom', 1000);

