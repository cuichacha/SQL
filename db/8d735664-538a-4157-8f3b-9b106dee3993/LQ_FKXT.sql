
;

select k3.ROLENAME, k2.count
from (select k1.ROLEINFO, count(1) as count
from KEYUNIT_VISITOR k1
where k1.CREATEDATE >= to_date('2019-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
and k1.CREATEDATE <= to_date('2021-09-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
and ROLEINFO = ''
group by k1.ROLEINFO) k2 left join KEYUNIT_VISITOR k3 on k2.ROLEINFO = k3.ROLEINFO;