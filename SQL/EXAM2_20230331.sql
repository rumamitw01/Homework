#1
CREATE TABLE us_counties_pop_est_2019 (
		state_fips text,
		county_fips text,
		region smallint,
		state_name text,
		county_name text,
		area_land bigint,
		area_water bigint,
		internal_point_lat numeric(10,7),
		internal_point_lon numeric(10,7),
		pop_est_2018 integer,
		pop_est_2019 integer,
		births_2019 integer,
		deaths_2019 integer,
		international_migr_2019 integer,
		domestic_migr_2019 integer,
		residual_2019 integer,
		CONSTRAINT counties_2019_key PRIMARY KEY (state_fips, county_fips)
);
COPY us_counties_pop_est_2019
FROM 'C:\Test\us_counties_pop_est_2019.csv'
WITH (FORMAT CSV, HEADER
) ;
CREATE TABLE us_counties_pop_est_2010 (
		state_fips text,
		county_fips text,
		region smallint,
		state_name text,
		county_name text,
		estimates_base_2010 integer,
		CONSTRAINT counties_2010_key PRIMARY KEY (state_fips, county_fips)
);
COPY us_counties_pop_est_2019
FROM 'C:\Test\us_counties_pop_est_2019.csv'
WITH (FORMAT CSV, HEADER
) ;
SELECT '2010' AS year,county_name, estimates_base_2010
FROM us_counties_pop_est_2010
INTERSECT
SELECT '2019' AS year,county_name, pop_est_2019
FROM us_counties_pop_est_2019
;
#2
CREATE TABLE albums(
	album_id bigserial GENERATED ALWAYS AS IDENTITY,
	catalog_code text,
	title text,
	artist text,
	release_date date,
	genre text,
	description text
);
CREATE TABLE songs(
	song_id bigserial GENERATED ALWAYS AS IDENTITY,
	title text REFERENCES albums(title),
	composers text,
	album_id bigint REFERENCES albums(album_id)
);
