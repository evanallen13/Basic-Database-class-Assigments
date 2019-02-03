set echo off
set feedback off
set verify off
set heading on

/* start C:\Users\evana\Desktop\sqlPractice\queries.sql */

column Courses heading 'Number of| Courses' forma 9,999

/* How many courses does Lee teach */
select instructor, count(*) As Courses 
	from SchClasses 
	where instructor = 'Lee'
	group by instructor;

/* How many courses does Lee teach during the Fall 2012 */
select instructor, count(*) As Courses
	from SchClasses 
	where instructor = 'Lee'
	and semester = 'Fall'
	group by instructor;

/* How many IS 380 courses does Lee teach */
select instructor, count(*) As Courses
	from SchClasses 
	where instructor = 'Lee'
	and dept = 'IS'
	and code = '380'
	group by instructor;

/* How many courses do each instructor teach */
select instructor, count(*) As Courses
	from SchClasses
	group by instructor;

/* How many courses are offered each year */
select year, count(call_num) As Courses
	from SchClasses
	group by year;

/* How many courses are offered each year semester */ 
select	year, semester, count(call_num) As Courses
	from SchClasses 
	group by semester, year;

/* How many courses are offered per department */
select dept, count(*) AS Courses
	from SchClasses
	group by dept;

/* How many courses are offered by each department each year */
select dept, year, count(*) As Courses
	FROM SchClasses
	group by dept,year;

/* How many courses are offered by each department per year/semester */
select dept, year, semester, count(*) As Courses
	from SchClasses 
	group by dept, year, semester;

/* How many students are enrolled in Fall 2012, IS 380 selction 1 */
select semester, year, dept, code, section, count(*) As Students
	from SchClasses, Enrollments
	where semester = 'Fall'
	and year = '2012'
	and dept = 'IS'
	and code = '380'
	and section = 1
	and SchClasses.call_num = Enrollments.call_num
	group by semester, year, dept, code, section;

/* How many students are enrolled in Fall 2012 */
select semester, year, count(*) AS Students 
	from SchClasses, Enrollments 
	where SchClasses.call_num = Enrollments.call_num
	and semester = 'Fall'
	and year = '2012'
	group by semester, year;

/* How many students are enrolled in Fall 2012, Lee's course */
select semester, year, count(*) As Students
	from SchClasses, Enrollments
	where SchClasses.call_num = Enrollments.call_num 
	and semester = 'Fall'
	and year = '2012'
	and instructor = 'Lee'
	group by semester,year;

/* How many students are enrolled in Each year/semester */
select semester, year, count(*) As Students
	from SchClasses, Enrollments
	where SchClasses.call_num = Enrollments.call_num
	group by semester, year;

/* During fall 2012, what is the enrollment figure for each department */
select semester, year, dept, count(*) As Students
	from SchClasses, Enrollments
	where SchClasses.call_num = Enrollments.call_num
	and year = '2012'
	and semester = 'Fall'
	group by semester,year,dept;

/* What is the grade distribution for IS 380, section 1 during Fall 2012 */
select grade, count(*)
	from SchClasses, Enrollments
	where SchClasses.call_num = Enrollments.call_num
	and dept = 'IS'
	and code = 380
	and section = '1'
	and semester = 'Fall'
	and year = 2012
	group by grade;

/* What is the grade distribution of courses taught by Lee */
select SchClasses.call_num,grade , instructor, count(grade)
	from SchClasses, Enrollments
	where SchClasses.call_num = Enrollments.call_num
	and instructor = 'Lee'
	group by grade, SchClasses.call_num, instructor;

/* What is the avg GPA of courses taught by Lee */
select instructor, avg(grade_point)
	from SchClasses, Enrollments
	where SchClasses.call_num = Enrollments.call_num
	and instructor = 'Lee'
	group by instructor;

/* Use one command to display class GPA of each call_num */
select Enrollments.call_num, avg(grade_point)
	from SchClasses, Enrollments
	where SchClasses.call_num = Enrollments.call_num
	group by Enrollments.call_num;

/* Use one command to display class GPA of each call_num 
	Display Dept, Code, and Sections */
select Enrollments.call_num,dept,code,section, avg(grade_point)
	from SchClasses, Enrollments
	where SchClasses.call_num = Enrollments.call_num
	group by Enrollments.call_num,dept,code,section;

/* Display call_num, Instructor of call_num that has class GPA >= 3 */
select Enrollments.call_num, instructor, avg(grade_point)
	from SchClasses, Enrollments
	where SchClasses.call_num = Enrollments.call_num
	group by Enrollments.call_num,instructor
	having avg(grade_point) >= 3;

/* Display call_num, dept, code of courses that have 2 or less students enrolled */
select Enrollments.call_num, dept, code, count(*)
	from SchClasses, Enrollments 
	where SchClasses.call_num = Enrollments.call_num
	group by Enrollments.call_num, dept, code
	having count(*) <= 2;

/* Display call_num, dept, code of courses that have no students enrolled */
select SchClasses.call_num, dept, code
	from SchClasses
	where NOT EXISTS (select Enrollments.call_num from Enrollments where Enrollments.call_num = SchClasses.call_num);
	
/* Display class GPA by instructor, and sort by class GPA in desending order */
select instructor, avg(grade_point)
	from SchClasses, Enrollments
	where SchClasses.call_num = Enrollments.call_num
	group by instructor
	order by avg(grade_point) desc;