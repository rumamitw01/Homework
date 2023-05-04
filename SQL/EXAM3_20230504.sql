#前置作業(匯入資料)
#第一題
CREATE DATABASE test;

CREATE TABLE acs_2014_2018_stats (
    geoid text CONSTRAINT geoid_key PRIMARY KEY,
    county text NOT NULL,
    st text NOT NULL,
    pct_travel_60_min numeric(5,2),
    pct_bachelors_higher numeric(5,2),
    pct_masters_higher numeric(5,2),
    median_hh_income integer,
    CHECK (pct_masters_higher <= pct_bachelors_higher)
);

COPY acs_2014_2018_stats
FROM 'C:\test\acs_2014_2018_stats.csv'
WITH (FORMAT CSV, HEADER);

#第二題
CREATE TABLE us_exports (
    year smallint,
    month smallint,
    citrus_export_value bigint,	
    soybeans_export_value bigint
);

COPY us_exports
FROM 'C:\test\us_exports.csv'
WITH (FORMAT CSV, HEADER);

#第三題
CREATE TABLE pls_fy2018_libraries (
    stabr text NOT NULL,
    fscskey text CONSTRAINT fscskey_2018_pkey PRIMARY KEY,
    libid text NOT NULL,
    libname text NOT NULL,
    address text NOT NULL,
    city text NOT NULL,
    zip text NOT NULL,
    county text NOT NULL,
    phone text NOT NULL,
    c_relatn text NOT NULL,
    c_legbas text NOT NULL,
    c_admin text NOT NULL,
    c_fscs text NOT NULL,
    geocode text NOT NULL,
    lsabound text NOT NULL,
    startdate text NOT NULL,
    enddate text NOT NULL,
    popu_lsa integer NOT NULL,
    popu_und integer NOT NULL,
    centlib integer NOT NULL,
    branlib integer NOT NULL,
    bkmob integer NOT NULL,
    totstaff numeric(8,2) NOT NULL,
    bkvol integer NOT NULL,
    ebook integer NOT NULL,
    audio_ph integer NOT NULL,
    audio_dl integer NOT NULL,
    video_ph integer NOT NULL,
    video_dl integer NOT NULL,
    ec_lo_ot integer NOT NULL,
    subscrip integer NOT NULL,
    hrs_open integer NOT NULL,
    visits integer NOT NULL,
    reference integer NOT NULL,
    regbor integer NOT NULL,
    totcir integer NOT NULL,
    kidcircl integer NOT NULL,
    totpro integer NOT NULL,
    gpterms integer NOT NULL,
    pitusr integer NOT NULL,
    wifisess integer NOT NULL,
    obereg text NOT NULL,
    statstru text NOT NULL,
    statname text NOT NULL,
    stataddr text NOT NULL,
    longitude numeric(10,7) NOT NULL,
    latitude numeric(10,7) NOT NULL
);

COPY pls_fy2018_libraries
FROM 'C:\test\pls_fy2018_libraries.csv'
WITH (FORMAT CSV, HEADER);


#相關係數(第一題)
SELECT corr(pct_masters_higher, median_hh_income)
    AS masters_income_r
FROM acs_2014_2018_stats;
#(pct_masters_higher 和 median_hh_income 的 r 值約為 0.60，
碩士學位或更高學歷百分比與收入之間的關係低於學士或更高學歷百分比與收入之間的關係，
有可能是因為與獲得學士學位相比，獲得碩士學位或更高學位對收入的影響可能更大，拉得更開了自然跟家戶所得中位數就更沒關係了)

#畫圖並解釋(第二題)
SELECT year, month, soybeans_export_value,
    round(   
       sum(soybeans_export_value) 
            OVER(ORDER BY year, month 
                 ROWS BETWEEN 11 PRECEDING AND CURRENT ROW), 0)
       AS twelve_month_avg
FROM us_exports
ORDER BY year, month;
#(大豆出口在 2000 年代後期大幅增長，並在 2018 年開始大幅下降。)

#排名(第三題)
SELECT
    libname,
    stabr,
    visits,
    popu_lsa,
    round(
        (visits::numeric / popu_lsa) * 1000, 1
        ) AS visits_per_1000,
    rank() OVER (ORDER BY (visits::numeric / popu_lsa) * 1000 DESC)
FROM pls_fy2018_libraries
WHERE popu_lsa >= 250000;