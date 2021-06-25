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
            where istreeshow = 1
              and parentid = '330000000000481001') r
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
from CASEINFO
group by FHSCORE;

select *
from caseinfo
where oldcaseid = 'A33100453000020200506015656';

update caseinfo
set fhscore = 60
where oldcaseid = 'A33100453000020200506015656';

select r.dfkcode, nvl(sum(b.cbs), 0) cbs
from (select roleid, rolename, parentid, fullpath, sortid, dfkcode
      from roleinfo
      where istreeshow = 1
        and parentid =
            (select roleid from roleinfo where dfkcode = replace(rpad('510106', 12), ' ', '0') and rownum = 1)) r
         left join (select count(distinct r.mergebh) cbs, r.mergeorg, ri.fullpath
                    from caseinfomerge t,
                         caseinfomergerelatecase r,
                         roleinfo ri
                    where r.mergebh = t.mergebh
                      and ri.roleid = r.mergeorg
                      and ri.fullpath like
                          nvl((select fullpath
                               from roleinfo rr
                               where rr.dfkcode = replace(rpad('510106', 12), ' ', '0')),
                              -1) || '%'
                      and exists(
                            select 1 from caseinfo c where c.caseid = r.caseid and c.isdelete = 0 and c.casestatus != 3)
                    group by r.mergeorg, ri.fullpath) b on b.fullpath like r.fullpath || '%'
group by r.dfkcode;


select nvl(sum(casecount), 0)                   cjs,
       nvl(sum(videocount), 0)                  sps,
       nvl(sum(picCount), 0)                    tps,
       nvl(sum(xyr), 0)                         xyr,
       nvl(sum(xyc), 0)                         xyc,
       nvl(sum(gj0), 0)                         gj0,
       nvl(sum(gj12), 0)                        gj12,
       nvl(sum(gj35), 0)                        gj35,
       nvl(sum(gj6), 0)                         gj6,
       nvl(sum(gk), 0)                          gk,
       nvl(sum(bm), 0)                          bm,
       nvl(sum(bmygk), 0)                       bmygk,
       nvl(sum(jm), 0)                          jm,
       nvl(sum(qxwykb), 0)                      qxwykb,
       nvl(sum(qxwybkb), 0)                     qxwybkb,
       nvl(sum(mh), 0)                          mh,
       nvl(sum(qdgl), 0)                        qdgl,
       nvl(sum(kngl), 0)                        kngl,
       nvl(sum(qt), 0)                          qt,
       nvl(sum(casecount), 0) - nvl(sum(yp), 0) wp,
       nvl(sum(yp), 0)                          yp,
       nvl(sum(wz), 0)                          wz,
       nvl(sum(jc), 0)                          jc,
       nvl(sum(zy), 0)                          zy,
       nvl(sum(tp), 0)                          tp,
       r.dfkcode
