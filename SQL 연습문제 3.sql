#날짜 : 2022/09/01
#이름 : 김현준
#내용 : SQL 연습문제 3

#실습 3-1
create database `College`;
Create USER 'java1_admin3'@'%' identified BY '1234';
grant ALL privileges On `java1_College`. * to 'java1_admin3'@'%';
flush privileges;

#실습 3-2
create table `Student`(
	`stdNo` varchar(8) primary key,
    `stdName` varchar(20),
    `stdHp` char(13) unique key,
    `stdYear` int,
    `stdAddress` varchar(100)
    );
    drop table `student`;
    
create table `Lecture`(
	`lecNo` int primary key,
    `lecName` varchar(20),
    `lecCredit` int,
    `lecTime` int,
    `lecClass` varchar(10)
    );
    drop table `Lecture`;

create table `Register`(
`regStdNo` char(8),
`regLecNo` int default null,
`regMidScore` int default null,
`regFinalScore` int default null,
`regTotalScore` int default null,
`regGrade` char(1) default null
);
drop table `Register`;

#실습 3-3
insert into `Student` (`stdNo`,`stdName`,`stdHp`,`stdYear`) values ('20201016','김유신','010-1234-1001','3');
insert into `Student` values ('20201126','김춘추','010-1234-1002','3','경상남도 경주시');
insert into `Student` values ('20210216','장보고','010-1234-1003','2','전라남도 완도시');
insert into `Student` values ('20210326','강감찬','010-1234-1004','2','서울시 영등포구');
insert into `Student` values ('20220416','이순신','010-1234-1005','1','부산시 부산진구');

insert into `Student` values ('20220521','송상현','010-1234-1006','1','부산시 동래구');


insert into `Lecture` values(159,'인지행동심리학',3,40,'본304');
insert into `Lecture` values(167,'운영체제론',3,25,'본B05');
insert into `Lecture` values(234,'중급 영문법',3,20,'본201');
insert into `Lecture` values(239,'세법개론',3,40,'본204');
insert into `Lecture` values(248,'빅데이터 개론',3,20,'본B01');

insert into `Lecture` values(253,'컴퓨팅사고와 코딩',2,10,'본B02');
insert into `Lecture` values(349,'사회복지 마케팅',2,50,'본301');


insert into `Register`(`regStdNo`,`regLecNo`) values ('20201126','234');
insert into `Register`(`regStdNo`,`regLecNo`) values ('20201016','248');
insert into `Register`(`regStdNo`,`regLecNo`) values ('20201016','253');
insert into `Register`(`regStdNo`,`regLecNo`) values ('20201126','239');
insert into `Register`(`regStdNo`,`regLecNo`) values ('20210216','349');

insert into `Register`(`regStdNo`,`regLecNo`) values ('20210326','349');
insert into `Register`(`regStdNo`,`regLecNo`) values ('20201016','167');
insert into `Register`(`regStdNo`,`regLecNo`) values ('20220416','349');


#실습 3-4
select * from `lecture`;

#실습 3-5
select * from `student`;

#실습 3-6
select * from `lecture`;

#실습 3-7
select * from `Student` where `stdYear` = 3;

#실습 3-8
select * from `Lecture` where `lecCredit` = 2;

#실습 3-9
update `register` set `regMidScore` = 36, `regFinalScore` = 42 where
	`regStdNo`='20201126' and `regLecNo`=234;
update `register` set `regMidScore` = 24, `regFinalScore` = 62 where
	`regStdNo`='20201016' and `regLecNo`=248;
update `register` set `regMidScore` = 28, `regFinalScore` = 40 where
	`regStdNo`='20201016' and `regLecNo`=253;
update `register` set `regMidScore` = 37, `regFinalScore` = 57 where
	`regStdNo`='20201126' and `regLecNo`=239;
update `register` set `regMidScore` = 28, `regFinalScore` = 68 where
	`regStdNo`='20210216' and `regLecNo`=349;
    
