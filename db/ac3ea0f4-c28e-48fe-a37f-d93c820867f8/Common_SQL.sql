select *
from COMMONUSERGROUP
where GROUPID = '4341940';


select *
from COMMONUSERGROUP
where GROUPID = '4341940';


select *
from GEUSERDOM g
where g.USERID in (select c.USERID
                   from COMMONUSERGROUP c
                   where GROUPID = '4341940');


select *
from GEUSERDOM g
where exists(select 1
             from COMMONUSERGROUP c
             where g.USERID = c.USERID
               and c.GROUPID = '4341940');


select g.USERID, g.EMAILADDR, g.USERNAME
from GEUSERDOM g
where exists(select 1
             from COMMONUSERGROUP c
             where g.USERID = c.USERID
               and c.GROUPID = '4341940')
  and g.ROLEID = ''
  and g.EMAILADDR like '%001%'
  and g.USERNAME like '%001%';


select g.USERID, g.EMAILADDR, g.USERNAME
from GEUSERDOM g
where exists(select 1
             from COMMONUSERGROUP c
             where g.USERID = c.USERID
               and c.GROUPID != '4341940')
  and g.ROLEID != ''
  and g.EMAILADDR not like ''
  and g.USERNAME not like '';


select count(1)
from (select g.USERID, g.EMAILADDR, g.USERNAME
      from GEUSERDOM g
      where exists(select 1
                   from COMMONUSERGROUP c
                   where g.USERID = c.USERID
                     and c.GROUPID = '4341940'));


select g.USERID, g.EMAILADDR, g.USERNAME
from GEUSERDOM g
where exists(select 1
             from COMMONUSERGROUP c
             where g.USERID = c.USERID
               and c.GROUPID != '4341940')
  and (g.EMAILADDR like '%001%' or g.USERNAME like '%001%');


select *
from COMMONUSERGROUP
where GROUPID = '4341940'
  and USERID in ('123', '456', '789');



select *
from COMMONGROUP
where GROUPNAME = '路桥区';

select g.USERID, g.EMAILADDR, g.USERNAME
from GEUSERDOM g
where exists(select 1
             from COMMONUSERGROUP c
             where g.USERID = c.USERID
               and c.GROUPID != '8001')
  and (g.EMAILADDR like '%001%' or g.USERNAME like '%001%');

select *
from GEUSERDOM
where EMAILADDR like 'admin%';

select *
from ROLEINFO
where ROLEID = '330000000000000001';

select *
from ROLEINFO
where ROLENAME like '路%';

select ID,
       HEADLINE,
       CNT,
       PHOTOID,
       BAKPHOTOID,
       PUBLISHER,
       PUBLISHTIME,
       EXPIREDTIME,
       SEVERITYLEVEL,
       PUBLISHERNAME,
       ROLENAME,
       CONTACT,
       PUBLISHSCOPE,
       ISLOGINSHOW,
       CASEID,
       CASESOURCE,
       CONTACTER,
       BULLETINTYPE,
       ISENABLE,
       CHECKEDFLAG,
       CHECKEDUSERID,
       CHECKEDUSERNAME,
       RECEIVER,
       CONTENT
from BULLETIN
where id = '3926241';

delete
from BULLETIN
where ID = '3926241';

select *
from COMMONUSERGROUP
where USERID = '330000000000000001';

select *
from ROLEINFO
where ROLEID = '330000000000000001';

select ROLEID
from ROLEINFO
where FULLPATH like '330000000000000001%';

select id,
       headline,
       cnt,
       photoid,
       bakphotoid,
       publisher,
       publishtime,
       expiredtime,
       severitylevel,
       publishername,
       rolename,
       contact,
       publishscope,
       isloginshow,
       content,
       caseid,
       casesource,
       contacter,
       bulletintype,
       isenable,
       checkedflag,
       checkeduserid,
       checkedusername,
       receiver
from BULLETIN b
where exists(select 1
             from ROLEINFO r1
             where b.PUBLISHSCOPE = r1.ROLEID
               and r1.FULLPATH like
                   (select r2.FULLPATH from ROLEINFO r2 where r2.ROLEID = '330000000000000001') || '%')
  and b.EXPIREDTIME >= sysdate
order by b.PUBLISHTIME desc;

select DOMAINID
from SYSTEMSTOREPATHCONFIG;

select *
from v$reserved_words

where keyword in (
    select COLUMN_NAME
    from all_tab_columns

    where table_name = 'SYSTEMSTOREPATHCONFIG');

insert into SYSTEMSTOREPATHCONFIG (STORAGEAREAID, DOMAINID, PATH)
VALUES ('111', '123', '1234');

select *
from v$reserved_words
ORDER BY KEYWORD ASC;

select *
from ROLEINFO
where ROLEID = '330000000000000001';

select s.GROUPID,
       s.GROUPNAME,
       s.STORAGEAREAID,
       s.BAKSTORAGEAREAID,
       s.ISENABLE,
       r.ROLENAME as RoleID,
       s.CREATER,
       s.CREATEDATE,
       s.MEMO
from SYSTEMSTOREPATHGROUP s,
     ROLEINFO r
where s.GROUPNAME like ''
  and s.ISENABLE = ''
  and s.ROLEID = r.ROLEID;

select STORAGEAREAID,
       DOMAINID,
       PATH,
       WEIGHT,
       BACKFLAG,
       FTPIP,
       FTPPORT,
       FTPUSER,
       FTPPASSWORD,
       FTPSTATUS,
       ROLEID,
       REMARK,
       CREATER,
       CREATEDATE,
       STORETYPE,
       LASTCONNTIME
from SYSTEMSTOREPATHCONFIG
where STORAGEAREAID = '28';

select t2.NAME,
       t2.IDNUMBER,
       t2.ZDRLAB,
       t2.GKSY,
       t2.ZDR_IMAGEDATA,
       t2.ZDR_STORAGEPATH,
       t2.PLACECODE,
       t2.PLACECODENAME,
       t2.LONGITUDE,
       t2.LATITUDE
from TBL_VIID_ZDR_FOOTPOINT t1
         inner join TBL_VIID_ZDR_FOOTPOINT t2
                    on t1.ZDRID in ('3_2020103014402200001') and t1.ZDRID = t2.ZDRID and
                       t2.IDNUMBER = '619932198612070919';

select *
from TBL_VIID_ZDR_FOOTPOINT
where ZDRID in ('1_2020103014402200001', '3_2020103014402200001')
  and IDNUMBER = '619932198612070919';

select ID
from TBL_VIID_ZDR_FOOTPOINT
where ZDRID in ('1_2020103014402200001', '3_2020103014402200001');

select *
from TBL_VIID_ZDR_FOOTPOINT t1,
     (select SHOTTIME, LATITUDE, LONGITUDE
      from TBL_VIID_ZDR_FOOTPOINT
      where ZDRID in ('3_2020103014402200001')) t2
where t1.SHOTTIME = t2.SHOTTIME
  and TRIGGERTIME >= to_date('2021-01-03 10:32:14', 'yyyy-mm-dd hh24:mi:ss');

select distinct t2.ZDRID
from TBL_VIID_ZDR_FOOTPOINT t1
         right outer join TBL_VIID_ZDR_FOOTPOINT t2
                          on t1.ZDRID in ('1_2020103014402200001') and
                             t1.SHOTTIME >= to_date('2021-01-02 10:32:14', 'yyyy-mm-dd hh24:mi:ss')
                              and t1.SHOTTIME <= to_date('2021-01-04 10:32:14', 'yyyy-mm-dd hh24:mi:ss')
                              and t1.LONGITUDE = 123.220000 and t1.LATITUDE = 123.220000 and
                             t1.SHOTTIME = t2.SHOTTIME and
                             t1.LATITUDE = t2.LATITUDE and t1.LONGITUDE = t2.LONGITUDE;


select distinct t1.ID, t1.ZDRID, t1.SHOTTIME, t1.DEVICEID
from TBL_VIID_ZDR_FOOTPOINT t1,
     (select distinct ZDRID, SHOTTIME, DEVICEID
      from TBL_VIID_ZDR_FOOTPOINT
      where ZDRID in ('1_2020103014402200001')) t3
where t3.SHOTTIME = t1.SHOTTIME
  and t3.DEVICEID = t1.DEVICEID
  and t1.SHOTTIME >= t3.SHOTTIME - 10 / (1 * 24 * 60 * 60)
  and t1.SHOTTIME <= t3.SHOTTIME + 10 / (1 * 24 * 60 * 60)
  and exists(select 1 from TBL_VIID_ZDR_BASICINFO t5 where t1.ZDRID = t5.ZDRID and t5.RKLX = '');

select t2.ID,
       t2.TRIGGERTIME,
       t2.RXSFYQID,
       t2.ZDRID,
       t2.NAME,
       t2.IDNUMBER,
       t2.ZDRLAB,
       t2.GKSY,
       t2.ZDR_IMAGEDATA,
       t2.ZDR_STORAGEPATH,
       t2.DEVICEID,
       t2.DEVICENAME,
       t2.PLACECODE,
       t2.PLACECODENAME,
       t2.SIMILARITYDEGREE,
       t2.SHOTTIME,
       t2.SMALLIMAGEID,
       t2.SMALLIMAGEDATA,
       t2.SMALLIMAGESTORAGEPATH,
       t2.BIGIMAGEID,
       t2.BIGIMAGEDATA,
       t2.BIGIMAGESTORAGEPATH,
       t2.DISPOSITIONID,
       t2.TITLE,
       t2.ALARMID,
       t2.ISPUSH,
       t2.FACEID,
       t2.NOTIFICATIONID,
       t2.LONGITUDE,
       t2.LATITUDE,
       t2.VIIDSERVERID
from TBL_VIID_ZDR_FOOTPOINT t2,
     (select distinct t1.ID, t1.ZDRID, t1.SHOTTIME, t1.DEVICEID
      from TBL_VIID_ZDR_FOOTPOINT t1,
           (select ZDRID, SHOTTIME, DEVICEID
            from TBL_VIID_ZDR_FOOTPOINT
            where ZDRID in ('1_2020103014402200001')) t3
      where t3.SHOTTIME = t1.SHOTTIME
        and t3.DEVICEID = t1.DEVICEID
        and t1.SHOTTIME >= (t3.SHOTTIME + INTERVAL '-1' SECOND)
        and t1.SHOTTIME <= (t3.SHOTTIME + INTERVAL '1' SECOND)) t4
