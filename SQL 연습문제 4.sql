#날짜 : 2022/09/02
#이름 : 김현준
#내용 : SQL 연습문제4


#실습4-1
CREATE DATABASE `java1_BookStore`;
CREATE USER 'java1_admin4'@'%' IDENTIFIED by '1234';
GRANT ALL PRIVILEGES ON `java1_BookStore`.* TO 'java1_admin4'@'%';
FLUSH PRIVILEGES;

#실습4-2
drop table `customer`;
CREATE TABLE`Customer`(
	`custID` int AUTO_INCREMENT primary key,
    `name` varchar(10) not null,
    `address` varchar(20) default null,
    `phone` char(13) default null
    );
    
CREATE TABLE`Book`(
	`bookID` int primary key,
    `bookName` varchar(20) not null,
    `publisher` varchar(20) not null,
    `price` int default null
    );

CREATE TABLE`Order`(
	`orderId` int AUTO_INCREMENT PRIMARY KEY,
    `custId` int not null,
    `bookId` int not null ,
    `salePrice` int not null,
    `orderDate` date not null
    );

#실습4-3
INSERT INTO `Customer`(`name`,`address`,`phone`)VALUES('박지성','영국 맨체스타','000-5000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`)VALUES('김연아','대한민국 서울','000-6000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`)VALUES('장미란','대한민국 강원도','000-7000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`)VALUES('추신수','미국 클리블랜드','000-8000-0001');
INSERT INTO `Customer`(`name`,`address`) VALUES('박세리','대한민국 대전');


INSERT INTO `Book`VALUES(1,'축구의 역사','굿스포츠',7000);
INSERT INTO `Book`VALUES(2,'축구아는 여자','나무수',13000);
INSERT INTO `Book`VALUES(3,'축구의 이해','대한미디어',22000);
INSERT INTO `Book`VALUES(4,'골프 바이블','대한미디어',35000);
INSERT INTO `Book`VALUES(5,'피겨 교본','굿스포츠',8000);

INSERT INTO `Book`VALUES(6,'역도 단계별기술','굿스포츠',6000);
INSERT INTO `Book`VALUES(7,'야구의 추억','이상미디어',20000);
INSERT INTO `Book`VALUES(8,'야구를 부탁해','이상미디어',13000);
INSERT INTO `Book`VALUES(9,'올림픽 이야기','삼성당',7500);
INSERT INTO `Book`VALUES(10,'Olympic Champions','Pearson',13000);


INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`)VALUES(1,1,6000,'2014-07-01');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`)VALUES(1,3,21000,'2014-07-03');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`)VALUES(2,5,8000,'2014-07-03');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`)VALUES(3,6,6000,'2014-07-04');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`)VALUES(4,7,20000,'2014-07-05');

INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`)VALUES(1,2,12000,'2014-07-07');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`)VALUES(4,8,13000,'2014-07-07');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`)VALUES(3,10,12000,'2014-07-08');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`)VALUES(2,10,7000,'2014-07-09');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`)VALUES(3,8,13000,'2014-07-10');

#실습4-4
select `custID`,`name`,`address` from `customer`;

#실습4-5
select `bookname`,`price` from `book`;

#실습4-6
select `price`,`bookname` from `book`;

#실습4-7
select `bookid`,`bookname`,`publisher`,`price` from `book`;

#실습4-8
select `publisher` from `book`;

#실습4-9
select distinct `publisher` from `book`;

#실습4-10
select * from `book` where `price` >= 20000;

#실습4-11
select * from `book` where `price` < 20000;

#실습4-12
select * from `book` where `price` >= 10000 and `price` <= 20000;

#실습4-13
select `bookid`,`bookname`,`price` from book where `price`>= 15000 and `price` <=30000;

#실습4-14
select * from `book` where `bookid` = 2 or `bookid`=3 or `bookid`=5;

#실습4-15
select * from `book` where `bookid` % 2 = 0;

#실습4-16
select * from `customer` where `name` like '박%';

#실습4-17
select * from `customer` where `address` like '대한민국%';

#실습4-18
select * from `customer` where `phone` is not null; 

#실습4-19
select * from `book` where `publisher` = '굿스포츠' or `publisher` = '대한미디어';

#실습4-20
select `publisher` from `book` where `bookname` = '축구의 역사';

#실습4-21
select `publisher` from `book` where `bookname` like '%축구%';

#실습4-22
select * from `book` where `bookname` like '_구%';

#실습4-23
select * from `book` where `bookname` like '%축구%' and `price` >= 20000;

#실습4-24
select * from `book` order by `bookname`;

#실습4-25
select * from `book` order by `price`,`bookname`;

#실습4-26
select * from `book` order by `price` desc, `publisher`;

#실습4-27
select * from `book` order by `price`desc limit 3;

#실습4-28
select * from `book` order by `price` limit 3;

#실습4-29
select sum(`salePrice`) as `총판매액` from `order`;

#실습4-30
select sum(`salePrice`) as `총판매액`, avg(`salePrice`) as `평균값`, min(`salePrice`) as `최저가`, max(`salePrice`) as `최고가` from `order`;

#실습4-31
select count(`orderId`)as `판매건수` from `order`;

#실습4-32
select 
	`bookId`,
    replace(`bookName`, '야구', '농구') as `bookname`
from `Book`;

#실습4-33

select * from `order`
where `saleprice` >= 8000 
;

#실습4-34
select * from `customer` as a
join `order` as b
on a.custId = b.custId
;

#실습4-35
select * from `customer` as a
join `order` as b
on a.custId = b.custId
order by a.`custId` asc
;

#실습4-36
select `name`,`saleprice` from `customer` as a
join `order` as b
on a.custId = b.custId
;

#실습4-37
select `name`,sum(`saleprice`) from `customer` as a
join `order` as b
on a.custId = b.custId
group by `name`
;

#실습4-38
select `name`,`bookname` from `customer` as a
join `order` as b
on a.custId = b.custId
join `book` as c
on b.`bookId` = c.`bookId`
;

#실습4-39
select `name`,`bookname` from `customer` as a
join `order` as b
on a.custId = b.custId
join `book` as c
on b.`bookId` = c.`bookId`
where `saleprice` = 20000
;

#실습4-40
select `name`,`saleprice` from `customer` as a
right join `order` as b
on a.custId = b.custId
;

#실습4-41
select `bookName` from `Book`
where `price`=(select max(`price`) from `Book`)
;

#실습4-42
select `name` from `Customer` where `custId` not in(select distinct`custId` from `Order`);

#실습4-43
select sum(`salePrice`)as `총매출` from `Order` where `custId`=(select `custId` from `Customer` where `name` = '김연아');


#실습4-44
insert into `Book`(`bookId`,`bookname`,`publisher`) VALUES (11,'스포츠의학','한솔의학서적');

#실습4-45
update `customer` set `address` = '대한민국 부산' where `custId`= 5;

#실습4-46
delete from `Customer` where `custId` = 5;
