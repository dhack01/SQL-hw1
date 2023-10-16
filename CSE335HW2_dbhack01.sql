-- Dakota Hack midterm exam


-- had to name it using an _ instead of - because of syntax reasons
-- Question 1
DROP DATABASE IF EXISTS test_dbhack01;
CREATE DATABASE test_dbhack01;

USE test_dbhack01;

-- Answer for question 2 bellow had to make the - _ again 
CREATE TABLE CAR (
	license_plate VARCHAR(50)	,
    make		  VARCHAR(50)	,
    model         VARCHAR(50)	, 
    year		  INT			,
    color		  ENUM ('black','white','blue','grey','silver')	,
    price		  REAL,
	CONSTRAINT carpr
		PRIMARY KEY (license_plate)
);

-- Answer for question 3 bellow had to make the - _ again 
CREATE TABLE REGISTRATION (
	 license_plate VARCHAR(50),
     owner		   VARCHAR(50),
     city		   VARCHAR(50),
     county	   VARCHAR(50),
     year		   INT,
     tax_rate      REAL,
     total		   REAL,
     CONSTRAINT regpr
		PRIMARY KEY (license_plate, owner, year),
        FOREIGN KEY (license_plate) REFERENCES CAR(license_plate)
);

-- Answer for question 4 bellow
INSERT INTO CAR VALUES
('123456','Toyota','Avalon',2012,'black',10000),
('2345a','Honda','Cvic',2022,'grey',22000),
('abc123','Lexus','LFA',2007,'black',100000);

-- Asnswer for question 5 bellow
INSERT INTO REGISTRATION VALUES
('123456','Dakota','Radcliff','Hardin','2012','200','1000'),
('2345a','Sydney','Louisville','Jefferson','2022','250','1400'),
('abc123','Jeff','Louisville','Jefferson','2007','5000','10000');

-- Answer for question 6 bellow
UPDATE CAR 
SET color = 'blue'
WHERE license_plate = 'abc123';

-- Answer for question 7 bellow

-- part a 
SELECT license_plate,make,model
FROM CAR
WHERE color = 'red' AND price > 50000;

-- part b
SELECT license_plate,owner
FROM REGISTRATION
WHERE city = 'Louisville' AND total > 1000;

-- part c
SELECT count(*) as CarsInJefferson
FROM REGISTRATION
WHERE county = 'Jefferson';

-- part d
SELECT county, count(*)
FROM REGISTRATION
GROUP BY county;

-- part f 
SELECT make,count(*)
FROM CAR
GROUP BY make
HAVING count(*)>10;

-- part g
SELECT make,count(model)
FROM CAR 
GROUP BY make
HAVING count(model)>2;