where t2.ID = t4.ID;


select distinct t1.ID, t1.ZDRID, t1.SHOTTIME, t1.DEVICEID
from TBL_VIID_ZDR_FOOTPOINT t1,
     (select distinct ZDRID, SHOTTIME, DEVICEID
      from TBL_VIID_ZDR_FOOTPOINT
      where ZDRID in ('1_2020103014402200001')) t3
where t3.SHOTTIME = t1.SHOTTIME
  and t3.DEVICEID = t1.DEVICEID
  and t1.SHOTTIME >= t3.SHOTTIME - 10 / (1 * 24 * 60 * 60)
  and t1.SHOTTIME <= t3.SHOTTIME + 10 / (1 * 24 * 60 * 60);

select distinct t5.ZDRID, t5.RKLX
from TBL_VIID_ZDR_BASICINFO t5,
     (select distinct t1.ID, t1.ZDRID, t1.SHOTTIME, t1.DEVICEID
      from TBL_VIID_ZDR_FOOTPOINT t1,
           (select distinct ZDRID, SHOTTIME, DEVICEID
            from TBL_VIID_ZDR_FOOTPOINT
            where ZDRID in ('3_2020103014402200001')) t3
      where t3.SHOTTIME = t1.SHOTTIME
        and t3.DEVICEID = t1.DEVICEID
        and t1.SHOTTIME >= t3.SHOTTIME - 10 / (1 * 24 * 60 * 60)
        and t1.SHOTTIME <= t3.SHOTTIME + 10 / (1 * 24 * 60 * 60)) t6
where t6.ZDRID = t5.ZDRID;

select distinct t1.ZDRID, t1.SHOTTIME, t1.DEVICEID
from TBL_VIID_ZDR_FOOTPOINT t1,
     (select distinct t2.ZDRID, t2.SHOTTIME, t2.DEVICEID
      from TBL_VIID_ZDR_FOOTPOINT t2
      where ZDRID in ('3_2020103014402200001')) t3
where t3.SHOTTIME = t1.SHOTTIME
  and t3.DEVICEID = t1.DEVICEID
  and t1.SHOTTIME >= (t3.SHOTTIME + INTERVAL '-1' SECOND)
  and t1.SHOTTIME <= (t3.SHOTTIME + INTERVAL '1' SECOND);


select t4.RKLX, t5.*
from TBL_VIID_ZDR_BASICINFO t4,
     (select t1.*
      from TBL_VIID_ZDR_FOOTPOINT t1,
           (select distinct t2.ZDRID, t2.SHOTTIME, t2.DEVICEID
            from TBL_VIID_ZDR_FOOTPOINT t2
            where ZDRID in ('3_2020103014402200001')) t3
      where t3.SHOTTIME = t1.SHOTTIME
        and t3.DEVICEID = t1.DEVICEID
        and t1.SHOTTIME >= (t3.SHOTTIME + INTERVAL '-5' SECOND)
        and t1.SHOTTIME <= (t3.SHOTTIME + INTERVAL '5' SECOND)
        and t1.ZDRID != t3.ZDRID
        and t1.NAME = ''
        and t1.IDNUMBER = ''
        and t1.TRIGGERTIME >= ''
        and t1.TRIGGERTIME <= ''
        and exists(select 1 from TBL_VIID_ZDR_BASICINFO t6 where t1.ZDRID = t6.ZDRID and t6.RKLX = '')) t5
where t5.ZDRID = t4.ZDRID;

select t1.ID                    as togetherId,
       t1.TRIGGERTIME           as togetherTriggerTime,
       t1.RXSFYQID              as togetherRxsfyqId,
       t1.ZDRID                 as togetherDocId,
       t1.NAME                  as togetherName,
       t1.IDNUMBER              as togetherIdNumber,
       t1.ZDRLAB                as togetherZdrLab,
       t1.GKSY                  as togetherGksy,
       t1.ZDR_IMAGEDATA         as togetherZdrImageData,
       t1.ZDR_STORAGEPATH       as togetherPhotoUrl,
       t1.DEVICEID              as togetherDeviceId,
       t1.DEVICENAME            as togetherDeviceName,
       t1.PLACECODE             as togetherPlaceCode,
       t1.PLACECODENAME         as togetherPlaceCodeName,
       t1.SIMILARITYDEGREE      as togetherSimilarityDegeree,
       t1.SHOTTIME              as togetherAlarmTime,
       t1.SMALLIMAGEID          as togetherSmallImageId,
       t1.SMALLIMAGEDATA        as togetherSmallImageData,
       t1.SMALLIMAGESTORAGEPATH as togetherFaceUrl,
       t1.BIGIMAGEID            as togetherBigImageId,
       t1.BIGIMAGEDATA          as togetherBigImageData,
       t1.BIGIMAGESTORAGEPATH   as togetherSenseUrl,
       t1.DISPOSITIONID         as togetherDispositonId,
       t1.TITLE                 as togetherTitle,
       t1.ALARMID               as togetherAlarmId,
       t1.ISPUSH                as togetherIsPush,
       t1.FACEID                as togetherFaceId,
       t1.NOTIFICATIONID        as togetherNotificationId,
       t1.LONGITUDE             as togetherLongtitude,
       t1.LATITUDE              as togetherLatitude,
       t1.VIIDSERVERID          as togetherViidServerId,
       t3.ID                    as id,
       t3.TRIGGERTIME           as triggerTime,
       t3.RXSFYQID              as rxsfyqId,
       t3.ZDRID                 as docId,
       t3.NAME                  as name,
       t3.IDNUMBER              as idNumber,
       t3.ZDRLAB                as zdrLab,
       t3.GKSY                  as gksy,
       t3.ZDR_IMAGEDATA         as zdrImageData,
       t3.ZDR_STORAGEPATH       as photoUrl,
       t3.DEVICEID              as deviceId,
       t3.DEVICENAME            as deviceName,
       t3.PLACECODE             as placeCode,
       t3.PLACECODENAME         as placeCodeName,
       t3.SIMILARITYDEGREE      as similarityDegeree,
       t3.SHOTTIME              as alarmTime,
       t3.SMALLIMAGEID          as smallImageId,
       t3.SMALLIMAGEDATA        as smallImageData,
       t3.SMALLIMAGESTORAGEPATH as faceUrl,
       t3.BIGIMAGEID            as bigImageId,
       t3.BIGIMAGEDATA          as bigImageData,
       t3.BIGIMAGESTORAGEPATH   as senseUrl,
       t3.DISPOSITIONID         as dispositonId,
       t3.TITLE                 as title,
       t3.ALARMID               as alarmId,
       t3.ISPUSH                as isPush,
       t3.FACEID                as faceId,
       t3.NOTIFICATIONID        as notificationId,
       t3.LONGITUDE             as longtitude,
       t3.LATITUDE              as latitude,
       t3.VIIDSERVERID          as viidServerId
