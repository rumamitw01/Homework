#Ch13-1
WITH temps_collapsed (station_name, max_temperature_group) AS
    (SELECT station_name,
           CASE WHEN max_temp >= 90 THEN '90 or more'
                WHEN max_temp >= 88 AND max_temp < 90 THEN '88-89'
                WHEN max_temp >= 86 AND max_temp < 88 THEN '86-87'
                WHEN max_temp >= 84 AND max_temp < 86 THEN '84-85'
                WHEN max_temp >= 82 AND max_temp < 84 THEN '82-83'
                WHEN max_temp >= 80 AND max_temp < 82 THEN '80-81'
                WHEN max_temp < 80 THEN '79 or less'
            END
    FROM temperature_readings
    WHERE station_name = 'WAIKIKI 717.2 HI US')

SELECT station_name, max_temperature_group, count(*)
FROM temps_collapsed
GROUP BY station_name, max_temperature_group
ORDER BY max_temperature_group;

#Ch13-2
SELECT *
FROM crosstab('SELECT flavor,
                      office,
                      count(*)
               FROM ice_cream_survey
               GROUP BY flavor, office
               ORDER BY flavor',

              'SELECT office
               FROM ice_cream_survey
               GROUP BY office
               ORDER BY office')

AS (flavor text,
    downtown bigint,
    midtown bigint,
    uptown bigint);


#Ch14-1
SELECT replace('Williams, Sr.', ', ', ' ');
SELECT regexp_replace('Williams, Sr.', ', ', ' ');
SELECT (regexp_match('Williams, Sr.', '.*, (.*)'))[1];

#Ch14-2
WITH
    word_list (word)
AS
    (
        SELECT regexp_split_to_table(speech_text, '\s') AS word
        FROM president_speeches
        WHERE speech_date = '1946-01-21'
    )

SELECT lower(
               replace(replace(replace(word, ',', ''), '.', ''), ':', '')
             ) AS cleaned_word,
       count(*)
FROM word_list
WHERE length(word) >= 5
GROUP BY cleaned_word
ORDER BY count(*) DESC;

#Ch14-3
SELECT president,
       speech_date,
       ts_rank_cd(search_speech_text, search_query, 2) AS rank_score
FROM president_speeches,
     to_tsquery('war & security & threat & enemy') search_query
WHERE search_speech_text @@ search_query
ORDER BY rank_score DESC
LIMIT 5;