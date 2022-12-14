/* SELECT_PRODUCTS */
SELECT * FROM `km_product` 
WHERE `prodCate2` =? 
ORDER BY `prodNo` DESC limit ?, 10;

/* SELECT_COUNT_TOTAL */
SELECT COUNT(`prodNo`) FROM `km_product` 
where `prodCate`=?;