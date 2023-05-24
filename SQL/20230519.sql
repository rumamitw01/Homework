#Ch15-1
SELECT statefp AS st,
       round (
              ( sum(ST_Area(geom::geography) / 2589988.110336))::numeric, 2
             ) AS square_miles
FROM us_counties_2019_shp
GROUP BY statefp
ORDER BY square_miles DESC;

#Ch15-2
WITH
    market_start (geog_point) AS
    (
     SELECT geog_point
     FROM farmers_markets
     WHERE market_name = 'The Oakleaf Greenmarket'
    ),
    market_end (geog_point) AS
    (
     SELECT geog_point
     FROM farmers_markets
     WHERE market_name = 'Columbia Farmers Market'
    )
SELECT ST_Distance(market_start.geog_point, market_end.geog_point) / 1609.344 -- convert to meters to miles
FROM market_start, market_end;

#Ch15-3
SELECT census.name,
       census.statefp,
       markets.market_name,
       markets.county,
       markets.st
FROM farmers_markets markets JOIN us_counties_2019_shp census
    ON ST_Intersects(markets.geog_point, ST_SetSRID(census.geom,4326)::geography)
    WHERE markets.county IS NULL
ORDER BY census.statefp, census.name;

#Ch15-4
SELECT census.statefp,
       census.name as county,
       count(*) AS dropoffs
FROM nyc_yellow_taxi_trips taxi JOIN us_counties_2019_shp census
ON ST_Within(
            ST_SetSRID(ST_MakePoint(taxi.dropoff_longitude, taxi.dropoff_latitude),4269)::geometry, census.geom
            )
GROUP BY census.statefp, census.name
ORDER BY count(*) DESC;

#Ch16-1
SELECT earthquake -> 'properties' ->> 'place' AS place,
       to_timestamp((earthquake -> 'properties' ->> 'time')::bigint / 1000) AS timestamp,
       (earthquake -> 'properties' ->> 'mag')::numeric AS mag
FROM earthquakes
WHERE (earthquake -> 'properties' ->> 'tsunami') = '1';

SELECT earthquake #>> '{properties, place}' AS place,
       to_timestamp((earthquake -> 'properties' ->> 'time')::bigint / 1000) AS timestamp,
       (earthquake #>> '{properties, mag}')::numeric AS mag
FROM earthquakes
WHERE (earthquake #>> '{properties, tsunami}') = '1';

#Ch16-2
CREATE TABLE earthquakes_from_json (
    id text PRIMARY KEY,
    title text,
    type text,
    quake_date timestamp with time zone,
    mag numeric,
    place text,
    earthquake_point geography(POINT, 4326),
    url text
);

#Ch16-3
INSERT INTO earthquakes_from_json
SELECT earthquake ->> 'id',
       earthquake -> 'properties' ->> 'title',
       earthquake -> 'properties' ->> 'type',
       to_timestamp((earthquake -> 'properties' ->> 'time')::bigint / 1000),
       (earthquake -> 'properties' ->> 'mag')::numeric,
       earthquake -> 'properties' ->> 'place',
       ST_SetSRID(
            ST_MakePoint(
                (earthquake #>> '{geometry, coordinates, 0}')::numeric,
                (earthquake #>> '{geometry, coordinates, 1}')::numeric
             ),
                 4326)::geography,
       earthquake -> 'properties' ->> 'url'
FROM earthquakes;

SELECT * FROM earthquakes_from_json;


#Ch16-3
{
	"id": 6,
	"fn": "Kathleen",
	"ln": "Roush",
	"lab_access": [{
		"lab_name": "Science B",
		"access_time": "2022-12-17T16:00:00-05:00"
	}, {
		"lab_name": "Science A",
		"access_time": "2022-12-07T10:02:00-05:00"
	}]
}
#Ch16-4
SELECT to_json(teachers_labs)
FROM (
    SELECT id,
           first_name AS fn,
           last_name AS ln,
        (
            SELECT json_agg(to_json(la))
            FROM (
                SELECT lab_name, access_time
                FROM teachers_lab_access
                WHERE teacher_id = teachers.id
                ORDER BY access_time DESC
            ) AS la
        ) AS lab_access
    FROM teachers
    WHERE id = 6)
AS teachers_labs;
