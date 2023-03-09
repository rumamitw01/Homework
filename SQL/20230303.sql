--2
CREATE DATABASE game_maker;
CREATE TABLE rpgmaker(
	id bigserial,
	name varchar(20),
	release_date date
);
INSERT INTO rpgmaker(name,release_date)
VALUES ('RPG Maker 95','1997-03-28'),
       ('RPG Maker 2000','2000-04-05'),
	   ('RPG Maker 2003','2002-12-18'),
	   ('RPG Maker XP','2004-06-22'),
	   ('RPG Maker VX','2007-12-27'),
	   ('RPG Maker VX Ace','2011-12-15'),
	   ('RPG Maker MV','2015-12-17'),
	   ('RPG Maker MZ','2020-08-20'),
	   ('RPG Maker Unite','2023-04-06');

--Ch.2本體所帶出Ch.3作業之前置步驟
CREATE TABLE teachers(
	id bigserial,
	first_name varchar(25),
	last_name varchar(50),
	school varchar(50),
	hire_date date,
	salary numeric
);

INSERT INTO teachers(first_name,last_name,school,hire_date,salary);
VALUES ('Janet','Smith','F.D. Roosevelt HS','2011-10-30',36200),
	   ('Lee','Reynolds','F.D. Roosevelt HS','1993-05-22',65000),
	   ('Samuel','Cole','Myers Middle School','2005-08-01',43500),
	   ('Samantha','Bush','Myers Middle School','2011-10-30',36200),
	   ('Betty','Diaz','Myers Middle School','2005-08-30',43500),
	   ('Kethleen','Roush','F.D. Roosevelt HS','2010-10-22',38500);

--3-1
SELECT * FROM teachers
ORDER BY school,last_name ASC;

--3-2
SELECT * FROM teachers
WHERE first_name LIKE 'S%' AND salary>=40000;

--3-3
SELECT * FROM teachers
WHERE hire_date>='2010-01-01' 
ORDER BY salary DESC;