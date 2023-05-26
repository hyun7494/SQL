/*
SELECT a.*, b.`prodName`,`descript`,`thumb3` FROM `km_product_cart` AS a
JOIN `km_product` AS b ON a.prodNo = b.prodNo WHERE `uid`= 'et009153';
UPDATE `km_product_cart` SET `count`=COUNT+2 where `cartNo`=68;
SELECT `c1Name` FROM `km_product_cate1` WHERE `cate1`=11;
*/

INSERT INTO `km_product_cate1` (cate1,c1Name) VALUES (10,'브랜드패션');
INSERT INTO `km_product_cate1` (cate1,c1Name) VALUES (11,'패션의류·잡화·뷰티');
INSERT INTO `km_product_cate1` (cate1,c1Name) VALUES (12,'유아동');
INSERT INTO `km_product_cate1` (cate1,c1Name) VALUES (13,'식품·생필품');
INSERT INTO `km_product_cate1` (cate1,c1Name) VALUES (14,'홈데코·문구·취미·반려');
INSERT INTO `km_product_cate1` (cate1,c1Name) VALUES (15,'컴퓨터·디지털·가전');
INSERT INTO `km_product_cate1` (cate1,c1Name) VALUES (16,'스포츠·건강·렌탈');
INSERT INTO `km_product_cate1` (cate1,c1Name) VALUES (17,'자동차·공구');
INSERT INTO `km_product_cate1` (cate1,c1Name) VALUES (18,'여행·도서·티켓·e쿠폰');

INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (10, 10, '브랜드 여성의류')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (10, 11, '브랜드 남성의류')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (10, 12, '브랜드 진·캐쥬얼')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (10, 13, '브랜드 신발·가방')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (10, 14, '브랜드 쥬얼리·시계')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (10, 15, '브랜드 아웃도어')

INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (11, 10, '여성의류')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (11, 11, '남성의류')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (11, 12, '언더웨어')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (11, 13, '신발')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (11, 14, '가방·잡화')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (11, 15, '주얼리·시계')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (11, 16, '화장품·향수')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (11, 17, '바디·헤어')

INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (12, 10, '출산·육아')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (12, 11, '장난감·완구')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (12, 12, '유아동 의류')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (12, 13, '유아동 신발/잡화')

INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (13, 10, '신선식품')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (13, 11, '가공식품')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (13, 12, '건강식품')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (13, 13, '커피/음료')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (13, 14, '생필품')
INSERT INTO `km_product_cate2` (cate1,cate2,c2Name) VALUES (11, 15, '바디/헤어')
