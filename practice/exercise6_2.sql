set echo on;
/* start C:\Users\evana\Desktop\IS380\exercise6_2.sql */
DROP TABLE Courses CASCADE CONSTRAINTS;
DROP TABLE Departments CASCADE CONSTRAINTS;
DROP TABLE Faculty CASCADE CONSTRAINTS;

drop table Courses;
drop table Departments;
drop table Faculty;


create table Departments(
	DCODE VARCHAR(5) PRIMARY KEY,
	DNAME VARCHAR(25),
	FID number(3));

create table Faculty(
	FID number(3) PRIMARY KEY,
	FNAME varchar(20),
	DCODE VARCHAR(5));

create table Courses(
	DCODE varchar(5),
	CNUM number(3),
	TITLE varchar(25),
	FID number(3),
	PRIMARY KEY (DCODE,CNUM),
	constraint fk_Courses_FID foreign key(FID) REFERENCES Faculty(FID),
	constraint fk_Courses_DCODE foreign key(DCODE) REFERENCES Departments(DCODE));

INSERT INTO Departments VALUES('FIN','Finance',035);
INSERT INTO Departments VALUES('MKT','Marketing',029);
INSERT INTO Departments VALUES('MGT','Management',047);
INSERT INTO Departments VALUES('IS','Information Systems',087);

INSERT INTO Faculty VALUES(023,'Lee','IS');
INSERT INTO Faculty VALUES(029,'Smith','MKT');
INSERT INTO Faculty VALUES(035,'Sun','FIN');
INSERT INTO Faculty VALUES(044,'Godfrey','MGT');
INSERT INTO Faculty VALUES(047,'Johnson','MGT');
INSERT INTO Faculty VALUES(067,'King','MGT');
INSERT INTO Faculty VALUES(087,'Stroll','IS');

INSERT INTO Courses VALUES('IS',380,'Database',047);
INSERT INTO Courses VALUES('IS',480,'Advanced Database',087);
INSERT INTO Courses VALUES('IS',485,'System Analysis',023);
INSERT INTO Courses VALUES('MGT',380,'Human Resources',067);
INSERT INTO Courses VALUES('FIN',380,'Financial Analysis',035);
INSERT INTO Courses VALUES('MGT',480,'Management Concepts',044);

SELECT * FROM Departments;
SELECT * FROM Faculty;
SELECT * FROM Courses;

/* #1 */
SELECT Departments.DCODE, Faculty.FNAME
	FROM Departments, Faculty
	WHERE Departments.FID = Faculty.FID;

/* #2 */
SELECT Departments.DNAME, Faculty.FNAME
	FROM Departments, Faculty
	WHERE Departments.FID = Faculty.FID;

/* #3 */
SELECT Departments.DName, Faculty.FNAME
	FROM Departments, Faculty 
	WHERE Departments.DCode = Faculty.DCode;

/* #4 */
SELECT Faculty.FNAME
	FROM Departments, Faculty
	WHERE Departments.DCODE = 'IS'
	AND Departments.FID = Faculty.FID;

/* #5 */
SELECT Faculty.FNAME 
	FROM Faculty
	WHERE Faculty.DCODE = 'IS';

/* #6 */
SELECT TITLE
	FROM Courses
	WHERE DCODE = 'IS';

/* #7 */
SELECT Courses.TITLE 
	FROM Courses,Faculty
	WHERE Faculty.DCODE = 'IS'
	AND Faculty.FID = Courses.FID;

/* #8 */
SELECT Courses.Title 
	FROM Departments, Courses
	WHERE Departments.DCODE = 'IS'
	AND Departments.FID = Courses.FID;

/* #9 */
SELECT Faculty.FNAME
	FROM Faculty, Courses
	WHERE Courses.DCODE = 'IS'
	AND Courses.CNUM = 380
	AND Faculty.FID = Courses.FID;

/* #10 */
SELECT Courses.TITLE
	FROM Courses
	WHERE Courses.CNUM >= 400
	AND Courses.CNUM < 500;

/* #11 */
SELECT Courses.TITLE
	FROM Courses 
	WHERE DCODE = 'IS'
	AND CNUM >= 400
	AND CNUM < 500;

/* #12 */
SELECT Faculty.FNAME
	FROM Courses, Faculty
	WHERE Courses.DCODE = 'IS'
	AND Courses.CNUM >= 400
	AND Courses.CNUM < 500
	AND Courses.FID = Faculty.FID;

/* #13 */
SELECT Departments.DNAME
	FROM Departments, Courses
	WHERE Courses.CNUM >= 400
	AND Courses.CNUM < 500
	AND Courses.DCODE = Departments.DCODE;

/* #15 */
SELECT Courses.TITLE
	FROM Courses, Faculty
	WHERE Faculty.DCODE = 'IS'
	AND Faculty.FID = Courses.FID;

/* #16 */
SELECT Courses.TITLE
	FROM Courses, Departments
	WHERE Departments.DCODE = 'IS'
	AND Departments.FID = Courses.FID;

/* #17 */
SELECT Faculty.FNAME
	FROM Departments, Faculty, Courses
	WHERE Courses.FID = Departments.FID
	AND Courses.FID = Faculty.FID;

/* #19 */
SELECT Faculty.FNAME
	FROM Departments, Courses, Faculty
	WHERE Courses.DCODE != Departments.DCODE
	AND Departments.FID = Faculty.FID 
	AND Courses.FID = Departments.FID;

/* #20 */
SELECT Courses.TITLE
	FROM Departments, Courses, Faculty
	WHERE Courses.DCODE != Departments.DCODE
	AND Departments.FID = Faculty.FID 
	AND Courses.FID = Departments.FID;