from (select roleid, rolename, parentid, fullpath, sortid, dfkcode
      from roleinfo
      where istreeshow = 1
        and (parentid is null or parentid = '0')) r
         left join (select count(1)                                                                           as casecount,
                           sum((select count(id)
                                from casematerialtype t
                                where c.caseid = t.caseid
                                  and t.typecode = 1))                                                           xyr,
                           sum((select count(id)
                                from casematerialtype t
                                where c.caseid = t.caseid
                                  and t.typecode = 2))                                                           xyc,
                           sum(c.videoCount)                                                                  as videoCount,
                           sum(c.picCount)                                                                    as picCount,
                           sum(case when routepointcount = 0 then 1 else 0 end)                               as gj0,
                           sum(case when routepointcount = 1 or routepointcount = 2 then 1 else 0 end)        as gj12,
                           sum(
                                   case when routepointcount >= 3 and routepointcount <= 5 then 1 else 0 end) as gj35,
                           sum(case when routepointcount >= 6 then 1 else 0 end)                              as gj6,
                           sum(
                                   case when securitylevel = 0 or securitylevel is null then 1 else 0 end)    as gk,
                           sum(case
                                   when c.securitylevel = 1 and (sysdate - c.createdate) - nvL(c.securitydays, 7) > 0
                                       then 1
                                   else 0 end)                                                                as bmygk,
                           sum(case when c.securitylevel = 1 then 1else 0 end)                                as bm,
                           sum(case when securitylevel = 2 then 1 else 0 end)                                 as jm,
                           sum(case when clearlevel = 0 then 1 else 0 end)                                    as qxwykb,
                           sum(case when clearlevel = 1 then 1 else 0 end)                                    as qxwybkb,
                           sum(case when clearlevel = 2 then 1 else 0 end)                                    as mh,
                           sum(case when relatelevel = 0 then 1 else 0 end)                                   as qdgl,
                           sum(case when relatelevel = 1 then 1 else 0 end)                                   as kngl,
                           sum(case when relatelevel = 2 then 1 else 0 end)                                   as qt,
                           sum(case when isclosedcase = 2 then 1 else 0 end)                                  as yp,
                           sum(case
                                   when (effect = '-1' or effect is null) and isclosedcase = 2 then 1
                                   else 0 end)                                                                as wz,
                           sum(case when effect = '0' and isclosedcase = 2 then 1 else 0 end)                 as jc,
                           sum(case when effect = '1' and isclosedcase = 2 then 1 else 0 end)                 as zy,
                           sum(case when effect = '2' and isclosedcase = 2 then 1 else 0 end)                 as tp,
                           createdept,
                           fullpath
                    from (select t.*, r.fullpath
                          from caseinfo t,
                               roleinfo r
                          where t.createdept = r.roleid
                            and t.casestatus != 3
                            and t.isdelete = 0
                            and r.istreeshow = 1
                            and t.createdate >= to_date('2021-06-01 00:00:00', 'yyyy-MM-dd HH24:mi:ss')
                            and t.createdate <= to_date('2021-06-25 00:00:00', 'yyyy-MM-dd HH24:mi:ss')) c
                    group by createdept, fullpath) M on M.fullpath like r.fullpath || '%'
group by r.dfkcode;

select p.*,
       q.zlas,
       q.xsajs,
       q.ctxsajs,
       q.qj,
       q.qd,
       q.dq,
       q.fjcxzp,
       decode(q.zlas, 0, 0, (round(p.cjs / q.zlas, 4)) * 100)          zcll,
       decode(q.xsajs, 0, 0, (round(p.xsaj / q.xsajs, 4)) * 100)       xsajcll,
       decode(q.ctxsajs, 0, 0, (round(p.ctxsaj / q.ctxsajs, 4)) * 100) ctxsajcll,
       decode(q.xsajs, 0, 0, (round(q.qj / q.xsajs, 4)) * 100)         qjl,
       decode(q.xsajs, 0, 0, (round(q.qd / q.xsajs, 4)) * 100)         qdl,
       decode(q.xsajs, 0, 0, (round(q.dq / q.xsajs, 4)) * 100)         dql,
       decode(q.xsajs, 0, 0, (round(q.fjcxzp / q.xsajs, 4)) * 100)     fjcxzpl
