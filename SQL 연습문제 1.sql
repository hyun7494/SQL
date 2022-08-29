#날짜 : 2022/08/29
#이름 : 김현준
#내용 : SQL 연습문제1

#실습 1-1
create database `Java1_Shop`;
create user 'java1_admin1'@'%' identified by '1234';
grant all privileges on `Java1_Shop`.* to 'java1_admin1'@'%';
flush privileges;


#실습 1-2
create table `Customer` (
	`custId` varchar(10) Primary key,
    `name` 	 varchar(10) NOT NULL,
    `hp` 	 char(13) DEFAULT NULL,
    `addr` 	 varchar(100) DEFAULT NULL,
    `rdate` date NOT NULL
    );

create table `Product` (
	`prodNo`   int AUTO_INCREMENT Primary key,
    `prodName` varchar(10) NOT NULL,
    `stock`    int DEFAULT 0,
    `price`    int DEFAULT NULL,
    `company`  varchar(20) NOT NULL
    );

create table `Order` (
	`orderNo`      int AUTO_INCREMENT Primary key,
    `orderId`      varchar(10) NOT NULL,
    `orderProduct` int NOT NULL,
    `orderCount` int NOT NULL,
    `orderDate` datetime NOT NULL
    );
    
#실습 1-3

insert into `customer` values('c101','김유신','010-1234-1001','김해시 봉황동','2022-01-01');
insert into `customer` values('c102','김춘추','010-1234-1002','경주시 보문동','2022-01-02');
insert into `customer` values('c103','장보고','010-1234-1003','완도군 청산면','2022-01-03');
insert into `customer` values('c104','강감찬','010-1234-1004','서울시 마포구','2022-01-04');
insert into `customer` (`custid`,`Name`,`rdate`) values ('c105','이성계','2022-01-05');

insert into `customer` values('c106','정철','010-1234-1006','경기도 용인시','2022-01-06');
insert into `customer` (`custid`,`Name`,`rdate`)values('c107','허준','2022-01-07');
insert into `customer` values('c108','이순신','010-1234-1008','서울시 영등포구','2022-01-08');
insert into `customer` values('c109','송상현','010-1234-1009','부산시 동래구','2022-01-09');
insert into `customer` values('c110','정약용','010-1234-1010','경기도 광주시','2022-01-10');

insert into `Product` values(1,'새우깡',5000,1500,'농심');
insert into `Product` values(2,'초코파이',2500,2500,'오리온');
insert into `Product` values(3,'포카칩',3600,1700,'오리온');
insert into `Product` values(4,'양파링',1250,1800,'농심');
insert into `Product` (`prodNo`,`prodName`,`stock`,`company`)values(5,'죠리퐁',2200,'크라운');

insert into `Product` values(6,'마카렛트',3500,3500,'롯데');
insert into `Product` values(7,'뿌셔뿌셔',1650,1200,'오뚜기');

insert into `Order` values(1,'c102',3,2,'2022-07-07 13:15:10');
insert into `Order` values(2,'c101',4,1,'2022-07-01 14:16:11');
insert into `Order` values(3,'c108',1,1,'2022-07-01 17:23:18');
insert into `Order` values(4,'c109',6,5,'2022-07-02 10:46:36');
insert into `Order` values(5,'c102',2,1,'2022-07-03 09:15:37');

insert into `Order` values(6,'c101',7,3,'2022-07-03 12:35:12');
insert into `Order` values(7,'c110',1,2,'2022-07-03 16:55:36');
insert into `Order` values(8,'c104',2,4,'2022-07-04 14:23:23');
insert into `Order` values(9,'c102',1,3,'2022-07-04 21:54:34');
insert into `Order` values(10,'c107',6,1,'2022-07-07 14:21:03');

drop table `Product`;


#실습 1-4
select * from `Customer`;

#실습 1-5
select `custId`, `name`, `hp` from `Customer`;

#실습 1-6
select * from `Product`;

#실습 1-7
select `company` from `Product`;

#실습 1-8
select distinct company from `Product`;

#실습 1-9
select `prodName`, `price` from `Product`;

#실습 1-10
select `prodName`, `price`+500 as `조정단가` from `Product`;

#실습 1-11
select `prodName`, `stock`, `price` from `Product` where `company` = '오리온';

#실습 1-12
select `orderProduct`, `orderCount`, `orderDate` FROM `Order` where `OrderId` = 'c102';

#실습 1-13
select `orderProduct`, `orderCount`, `orderDate` FROM `Order` WHERE `OrderId` = 'c102' && `OrderCount` >= 2;

#실습 1-14
select * FROM `Product` WHERE `Price` >= 1000 && `Price` <= 2000;

#실습 1-15  ***********LIKE********* 모든 문자 조회 => %
select `custId`, `name`, `hp`, `addr` FROM `Customer` WHERE `name` like '김%';

#실습 1-16
SELECT `custID`, `name`, `hp`, `addr` FROM `Customer` WHERE `name` like '__';

#실습 1-17 ***** null은 is 써야한다 *****
SELECT * FROM `Customer` WHERE `hp` is null;

#실습 1-18
SELECT * FROM `Customer` WHERE `addr` is not null;

#실습 1-19  ******* order by********
SELECT * FROM `Customer` order by `rdate` desc;

#실습 1-20
SELECT * FROM `Order` WHERE `orderCount` >= 3 order by `orderCount` DESC , `orderProduct` asc;

#실습 1-21
select AVG(Price) FROM `Product`;

#실습 1-22
SELECT SUM(stock) as `재고량 합계` FROM `Product` WHERE `company` = '농심';

#실습 1-23
SELECT COUNT(custID) AS `고객수` FROM `Customer`;

#실습 1-24
SELECT COUNT(distinct  company) AS `제조업체 수` FROM Product;

#실습 1-25
SELECT `orderProduct` AS `주문 상품번호`, SUM(`orderCount`) AS `총 주문수량` FROM `Order` GROUP BY `orderProduct`;

#실습 1-26
SELECT `company` AS `제조업체`, COUNT(*) AS `제품수`, MAX(`price`) AS `최고가` FROM `Product` group by `company`; 

#실습 1-27
SELECT `company` AS `제조업체`, COUNT(*) AS `제품수`, MAX(`price`) AS `최고가` FROM `Product`
GROUP BY `company` HAVING COUNT(`prodNo`) >= 2;

#실습 1-28
SELECT `orderProduct`, `orderId`, SUM(`orderCount`) AS `총 주문수량` FROM `Order`
GROUP BY `orderProduct`, `orderId`
order by `orderProduct`
;

#실습 1-29
SELECT `orderId`,`prodName` FROM `Order`as a
JOIN `Product` as b
on a.`orderProduct`  = b.`ProdNo`
WHERE `orderId` = 'c102'
;

#실습 1-30
SELECT `orderid`, `name`, `prodName`, `orderDate` FROM `Order` as a
join `Customer` as b on a.orderId = b.custId
join `Product` as c on a.orderProduct = c.prodNo
where `OrderDate` like '2022-07-03%'
;

SELECT `orderid`, `name`, `prodName`, `orderDate` FROM `Order` as a
join `Customer` as b on a.orderId = b.custId
join `Product` as c on a.orderProduct = c.prodNo
where substr(`orderDate`, 1, 10) = '2022-07-03'
;