update `register` set `regMidScore` = 16, `regFinalScore` = 65 where
	`regStdNo`='20210326' and `regLecNo`=349;
update `register` set `regMidScore` = 18, `regFinalScore` = 38 where
	`regStdNo`='20201016' and `regLecNo`=167;
update `register` set `regMidScore` = 25, `regFinalScore` = 58 where
	`regStdNo`='20220416' and `regLecNo`=349;

select * from `Register`;

#실습 3-10
update `Register` set
					`regTotalScore`=`regMidScore` + `regFinalScore`,
					`regGrade` = if(`regTotalScore` >= 90, 'A',
								 if(`regTotalScore` >= 80, 'B',
                                 if(`regTotalScore` >= 70, 'C',
                                 if(`regTotalScore` >= 60, 'D', 'F'))));
                                 
select * from `Register`;
	
#실습 3-11
select * from `Register` order by `regTotalScore` desc;

#실습 3-12
select * from `Register` where `regLecNo`=349 order by `regTotalScore` desc;

#실습 3-13
select * from `Lecture` where `lecTime` >= 30;

#실습 3-14
select `lecName`, `lecClass` from `Lecture`;

#실습 3-15
select `stdNo`, `stdName` from `Student`;

#실습 3-16
select * from `Student` where `stdAddress` is null;

#실습 3-17
select * from `Student` where `stdAddress` like '부산%';

#실습 3-18
select * from `Student` as a
left join `Register` AS b
on a.stdNo = b.regStdno;

#실습 3-19
select `stdNo`,`stdName`, `regLecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`
from `Student` AS a, `Register` AS b
WHERE a.stdNo = b.regStdNo;

#실습 3-20
select `stdName`, `stdNo`, `regLecNo`
FROM `Student` AS a
JOIN `Register` AS b
on a.stdNo = b.regStdNo where `regLecNo` = 349;

#실습 3-21
select `stdNo`,
		`stdName`,
        count(`stdNo`) AS `수강신청 건수`,
        sum(`regTotalScore`) AS `종합 점수`,
        sum(`regTotalScore`) / count(`stdNo`) AS `평균`
from `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo
group by `stdName`;

#실습 3-22
select * from `Register` AS a
JOIN `Lecture` AS b
on a.regLecNo = b.lecNo;

#실습 3-23
select 
	`regStdNo`,
    `regLecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Register` AS a
JOIN `Lecture` AS b
on a.regLecNo = b.lecNo;

#실습 3-24
select
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regTotalScore`) as `사회복지 마케팅 평균`
FROM `Register` AS a 
Join `Lecture` AS b
ON a.regLecNo = b.lecNo
where `lecName` = '사회복지 마케팅';

#실습 3-25
SELECT
	`regStdNo`,
    `lecName`
FROM `Register` AS a
JOIN `Lecture` AS b
ON a.regLecNo = b.lecNo
where `regGrade` = 'A';

#실습 3-26
select * from `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c
On b.regLecNo = c.lecNo;

#실습 3-27
SELECT
	`stdNo`,
    `stdName`,
    `lecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
FROM `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c
On b.regLecNo = c.lecNo
order by `regTotalScore` desc;


#실습 3-28
SELECT
	`stdNo`,
    `stdName`,
    `lecName`,
    `regTotalScore`,
    `regGrade`
FROM `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c
On b.regLecNo = c.lecNo
where `regGrade` = 'F';

#실습 3-29
SELECT
	`stdNo`,
    `stdName`,
    sum(`lecCredit`) AS `이수학점`
FROM `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c
On b.regLecNo = c.lecNo
where `regGrade` != 'F'
group by `stdNo`;

#실습 3-30
SELECT
	`stdNo`,
    `stdName`,
    GROUP_CONCAT(`lecName`) AS `신청과목`,
    GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
FROM `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c
ON b.regLecNo = c.lecNo
GROUP BY `stdNo`;
