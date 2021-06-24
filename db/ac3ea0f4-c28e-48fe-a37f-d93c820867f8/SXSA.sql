select roleid, rolename, parentid, fullpath, sortid, dfkcode
from roleinfo
where istreeshow = 1;

select c.*, i.fullpath
from caseinfo c
         left join roleinfo i on c.createdept = i.roleid;

select *
from (select createdept,
             fullpath,
             count(1) cou
      from (
               select c.*, i.fullpath
               from caseinfo c
                        left join roleinfo i on c.createdept = i.roleid
           ) c
      group by createdept, fullpath);

select *
from (select createdept,
             fullpath,
             SHSCORE,
             count(1) cou
      from (
               select c.*, i.fullpath
               from caseinfo c
                        left join roleinfo i on c.createdept = i.roleid
           ) c
      group by createdept, fullpath, SHSCORE);

select *
from (select createdept,
             fullpath,
             FHSCORE,
             count(1) cou
      from (
               select c.*, i.fullpath
               from caseinfo c
                        left join roleinfo i on c.createdept = i.roleid
           ) c
      group by createdept, fullpath, FHSCORE);

select Y.*
from (
         select r.roleid,
                r.dfkcode,
                r.rolename,
                nvl(sum(cou), 0) cou
         from (select roleid, rolename, parentid, fullpath, sortid, dfkcode
               from roleinfo
               where istreeshow = 1
                 and PARENTID = '330000000000481001'
              ) r
                  left join (select *
                             from (select createdept,
                                          fullpath,
                                          count(1) cou
                                   from (
                                            select c.*, i.fullpath
                                            from caseinfo c
                                                     left join roleinfo i on c.createdept = i.roleid
                                        ) c
                                   group by createdept, fullpath)
         ) M on M.fullpath like r.fullpath || '%'
         group by roleid, rolename, sortid, dfkcode
         order by ROLEID asc, sortid
     ) Y;

select *
from ROLEINFO
where PARENTID = '330000000000481001';

select Y.*,
       decode((y.tps - y.zlz), 0, 0, (round(y.bz / (y.tps - y.zlz), 4)) * 100)                                      bzl,
       decode((y.gj37 + y.gj7 + y.gj0 + y.gj12), 0, 0, (round(y.gj7 / (y.gj37 + y.gj7 + y.gj0 + y.gj12), 4)) * 100) yxl,
       decode((y.gj37 + y.gj7 + y.gj0 + y.gj12), 0, 0,
              (round((y.gj37 + y.gj7 + y.gj12) / (y.gj37 + y.gj7 + y.gj0 + y.gj12), 4)) * 100)                      gjl
from (
         select r.roleid,
                r.rolename,
                r.dfkcode,
                nvl(sum(videocount), 0) sps,
                nvl(sum(picCount), 0)   tps,
                nvl(sum(labelcount), 0) bz,
                nvl(sum(gj0), 0)        gj0,
                nvl(sum(gj12), 0)       gj12,
                nvl(sum(gj37), 0)       gj37,
                nvl(sum(gj7), 0)        gj7,
                nvl(sum(zlz), 0)        zlz
         from (select roleid, rolename, parentid, fullpath, sortid, dfkcode
               from roleinfo
               where istreeshow = 1
                 and parentid = '330000000000481001'
              ) r
                  left join (select sum(c.videoCount)                                                                as videoCount,
                                    sum(c.picCount)                                                                  as picCount,
                                    sum(c.labelcount)                                                                as labelcount,
                                    sum(case when routepointcount = 0 then 1 else 0 end)                             as gj0,
                                    sum(case when routepointcount = 1 or routepointcount = 2 then 1 else 0 end)      as gj12,
                                    sum(
                                            case when routepointcount > 2 and routepointcount < 6 then 1 else 0 end) as gj37,
                                    sum(case when routepointcount > 5 then 1 else 0 end)                             as gj7,
                                    sum(zlz)                                                                            zlz,
                                    createdept,
                                    fullpath
                             from (
                                      select c.*,
                                             i.fullpath,
                                             (SELECT COUNT(1)
                                              FROM CASEMATERIAL CM
                                              WHERE CM.CASEID = C.CASEID
                                                AND ISFACEPIC = 1) AS ZLZ
                                      from caseinfo c
                                               left join roleinfo i on c.createdept = i.roleid
                                  ) c
                             group by createdept, fullpath) M
                            on M.fullpath like r.fullpath || '%'
         group by roleid, rolename, sortid, dfkcode
         order by dfkcode asc, sortid
     ) Y;

select Y.*, (select cnt from codedetail where typeid = 'casescore' and id = field) cnt
from (select r.roleid, r.dfkcode, r.rolename, fhscore field, nvl(sum(cou), 0) cou
      from (select roleid, rolename, parentid, fullpath, sortid, dfkcode
            from roleinfo
            where istreeshow = 1 and parentid = '330000000000481001') r
               left join (select *
                          from (select createdept, fullpath, fhscore, count(1) cou
                                from (select c.*, i.fullpath
                                      from caseinfo c
                                               left join roleinfo i on c.createdept = i.roleid
                                      where C.ISDELETE = 0
                                        AND C.CASESTATUS <> 3
                                        AND I.ISTREESHOW = 1
                                        AND (CASEINFOSTATUSCODE is null or CASEINFOSTATUSCODE <> '0500')
                                       ) c
                                group by createdept, fullpath, fhscore)) M on M.fullpath like r.fullpath || '%'
      group by roleid, rolename, sortid, dfkcode, fhscore
      order by dfkcode asc, sortid) Y;
-- [330000088888888888, 2010-05-25 00:00:00, 2021-06-24 23:59:59, 2010-05-25 00:00:00, 2021-06-24 23:59:59]

select FHSCORE
from CASEINFO group by FHSCORE;

select * from caseinfo where oldcaseid = 'A33100453000020200506015656';

update caseinfo set fhscore = 60 where oldcaseid = 'A33100453000020200506015656';