from (select Y.*, decode(y.cjs, 0, 0, (round(y.lrjs / y.cjs, 4)) * 100) lrjsl
      from (select r.roleid,
                   r.rolename,
                   r.dfkcode,
                   nvl(sum(casecount), 0) cjs,
                   nvl(sum(xsaj), 0)      xsaj,
                   nvl(sum(zaaj), 0)      zaaj,
                   nvl(sum(ctxsaj), 0)    ctxsaj,
                   nvl(sum(lrjs), 0)      lrjs
            from (select roleid, rolename, parentid, fullpath, sortid, dfkcode
                  from roleinfo
                  where istreeshow = 1
                    and parentid = '330000000000481001') r
                     left join (select *
                                from (select count(1) as                                                     casecount,
                                             sum(case when c.categoriescode = '10' then 1 else 0 end)        xsaj,
                                             sum(case when c.categoriescode = '20' then 1 else 0 end)        zaaj,
                                             sum(case
                                                     when C.CATEGORIESCODE = '10' AND EXISTS(SELECT 1
                                                                                             FROM CODE_AJLB CA
                                                                                             WHERE CA.CODE = PARENTCATEGORIESCODE
                                                                                               AND CA.ISXGXSAJ = '1') AND
                                                          (PARENTCATEGORIESCODE != '050002001800' AND
                                                           PARENTCATEGORIESCODE NOT LIKE '0500030002%' OR
                                                           (C.PARENTCATEGORIESCODE IS NULL OR C.PARENTCATEGORIESCODE LIKE '060210%'))
                                                         then 1
                                                     else 0 end)                                             ctxsaj,
                                             sum(case when c.createdate - c.casetime <= 3 then 1 else 0 end) lrjs,
                                             createdept,
                                             fullpath
                                      from (SELECT C.*, I.FULLPATH
                                            FROM CASEINFO C
                                                     LEFT JOIN ROLEINFO I ON C.CREATEDEPT = I.ROLEID
                                            WHERE C.ISDELETE = 0
                                              AND C.CASESTATUS <> 3
                                              AND I.ISTREESHOW = 1
                                              AND (CASEINFOSTATUSCODE is null or CASEINFOSTATUSCODE <> '0500')
                                              and I.FULLPATH LIKE
                                                  (SELECT FULLPATH FROM ROLEINFO WHERE ROLEID = '330000000000481001') || '%'
                                              and C.ESTABLISHDATE >=
                                                  TO_DATE('2021-01-01 13:54:41', 'YYYY-MM-DD HH24:MI:SS')
                                              and C.ESTABLISHDATE <=
                                                  TO_DATE('2021-06-20 13:54:41', 'YYYY-MM-DD HH24:MI:SS')
                                              and C.CASESOURCE = '案件倒查') C
                                      GROUP BY CREATEDEPT, FULLPATH)) M on M.fullpath like r.fullpath || '%'
            GROUP BY R.ROLEID, R.ROLENAME, R.SORTID, R.DFKCODE
            ORDER BY R.DFKCODE ASC, R.SORTID) Y) P
         LEFT JOIN (SELECT R.ROLEID,
                           R.ROLENAME,
                           NVL(SUM(M.ZLAS), 0)    ZLAS,
                           NVL(SUM(M.XSAJS), 0)   XSAJS,
                           NVL(SUM(M.CTXSAJS), 0) CTXSAJS,
                           NVL(SUM(M.QJ), 0)      QJ,
                           NVL(SUM(M.QD), 0)      QD,
                           NVL(SUM(M.DQ), 0)      DQ,
                           NVL(SUM(M.FJCXZP), 0)  FJCXZP
                    FROM (SELECT ROLEID, ROLENAME, PARENTID, FULLPATH, SORTID, DFKCODE
                          FROM ROLEINFO
                          WHERE 1 = 1
                            and parentid = '330000000000481001') r
                             LEFT JOIN (SELECT LADW_GAJGJGDM                                                                          LADW,
                                               (SELECT CG.CODE_LEV1 FROM CODE_GXS CG WHERE CODE = LADW_GAJGJGDM)                      LEV1,
                                               (SELECT CG.CODE_LEV2 FROM CODE_GXS CG WHERE CODE = LADW_GAJGJGDM)                      LEV2,
                                               (SELECT CG.CODE_LEV3 FROM CODE_GXS CG WHERE CODE = LADW_GAJGJGDM)                      LEV3,
                                               (SELECT CG.CODE_LEV4 FROM CODE_GXS CG WHERE CODE = LADW_GAJGJGDM)                      LEV4,
                                               (SELECT CG.CODE_LEV5 FROM CODE_GXS CG WHERE CODE = LADW_GAJGJGDM)                      LEV5,
                                               COUNT(1)                                                                               ZLAS,
                                               SUM(CASE WHEN XSJQLBDM = '100' THEN 1 ELSE 0 END)                                      XSAJS,
                                               SUM(CASE
                                                       WHEN XSJQLBDM = '100' AND
                                                            (ISXGXSAJ = '1' AND ZATZ_JYQK != '050002001800' AND
                                                             ZATZ_JYQK NOT LIKE '0500030002%' OR
                                                             (CODELEV2 IS NULL OR CODELEV2 LIKE '060210%')) THEN 1
                                                       ELSE 0 END)                                                                    CTXSAJS,
                                               SUM(
                                                       case when XSJQLBDM = '100' and codelev2 like '050004%' then 1 else 0 end)      qd,
                                               SUM(
                                                       case when XSJQLBDM = '100' and codelev2 like '050001%' then 1 else 0 end)      qj,
                                               SUM(
                                                       case when XSJQLBDM = '100' and codelev2 like '050002%' then 1 else 0 end)      dq,
                                               SUM(
                                                       case when XSJQLBDM = '100' and ZATZ_JYQK like '0500030002%' then 1 else 0 end) fjcxzp
                                        FROM (SELECT T.LADW_GAJGJGDM,
                                                     T.AJLBDM,
                                                     T.PASJ,
                                                     T.ZCJDDM,
                                                     T.ZATZ_JYQK,
                                                     T.XSJQLBDM,
                                                     (SELECT C.ISXGXSAJ FROM CODE_AJLB C WHERE C.CODE = T.AJLBDM)  ISXGXSAJ,
                                                     (SELECT C.CODE_LEV1 FROM CODE_AJLB C WHERE C.CODE = T.AJLBDM) CODELEV,
                                                     (SELECT C.CODE FROM CODE_AJLB C WHERE C.CODE = T.AJLBDM)      CODELEV2
                                              FROM TB_ST_ASJ T
                                              WHERE 1 = 1
                                                AND LARQ >= TO_DATE('2021-01-01 13:54:41', 'YYYY-MM-DD HH24:MI:SS')
                                                AND LARQ <= TO_DATE('2021-06-20 13:54:41', 'YYYY-MM-DD HH24:MI:SS')
                                                and LADW_GAJGJGDM in (select code
                                                                      from code_gxs ri
                                                                      where ri.code =
                                                                            (select dfkcode from roleinfo ri where ri.roleid = '330000000000481001')
                                                                         or ri.CODE_LEV1 =
                                                                            (select dfkcode from roleinfo ri where ri.roleid = '330000000000481001')
                                                                         or ri.CODE_LEV2 =
                                                                            (select dfkcode from roleinfo ri where ri.roleid = '330000000000481001')
                                                                         or ri.CODE_LEV3 =
                                                                            (select dfkcode from roleinfo ri where ri.roleid = '330000000000481001')
                                                                         or ri.CODE_LEV4 =
                                                                            (select dfkcode from roleinfo ri where ri.roleid = '330000000000481001')
                                                                         or ri.CODE_LEV5 =
                                                                            (select dfkcode from roleinfo ri where ri.roleid = '330000000000481001'))) A
                                        GROUP BY A.LADW_GAJGJGDM) M
                                       ON (R.DFKCODE = M.LEV1 OR R.DFKCODE = M.LEV2 OR R.DFKCODE = M.LEV3 OR
                                           R.DFKCODE = M.LEV4 OR R.DFKCODE = M.LEV5 OR R.DFKCODE = M.LADW)
                    GROUP BY R.ROLEID, R.ROLENAME, R.SORTID, R.DFKCODE
                    ORDER BY R.DFKCODE ASC, R.SORTID) Q ON P.ROLEID = Q.ROLEID;

--[330000000000481001, 330000000000481001, 2021-05-20 00:00:00, 2021-06-20 13:54:41, 案件倒查, 330000000000481001, 2021-05-20 00:00:00, 2021-06-20 13:54:41, 330000000000481001, 330000000000481001, 330000000000481001, 330000000000481001, 330000000000481001, 330000000000481001]

select *
from CASEINFO
where ESTABLISHDATE between TO_DATE('2021-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') and TO_DATE('2021-06-01 23:59:59', 'YYYY-MM-DD HH24:MI:SS');

select ESTABLISHDATE
from CASEINFO where CASEID = '330602010000210625095947947389';