set echo on 

spool C:\Users\evana\Desktop\IS380\hw3.txt 
/* start C:\Users\evana\Desktop\IS380\hw3.sql */

/* #1 Delete STUDENTS Table */
drop table STUDENTS;

/* #2  Create Table */
create table STUDENTS(
	SNN char(9),
	LastName char(10),
	FirstName char(10),
	Major char(10),
	GPA number(3,2),
	DOB date,
	PRIMARY KEY (SNN));

/* #3 Insert Records */
insert into STUDENTS values ('101','Smith','Johnny','IS',3.41,'18-may-92');
insert into STUDENTS values ('102','Smith','Jack','FIN',3.25,'11-mar-90');
insert into STUDENTS values ('103','Meyer','Jim','HRM',2.82,'11-oct-91');
insert into STUDENTS values ('104','Brown','Jenny','IS',2.78,'4-apr-91');

/* #4 display all records of STUDENTS table */
SELECT * FROM STUDENTS;

/* #5 Insert new Record for Jaime Lee */
insert into STUDENTS values ('105','Lee','Jaime',null,null,'1-apr-83');

/* #6 Save all changes */
commit;

/* #7 Display last name and first name of all students */
SELECT LastName, FirstName FROM STUDENTS;

/* #8 Display last name and first name of all students who have GPA higher than 3*/
SELECT LastName, FirstName FROM STUDENTS
	WHERE GPA > 3;

/* #9 Display all students who are not IS majors*/
SELECT * FROM STUDENTS
	WHERE major != 'IS';

/* 10 Display students whos fisrt name starts with J and last name starts with S */ 
SELECT * FROM STUDENTS
	WHERE FirstName LIKE ('J%')
	AND LastName LIKE ('S%');

/* #11 Change student 101's major to FIN */ 
UPDATE STUDENTS 
	SET major = 'FIN'
	WHERE SNN = 101;

/* #12 Change student 101's major back to IS */
UPDATE STUDENTS 
	SET major = 'IS'
	WHERE SNN = 101;

/* #13 Change student 102's Major to MKT and GPA to 3.3 */ 
UPDATE STUDENTS 
	SET major = 'MKT',
		GPA = 3.3
	WHERE SNN = 102;

/* #14 Add a column for Associations */ 
alter table
	STUDENTS
	ADD(ASSOCIATION varchar2(15));

/* #15 Set IS students association to ISSA*/ 
UPDATE STUDENTS 
	SET ASSOCIATION = 'ISSA'
	WHERE Major = 'IS';

/* #16 Delete student 103*/ 
DELETE 
	FROM STUDENTS
	WHERE SNN = 103;

/* #17 Display Students in order Descending GPA  */
SELECT * FROM STUDENTS
	ORDER By GPA DESC;

/* #18 Display students whos major is null*/
SELECT * FROM STUDENTS 
	WHERE major is  null;

/* #19 Ser student 101's major to null*/
UPDATE STUDENTS 
	set major = null
	WHERE snn = 101;	

/* #20 Save all changes */
commit;

spool off 


Po_Num|Po_Date|Dist_ID|Dist_Name|DistProd_ID|UPC|Prod_Name|QTY 