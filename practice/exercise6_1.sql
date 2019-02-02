set echo on 

/* start C:\Users\evana\Desktop\IS380\exercise6_1.sql */
drop table SP;
drop table S;
drop table P;

create table S( 
	S varchar(2) PRIMARY KEY,
	Sname varchar(15),
	status number(2,0),
	CITY varchar(20));

create table P(
	P varchar(2) PRIMARY KEY,
	PNAME varchar(15),
	COLOR varchar(10),
	WEIGHT number(2),
	CITY varchar(15));

create table SP(
	S varchar(2) references S(S),
	P varchar(2) references P(P),
	QTY number(3),
	PRIMARY KEY (S,P));

INSERT INTO S VALUES('S1','Smith',20,'London');
INSERT INTO S VALUES('S2','Jones',10,'Paris');
INSERT INTO S VALUES('S3','Blake',30,'Paris');
INSERT INTO S VALUES('S4','Clark',20,'London');
INSERT INTO S VALUES('S5','Adams',30,'Athens');

INSERT INTO P VALUES('P1','Nut','Red',12,'London');
INSERT INTO P VALUES('P2','Bolt','Green',17,'Paris');
INSERT INTO P VALUES('P3','Screw','Blue',17,'Rome');
INSERT INTO P VALUES('P4','Screw','Red',14,'London');
INSERT INTO P VALUES('P5','Cam','Blue',12,'Paris');
INSERT INTO P VALUES('P6','Cog','Red',19,'London');

INSERT INTO SP VALUES('S1','P1',300);
INSERT INTO SP VALUES('S1','P2',200);
INSERT INTO SP VALUES('S1','P3',400);
INSERT INTO SP VALUES('S1','P4',200);
INSERT INTO SP VALUES('S1','P5',100);
INSERT INTO SP VALUES('S1','P6',100);
INSERT INTO SP VALUES('S2','P1',300);
INSERT INTO SP VALUES('S2','P2',400);
INSERT INTO SP VALUES('S3','P2',200);
INSERT INTO SP VALUES('S4','P2',200);
INSERT INTO SP VALUES('S4','P4',300);
INSERT INTO SP VALUES('S4','P5',400);

/* Supplies who supply pruduc P1 */
SELECT S.Sname from S,SP
	WHERE SP.P= 'P1'
	AND S.S = SP.S;

/* Display name and weight which supplied by supplier S3 */
SELECT P.PNAME, P.WEIGHT FROM P, SP 
	WHERE SP.S ='S3'
	AND P.P = SP.P;

/* Display quantity of Green Bolts supplied by Smith */
SELECT SP.QTY FROM SP,P,SP
	WHERE P.PNAME = 'Bolt'
	AND S.Sname = 'Smith'
	AND S.S = SP.S
	AND P.P = SP.P;

/* Display S# amd Sname of supplier who supplys Red Nuts */
SELECT S.S, S.Sname FROM S,P,SP
	WHERE P.COLOR = 'Red'
	AND P.PNAME = 'Nut'
	AND S.S = SP.S
	AND P.P = SP.P;

/* Display p# and names of parts which are supplied by Blake */
SELECT P.P, P.PNAME FROM SP,P,S
	WHERE S.Sname = 'Blake'
	AND SP.S = S.S 
	AND SP.P = P.P;

/* Display names of all parts whcih are supplied by suppliers whose status is higher than 25 */
SELECT P.PNAME FROM P, S, SP
	WHERE status > 25
	AND SP.S = S.S 
	AND SP.P = P.P; 

/* Display S# and P# pairs of which the supplier and the part are from the same city and the supplier has supplier that part */
SELECT S.S, P.P FROM P, S, SP
	WHERE S.CITY = P.CITY
	AND SP.S = S.S 
	AND SP.P = P.P;

SELECT P.PNAME FROM P,SP
	WHERE SP.QTY = (SELECT MAX(SP.QTY) FROM SP)
	AND P.P = SP.P;

SELECT * FROM SP,P 
	WHERE SP.P = P.P
	ORDER BY SP.QTY DESC;

