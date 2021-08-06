use mytanhua;
select *
from tb_publish_info
where state = 5;

select ui.id,
       ui.user_id,
       ui.nick_name,
       ui.logo,
       ui.tags,
       ui.sex,
       ui.age,
       ui.edu,
       ui.city,
       ui.birthday,
       ui.cover_pic,
       ui.industry,
       ui.income,
       ui.marriage,
       ui.created,
       ui.updated
from tb_user_info as ui,
     tb_log as l
order by ui.updated desc
limit 10 offset 0;

select ui.id,
       ui.user_id,
       ui.nick_name,
       ui.logo,
       ui.tags,
       ui.sex,
       ui.age,
       ui.edu,
       ui.city,
       ui.birthday,
       ui.cover_pic,
       ui.industry,
       ui.income,
       ui.marriage,
       ui.created,
       ui.updated
from tb_user_info as ui,
     tb_log as l
where ui.user_id = l.user_id
order by l.log_time desc
limit 20 offset 0;

select distinct user_id, a.*
from tb_log a
order by log_time desc
limit 20 offset 0;

select distinct user_id
from tb_log
limit 10 offset 0;

select log_time
from tb_log
order by log_time desc
limit 10 offset 0;

select user_id, log_time
from tb_log
group by user_id
order by log_time desc
limit 10 offset 0;

select *
from tb_user_info
where id = 20018;

select *
from tb_user_love
where loved_user_id = 1;

select *
from tb_user_info
where user_id = 20012;

select *
from tb_publish_info
where id = 31924;