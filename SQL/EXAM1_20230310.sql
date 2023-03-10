CREATE DATABASE EXAM1;

CREATE TABLE players(
	Team varchar(10),
	Name varchar(20),
	TOTAL numeric,
	REBOUND numeric,
	ASSIST numeric
);

INSERT INTO players(Team,Name,TOTAL,REBOUND,ASSIST)
VALUES('SHOHOKU','H. Sakuragi',10,26,3),
	  ('SHOHOKU','K. Rukawa',23,12,13),
	  ('Kainan','S. Maki',26,15,6),
	  ('Ryonan','A. Sendoh',28,10,14);

SELECT Team,Name,TOTAL,REBOUND from players
WHERE TOTAL>=10 and TOTAL<=99 and REBOUND>=10 and REBOUND<=99
ORDER BY REBOUND DESC;