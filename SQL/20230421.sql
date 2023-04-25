#ch9

#9-1
#不使用HAVING過濾
SELECT pls18.stabr,
       sum(pls18.totstaff) AS totstaff_2018,
       sum(pls17.totstaff) AS totstaff_2017,
       sum(pls16.totstaff) AS totstaff_2016,
       round( (sum(pls18.totstaff::numeric) - sum(pls17.totstaff)) /
            sum(pls17.totstaff) * 100, 1 ) AS chg_2018_17,
       round( (sum(pls17.totstaff::numeric) - sum(pls16.totstaff)) /
            sum(pls16.totstaff) * 100, 1 ) AS chg_2017_16
FROM pls_fy2018_libraries pls18
       JOIN pls_fy2017_libraries pls17 ON pls18.fscskey = pls17.fscskey
       JOIN pls_fy2016_libraries pls16 ON pls18.fscskey = pls16.fscskey
WHERE pls18.totstaff >= 0
       AND pls17.totstaff >= 0
       AND pls16.totstaff >= 0
GROUP BY pls18.stabr
ORDER BY chg_2018_17 DESC;

#使用HAVING過濾
SELECT pls18.stabr,
       sum(pls18.totstaff) AS totstaff_2018,
       sum(pls17.totstaff) AS totstaff_2017,
       sum(pls16.totstaff) AS totstaff_2016,
       round( (sum(pls18.totstaff::numeric) - sum(pls17.totstaff)) /
            sum(pls17.totstaff) * 100, 1 ) AS chg_2018_17,
       round( (sum(pls17.totstaff::numeric) - sum(pls16.totstaff)) /
            sum(pls16.totstaff) * 100, 1 ) AS chg_2017_16
FROM pls_fy2018_libraries pls18
       JOIN pls_fy2017_libraries pls17 ON pls18.fscskey = pls17.fscskey
       JOIN pls_fy2016_libraries pls16 ON pls18.fscskey = pls16.fscskey
WHERE pls18.totstaff >= 0
       AND pls17.totstaff >= 0
       AND pls16.totstaff >= 0
GROUP BY pls18.stabr
HAVING sum(pls18.visits) > 50000000
ORDER BY chg_2018_17 DESC;

#9-2
SELECT pls18.obereg,
       sum(pls18.visits) AS visits_2018,
       sum(pls17.visits) AS visits_2017,
       sum(pls16.visits) AS visits_2016,
       round( (sum(pls18.visits::numeric) - sum(pls17.visits)) /
            sum(pls17.visits) * 100, 1 ) AS chg_2018_17,
       round( (sum(pls17.visits::numeric) - sum(pls16.visits)) /
            sum(pls16.visits) * 100, 1 ) AS chg_2017_16
FROM pls_fy2018_libraries pls18
       JOIN pls_fy2017_libraries pls17 ON pls18.fscskey = pls17.fscskey
       JOIN pls_fy2016_libraries pls16 ON pls18.fscskey = pls16.fscskey
WHERE pls18.visits >= 0
       AND pls17.visits >= 0
       AND pls16.visits >= 0
GROUP BY pls18.obereg
ORDER BY chg_2018_17 DESC;

#獎勵題
CREATE TABLE obereg_codes (
    obereg text CONSTRAINT obereg_key PRIMARY KEY,
    region text
);

INSERT INTO obereg_codes
VALUES ('01', 'New England (CT ME MA NH RI VT)'),
       ('02', 'Mid East (DE DC MD NJ NY PA)'),
       ('03', 'Great Lakes (IL IN MI OH WI)'),
       ('04', 'Plains (IA KS MN MO NE ND SD)'),
       ('05', 'Southeast (AL AR FL GA KY LA MS NC SC TN VA WV)'),
       ('06', 'Soutwest (AZ NM OK TX)'),
       ('07', 'Rocky Mountains (CO ID MT UT WY)'),
       ('08', 'Far West (AK CA HI NV OR WA)'),
       ('09', 'Outlying Areas (AS GU MP PR VI)');

SELECT obereg_codes.region,
       sum(pls18.visits) AS visits_2018,
       sum(pls17.visits) AS visits_2017,
       sum(pls16.visits) AS visits_2016,
       round( (sum(pls18.visits::numeric) - sum(pls17.visits)) /
            sum(pls17.visits) * 100, 1 ) AS chg_2018_17,
       round( (sum(pls17.visits::numeric) - sum(pls16.visits)) /
            sum(pls16.visits) * 100, 1 ) AS chg_2017_16
FROM pls_fy2018_libraries pls18
       JOIN pls_fy2017_libraries pls17 ON pls18.fscskey = pls17.fscskey
       JOIN pls_fy2016_libraries pls16 ON pls18.fscskey = pls16.fscskey
       JOIN obereg_codes ON pls18.obereg = obereg_codes.obereg
WHERE pls18.visits >= 0
       AND pls17.visits >= 0
       AND pls16.visits >= 0
GROUP BY obereg_codes.region
ORDER BY chg_2018_17 DESC;



#ch10
ALTER TABLE meat_poultry_egg_establishments ADD COLUMN meat_processing boolean;
ALTER TABLE meat_poultry_egg_establishments ADD COLUMN poultry_processing boolean;
SELECT * FROM meat_poultry_egg_establishments;
UPDATE meat_poultry_egg_establishments
SET meat_processing = TRUE
WHERE activities ILIKE '%meat processing%';
UPDATE meat_poultry_egg_establishments
SET poultry_processing = TRUE
WHERE activities ILIKE '%poultry processing%';
SELECT * FROM meat_poultry_egg_establishments;
SELECT count(meat_processing), count(poultry_processing)
FROM meat_poultry_egg_establishments;
SELECT count(*)
FROM meat_poultry_egg_establishments
WHERE meat_processing = TRUE AND
      poultry_processing = TRUE;