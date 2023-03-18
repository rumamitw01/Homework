#4-1:real，因爲只需要這題總共只需要3位小數點前位數+1位小數點後位數
#4-2:varchar。因爲將姓與名獨立儲存對之後檢索有比較大彈性
#4-3:因爲格式不正確，所以無法成功轉成timestamp type
#5-1
CREATE TABLE test(
	id bigserial,
	movie varchar(30),
	actor varchar(20)
);

COPY test FROM 'C:\test.csv'
WITH (FORMAT CSV,HEADER,DELIMITER ':');

#5-2

COPY (
    SELECT county_name, state_name, births_2019
    FROM us_counties_pop_est_2019
    ORDER BY births_2019 DESC
    LIMIT 20
);

#5-3:資料不夠存，會直接報錯
