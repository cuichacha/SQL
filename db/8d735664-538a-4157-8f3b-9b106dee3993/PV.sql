select k3.ROLENAME, k2.count
from (select k1.ROLEINFO, count(1) as count
      from KEYUNIT_VISITOR k1
      where k1.CREATEDATE >= to_date('2019-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
        and k1.CREATEDATE <= to_date('2021-09-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
        and ROLEINFO = ''
      group by k1.ROLEINFO) k2
         left join KEYUNIT_VISITOR k3 on k2.ROLEINFO = k3.ROLEINFO;

select count(1)
from KEYUNIT_VISITOR
where STATUS = '1';

select count(1)
from KEYUNIT_VISITOR
where CREATEDATE <= sysdate
  and CREATEDATE >= to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd hh24:mi:ss');

select count(1)
from KEYUNIT_VISITOR
where trunc(CREATEDATE) = trunc(sysdate);

select count(1) as count, to_char(trunc(CREATEDATE), 'yyyy-mm-dd') as day
from KEYUNIT_VISITOR
group by trunc(CREATEDATE);



select (select cnt from CODEDETAIL c where c.ID = a.GENDERCODE and c.TYPEID = 'GenderCode')      as gender,
       (select cnt from CODEDETAIL c where c.ID = a.KEYUNITID and c.TYPEID = 'KeyUnitAlarmType') as keyUnitAlarmType,
       r.ROLENAME,
       a.ID,
       a.KEYUNITID,
       a.NAME,
       a.CERTIFICATE,
       a.GENDERCODE,
       a.ADDRESS,
       a.ALARMTYPE,
       a.CERTIFICATEPHOTO,
       a.PHOTO,
       a.SIMILARITY,
       a.PERSONMINORCATEGORIES,
       a.CREATEDATE,
       a.AREACODE,
       a.AREANAME,
       a.POLICE,
       a.UPLOADDATE,
       a.UPLOADSTATUS,
       a.UPLOADMSG,
       a.ISDEAL,
       a.DEALNOTES,
       a.CREATETOR
from KEYUNIT_ALARM a
         left join ROLEINFO r on a.KEYUNITID = r.ROLEID
where a.CREATEDATE >= ''
  and a.CREATEDATE <= ''
  and a.KEYUNITID = ''
  and a.GENDERCODE = ''
  and a.CERTIFICATE = ''
  and a.NAME like '';


select *
from (select to_char(GXSJ, 'yyyy-mm-dd hh24:mi:ss') as time
      from ZCGL_DEVICE
      order by GXSJ asc)
where ROWNUM = 1;

select SBBM
from ZCGL_DEVICE
where GXSJ >= to_date('2021-07-05 14:03:58', 'yyyy-mm-dd hh24:mi:ss');

select a.HONOR, a.MEMO, a.id as honorid, b.*, (select c.NAME from SCOUTROOM c where b.ROOMID = c.ID) as room_txt
from scoutroom_person_honor a
         left join SCOUTROOM_PERSON b on a.PERSONID = b.ID
where 1 = 1
order by b.usernumber;

select count(*)
from ZCGL_DEVICE_SOURCE
where length(substr(to_char(JD), instr(to_char(JD), '.') + 1)) < 6
   or length(substr(to_char(WD), instr(to_char(WD), '.') + 1)) < 6;

update ZCGL_DEVICE_SOURCE
set ASSERTSTATUS = null;

update ZCGL_DEVICE_SOURCE
set CREATETIME = sysdate;

select SBBM,
       SBMC,
       JKDWLX,
       MACDZ,
       IP,
       SXJGNLX,
       JD,
       WD,
       SXJCJQY,
       SBZT,
       UPLOADUSER
from ZCGL_DEVICE_SOURCE
where ASSERTSTATUS is null
order by CREATETIME asc;

update SMS_AUTH
set AUTHTIME = sysdate
where ID = '31';

select JD, WD
from ZCGL_DEVICE_SOURCE;

delete
from ZCGL_DEVICE_SOURCE;

delete
from ZCGL_DEVICE;

select count(*)
from ZCGL_DEVICE_SOURCE
where ASSERTSTATUS = null;

select *
from ZCGL_DEVICE_SOURCE
where IP = '61.7.30.66';

select *
from sms_auth
where CREATOR != 'admin001@zjtek.com'
  and SCOPE = 2
union
select *
from SMS_AUTH
where CREATOR = 'admin001@zjtek.com';

select *
from (select id,
             phone,
             alias,
             certificate,
             to_char(authtime, 'yyyy-mm-dd hh24:mi:ss') as authtime,
             scope
      from sms_auth
      where CREATOR != 'admin001@zjtek.com'
        and SCOPE = 2
      union
      select id,
             phone,
             alias,
             certificate,
             to_char(authtime, 'yyyy-mm-dd hh24:mi:ss') as authtime,
             scope
      from SMS_AUTH
      where CREATOR = 'admin001@zjtek.com')
order by AUTHTIME desc;

SELECT *
FROM (SELECT m.*, ROWNUM RN
      FROM (select *
            from (select id, phone, alias, certificate, to_char(authtime, 'yyyy-mm-dd hh24:mi:ss') as authtime, scope
                  from sms_auth
                  where SCOPE = 2
                    and creator = 'admin001@zjtek.com'
                  union
                  select id, phone, alias, certificate, to_char(authtime, 'yyyy-mm-dd hh24:mi:ss') as authtime, scope
                  from SMS_AUTH
                  where 1 = 1
                    and creator = 'admin001@zjtek.com')
            order by AUTHTIME desc) m
      WHERE ROWNUM <= 20)
WHERE RN > 0;

select *
from ZCGL_DEVICE_SOURCE s
where s.ASSERTSTATUS = 200
  and s.SBBM not in (select SBBM from ZCGL_DEVICE);



insert into ZCGL_DEVICE (SBBM, SBMC, JKDWLX, IP, MACDZ, SXJGNLX,
                         JD, WD, SXJCJQY, SBZT)
values (select SBBM, SBMC, JKDWLX, IP, MACDZ, SXJGNLX,
                                     JD, WD, SXJCJQY, SBZT
from s
where s.ASSERTSTATUS = 200
  and s.SBBM not in (select SBBM from ZCGL_DEVICE));


insert into zcgl_device
(SBBM, SBMC, JKDWLX, IP, MACDZ, SXJGNLX,
 JD, WD, SXJCJQY, SBZT, GXSJ, RKSJ)
select SBBM,
       SBMC,
       JKDWLX,
       IP,
       MACDZ,
       SXJGNLX,
       JD,
       WD,
       SXJCJQY,
       SBZT,
       sysdate,
       sysdate
from zcgl_device_source s
where s.ASSERTSTATUS = 200
  and not exists(select 1 from zcgl_device z where z.sbbm = s.sbbm);

select *
from ZCGL_DEVICE_SOURCE
where IP = '61.24.47.113';

alter table ZCGL_DEVICE
    modify WD number(38, 11);

merge into ZCGL_DEVICE z1
using (select *
       from (select CREATETIME,
                    SBBM,
                    SBMC,
                    JKDWLX,
                    IP,
                    MACDZ,
                    SXJGNLX,
                    JD,
                    WD,
                    SXJCJQY,
                    SBZT,
                    row_number() over (partition by SBBM order by CREATETIME desc) as seq
             from ZCGL_DEVICE_SOURCE
             where ASSERTSTATUS = '200')
       where seq = 1) z2
on (z1.SBBM = z2.SBBM and z1.GXSJ < z2.CREATETIME)
when matched then
    update
    set z1.SBMC    = z2.SBMC,
        z1.JKDWLX  = z2.JKDWLX,
        z1.IP      = z2.IP,
        z1.MACDZ   = z2.MACDZ,
        z1.SXJGNLX = z2.SXJGNLX,
        z1.JD      = z2.JD,
        z1.WD      = z2.WD,
        z1.SXJCJQY = z2.SXJCJQY,
        z1.SBZT    = z2.SBZT,
        z1.TBZT    = null;

select CREATETIME,
       SBBM,
       SBMC,
       JKDWLX,
       IP,
       MACDZ,
       SXJGNLX,
       JD,
       WD,
       SXJCJQY,
       SBZT,
       row_number() over (partition by SBBM order by CREATETIME desc) as seq
from ZCGL_DEVICE_SOURCE
where SBBM = '61012299001310000028'
order by CREATETIME desc;

select *
from (select CREATETIME,
             SBBM,
             SBMC,
             JKDWLX,
             IP,
             MACDZ,
             SXJGNLX,
             JD,
             WD,
             SXJCJQY,
             SBZT,
             row_number() over (partition by SBBM order by CREATETIME desc) as seq
      from ZCGL_DEVICE_SOURCE
      where ASSERTSTATUS = '200')
where seq = 1;


select (select count(*)
        from ZCGL_DEVICE)           as formalCount,
       (select count(*)
        from ZCGL_DEVICE_SOURCE)    as pushCount,
       (select count(distinct SBBM)
        from ZCGL_DEVICE_SOURCE
        where ASSERTSTATUS = '200') as accurateCount
from DUAL;

select formalCount, pushCount, accurateCount, (pushCount - accurateCount) as inaccurateCount
from (select (select count(*)
              from ZCGL_DEVICE)           as formalCount,
             (select count(*)
              from ZCGL_DEVICE_SOURCE)    as pushCount,
             (select count(distinct SBBM)
              from ZCGL_DEVICE_SOURCE
              where ASSERTSTATUS = '200') as accurateCount
      from DUAL);

select substr(SBBM, 0, 4) as place, count(substr(SBBM, 0, 4)) as total
from ZCGL_DEVICE
group by substr(SBBM, 0, 4);

select substr(SBBM, 0, 4) as place, count(substr(SBBM, 0, 4)) as pushCount
from ZCGL_DEVICE_SOURCE
where ASSERTSTATUS = '200'
group by substr(SBBM, 0, 4);

select substr(SBBM, 0, 4)            as place,
       (select count(substr(SBBM, 0, 4))
        from ZCGL_DEVICE_SOURCE
        group by substr(SBBM, 0, 4)) as pushTotal,
       (select count(substr(SBBM, 0, 4))
        from ZCGL_DEVICE_SOURCE
        where ASSERTSTATUS = '200'
        group by substr(SBBM, 0, 4)) as accurateCount
from ZCGL_DEVICE_SOURCE
group by substr(SBBM, 0, 4);

select place,
       total,
       pushTotal,
       accurateCount,
       (pushTotal - accurateCount)         as inaccurateTotal,
       round(accurateCount / pushTotal, 2) as accurateRate
from (select substr(SBBM, 0, 4)            as place,
             (select count(SBBM)
              from ZCGL_DEVICE
              group by substr(SBBM, 0, 4)) as total,
             (select count(SBBM)
              from ZCGL_DEVICE_SOURCE
              group by substr(SBBM, 0, 4)) as pushTotal,
             (select count(distinct SBBM)
              from ZCGL_DEVICE_SOURCE
              where ASSERTSTATUS = '200'
              group by substr(SBBM, 0, 4)) as accurateCount
      from ZCGL_DEVICE_SOURCE
      group by substr(SBBM, 0, 4));

select count(distinct SBBM)
from ZCGL_DEVICE_SOURCE
where ASSERTSTATUS = '200'
group by substr(SBBM, 0, 6);

select substr(SBBM, 0, 4) as placeCode, count(*) as pushTotal
from ZCGL_DEVICE_SOURCE
where substr(SBBM, 0, 4) like '61%'
group by substr(SBBM, 0, 4);

select (select name from EQP_AREA where ID = rpad(placeCode, 6, 0)) as xzqyName,
       nvl(pushTotal, 0)
from (select substr(SBBM, 0, 4) as placeCode, count(*) as pushTotal
      from ZCGL_DEVICE_SOURCE
      where substr(SBBM, 0, 4) like '61%'
      group by substr(SBBM, 0, 4));

select (select name from EQP_AREA where ID = rpad(placeCode, 6, 0)) as xzqyName,
       placeCode,
       nvl(accurateCount, 0)                                        as accurateCount
from (select substr(SBBM, 0, 4) as placeCode, count(distinct SBBM) as accurateCount
      from ZCGL_DEVICE_SOURCE
      where substr(SBBM, 0, 4) like '61%'
      group by substr(SBBM, 0, 4));

with t1 as (select rpad(substr(SBBM, 0, 4), 6, 0) as placeCode, nvl(count(SBBM), 0) as pushTotal
            from ZCGL_DEVICE_SOURCE
            where substr(SBBM, 0, 4) like '61%'
            group by substr(SBBM, 0, 4)),
     t2 as (select rpad(substr(SBBM, 0, 4), 6, 0) as placeCode, nvl(count(distinct SBBM), 0) as accurateCount
            from ZCGL_DEVICE_SOURCE
            where substr(SBBM, 0, 4) like '61%'
            group by substr(SBBM, 0, 4)),
     t3 as (select count(*) as total, rpad(substr(SBBM, 0, 4), 6, 0) as placeCode
            from ZCGL_DEVICE
            where substr(SBBM, 0, 4) like '61%'
            group by substr(SBBM, 0, 4))
select name                                          as xzqyName,
       nvl(total, 0)                                 as total,
       nvl(pushTotal, 0)                             as pushTotal,
       nvl(accurateCount, 0)                         as accurateCount,
       nvl((pushTotal - accurateCount), 0)           as inaccurateTotal,
       nvl(round((accurateCount / pushTotal), 2), 0) as accurateRate
from (select e.NAME as name, t1.pushTotal, t2.accurateCount, t3.total
      from EQP_AREA e
               left join t1 on rpad(e.id, 6, 0) = t1.placeCode
               left join t2 on rpad(e.id, 6, 0) = t2.placeCode
               left join t3 on rpad(e.id, 6, 0) = t3.placeCode
      where ID like '61%'
        and length(ID) = 4);

select count(*)
from sms_auth
where phone in ('18912341234', '17312341234');

alter table ZCGL_DEVICE
    add TSSJ date;
update ZCGL_DEVICE
set TSSJ = sysdate
where TBZT = 1;

select IP
from ZCGL_DEVICE
where IP = '10.80.0.120'
  and SBBM != '61012299001310000028';


select *
from ZCGL_DEVICE;

select *
from ZCGL_DEVICE
where SBBM = '61012299001310000028'
  and SBMC = '政府门外1'
union
select *
from ZCGL_DEVICE
where SBBM = '61010257001310433276'
  and SBMC = '八府庄商业街八府活动中心全北';

select *
from ZCGL_DEVICE
where SXJGNLX like '%3/1%';

alter table zcgl_device_source
    modify ASSERTSTATUS varchar2(1000);

select MACDZ, instr(MACDZ, '8C')
from ZCGL_DEVICE_SOURCE;

select nvl(s.count, 0)                                                                as total,
       nvl(t.count, 0)                                                                as localCount,
       nvl((s.count - t.count), 0)                                                    as outSideCount,
       s.PEOPLETYPE                                                                   as peopleType,
       (select CNT from CODEDETAIL where TYPEID = 'PeopleType' and ID = s.PEOPLETYPE) as peopleTypeName
from (select count(*) as count, PEOPLETYPE
      from ZDRINFO
      group by PEOPLETYPE) s
         left join
     (select count(*) as count, PEOPLETYPE
      from ZDRINFO
      where instr(TAGS, '本地') > 0
      group by PEOPLETYPE) t on s.PEOPLETYPE = t.PEOPLETYPE;

alter table ZDRINFO
    MODIFY EDUCATION varchar2(2);

create table ZDRINFO
(
    ID             varchar2(20) primary key not null,
    IDNUMBER       VARCHAR2(20)             not null,
    NAME           VARCHAR2(60),
    GENDER         VARCHAR2(2),
    ETHNICITY      VARCHAR2(2),
    ATTENTIONLEVEL VARCHAR2(2),
    PEOPLETYPE     VARCHAR2(2),
    PHONE          VARCHAR2(20),
    BIRTH          VARCHAR2(20),
    ADDRESS        VARCHAR2(1000),
    POLICETYPE     VARCHAR2(2),
    EDUCATION      VARCHAR2(2),
    OCCUPATION     VARCHAR2(1000),
    DUTYUNIT       VARCHAR2(1000),
    POLICE         VARCHAR2(20),
    POLICEPHONE    VARCHAR2(100),
    CREATETIME     DATE        default sysdate,
    UPDATETIME     DATE,
    PHOTO          CLOB,
    TAGS           VARCHAR2(1000),
    ISDELETE       VARCHAR2(2) default 0
);

comment on column ZDRINFO.ID is '主键ID';
comment on column ZDRINFO.IDNUMBER is '证件号码';
comment on column ZDRINFO.NAME is '姓名';
comment on column ZDRINFO.GENDER is '性别';
comment on column ZDRINFO.ETHNICITY is '民族';
comment on column ZDRINFO.ATTENTIONLEVEL is '关注级别';
comment on column ZDRINFO.PEOPLETYPE is '人员类别';
comment on column ZDRINFO.PHONE is '联系方式';
comment on column ZDRINFO.BIRTH is '出生日期';
comment on column ZDRINFO.ADDRESS is '户籍地址';
comment on column ZDRINFO.POLICETYPE is '责任民警';
comment on column ZDRINFO.EDUCATION is '文化程度';
comment on column ZDRINFO.OCCUPATION is '职业';
comment on column ZDRINFO.DUTYUNIT is '责任单位';
comment on column ZDRINFO.POLICE is '责任民警';
comment on column ZDRINFO.POLICEPHONE is '民警联系方式';
comment on column ZDRINFO.CREATETIME is '创建时间';
comment on column ZDRINFO.UPDATETIME is '更新时间';
comment on column ZDRINFO.PHOTO is '照片';
comment on column ZDRINFO.TAGS is '标签';
comment on column ZDRINFO.ISDELETE is '是否删除 1已删除 0未删除';

drop table VISITRECORD;

create table VISITRECORD
(
    ID         varchar2(20) primary key not null,
    ZDRID      varchar2(20),
    SUPERVISOR varchar2(100),
    ADDRESS    varchar2(1000),
    CONTENT    varchar2(4000),
    VISITTIME  DATE default sysdate
);

comment on column VISITRECORD.ID is '主键ID';
comment on column VISITRECORD.ZDRID is '重点人ID';
comment on column VISITRECORD.SUPERVISOR is '负责人';
comment on column VISITRECORD.ADDRESS is '地点';
comment on column VISITRECORD.CONTENT is '内容';
comment on column VISITRECORD.VISITTIME is '时间';


select *
from CODEDETAIL
where TYPEID = 'Tags';

select wm_concat(c.CNT) as cnt
from ZDRINFO z,
     CODEDETAIL c
where z.ID = '2002'
  and c.TYPEID = 'Tags'
  and instr(',' || z.TAGS || ',', ',' || c.ID || ',') > 0;

select z.ID,
       z.IDNUMBER,
       z.NAME,
       z.GENDER,
       z.ETHNICITY,
       z.ATTENTIONLEVEL,
       z.PEOPLETYPE,
       z.PHONE,
       z.BIRTH,
       z.ADDRESS,
       z.POLICETYPE,
       z.EDUCATION,
       z.OCCUPATION,
       z.DUTYUNIT,
       z.POLICE,
       z.POLICEPHONE,
       z.CREATETIME,
       z.UPDATETIME,
       z.PHOTO,
       z.TAGS,
       z.ISDELETE,
       (select CNT from CODEDETAIL where TYPEID = 'GenderCode' and ID = z.GENDER)             as genderName,
       (select CNT from CODEDETAIL where TYPEID = 'EthicCode' and ID = z.ETHNICITY)           as ethnicityName,
       (select CNT from CODEDETAIL where TYPEID = 'AttentionLevel' and ID = z.ATTENTIONLEVEL) as attentionLevelName,
       (select CNT from CODEDETAIL where TYPEID = 'PeopleType' and ID = z.PEOPLETYPE)         as peopleTypeName,
       (select CNT from CODEDETAIL where TYPEID = 'PoliceType' and ID = z.POLICETYPE)         as policeTypeName,
       (select CNT from CODEDETAIL where TYPEID = 'Education' and ID = z.EDUCATION)           as educationName,
       (select wm_concat(c.CNT)
        from CODEDETAIL c
        where c.TYPEID = 'Tags'
          and instr(',' || z.TAGS || ',', ',' || c.ID || ',') > 0
       )                                                                                      as tagName,
       (select count(*) from jqInfo where jqbh = ID)                                          as issueCount
from ZDRINFO z;

select JQBH
from JQFOLLOW
where FOLLOWER = 'admin001@zjtek.com';

select count(*) as count
from ZDRINFO
where ISDELETE = 1
union all
select count(*) as count
from ZDRINFO
where exists(select JQBH
             from JQFOLLOW
             where FOLLOWER = 'admin001@zjtek.com'
               and ID = JQBH);

drop table ZDRJQINFO;

create table ZDRJQINFO
(
    ZDRID    varchar2(20),
    JQINFOID varchar2(20),
    CONSTRAINT ZDR_JQ PRIMARY KEY (ZDRID, JQINFOID)
);

comment on column ZDRJQINFO.ZDRID is '重点人Id';
comment on column ZDRJQINFO.JQINFOID is '警情Id';


select *
from JQINFO j
where exists(select 1
             from (select JQINFOID
                   from ZDRJQINFO
                   where ZDRID = '2002') z
             where j.ID = z.JQINFOID);

insert into ZDRJQINFO (ZDRID, JQINFOID)
VALUES ('3001', '5001');

select *
from ZDRINFO
where EXISTS(select 1 from JQFOLLOW where FOLLOWER = 'admin001@zjtek.com' and ID = JQBH);

select wm_concat(c.CNT)
from CODEDETAIL c
where c.TYPEID = 'Tags'
  and instr(',' || '1,2' || ',', ',' || c.ID || ',') > 0;

select wm_concat(c.CNT)
from CODEDETAIL c
where c.TYPEID = 'Tags'
  and instr(',' || '1,2' || ',', ',' || c.ID || ',') > 0;

select wm_concat(c.ID)
from CODEDETAIL c
where instr(',' || '重点,一般' || ',', ',' || c.CNT || ',') > 0;

select ID,
       IDNUMBER,
       NAME,
       GENDER,
       ETHNICITY,
       ATTENTIONLEVEL,
       PEOPLETYPE,
       PHONE,
       BIRTH,
       ADDRESS,
       POLICETYPE,
       EDUCATION,
       OCCUPATION,
       DUTYUNIT,
       POLICE,
       POLICEPHONE,
       CREATETIME,
       UPDATETIME,
       PHOTO,
       TAGS,
       ISDELETE
from ZDRINFO;

select j.*,
       (select CNT from codedetail c where c.ID = j.DEAL and TYPEID = 'jqInfoDeal')   dealcn,
       (select CNT from codedetail c where c.ID = j.JQLBDM and TYPEID = 'jqInfoJqLb') jqlbCN,
       (select CNT from codedetail c where c.ID = j.JQLXDM and TYPEID = 'jqInfoJqLx') JqlxCN,
       (select CNT from codedetail c where c.ID = j.JQXLDM and TYPEID = 'jqInfoJqXl') jqxlCN,
       decode(STATUS, 0, '未结', 1, '已结')                                               statuscn
from JQINFO j
where not exists(select JQINFOID
                 from ZDRJQINFO
                 where ZDRID = '4001'
                   and j.ID = JQINFOID)
order by CREATETIME desc;

delete
from ZCGL_DEVICE;

update ZCGL_DEVICE
set TBZT = '11'
where TBZT = '2';
commit;

update ZCGL_DEVICE
set TBZT = '2',
    SBZT = '2'
where substr(SBBM, 0, 2) != '61';

select *
from ZCGL_DEVICE
where TBZT is null
   or to_number(TBZT) < 10;

select *
from ZCGL_DEVICE
where instr('/' || 'A0101/A0102' || '/', '/' || ZCGL_DEVICE.SXJCJQY || '/') > 0;

create table KEYDEVICE
(
    SBBM         varchar2(20) primary key not null,
    REPORTSTATUS varchar2(2) default '0',
    CREATETIME   date        default sysdate,
    REPORTTIME   date
);

drop table KEYDEVICE;

-- 新增重点设备查询
select *
from ZCGL_DEVICE z
where to_number(z.TBZT) > 10
  and instr('/' || 'A0101/A0102' || '/', '/' || z.SXJCJQY || '/') > 0
  and not exists(select SBBM from KEYDEVICE k where z.SBBM = k.SBBM);

-- 重点设备管理查询
select k.REPORTSTATUS,
       k.REPORTTIME,
       z.*,
       (select instr('/' || 'A0101/A0102' || '/', '/' || z.SXJCJQY || '/') from DUAL) as isKeyDevice
from KEYDEVICE k
         left join ZCGL_DEVICE z on k.SBBM = z.SBBM;

select *
from KEYDEVICE
where REPORTSTATUS = '0';