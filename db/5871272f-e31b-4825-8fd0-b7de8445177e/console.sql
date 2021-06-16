CREATE TABLE `course`
(
    `course_id`   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程id，实例  1001',
    `course_name` varchar(20) DEFAULT NULL COMMENT '课程名称 示例 机器学习课程',
    PRIMARY KEY (`course_id`)
);

CREATE TABLE `score`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id 示例 1000',
    `student_id`   bigint(20)          DEFAULT NULL COMMENT '学号 示例：202001001',
    `term`         varchar(20)         DEFAULT NULL COMMENT '学期 示例：2020上学期',
    `course_id`    bigint(20)          DEFAULT NULL COMMENT '课程id 示例：1001',
    `score`        int(11)             DEFAULT NULL COMMENT '分数 示例：85',
    `status`       tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1 表示有效， 0 表示无效',
    `gmt_create`   datetime            DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified` datetime            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
);

CREATE TABLE `student`
(
    `student_id`   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '学号 实例:202001001',
    `student_name` varchar(20) DEFAULT NULL COMMENT '姓名 示例：张三',
    PRIMARY KEY (`student_id`)
);

# 统计每个学生每个学期的总分、平均分、最高课程分数，最低课程分数，按照学期 倒序，平均分 倒序，取排序前20名。
# 展示字段名字： 学生学号，学生姓名，学期，总分，均分，最高课程分数，最低课程分数，
select student.student_id,
       student.student_name,
       score.term,
       sum(score.score),
       avg(score.score),
       max(score.score),
       min(score.score)
from score,
     student
where score.student_id = student.student_id
group by student.student_id, student.student_name, score.term
order by avg(score.score) desc
limit 20 offset 0;

# 查询指定学期（term = '2020下学期'）学期,每个课程的学生数、以及不及格（score < 60）学生的数量
select s1.term, s1.course_id, count(s1.student_id), s2.failure
from score s1
         left join (select score.term, score.course_id, count(score.student_id) as failure
                    from score
                    where score.term = '2020下学期'
                      and score.score < 60
                    group by score.term, score.course_id) as s2 on s1.term = s2.term
where s1.term = '2020下学期'
group by s1.term, s1.course_id, s2.failure;

SELECT s1.term,
       s1.course_id,
       COUNT(s1.student_id) AS student_number,
       s2.failure
FROM score s1
         LEFT JOIN
     (SELECT term,
             course_id,
             COUNT(student_id) AS failure
      FROM score
      WHERE term = '2020下学期'
        AND score < 60
      GROUP BY course_id,
               term) s2
     ON s1.term = s2.term
         AND s1.course_id = s2.course_id
WHERE s1.term = '2020下学期'
GROUP BY s1.course_id,
         s1.term, s2.failure;


# 更新指定学生（student_id = 20200001 ）的 指定课程 （course_id = 1001 ） 全部更新为无效（status = 0）
update score
set status=0
where student_id = 20200001
  and course_id = 1001;

create database demo character set utf8;

use demo;