SELECT * FROM P,SP
WHERE P.P = SP.P
MINUS
SELECT * FROM P,SP
	WHERE SP.QTY = (SELECT MAX(SP.QTY) FROM SP)
	AND P.P = SP.P;

SELECT MEDIAN(QTY) FROM SP;

SELECT AVG(QTY) FROM SP;

SELECT STATS_MODE(QTY) FROM SP;

SELECT QTY  FROM SP;

SELECT SP.QTY, P.PNAME AS Products, S.Sname AS Suppliers FROM SP,S,P
	WHERE SP.QTY < (SELECT AVG(SP.QTY) FROM SP)
	AND SP.S = S.S
	AND SP.P = P.P;
	
SELECT SUM(SP.Qty) AS Total_QTY FROM SP;

SELECT COUNT(SP.Qty) AS Total_QTY FROM SP
	WHERE SP.QTY = 400;

/* Display the Avg of Qty */
SELECT AVG(QTY) FROM SP;

/* Display S#, P# and Qty of that have QTY under the Av */
SELECT * FROM SP
	WHERE QTY <  (SELECT AVG(QTY) FROM SP)
	ORDER BY QTY DESC;

/* All P# in P and SP tables */
SELECT P FROM SP
UNION 
SELECT P FROM P;

/* Finding the products that are currently in stock */
SELECT P FROM SP
INTERSECT 
SELECT P FROM P;

/* Finding the Suppliers that dont have product */
SELECT S From S
MINUS 
SELECT S FROM SP;

/* Changing the City name Rome to Oslo */
UPDATE P 
	SET CITY = 'Oslo'
	WHERE P = 'P3';

/* Concat S and P From SP */ 
SELECT S||P, QTY FROM SP;

/* Descend by Qty then by Status */ 
SELECT S.S,P.P,S.Status,SP.QTY 
	FROM S,P,SP
	Where S.S = SP.S
	AND P.P = SP.P 
	ORDER BY SP.QTY DESC, S.Status ASC;

/* Finding the Second Highest */ 
SELECT MAX(QTY) FROM SP 
	WHERE QTY NOT IN (SELECT MAX(QTY) FROM SP);

SELECT SName FROM S 
	WHERE LENGTH(CITY) > 5;

SELECT SUBSTR (SName,2) FROM S 
	WHERE SName = 'Blake';

/* Select the Total Qty of Red parts */
SELECT sum(qty) FROM SP, P 
	WHERE P.COLOR= 'Red';

/* Select the Names of the Supplies who have the max Qty */
SELECT S.SName FROM S,SP
	WHERE QTY = (SELECT MAX(QTY) FROM SP)
	AND S.S = SP.S;

/* GROUP BY */
/* Find the number of Total Quantity per Item and Color */
SELECT P.COLOR,P.PName, SUM(QTY) AS Total_QTY
	FROM SP,P
	WHERE P.P = SP.P
	GROUP BY P.COLOR,P.PName
	ORDER BY SUM(QTY) DESC;

/* Find the Number of total Qty per Color */
SELECT P.COLOR, SUM(QTY) AS Total_QTY
	FROM SP,P
	GROUP BY P.COLOR
	ORDER BY SUM(QTY) DESC;

/* Display the Name of supplier and total QTY */
SELECT S.SName, SUM(QTY) AS Total_QTY
	FROM SP, S 
	WHERE SP.S = S.S
	GROUP BY S.SName 
	ORDER BY SUM(QTY) DESC;

/* Display the Status and total QTY each status has */
SELECT S.Status, SUM(QTY) AS Total_QTY
	FROM S, SP 
	WHERE SP.S = S.S 
	GROUP BY S.Status
	ORDER BY S.Status DESC;

/* Display the Qty being stored in each location */
SELECT CITY, SUM(QTY) AS Total
	FROM P, SP 
	WHERE SP.P = P.P 
	GROUP BY CITY 
	ORDER BY SUM(QTY);

/* Display the Qty being produced in location */
SELECT CITY, SUM(QTY) AS Total
	FROM S,SP 
	WHERE SP.S = S.S 
	GROUP BY CITY
	ORDER BY SUM(QTY);