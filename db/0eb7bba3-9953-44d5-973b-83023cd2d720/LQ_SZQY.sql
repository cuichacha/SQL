select count(ID)                                                     as buyingCount,
       count(distinct CERTIFICATE)                                   as buyersCount,
       SUM(GASNUM)                                                   as gasTotalNum,
       SUM(GASPRICE)                                                 as gasTotalPrice,
       ROUND(SUM(GASPRICE) / SUM(GASNUM), 2)                         as gasAveragePrice,
       to_char(GASSTATION_PURCHASE_HISTORY.CREATEDATE, 'yyyy-mm-dd') as day
from GASSTATION_PURCHASE_HISTORY
where STATIONID = '13'
  and GASTYPE = '93'
  and CREATEDATE >= TO_DATE('2019-02-19 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
  and CREATEDATE <= TO_DATE('2021-05-19 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
group by to_char(GASSTATION_PURCHASE_HISTORY.CREATEDATE, 'yyyy-mm-dd');

select count(1)
from (select count(ID)                                                     as buyingCount,
             count(distinct CERTIFICATE)                                   as buyersCount,
             SUM(GASNUM)                                                   as gasTotalNum,
             SUM(GASPRICE)                                                 as gasTotalPrice,
             ROUND(SUM(GASPRICE) / SUM(GASNUM), 2)                         as gasAveragePrice,
             to_char(GASSTATION_PURCHASE_HISTORY.CREATEDATE, 'yyyy-mm-dd') as day
      from GASSTATION_PURCHASE_HISTORY
      where STATIONID = '13'
      group by to_char(GASSTATION_PURCHASE_HISTORY.CREATEDATE, 'yyyy-mm-dd'));


select count(1)
from (select distinct t.stationId,
                      t.buyingCount,
                      t.buyersCount,
                      t.gasTotalNum,
                      t.gasTotalPrice,
                      t.gasAveragePrice
      from GASSTATION_PURCHASE_HISTORY gph2,
           (select ROLEID                        as stationId,
                   count(ID)                     as buyingCount,
                   count(distinct CERTIFICATE)   as buyersCount,
                   SUM(GASNUM)                   as gasTotalNum,
                   SUM(GASPRICE)                 as gasTotalPrice,
                   (SUM(GASPRICE) / SUM(GASNUM)) as gasAveragePrice
            from (select ID, STATIONID, GASNUM, GASPRICE, CERTIFICATE
                  from GASSTATION_PURCHASE_HISTORY) gph,
                 (select ROLEID, ROLENAME
                  from ROLEINFO
                  where PARENTID = '12345') ri
            where ri.ROLEID = gph.STATIONID
            group by ROLEID) t
      where gph2.STATIONID = t.stationId);

select *
from GASSTATION_ZDRY;

select stationid, count(price)
from gasstation_purchase_history p
where exists
          (select 1
           from roleinfo r
           where p.stationid = r.roleid
             and r.fullpath like
                 (select fullpath from roleinfo r2 where r2.roleid = '12345') || '%')
group by stationid;

select FULLPATH
from ROLEINFO
where FULLPATH LIKE '12345' || '%';


select gph.STATIONID,
       count(ID)                             as buyingCount,
       count(distinct CERTIFICATE)           as buyersCount,
       SUM(GASNUM)                           as gasTotalNum,
       SUM(GASPRICE)                         as gasTotalPrice,
       ROUND(SUM(GASPRICE) / SUM(GASNUM), 2) as gasAveragePrice
from GASSTATION_PURCHASE_HISTORY gph
where exists(select 1
             from ROLEINFO r2
             where gph.STATIONID = r2.ROLEID
               and r2.FULLPATH like (select r3.FULLPATH
                                     from ROLEINFO r3
                                     where r3.ROLEID = '12345') || '%')
group by gph.STATIONID;


select p.STATIONID,
       r1.ROLENAME as stationName,
       p.buyingCount,
       p.buyersCount,
       p.gasTotalNum,
       p.gasTotalPrice,
       p.gasAveragePrice
from ROLEINFO r1,
     (select gph.STATIONID,
             count(ID)                             as buyingCount,
             count(distinct CERTIFICATE)           as buyersCount,
             SUM(GASNUM)                           as gasTotalNum,
             SUM(GASPRICE)                         as gasTotalPrice,
             ROUND(SUM(GASPRICE) / SUM(GASNUM), 2) as gasAveragePrice
      from GASSTATION_PURCHASE_HISTORY gph
      where exists(select 1
                   from ROLEINFO r2
                   where gph.STATIONID = r2.ROLEID
                     and gph.GASTYPE = '汽油'
                     and gph.CREATEDATE >= TO_DATE('2019-02-19 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
                     and gph.CREATEDATE <= TO_DATE('2021-05-19 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
                     and r2.FULLPATH like (select r3.FULLPATH
                                           from ROLEINFO r3
                                           where r3.ROLEID = '12345') || '%')
      group by gph.STATIONID) p
where p.STATIONID = r1.ROLEID;



select ROLEID
from ROLEINFO
where FULLPATH like (select FULLPATH
                     from ROLEINFO
                     where ROLEID = '12345') || '%';


select count(ID)                             as buyingCount,
       count(distinct CERTIFICATE)           as buyersCount,
       SUM(GASNUM)                           as gasTotalNum,
       SUM(PRICE)                            as gasTotalPrice,
       ROUND(SUM(GASPRICE) / SUM(GASNUM), 2) as gasAveragePrice,
       to_char(gph.CREATEDATE, 'yyyy-mm-dd') as day
from GASSTATION_PURCHASE_HISTORY gph
where exists(select 1
             from ROLEINFO r2
             where gph.STATIONID = r2.ROLEID
               and r2.FULLPATH like (select r3.FULLPATH from ROLEINFO r3 where r3.ROLEID = '200000000000000003') || '%')
group by to_char(gph.CREATEDATE, 'yyyy-mm-dd');



SELECT *
FROM (SELECT m.*, ROWNUM RN
      FROM (select id,
                   stationid,
                   (select rolename from roleinfo r where r.roleid = stationid)       StationName,
                   name,
                   gendercode,
                   certificate,
                   certificatetype,
                   certificateaddress,
                   photourl,
                   companytype,
                   phone,
                   plateno,
                   gastype,
                   price,
                   gasnum,
                   gasuse,
                   gasprice,
                   containertype,
                   issuspicious,
                   createdate,
                   (select username from geuserdom a where a.emailaddr = g.CREATETOR) createtor,
                   ispush,
                   pushtime
            from gasstation_purchase_history g
            WHERE g.createDate >= to_date(?, 'yyyy-mm-dd hh24:mi:ss')
              and g.createDate <= to_date(?, 'yyyy-mm-dd hh24:mi:ss')
              and exists(select 1
                         from roleinfo r
                         where r.roleid = g.stationId
                           and r.fullpath like (select fullpath from roleinfo r2 where r2.roleid = ?) || '%')) m
      WHERE ROWNUM <= ?)
WHERE RN > ?

select *
from PEOPLE;

insert into People (NUMID, RID, PROPERTY, JZFL, IS_DELETE, CUNIT)
values (7305, 'r20200422001', '重点关注', '其他个人极端行为', 'N', '路北派出所');