from TBL_VIID_ZDR_FOOTPOINT t1,
     (select t2.*
      from TBL_VIID_ZDR_FOOTPOINT t2
      where ZDRID in ('3_2020103014402200001', '5_2020103014402200001')
        and t2.SHOTTIME >= to_date('2020-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
        and t2.SHOTTIME <= to_date('2021-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')) t3
where t3.ZDRID != t1.ZDRID
  and t3.DEVICEID = t1.DEVICEID
  and t1.SHOTTIME >= (t3.SHOTTIME + INTERVAL '-5' SECOND)
  and t1.SHOTTIME <= (t3.SHOTTIME + INTERVAL '5' SECOND);



select (select cnt
        from CODEDETAIL c
        where c.ID = t8.togetherPeopleType
          and c.TYPEID = 'RKLX')                                                       as togetherPeopleTypeName,
       (select cnt from CODEDETAIL c where c.ID = t8.peopleType and c.TYPEID = 'RKLX') as peopleTypeName,
       (select cnt
        from CODEDETAIL c
        where c.ID = t8.togetherAttentionLevel
          and c.TYPEID = 'GZJB')                                                       as togetherAttentionLevelName,
       (select cnt
        from CODEDETAIL c
        where c.ID = t8.peopleAttentionLevel
          and c.TYPEID = 'GZJB')                                                       as peopleAttentionLevelName,
       t8.*
from (select t6.RKLX as peopleType, t6.XP as peoplePhoto, t6.GZJB as peopleAttentionLevel, t7.*
      from TBL_VIID_ZDR_BASICINFO t6,
           (select t4.RKLX as togetherPeopleType, t4.XP as togetherPeoplePhoto, t4.GZJB as togetherAttentionLevel, t5.*
            from TBL_VIID_ZDR_BASICINFO t4,
                 (select t1.ID                    as togetherId,
                         t1.TRIGGERTIME           as togetherTriggerTime,
                         t1.RXSFYQID              as togetherRxsfyqId,
                         t1.ZDRID                 as togetherDocId,
                         t1.NAME                  as togetherName,
                         t1.IDNUMBER              as togetherIdNumber,
                         t1.ZDRLAB                as togetherZdrLab,
                         t1.GKSY                  as togetherGksy,
                         t1.ZDR_IMAGEDATA         as togetherZdrImageData,
                         t1.ZDR_STORAGEPATH       as togetherPhotoUrl,
                         t1.DEVICEID              as togetherDeviceId,
                         t1.DEVICENAME            as togetherDeviceName,
                         t1.PLACECODE             as togetherPlaceCode,
                         t1.PLACECODENAME         as togetherPlaceCodeName,
                         t1.SIMILARITYDEGREE      as togetherSimilarityDegeree,
                         t1.SHOTTIME              as togetherAlarmTime,
                         t1.SMALLIMAGEID          as togetherSmallImageId,
                         t1.SMALLIMAGEDATA        as togetherSmallImageData,
                         t1.SMALLIMAGESTORAGEPATH as togetherFaceUrl,
                         t1.BIGIMAGEID            as togetherBigImageId,
                         t1.BIGIMAGEDATA          as togetherBigImageData,
                         t1.BIGIMAGESTORAGEPATH   as togetherSenseUrl,
                         t1.DISPOSITIONID         as togetherDispositonId,
                         t1.TITLE                 as togetherTitle,
                         t1.ALARMID               as togetherAlarmId,
                         t1.ISPUSH                as togetherIsPush,
                         t1.FACEID                as togetherFaceId,
                         t1.NOTIFICATIONID        as togetherNotificationId,
                         t1.LONGITUDE             as togetherLongtitude,
                         t1.LATITUDE              as togetherLatitude,
                         t1.VIIDSERVERID          as togetherViidServerId,
                         t3.ID                    as id,
                         t3.TRIGGERTIME           as triggerTime,
                         t3.RXSFYQID              as rxsfyqId,
                         t3.ZDRID                 as docId,
                         t3.NAME                  as name,
                         t3.IDNUMBER              as idNumber,
                         t3.ZDRLAB                as zdrLab,
                         t3.GKSY                  as gksy,
                         t3.ZDR_IMAGEDATA         as zdrImageData,
                         t3.ZDR_STORAGEPATH       as photoUrl,
                         t3.DEVICEID              as deviceId,
                         t3.DEVICENAME            as deviceName,
                         t3.PLACECODE             as placeCode,
                         t3.PLACECODENAME         as placeCodeName,
                         t3.SIMILARITYDEGREE      as similarityDegeree,
                         t3.SHOTTIME              as alarmTime,
                         t3.SMALLIMAGEID          as smallImageId,
                         t3.SMALLIMAGEDATA        as smallImageData,
                         t3.SMALLIMAGESTORAGEPATH as faceUrl,
                         t3.BIGIMAGEID            as bigImageId,
                         t3.BIGIMAGEDATA          as bigImageData,
                         t3.BIGIMAGESTORAGEPATH   as senseUrl,
                         t3.DISPOSITIONID         as dispositonId,
                         t3.TITLE                 as title,
                         t3.ALARMID               as alarmId,
                         t3.ISPUSH                as isPush,
                         t3.FACEID                as faceId,
                         t3.NOTIFICATIONID        as notificationId,
                         t3.LONGITUDE             as longtitude,
                         t3.LATITUDE              as latitude,
                         t3.VIIDSERVERID          as viidServerId
                  from TBL_VIID_ZDR_FOOTPOINT t1,
                       (select t2.*
                        from TBL_VIID_ZDR_FOOTPOINT t2
                        where ZDRID in ('5_2020103014402200001')
                          and t2.SHOTTIME >= to_date('2019-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
                          and t2.SHOTTIME <= to_date('2021-09-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
                       ) t3
                  where t3.ZDRID != t1.ZDRID
                    and t3.DEVICEID = t1.DEVICEID
                    and t1.SHOTTIME >= (t3.SHOTTIME + INTERVAL '-5' SECOND)
                    and t1.SHOTTIME <= (t3.SHOTTIME + INTERVAL '5' SECOND)
                 ) t5
            where t5.togetherDocId = t4.ZDRID) t7
      where t7.docId = t6.ZDRID) t8
where t8.peopleType = '1';


select *
from TBL_VIID_ZDR_FOOTPOINT
where ID = '1100000000000220200103103214100012020121110371200000006';



select *
from TBL_VIID_ZDR_FOOTPOINT t1,
     (select t2.*
      from TBL_VIID_ZDR_FOOTPOINT t2
      where ZDRID in ('5_2020103014402200001')
        and t2.SHOTTIME >= to_date('2020-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
        and t2.SHOTTIME <= to_date('2021-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')) t3
where t3.ZDRID != t1.ZDRID
  and t3.DEVICEID = t1.DEVICEID
  and t1.SHOTTIME >= (t3.SHOTTIME + INTERVAL '-5' SECOND)
  and t1.SHOTTIME <= (t3.SHOTTIME + INTERVAL '5' SECOND);



select *
from TBL_VIID_ZDR_FOOTPOINT
where ZDRID in ('3_2020103014402200001', '5_2020103014402200001')
  and SHOTTIME >= to_date('2020-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
  and SHOTTIME <= to_date('2020-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss');



select t4.RKLX, t5.*
from TBL_VIID_ZDR_BASICINFO t4,
     (select t2.*
      from TBL_VIID_ZDR_FOOTPOINT t2
      where ZDRID in ('3_2020103014402200001', '5_2020103014402200001')
        and t2.SHOTTIME >= to_date('2020-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
        and t2.SHOTTIME <= to_date('2021-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
        and exists(select 1 from TBL_VIID_ZDR_BASICINFO t6 where t2.ZDRID = t6.ZDRID and t6.RKLX = '1')
     ) t5
where t5.ZDRID = t4.ZDRID;



select t1.*
from TBL_VIID_ZDR_FOOTPOINT t1,
     (select distinct t2.ZDRID, t2.SHOTTIME, t2.DEVICEID
      from TBL_VIID_ZDR_FOOTPOINT t2
      where ZDRID in ('3_2020103014402200001', '5_2020103014402200001')) t3
where t3.DEVICEID = t1.DEVICEID
  and t1.ZDRID != t3.ZDRID
  and t1.SHOTTIME >= (t3.SHOTTIME + INTERVAL '-5' SECOND)
  and t1.SHOTTIME <= (t3.SHOTTIME + INTERVAL '5' SECOND);


select t1.*
from TBL_VIID_ZDR_PERSONDOC t1
where t1.ZDRID in ('3_2020103014402200001')
  and exists(select 1 from TBL_VIID_ZDR_BASICINFO t2 where t1.ZDRID = t2.ZDRID and t2.RKLX = '1');

select *
from TBL_VIID_ZDR_PERSONDOC t3
where t3.PROFILEID in (select t1.PROFILEID
                       from TBL_VIID_ZDR_PERSONDOC t1
                       where t1.ZDRID in ('3_2020103014402200001')
                         and exists(
                               select 1 from TBL_VIID_ZDR_BASICINFO t2 where t1.ZDRID = t2.ZDRID and t2.RKLX = '1'));

select t3.*
from TBL_VIID_ZDR_BASICINFO t3
where exists(select 1
             from (select t1.*
                   from TBL_VIID_ZDR_PERSONDOC t1
                   where t1.ZDRID in ('2_2020103014402200001', '3_2020103014402200001', '4_2020103014402200001',
                                      '5_2020103014402200001')
                     and exists(select 1 from TBL_VIID_ZDR_BASICINFO t2 where t1.ZDRID = t2.ZDRID and t2.RKLX = '1')) t4
             where t3.ZDRID = t4.ZDRID);



select e.NAME, t2.XM, t1.*
from TBL_VIID_ZDR_PERSONDOC t1
         inner join TBL_VIID_ZDR_BASICINFO t2 on t1.ZDRID = t2.ZDRID and t1.ZDRID in
                                                                         ('2_2020103014402200001',
                                                                          '3_2020103014402200001',
                                                                          '4_2020103014402200001',
                                                                          '5_2020103014402200001') and
                                                 t2.RKLX = '1'
         left join EQP_AREA e on t1.RESIDENCEADMINDIVISION = e.ID;



select t6.RKLX, t5.*
from TBL_VIID_ZDR_PERSONDOC t5,
     (select t3.*
      from TBL_VIID_ZDR_BASICINFO t3
      where exists(select 1
                   from (select t1.*
                         from TBL_VIID_ZDR_PERSONDOC t1
                         where t1.ZDRID in ('3_2020103014402200001', '5_2020103014402200001')
                           and exists(select 1
                                      from TBL_VIID_ZDR_BASICINFO t2
                                      where t1.ZDRID = t2.ZDRID
                                        and t2.RKLX = '1')) t4
                   where t3.ZDRID = t4.ZDRID)) t6
where t5.ZDRID = t6.ZDRID;

select c.CNT, t7.*
from CODEDETAIL c,
     (select t6.RKLX, t5.*
      from TBL_VIID_ZDR_PERSONDOC t5,
           (select t3.*
            from TBL_VIID_ZDR_BASICINFO t3
            where exists(select 1
                         from (select t1.*
                               from TBL_VIID_ZDR_PERSONDOC t1
                               where t1.ZDRID in ('3_2020103014402200001', '5_2020103014402200001')
                                 and exists(select 1
                                            from TBL_VIID_ZDR_BASICINFO t2
                                            where t1.ZDRID = t2.ZDRID
                                              and t2.RKLX = '1')) t4
                         where t3.ZDRID = t4.ZDRID)) t6
      where t5.ZDRID = t6.ZDRID) t7
where t7.RKLX = c.ID
  and c.TYPEID = 'casetype';

select *
from CODEDETAIL
where TYPEID like '%Gender%';



select *
from CODEDETAIL
where TYPEID like '%GZJB%';

select *
from CODEDETAIL
where TYPEID = 'nationalityCode';

select *
from EQP_AREA
where ID like '%610%';


select t6.RKLX, t5.*
from TBL_VIID_ZDR_PERSONDOC t5,
     (select t3.*
      from TBL_VIID_ZDR_BASICINFO t3
      where exists(select 1
                   from (select t1.*
                         from TBL_VIID_ZDR_PERSONDOC t1
                         where t1.ZDRID in ('3_2020103014402200001', '5_2020103014402200001')
                           and exists(select 1
                                      from TBL_VIID_ZDR_BASICINFO t2
                                      where t1.ZDRID = t2.ZDRID
                                        and t2.RKLX = '1')) t4
                   where t3.ZDRID = t4.ZDRID)) t6
where t5.ZDRID = t6.ZDRID;

select e.NAME, t7.*
from EQP_AREA e,
     (select t6.RKLX, t5.*
      from TBL_VIID_ZDR_PERSONDOC t5,
           (select t3.*
            from TBL_VIID_ZDR_BASICINFO t3
            where exists(select 1
                         from (select t1.*
                               from TBL_VIID_ZDR_PERSONDOC t1
                               where t1.ZDRID in ('3_2020103014402200001', '5_2020103014402200001')
                                 and exists(select 1
                                            from TBL_VIID_ZDR_BASICINFO t2
                                            where t1.ZDRID = t2.ZDRID
                                              and t2.RKLX = '1')) t4
                         where t3.ZDRID = t4.ZDRID)) t6
      where t5.ZDRID = t6.ZDRID) t7
where t7.RESIDENCEADMINDIVISION = e.ID;


select (select cnt from CODEDETAIL c where c.ID = t8.ETHICCODE and c.TYPEID = 'EthicCode')             as ethnicGroup,
       (select cnt from CODEDETAIL c where c.ID = t8.GENDERCODE and c.TYPEID = 'GenderCode')           as gender,
       (select cnt from CODEDETAIL c where c.ID = t8.RKLX and c.TYPEID = 'RKLX')                       as caseType,
       (select cnt from CODEDETAIL c where c.ID = t8.NATIONALITYCODE and c.TYPEID = 'NationalityCode') as nation,
       (select cnt from CODEDETAIL c where c.ID = t8.NATIVECITYCODE and c.TYPEID = 'NativeCityCode')   as nativeCity,
       (select cnt
        from CODEDETAIL c
        where c.ID = t8.GZJB
          and c.TYPEID = 'GZJB')                                                                       as attentionLevel,
       t8.*
from (SELECT *
      FROM (SELECT m.*, ROWNUM RN
            FROM (
                     select t7.*, e.NAME as areaName
                     from EQP_AREA e,
                          (select t6.RKLX,
                                  t6.GZJB,
                                  t6.GKSY,
                                  t6.GKDW_GAJGJGDM,
                                  t6.GKDW_GAJGMC,
                                  t6.ZRMJ_XM,
                                  t6.ZRMJ_LXDH,
                                  t6.DJDW_GAJGJGDM,
                                  t6.DJDW_GAJGMC,
                                  t6.DJR_XM,
                                  t6.XP,
                                  t5.*
                           from TBL_VIID_ZDR_PERSONDOC t5,
                                (select t3.*
                                 from TBL_VIID_ZDR_BASICINFO t3
                                 where exists(select 1
                                              from (select t1.*
                                                    from TBL_VIID_ZDR_PERSONDOC t1
                                                    where t1.ZDRID in ('3_2020103014402200001', '5_2020103014402200001')
                                                      and exists(select 1
                                                                 from TBL_VIID_ZDR_BASICINFO t2
                                                                 where t1.ZDRID = t2.ZDRID
                                                                   and t2.RKLX = '1')) t4
                                              where t3.ZDRID = t4.ZDRID)) t6
                           where t5.ZDRID = t6.ZDRID) t7
                     where t7.RESIDENCEADMINDIVISION = e.ID
                 ) m
            WHERE ROWNUM <= 20)
      WHERE RN > 0) t8;



select (select cnt from CODEDETAIL c where c.ID = t5.ETHICCODE and c.TYPEID = 'EthicCode')             as ethnicGroup,
       (select cnt from CODEDETAIL c where c.ID = t5.GENDERCODE and c.TYPEID = 'GenderCode')           as gender,
       (select cnt from CODEDETAIL c where c.ID = t5.RKLX and c.TYPEID = 'RKLX')                       as caseType,
       (select cnt from CODEDETAIL c where c.ID = t5.NATIONALITYCODE and c.TYPEID = 'NationalityCode') as nation,
       (select cnt from CODEDETAIL c where c.ID = t5.NATIVECITYCODE and c.TYPEID = 'NativeCityCode')   as nativeCity,
       (select cnt
        from CODEDETAIL c
        where c.ID = t5.GZJB
          and c.TYPEID = 'GZJB')                                                                       as attentionLevel,
       t5.*
from (select t3.RKLX,
             t3.GZJB,
             t3.GKSY,
             t3.GKDW_GAJGJGDM,
             t3.GKDW_GAJGMC,
             t3.ZRMJ_XM,
             t3.ZRMJ_LXDH,
             t3.DJDW_GAJGJGDM,
             t3.DJDW_GAJGMC,
             t3.DJR_XM,
             t3.XP,
             t3.DJSJ,
             t3.ZDRGLLB,
             t3.PLACECODE,
             t4.*
      from TBL_VIID_ZDR_BASICINFO t3,
           (select e.NAME as areaName, t2.*
            from EQP_AREA e,
                 (select t1.*
                  from TBL_VIID_ZDR_PERSONDOC t1
                  where PROFILEID = '610000000050451021610420201117094000000000000001') t2
            where t2.RESIDENCEADMINDIVISION = e.ID) t4
      where t3.ZDRID = t4.ZDRID) t5;

select (select cnt from CODEDETAIL c where c.ID = t5.ETHICCODE and c.TYPEID = 'EthicCode')             as ethnicGroup,
       (select cnt from CODEDETAIL c where c.ID = t5.GENDERCODE and c.TYPEID = 'GenderCode')           as gender,
       (select cnt from CODEDETAIL c where c.ID = t5.RKLX and c.TYPEID = 'RKLX')                       as caseType,
       (select cnt from CODEDETAIL c where c.ID = t5.NATIONALITYCODE and c.TYPEID = 'NationalityCode') as nation,
       (select cnt from CODEDETAIL c where c.ID = t5.NATIVECITYCODE and c.TYPEID = 'NativeCityCode')   as nativeCity,
       (select cnt
        from CODEDETAIL c
        where c.ID = t5.GZJB
          and c.TYPEID = 'GZJB')                                                                       as attentionLevel,
       t5.*
from (select t3.RKLX,
             t3.GZJB,
             t3.GKSY,
             t3.GKDW_GAJGJGDM,
             t3.GKDW_GAJGMC,
             t3.ZRMJ_XM,
             t3.ZRMJ_LXDH,
             t3.DJDW_GAJGJGDM,
             t3.DJDW_GAJGMC,
             t3.DJR_XM,
             t3.XP,
             t3.DJSJ,
             t3.ZDRGLLB,
             t3.PLACECODE,
             t4.*
      from TBL_VIID_ZDR_BASICINFO t3,
           (select e.NAME as areaName, t2.*
            from EQP_AREA e,
                 (select t1.*
                  from TBL_VIID_ZDR_PERSONDOC t1
                  where ZDRID = '3_2020103014402200001') t2
            where t2.RESIDENCEADMINDIVISION = e.ID) t4
      where t3.ZDRID = t4.ZDRID) t5;


select (select cnt from CODEDETAIL c where c.ID = '01' and c.TYPEID = 'EthicCode')        as ethnicGroup,
       (select cnt from CODEDETAIL c where c.ID = '1' and c.TYPEID = 'GenderCode')        as gender,
       (select cnt from CODEDETAIL c where c.ID = '1' and c.TYPEID = 'RKLX')              as caseType,
       (select cnt from CODEDETAIL c where c.ID = '001' and c.TYPEID = 'NationalityCode') as nation,
       (select cnt from CODEDETAIL c where c.ID = '001' and c.TYPEID = 'NativeCityCode')  as nativeCity,
       name
from EQP_AREA
where ID = '610100';



select t3.RKLX, t4.*
from TBL_VIID_ZDR_BASICINFO t3,
     (select t1.*
      from TBL_VIID_ZDR_FOOTPOINT t1
      where t1.ZDRID in ('4_2020103014402200001', '5_2020103014402200001')
        and exists(select t2.RKLX from TBL_VIID_ZDR_BASICINFO t2 where t1.ZDRID = t2.ZDRID and t2.RKLX = '1')) t4
where t3.ZDRID = t4.ZDRID;



select ZDRID, SHOTTIME
from TBL_VIID_ZDR_FOOTPOINT
where DEVICEID = '11010152001310001504'
  and SHOTTIME >= to_date('2020-01-03 10:32:03', 'yyyy-mm-dd hh24:mi:ss')
  and SHOTTIME <= to_date('2020-01-03 10:32:04', 'yyyy-mm-dd hh24:mi:ss');

select ZDRID, SHOTTIME
from TBL_VIID_ZDR_FOOTPOINT
where DEVICEID = '11010152001310001505'
  and SHOTTIME >= to_date('2020-01-03 10:32:05', 'yyyy-mm-dd hh24:mi:ss')
  and SHOTTIME <= to_date('2020-01-03 10:32:06', 'yyyy-mm-dd hh24:mi:ss');



select (select cnt from CODEDETAIL c where c.ID = t.RKLX and c.TYPEID = 'RKLX')       as caseType,
       (select cnt from CODEDETAIL c where c.ID = t.XBDM and c.TYPEID = 'GenderCode') as gender,
       (select cnt from CODEDETAIL c where c.ID = t.GZJB and c.TYPEID = 'GZJB')       as attentionLevel,
       t.*
from (select *
      from TBL_VIID_ZDR_BASICINFO
      where ZDRID in ('4_2020103014402200001', '5_2020103014402200001')) t;

SELECT *
FROM (SELECT m.*, ROWNUM RN
      FROM (select (select cnt from CODEDETAIL c where c.ID = t.RKLX and c.TYPEID = 'RKLX')       as caseType,
                   (select cnt from CODEDETAIL c where c.ID = t.XBDM and c.TYPEID = 'GenderCode') as gender,
                   (select cnt from CODEDETAIL c where c.ID = t.GZJB and c.TYPEID = 'GZJB')       as attentionLevel,
                   t.*
            from (select * from TBL_VIID_ZDR_BASICINFO where (ZDRID in ('5_2020103014402200001'))) t) m
      WHERE ROWNUM <= 20)
WHERE RN > 0;



select ZDRID, count(ZDRID)
from TBL_VIID_ZDR_FOOTPOINT
where DEVICEID = '11010152001310001505'
  and SHOTTIME >= to_date('2020-01-03 10:32:05', 'yyyy-mm-dd hh24:mi:ss')
  and SHOTTIME <= to_date('2020-01-03 10:32:06', 'yyyy-mm-dd hh24:mi:ss')
group by ZDRID;



select (select cnt from CODEDETAIL c where c.ID = t4.RKLX and c.TYPEID = 'RKLX')          as caseType,
       (select cnt from CODEDETAIL c where c.ID = t4.GZJB and c.TYPEID = 'GZJB')          as attentionLevel,
       (select cnt from CODEDETAIL c where c.ID = '01' and c.TYPEID = 'EthicCode')        as ethnicGroup,
       (select cnt from CODEDETAIL c where c.ID = '1' and c.TYPEID = 'GenderCode')        as gender,
       (select cnt from CODEDETAIL c where c.ID = '001' and c.TYPEID = 'NationalityCode') as nation,
       (select cnt from CODEDETAIL c where c.ID = '001' and c.TYPEID = 'NativeCityCode')  as nativeCity,
       NAME                                                                               as areaName,
       t4.*
from EQP_AREA e,
     (select t3.RKLX,
             t3.GZJB,
             t3.PROFILEID
      from (select t1.RKLX, t1.GZJB, t2.PROFILEID
            from TBL_VIID_ZDR_BASICINFO t1,
                 (select PROFILEID, ZDRID
                  from TBL_VIID_ZDR_PERSONDOC
                  where PROFILEID = '610000000050451021610420201117094000000000000002') t2
            where t1.ZDRID = t2.ZDRID) t3) t4
where e.ID = '610100';

select (select cnt from CODEDETAIL c where c.ID = t.RKLX and c.TYPEID = 'RKLX')           as caseType,
       (select cnt from CODEDETAIL c where c.ID = t.GZJB and c.TYPEID = 'GZJB')           as attentionLevel,
       (select cnt from CODEDETAIL c where c.ID = '01' and c.TYPEID = 'EthicCode')        as ethnicGroup,
       (select cnt from CODEDETAIL c where c.ID = '1' and c.TYPEID = 'GenderCode')        as gender,
       (select cnt from CODEDETAIL c where c.ID = '001' and c.TYPEID = 'NationalityCode') as nation,
       (select cnt from CODEDETAIL c where c.ID = '001' and c.TYPEID = 'NativeCityCode')  as nativeCity,
       t.areaName
from (select e.NAME as areaName, p.PROFILEID, b.RKLX, b.GZJB
      from TBL_VIID_ZDR_PERSONDOC p
               inner join TBL_VIID_ZDR_BASICINFO b
                          on p.PROFILEID = '610000000050451021610420201117094000000000000002' and p.ZDRID = b.ZDRID
               left join EQP_AREA e on e.ID = '610100') t
order by t.PROFILEID;



select ZDRID
from TBL_VIID_ZDR_FOOTPOINT
group by ZDRID;

select distinct ZDRID,
                SHOTTIME,
                rank() over (partition by ZDRID order by SHOTTIME desc ) as rank
from TBL_VIID_ZDR_FOOTPOINT;


select ZDRID
from (select distinct ZDRID,
                      SHOTTIME,
                      rank() over (partition by ZDRID order by SHOTTIME desc ) as rank
      from TBL_VIID_ZDR_FOOTPOINT)
where rank = 1;

select t1.ZDRID, t1.SHOTTIME, dense_rank() over (partition by ZDRID order by SHOTTIME desc) as rw
from TBL_VIID_ZDR_FOOTPOINT t1;



select ZDRID, SHOTTIME, ROW_NUMBER() over (partition by ZDRID order by SHOTTIME desc) as rw
from TBL_VIID_ZDR_FOOTPOINT;

select t2.*
from (select t1.*, ROW_NUMBER() over (partition by ZDRID order by SHOTTIME desc) as rw
      from TBL_VIID_ZDR_FOOTPOINT t1) t2
where t2.rw = 1
  and t2.SHOTTIME >= to_date('2021-04-22 14:17:41', 'yyyy-mm-dd hh24:mi:ss');


update TBL_VIID_ZDR_FOOTPOINT
set SMALLIMAGESTORAGEPATH = 'http://172.16.70.251:80/casematerial/S/330000/000000/202008/14/3990/1597805581471.jpg';

alter table TBL_VIID_ZDR_PERSONDOC
    add (DEVICEID VARCHAR2(20),
         DEVICENAME VARCHAR2(100),
         SHOTTIME DATE,
         LONGITUDE NUMBER(10, 6),
         LATITUDE NUMBER(10, 6));

select ZDRID,
       RESIDENCEADMINDIVISION,
       SHOTTIME  as lastActiveTime,
       LATITUDE  as lastActiveLatitude,
       LONGITUDE as lastActiveLongitude,
       DEVICEID  as lastActiveDeviceId
from TBL_VIID_ZDR_PERSONDOC;



select p.*,
       b.gzjb,
       b.RKLX,
       b.GZJB,
       b.GKSY,
       b.GKDW_GAJGJGDM,
       b.GKDW_GAJGMC,
       b.ZRMJ_XM,
       b.ZRMJ_LXDH,
       b.DJDW_GAJGJGDM,
       b.DJDW_GAJGMC,
       b.DJR_XM,
       b.XP
from TBL_VIID_ZDR_PERSONDOC P
         left join TBL_VIID_ZDR_BASICINFO B
                   on p.zdrid = b.zdrid
where b.gzjb = '1'
  and p.name like '%%'
  and p.idnumber = '613265987456523478'
  and b.rklx = '1';


select (select cnt from CODEDETAIL c where c.ID = t.ETHICCODE and c.TYPEID = 'EthicCode')             as ethnicGroup,
       (select cnt from CODEDETAIL c where c.ID = t.GENDERCODE and c.TYPEID = 'GenderCode')           as gender,
       (select cnt from CODEDETAIL c where c.ID = t.RKLX and c.TYPEID = 'RKLX')                       as caseType,
       (select cnt from CODEDETAIL c where c.ID = t.NATIONALITYCODE and c.TYPEID = 'NationalityCode') as nation,
       (select cnt from CODEDETAIL c where c.ID = t.NATIVECITYCODE and c.TYPEID = 'NativeCityCode')   as nativeCity,
       (select cnt from CODEDETAIL c where c.ID = t.GZJB and c.TYPEID = 'GZJB')                       as attentionLevel,
       t.*
from (select p.*,
             b.RKLX,
             b.GZJB,
             b.GKSY,
             b.GKDW_GAJGJGDM,
             b.GKDW_GAJGMC,
             b.ZRMJ_XM,
             b.ZRMJ_LXDH,
             b.DJDW_GAJGJGDM,
             b.DJDW_GAJGMC,
             b.DJR_XM,
             b.XP
      from TBL_VIID_ZDR_PERSONDOC P
               left join TBL_VIID_ZDR_BASICINFO B
                         on p.ZDRID = b.ZDRID
      where p.ZDRID in ('5_2020103014402200001')
        and b.GZJB = '1'
        and p.NAME like '%%'
        and p.IDNUMBER = '613265987456523478'
        and b.RKLX = '1') t;

select count(1)
from (select p.*,
             b.gzjb,
             b.RKLX,
             b.GZJB as attentionLevel,
             b.GKSY,
             b.GKDW_GAJGJGDM,
             b.GKDW_GAJGMC,
             b.ZRMJ_XM,
             b.ZRMJ_LXDH,
             b.DJDW_GAJGJGDM,
             b.DJDW_GAJGMC,
             b.DJR_XM,
             b.XP
      from TBL_VIID_ZDR_PERSONDOC P
               left join TBL_VIID_ZDR_BASICINFO B
                         on p.zdrid = b.zdrid
      where p.ZDRID in ('5_2020103014402200001')
        and b.gzjb = '1'
        and p.name like '%%'
        and p.idnumber = '613265987456523478'
        and b.rklx = '1');



select (select cnt from CODEDETAIL c where c.ID = t.togetherPeopleType and c.TYPEID = 'RKLX')     as
                                                                                                     togetherPeopleTypeName,
       (select cnt from CODEDETAIL c where c.ID = t.peopleType and c.TYPEID = 'RKLX')             as peopleTypeName,
       (select cnt from CODEDETAIL c where c.ID = t.togetherAttentionLevel and c.TYPEID = 'GZJB') as
                                                                                                     togetherAttentionLevelName,
       (select cnt from CODEDETAIL c where c.ID = t.peopleAttentionLevel and c.TYPEID = 'GZJB')   as
                                                                                                     peopleAttentionLevelName,
       t.*
from (select b2.GZJB                  as togetherAttentionLevel,
             b2.RKLX                  as togetherPeopleType,
             b2.XP                    as togetherPeoplePhoto,
             f2.ID                    as togetherId,
             f2.TRIGGERTIME           as togetherTriggerTime,
             f2.RXSFYQID              as togetherRxsfyqId,
             f2.ZDRID                 as togetherDocId,
             f2.NAME                  as togetherName,
             f2.IDNUMBER              as togetherIdNumber,
             f2.ZDRLAB                as togetherZdrLab,
             f2.GKSY                  as togetherGksy,
             f2.ZDR_IMAGEDATA         as togetherZdrImageData,
             f2.ZDR_STORAGEPATH       as togetherPhotoUrl,
             f2.DEVICEID              as togetherDeviceId,
             f2.DEVICENAME            as togetherDeviceName,
             f2.PLACECODE             as togetherPlaceCode,
             f2.PLACECODENAME         as togetherPlaceCodeName,
             f2.SIMILARITYDEGREE      as togetherSimilarityDegeree,
             f2.SHOTTIME              as togetherAlarmTime,
             f2.SMALLIMAGEID          as togetherSmallImageId,
             f2.SMALLIMAGEDATA        as togetherSmallImageData,
             f2.SMALLIMAGESTORAGEPATH as togetherFaceUrl,
             f2.BIGIMAGEID            as togetherBigImageId,
             f2.BIGIMAGEDATA          as togetherBigImageData,
             f2.BIGIMAGESTORAGEPATH   as togetherSenseUrl,
             f2.DISPOSITIONID         as togetherDispositonId,
             f2.TITLE                 as togetherTitle,
             f2.ALARMID               as togetherAlarmId,
             f2.ISPUSH                as togetherIsPush,
             f2.FACEID                as togetherFaceId,
             f2.NOTIFICATIONID        as togetherNotificationId,
             f2.LONGITUDE             as togetherLongtitude,
             f2.LATITUDE              as togetherLatitude,
             f2.VIIDSERVERID          as togetherViidServerId,
             b1.GZJB                  as peopleAttentionLevel,
             b1.RKLX                  as peopleType,
             b1.XP                    as peoplePhoto,
             f1.ID                    as id,
             f1.TRIGGERTIME           as triggerTime,
             f1.RXSFYQID              as rxsfyqId,
             f1.ZDRID                 as docId,
             f1.NAME                  as name,
             f1.IDNUMBER              as idNumber,
             f1.ZDRLAB                as zdrLab,
             f1.GKSY                  as gksy,
             f1.ZDR_IMAGEDATA         as zdrImageData,
             f1.ZDR_STORAGEPATH       as photoUrl,
             f1.DEVICEID              as deviceId,
             f1.DEVICENAME            as deviceName,
             f1.PLACECODE             as placeCode,
             f1.PLACECODENAME         as placeCodeName,
             f1.SIMILARITYDEGREE      as similarityDegeree,
             f1.SHOTTIME              as alarmTime,
             f1.SMALLIMAGEID          as smallImageId,
             f1.SMALLIMAGEDATA        as smallImageData,
             f1.SMALLIMAGESTORAGEPATH as faceUrl,
             f1.BIGIMAGEID            as bigImageId,
             f1.BIGIMAGEDATA          as bigImageData,
             f1.BIGIMAGESTORAGEPATH   as senseUrl,
             f1.DISPOSITIONID         as dispositonId,
             f1.TITLE                 as title,
             f1.ALARMID               as alarmId,
             f1.ISPUSH                as isPush,
             f1.FACEID                as faceId,
             f1.NOTIFICATIONID        as notificationId,
             f1.LONGITUDE             as longtitude,
             f1.LATITUDE              as latitude,
             f1.VIIDSERVERID          as viidServerId
      from TBL_VIID_ZDR_FOOTPOINT f1
               inner join TBL_VIID_ZDR_FOOTPOINT f2 on
              f2.ZDRID != f1.ZDRID
              and f2.SHOTTIME >= to_date('2019-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
              and f2.SHOTTIME <= to_date('2021-09-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
              and f2.DEVICEID = f1.DEVICEID
              and f1.IDNUMBER = '619932198612070916'
              and f1.SHOTTIME >= (f2.SHOTTIME + INTERVAL '-5' SECOND)
              and f1.SHOTTIME <= (f2.SHOTTIME + INTERVAL '5' SECOND)
               left join TBL_VIID_ZDR_BASICINFO b1 on b1.ZDRID = f1.ZDRID
               left join TBL_VIID_ZDR_BASICINFO b2 on b2.ZDRID = f2.ZDRID) t;

select *
from TBL_VIID_ZDR_FOOTPOINT
where ID = '110000000000022020010310321410001020201123104510';

select (select cnt from CODEDETAIL c where c.ID = t.MZDM and c.TYPEID = 'EthicCode')                  as ethnicGroup,
       (select cnt from CODEDETAIL c where c.ID = t.XBDM and c.TYPEID = 'GenderCode')                 as gender,
       (select cnt from CODEDETAIL c where c.ID = t.RKLX and c.TYPEID = 'RKLX')                       as caseType,
       (select cnt from CODEDETAIL c where c.ID = t.NATIONALITYCODE and c.TYPEID = 'NationalityCode') as nation,
       (select cnt from CODEDETAIL c where c.ID = t.NATIVECITYCODE and c.TYPEID = 'NativeCityCode')   as nativeCity,
       (select cnt from CODEDETAIL c where c.ID = t.GZJB and c.TYPEID = 'GZJB')                       as attentionLevel,
       t.*
from (select e.NAME as areaName,
             p.BIRTHTIME,
             p.RESIDENCEADMINDIVISION,
             p.NATIVECITYCODE,
             p.NATIONALITYCODE,
             p.PLACEFULLADDRESS,
             p.TAGS,
             b.ZDRID,
             b.GMSFHM,
             b.XM,
             b.XBDM,
             b.MZDM,
             b.GZJB,
             b.RKLX,
             b.ZDRGLLBDM,
             b.GKSY,
             b.GKDW_GAJGJGDM,
             b.GKDW_GAJGMC,
             b.ZRMJ_XM,
             b.ZRMJ_LXDH,
             b.DJDW_GAJGJGDM,
             b.DJDW_GAJGMC,
             b.DJR_XM,
             b.DJSJ,
             b.XP,
             b.ZDRGLLB,
             b.VIIDSERVERID,
             b.PLACECODE
      from TBL_VIID_ZDR_BASICINFO b
               left join TBL_VIID_ZDR_PERSONDOC p on b.ZDRID = p.ZDRID
               left join EQP_AREA e on p.RESIDENCEADMINDIVISION = e.ID
     ) t
order by t.XM, t.GMSFHM nulls last;



select *
from TBL_VIID_ZDR_PERSONDOC p
         left join EQP_AREA e on p.RESIDENCEADMINDIVISION = e.ID
where length(RESIDENCEADMINDIVISION) = 4
   or substr(RESIDENCEADMINDIVISION, -2, 2) = '00';


select p.RESIDENCEADMINDIVISION, e.NAME, e.LONGITUDE, e.LATITUDE, p.count
from (select RESIDENCEADMINDIVISION, count(1) as count
      from TBL_VIID_ZDR_PERSONDOC
      where substr(RESIDENCEADMINDIVISION, -2, 2) != '00'
        and length(RESIDENCEADMINDIVISION) = '6'
      group by RESIDENCEADMINDIVISION) p
         left join EQP_AREA e on p.RESIDENCEADMINDIVISION = e.ID;

select RESIDENCEADMINDIVISION, count(1)
from TBL_VIID_ZDR_PERSONDOC
group by RESIDENCEADMINDIVISION;


select *
from EQP_AREA
where name like '%铜%';

select *
from EQP_AREA
where ID like '6102%';

select *
from EQP_AREA
where EQP_AREA.ID = '610403';

select RESIDENCEADMINDIVISION, LONGITUDE, LATITUDE
from TBL_VIID_ZDR_PERSONDOC;

select e.NAME      as placeCodeName,
       p.ZDRID,
       p.RESIDENCEADMINDIVISION,
       p.SHOTTIME  as lastActiveTime,
       p.LATITUDE  as lastActiveLatitude,
       p.LONGITUDE as lastActiveLongitude,
       p.DEVICEID  as lastActiveDeviceId
from TBL_VIID_ZDR_PERSONDOC p
         left join EQP_AREA e on p.RESIDENCEADMINDIVISION = e.ID
where length(p.RESIDENCEADMINDIVISION) = 4;


select p.ZDRID,
       p.RESIDENCEADMINDIVISION,
       p.SHOTTIME  as lastActiveTime,
       p.LATITUDE  as lastActiveLatitude,
       p.LONGITUDE as lastActiveLongitude,
       p.DEVICEID  as lastActiveDeviceId
from TBL_VIID_ZDR_PERSONDOC p
where length(p.RESIDENCEADMINDIVISION) = 6
  and substr(RESIDENCEADMINDIVISION, -2, 2) != '00';



select p.RESIDENCEADMINDIVISION, e.NAME, e.LONGITUDE, e.LATITUDE, p.count
from (select RESIDENCEADMINDIVISION, count(1) as count
      from TBL_VIID_ZDR_PERSONDOC
      where substr(RESIDENCEADMINDIVISION, -2, 2) = '00'
         or length(RESIDENCEADMINDIVISION) = '4'
      group by RESIDENCEADMINDIVISION) p
         left join EQP_AREA e on p.RESIDENCEADMINDIVISION = e.ID;



select p.placeCode as RESIDENCEADMINDIVISION, e.NAME, e.LONGITUDE, e.LATITUDE, p.count
from (select RPAD(substr(RESIDENCEADMINDIVISION, 0, 4), 6, '0') as placeCode, count(1) as count
      from TBL_VIID_ZDR_PERSONDOC
      group by substr(RESIDENCEADMINDIVISION, 0, 4)) p
         left join EQP_AREA e on p.placeCode = e.ID;



select RPAD(p.placeCode, 6, '0') as RESIDENCEADMINDIVISION, e.NAME, p.count, e.LONGITUDE, e.LATITUDE
from (select substr(RESIDENCEADMINDIVISION, 0, 4) as placeCode,
             count(1)                             as count
      from TBL_VIID_ZDR_PERSONDOC
      group by substr(RESIDENCEADMINDIVISION, 0, 4)) p
         left join EQP_AREA e on p.placeCode = e.ID or RPAD(p.placeCode, 6, '0') = e.ID;



select p.RESIDENCEADMINDIVISION, e.NAME, e.LONGITUDE, e.LATITUDE, p.count
from (select RESIDENCEADMINDIVISION, count(1) as count
      from TBL_VIID_ZDR_PERSONDOC
      where substr(RESIDENCEADMINDIVISION, -2, 2) != '00'
        and length(RESIDENCEADMINDIVISION) = '6'
      group by RESIDENCEADMINDIVISION) p
         left join EQP_AREA e on p.RESIDENCEADMINDIVISION = e.ID;

select e.NAME      as placeCodeName,
       p.ZDRID,
       p.RESIDENCEADMINDIVISION,
       p.SHOTTIME  as lastActiveTime,
       p.LATITUDE  as lastActiveLatitude,
       p.LONGITUDE as lastActiveLongitude,
       p.DEVICEID  as lastActiveDeviceId
from TBL_VIID_ZDR_PERSONDOC p
         left join EQP_AREA e on p.RESIDENCEADMINDIVISION = e.ID
where p.LONGITUDE is not null
  and p.LATITUDE is not null;

select RPAD(p.placeCode, 6, '0') as RESIDENCEADMINDIVISION, e.NAME, p.count, e.LONGITUDE, e.LATITUDE
from (select substr(RESIDENCEADMINDIVISION, 0, 4) as placeCode,
             count(1)                             as count
      from TBL_VIID_ZDR_PERSONDOC
      where LONGITUDE is not null
        and LATITUDE is not null
      group by substr(RESIDENCEADMINDIVISION, 0, 4)) p
         left join EQP_AREA e on p.placeCode = e.ID or RPAD(p.placeCode, 6, '0') = e.ID;

select p.RESIDENCEADMINDIVISION, e.NAME, e.LONGITUDE, e.LATITUDE, p.count
from (select RESIDENCEADMINDIVISION, count(1) as count
      from TBL_VIID_ZDR_PERSONDOC
      where substr(RESIDENCEADMINDIVISION, -2, 2) != '00'
        and length(RESIDENCEADMINDIVISION) = '6'
        and LONGITUDE is not null
        and LATITUDE is not null
      group by RESIDENCEADMINDIVISION) p
         left join EQP_AREA e on p.RESIDENCEADMINDIVISION = e.ID;


select RPAD(p.placeCode, 6, '0') as RESIDENCEADMINDIVISION, e.NAME, p.count, e.LONGITUDE, e.LATITUDE
from (select substr(RESIDENCEADMINDIVISION, 0, 4) as placeCode, count(1) as count
      from TBL_VIID_ZDR_PERSONDOC
      where LONGITUDE is not null
        and LATITUDE is not null
      group by substr(RESIDENCEADMINDIVISION, 0, 4)) p
         left join EQP_AREA e on p.placeCode = e.ID or RPAD(p.placeCode, 6, '0') = e.ID;



select *
from KEYUNIT_VISITOR;

select *
from CODEDETAIL
where TYPEID like 'Gender%';

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
where a.GENDERCODE = '1';


select *
from KEYUNIT_ALARM;

update KEYUNIT_ALARM
set PHOTO = (select SMALLIMAGEDATA
             from TBL_VIID_ZDR_FOOTPOINT
             where ID = '1100000000000220200103103214100012021041623020300000045')
where ID = '20210508163245000001';

select *
from KEYUNIT_VISITOR;

select *
from CODEDETAIL
where TYPEID = 'EthicCode'
  and CNT = '汉族';

select *
from KEYUNIT
where UNITNAME = '';

select *
from DEPARTMENT
where DEPARTNAME = '';

select distinct (select ID
                 from CODEDETAIL
                 where TYPEID = 'EthicCode'
                   and CNT = '汉族')      as ethnicity,
                (select UNITCODE
                 from KEYUNIT
                 where UNITNAME = '')   as unit,
                (select DEPARTCODE
                 from DEPARTMENT
                 where DEPARTNAME = '') as department
from KEYUNIT;

select count(1)
from KEYUNIT_VISITOR
where STATUS = 1
  and KEYUNITID = '200100200000012001';

select *
from KEYUNIT_VISITOR;

select ID
from KEYUNIT
where FULLPATH like '1%'
   or ID = '1';

select FULLPATH
from KEYUNIT
where ID = '2002';

select *
from KEYUNIT_ALARM
where KEYUNITID in (select ID
                    from KEYUNIT
                    where FULLPATH like '200100200000012001$2002%');

select FULLPATH
from KEYUNIT
where ID = '2002';

select ID
from KEYUNIT
where FULLPATH like '200100200000012001$2002%';

select *
from KEYUNIT_ALARM
where KEYUNITID in ('2001', '2002');

select ID
from KEYUNIT
where AREACODE = '200000200000011035';

select ROLEID
from ROLEINFO
where ROLENAME = '';


select count(1) as count, k2.ID
from KEYUNIT_VISITOR v1
         left join (select k1.ID
                    from KEYUNIT k1
                    where exists(select 1
                                 from ROLEINFO r1
                                 where k1.AREACODE = r1.ROLEID
                                   and r1.FULLPATH like
                                       (select r2.FULLPATH from ROLEINFO r2 where r2.ROLEID = '') || '%')) k2
                   on v1.KEYUNITID = k2.ID
where v1.CREATEDATE >= to_date('2019-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
  and v1.CREATEDATE <= to_date('2022-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
group by k2.ID;

select k3.UNITNAME, nvl(v2.count, 0) as count
from KEYUNIT k3
         inner join (select count(1) as count, k2.ID
                     from KEYUNIT_VISITOR v1
                              inner join (select k1.ID
                                          from KEYUNIT k1
                                          where exists(select 1
                                                       from ROLEINFO r1
                                                       where k1.AREACODE = r1.ROLEID
                                                         and r1.FULLPATH like
                                                             (select r2.FULLPATH
                                                              from ROLEINFO r2
                                                              where r2.ROLEID = '200000200000011035') || '%')) k2
                                         on v1.KEYUNITID = k2.ID
                     where v1.CREATEDATE >= to_date('2019-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
                       and v1.CREATEDATE <= to_date('2022-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
                     group by k2.ID) v2 on v2.ID = k3.ID;

select nvl(v.parentid, '')           as parent,
       nvl(v.roleid, '')             as id,
       v.rolename                    as name,
       (select count(*)
        from RoleInfo t
        where t.PARENTID = v.ROLEID) as childrenCount
from RoleInfo v
where v.DFKCODE like '3304%';



select nvl(v.parentid, '')           as parent,
       nvl(v.roleid, '')             as id,
       v.rolename                    as name,
       (select count(*)
        from RoleInfo t,
             KEYUNIT k
        where t.PARENTID = v.ROLEID
           or t.ROLEID = k.PARENTID) as childrenCount
from RoleInfo v
union
select PARENTID                                                    as parent,
       ID                                                          as id,
       UNITNAME                                                    as name,
       (select COUNT(*) from KEYUNIT k1 where k1.PARENTID = k2.ID) as childrenCount
from KEYUNIT k2;

select s.parent, s.id, s.name, s.childrenCount
from (select nvl(v.parentid, '')           as parent,
             nvl(v.roleid, '')             as id,
             v.rolename                    as name,
             (select count(*)
              from RoleInfo t,
                   KEYUNIT k
              where t.PARENTID = v.ROLEID
                 or t.ROLEID = k.PARENTID) as childrenCount
      from RoleInfo v
      union
      select nvl(k2.parentid, '')                                        as parent,
             nvl(k2.id, '')                                              as id,
             k2.unitname                                                 as name,
             (select COUNT(*) from KEYUNIT k1 where k1.PARENTID = k2.ID) as childrenCount
      from KEYUNIT k2) s;

select s.parent, id, name, childrenCount
from (select nvl(v.parentid, '')                                             as parent,
             nvl(v.roleid, '')                                               as id,
             v.rolename                                                      as name,
             ((select count(*)
               from KEYUNIT k
               where k.AREACODE = v.ROLEID) + (select count(*)
                                               from RoleInfo t
                                               where t.PARENTID = v.ROLEID)) as childrenCount
      from RoleInfo v
      where v.PARENTID = '330000000000000001'
      union
      select nvl(k2.AREACODE, '')                                        as parent,
             nvl(k2.id, '')                                              as id,
             k2.unitname                                                 as name,
             (select COUNT(*) from KEYUNIT k1 where k1.AREACODE = k2.ID) as childrenCount
      from KEYUNIT k2
      where k2.AREACODE = '330000000000000001') s;


select count(1)
from ROLEINFO r2
where r2.FULLPATH like (select substr(k.FULLPATH, 0, instr(k.FULLPATH, '$') - 1) as path
                        from KEYUNIT k
                                 inner join ROLEINFO r1 on k.PARENTID = r1.ROLEID) || '%';

select substr(k.FULLPATH, -(length(k.ID)), length(k.ID)) as path
from KEYUNIT k
         inner join ROLEINFO r1 on k.PARENTID = r1.ROLEID;

select *
from ROLEINFO r2,
     (select k.FULLPATH, k.ID, substr(k.FULLPATH, 0, length(k.FULLPATH) - length(k.ID) - 1) as path
      from KEYUNIT k
               inner join ROLEINFO r1 on k.PARENTID = r1.ROLEID) t
where r2.FULLPATH like '%' || t.path || '%';

select FULLPATH, substr(FULLPATH, 0, instr(FULLPATH, '$') - 1)
from ROLEINFO
where FULLPATH like '%203207200000011023';

select *
from ROLEINFO
where ROLEID = '200000200000011035';

select *
from GEUSERDOM
where ROLEID = '200000200000011035';

select *
from KEYUNIT
where ID = '';

select *
from ROLEINFO
where ROLEID = '200000200000011052';

select ROLEID
from ROLEINFO
where FULLPATH like (select FULLPATH
                     from ROLEINFO
                     where ROLEID = '200000200000011052') || '%';

select ID
from KEYUNIT
where AREACODE in ('200000200000011052');

select *
from CODEDETAIL
where TYPEID = 'warnAlarmTypeMinor';

select *
from ATTENDANCE
where CERTIFICATE = '341125199707141994'
  and trunc(CREATETIME) = trunc(sysdate)
  and OFFTIME is null;

select *
from ROLEINFO
where ROLENAME like '%第五%';

select *
from ROLEINFO
where ROLEID = '200000200000011195';

select *
from KEYUNIT_ALARM
where KEYUNITID in (select ROLEID
                    from ROLEINFO
                    where FULLPATH like (select FULLPATH from ROLEINFO where ROLEID = '200000200000011052') || '%');

select *
from KEYUNIT_ALARM a
where exists(select 1
             from ROLEINFO r
             where a.KEYUNITID = r.ROLEID
               and r.FULLPATH like (select FULLPATH from ROLEINFO where ROLEID = '200000200000011052') || '%');

select *
from KEYUNIT_ALARM a
         left join KEYUNIT k on a.KEYUNITID = k.ID
where exists(select 1
             from ROLEINFO r
             where k.UNITCODE = r.DFKCODE
               and r.FULLPATH like (select FULLPATH from ROLEINFO where ROLEID = '200000200000011196') || '%');

select *
from ROLEINFO
where FULLPATH like (select FULLPATH from ROLEINFO where ROLEID = '200000200000011052') || '%'
  and ROLEID != '200000200000011052';

select r.ROLEID,
       r.ROLENAME,
       r.PARENTID,
       k.UNITCODE,
       k.UNITTYPE,
       (select ROLENAME from ROLEINFO i where i.ROLEID = r.PARENTID) as areaName
from ROLEINFO r
         left join KEYUNIT k on r.ROLEID = k.ID
where r.FULLPATH like (select FULLPATH from ROLEINFO where ROLEID = '200000200000011052') || '%'
  and r.ROLETYPE = 5
  and r.ROLEID != '200000200000011052';

select *
from KEYUNIT;

select (select cnt from CODEDETAIL c where c.ID = t.togetherPeopleType and c.TYPEID = 'RKLX')     as
                                                                                                     togetherPeopleTypeName,
       (select cnt from CODEDETAIL c where c.ID = t.peopleType and c.TYPEID = 'RKLX')             as peopleTypeName,
       (select cnt from CODEDETAIL c where c.ID = t.togetherAttentionLevel and c.TYPEID = 'GZJB') as
                                                                                                     togetherAttentionLevelName,
       (select cnt from CODEDETAIL c where c.ID = t.peopleAttentionLevel and c.TYPEID = 'GZJB')   as
                                                                                                     peopleAttentionLevelName,
       t.*
from (select b2.GZJB                  as togetherAttentionLevel,
             b2.RKLX                  as togetherPeopleType,
             b2.XP                    as togetherPeoplePhoto,
             f2.ID                    as togetherId,
             f2.TRIGGERTIME           as togetherTriggerTime,
             f2.RXSFYQID              as togetherRxsfyqId,
             f2.ZDRID                 as togetherDocId,
             f2.NAME                  as togetherName,
             f2.IDNUMBER              as togetherIdNumber,
             f2.ZDRLAB                as togetherZdrLab,
             f2.GKSY                  as togetherGksy,
             f2.ZDR_IMAGEDATA         as togetherZdrImageData,
             f2.ZDR_STORAGEPATH       as togetherPhotoUrl,
             f2.DEVICEID              as togetherDeviceId,
             f2.DEVICENAME            as togetherDeviceName,
             f2.PLACECODE             as togetherPlaceCode,
             f2.PLACECODENAME         as togetherPlaceCodeName,
             f2.SIMILARITYDEGREE      as togetherSimilarityDegeree,
             f2.SHOTTIME              as togetherAlarmTime,
             f2.SMALLIMAGEID          as togetherSmallImageId,
             f2.SMALLIMAGEDATA        as togetherSmallImageData,
             f2.SMALLIMAGESTORAGEPATH as togetherFaceUrl,
             f2.BIGIMAGEID            as togetherBigImageId,
             f2.BIGIMAGEDATA          as togetherBigImageData,
             f2.BIGIMAGESTORAGEPATH   as togetherSenseUrl,
             f2.DISPOSITIONID         as togetherDispositonId,
             f2.TITLE                 as togetherTitle,
             f2.ALARMID               as togetherAlarmId,
             f2.ISPUSH                as togetherIsPush,
             f2.FACEID                as togetherFaceId,
             f2.NOTIFICATIONID        as togetherNotificationId,
             f2.LONGITUDE             as togetherLongtitude,
             f2.LATITUDE              as togetherLatitude,
             f2.VIIDSERVERID          as togetherViidServerId,
             b1.GZJB                  as peopleAttentionLevel,
             b1.RKLX                  as peopleType,
             b1.XP                    as peoplePhoto,
             f1.ID                    as id,
             f1.TRIGGERTIME           as triggerTime,
             f1.RXSFYQID              as rxsfyqId,
             f1.ZDRID                 as docId,
             f1.NAME                  as name,
             f1.IDNUMBER              as idNumber,
             f1.ZDRLAB                as zdrLab,
             f1.GKSY                  as gksy,
             f1.ZDR_IMAGEDATA         as zdrImageData,
             f1.ZDR_STORAGEPATH       as photoUrl,
             f1.DEVICEID              as deviceId,
             f1.DEVICENAME            as deviceName,
             f1.PLACECODE             as placeCode,
             f1.PLACECODENAME         as placeCodeName,
             f1.SIMILARITYDEGREE      as similarityDegeree,
             f1.SHOTTIME              as alarmTime,
             f1.SMALLIMAGEID          as smallImageId,
             f1.SMALLIMAGEDATA        as smallImageData,
             f1.SMALLIMAGESTORAGEPATH as faceUrl,
             f1.BIGIMAGEID            as bigImageId,
             f1.BIGIMAGEDATA          as bigImageData,
             f1.BIGIMAGESTORAGEPATH   as senseUrl,
             f1.DISPOSITIONID         as dispositonId,
             f1.TITLE                 as title,
             f1.ALARMID               as alarmId,
             f1.ISPUSH                as isPush,
             f1.FACEID                as faceId,
             f1.NOTIFICATIONID        as notificationId,
             f1.LONGITUDE             as longtitude,
             f1.LATITUDE              as latitude,
             f1.VIIDSERVERID          as viidServerId
      from (select *
            from TBL_VIID_ZDR_FOOTPOINT t1
            where t1.SHOTTIME >= to_date('2021-05-09 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
              and t1.SHOTTIME <= to_date('2021-05-09 23:00:00', 'yyyy-mm-dd hh24:mi:ss')
              and t1.IDNUMBER = '619932198612070921') f1
               inner join (select *
                           from TBL_VIID_ZDR_FOOTPOINT t2
                           where t2.SHOTTIME >= to_date('2021-05-09 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
                             and t2.SHOTTIME <= to_date('2021-05-09 23:00:00', 'yyyy-mm-dd hh24:mi:ss')) f2 on
              f2.ZDRID != f1.ZDRID
              and f1.IDNUMBER != f2.IDNUMBER
              and f2.DEVICEID = f1.DEVICEID
              and f1.SHOTTIME >= (f2.SHOTTIME + INTERVAL '-5' SECOND)
              and f1.SHOTTIME <= (f2.SHOTTIME + INTERVAL '5' SECOND)
               left join TBL_VIID_ZDR_BASICINFO b1 on b1.ZDRID = f1.ZDRID
               left join TBL_VIID_ZDR_BASICINFO b2 on b2.ZDRID = f2.ZDRID) t;


select DEPARTCODE, DEPARTNAME
from DEPARTMENT
where UNITCODE = '';

select *
from CODEDETAIL
where TYPEID like 'warnAlarmTypeMinor';


select DEVICEID, trunc(SHOTTIME)
from TBL_VIID_ZDR_FOOTPOINT
where SHOTTIME <= trunc(sysdate)
  and SHOTTIME >= trunc(sysdate) - 90;

select *
from TBL_VIID_ZDR_FOOTPOINT
where trunc(SHOTTIME) = to_date('2021-05-06 00:00:00', 'yyyy-mm-dd hh24:mi:ss');

select abs(round(to_number(f1.SHOTTIME - f2.SHOTTIME) * 24 * 60 * 60)) as followTime,
       f1.ID                                                           as zdrFaceId,
       f1.ZDRID                                                        as zdrId,
       f1.IDNUMBER                                                     as zdrIdNumber,
       f1.DEVICEID                                                     as zdrDeviceId,
       f1.SHOTTIME                                                     as zdrShotTime,
       f2.ID                                                           as followFaceId,
       f2.ZDRID                                                        as followZdrId,
       f2.IDNUMBER                                                     as followIdNumber,
       f2.DEVICEID                                                     as followDeviceId,
       f2.SHOTTIME                                                     as followShotTime
from (select *
      from TBL_VIID_ZDR_FOOTPOINT
      where DEVICEID = '61030401001320000038'
        and trunc(SHOTTIME) = to_date('2021-05-19 00:00:00', 'yyyy-mm-dd hh24:mi:ss')) f1
         inner join (select *
                     from TBL_VIID_ZDR_FOOTPOINT
                     where DEVICEID = '61030401001320000038'
                       and trunc(SHOTTIME) = to_date('2021-05-19 00:00:00', 'yyyy-mm-dd hh24:mi:ss')) f2
                    on f1.DEVICEID = f2.DEVICEID and f1.ZDRID != f2.ZDRID and f1.IDNUMBER != f2.IDNUMBER
where abs(round(to_number(f1.SHOTTIME - f2.SHOTTIME) * 24 * 60 * 60)) <= 20;

select count(1)
from KEYUNIT_VISITOR v
         left join KEYUNIT k on v.KEYUNITID = k.ID
where trunc(v.CREATEDATE) = trunc(sysdate)
  and exists(select 1
             from ROLEINFO r
             where k.UNITCODE = r.DFKCODE
               and r.FULLPATH like (select FULLPATH from ROLEINFO where ROLEID = '200000200000011088') || '%');

select k.ID, k.UNITNAME
from ROLEINFO r
         inner join KEYUNIT k on r.DfkCode = k.UnitCode
where r.FULLPATH like (select FULLPATH
                       from ROLEINFO
                       where ROLEID = '200000200000011088') || '%';

select RPAD(p.placeCode, 6, '0') as RESIDENCEADMINDIVISION,
       e.NAME,
       p.GZJB,
       p.RKLX,
       p.count,
       e.LONGITUDE,
       e.LATITUDE
from (select substr(b.placecode, 0, 4) as placeCode,
             count(1)                  as count,
             b.RKLX,
             b.GZJB
      from TBL_VIID_ZDR_PERSONDOC tp
               left join tbl_viid_zdr_basicinfo b on tp.zdrid = b.zdrid
      where LONGITUDE is not null
        and LATITUDE is not null
      group by substr(placecode, 0, 4), b.RKLX, b.GZJB) p
         left join EQP_AREA e on p.placeCode = e.ID or RPAD(p.placeCode, 6, '0') = e.ID
where p.placeCode is not null;

select *
from EQP_AREA where ID like '6199%';



select p.RESIDENCEADMINDIVISION, e.NAME, e.LONGITUDE, e.LATITUDE, p.count, p.RKLX, p.GZJB
from (select b.PLACECODE as RESIDENCEADMINDIVISION, count(1) as count, b.RKLX, b.GZJB
      from TBL_VIID_ZDR_PERSONDOC t
               left join TBL_VIID_ZDR_BASICINFO b on t.ZDRID = b.ZDRID
      where substr(b.PLACECODE, -2, 2) != '00'
        and length(b.PLACECODE) = '6'
        and LONGITUDE is not null
        and LATITUDE is not null
      group by b.PLACECODE, b.RKLX, b.GZJB) p
         left join EQP_AREA e on p.RESIDENCEADMINDIVISION = e.ID;

select *
from EQP_AREA where ID = '610100';