/* view화면 출력 */
SELECT a.*, b.`fno`, b.`oriName`, b.`download` 
FROM `board_article` AS a 
left JOIN `board_file` AS b 
ON a.`no`=b.`parent` 
WHERE `no`=?;

/* 조회수 증가 */
UPDATE `board_article` SET `hit` = `hit`+1 WHERE `no`=?;

/* list 화면 출력 */
SELECT a.*, b.`nick` FROM `board_article` as a
JOIN `board_user` AS b
ON a.uid = b.uid
WHERE `cate`=?;