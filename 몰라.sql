INSERT INTO `board_terms` (`terms`, `privacy`) VALUES ('terms', 'privacy');
ALTER TABLE `book`
RENAME COLUMN bookID TO bookId;
INSERT INTO `customer` (`name`,`address`,`phone`) VALUES ('김현준', '부산시', '010-9153-7494');
ALTER TABLE `board_user` ADD COLUMN `sessId` VARCHAR(100) unique;
ALTER TABLE `board_user` ADD COLUMN `sessLimitDate` DATETIME;
ALTER TABLE `board_user` DROP column `sessId`;
ALTER TABLE `board_user` DROP column `sessLimitDate`;
UPDATE `board_user`SET
							`sessId`='A10121213xxx',
							`sessLimitDate` = DATE_ADD(NOW(), INTERVAL 1 HOUR)
								WHERE
									`uid`='et002727';
SELECT * FROM `board_user` WHERE `sessId`=? AND `sessLimitDate` > NOW();

UPDATE `board_user` SET `sessId`=NULL, `sessLimitDate`=NULL, `sessId`=NULL WHERE `uid`=?;

SELECT a.*, b.nick FROM `board_article` AS a 
JOIN `board_user` AS b 
ON a.uid = b.uid 
WHERE 
	`parent`=0 AND 
	(`title` LIKE '%검색 키워드%' OR 
	`nick` LIKE '%파일%');
	
SELECT COUNT(`no`) FROM `board_article` AS a 
JOIN `board_user` AS b 
ON a.uid= b.uid
WHERE `parent`=0 AND
(`title` LIKE '%검색 키워드%' OR 
	`nick` LIKE '%파일%');

SELECT a.*, b.nick board_terms
select * from `board_user` where `uid`='et002727' and `pass`=SHA2('!q2w3e4r', 256);