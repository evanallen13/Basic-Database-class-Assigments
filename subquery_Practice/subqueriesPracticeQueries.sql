set echo on
set feedback on
set verify on
set heading off

/* start C:\Users\evana\Desktop\topic17\subqueriesPracticeQueries.sql */

/* #1 Write a SQL statement to show with courses Betty receives her highest grade */
select CNum
	from Enrollments,Students
	where SName ='Betty'
	and GRADE = (select max(GRADE) 
					from Enrollments,Students 
					where Students.SNum = Enrollments.SNum 
					and SName = 'Betty')
	and Enrollments.SNum = Students.SNum;

/* #2 Write a SQL statement to show that who gets the lowests grade in class IS 300 */
select SNAME 
	from Students, Enrollments, Courses 
	where Students.SNum = Enrollments.SNum 
	and Courses.CNum = Enrollments.CNum
	and Enrollments.GRADE in(select min(GRADE)
								from Enrollments);

/* #3 Write a command to update student 101 GPA in the Student table based on the Enrollments */
update Students 
	set GPA = (select avg(GRADE) from Enrollments where SNum = 101)
	where SNum = 101;

/* #4 Write a SQL command to update the number of students enrolled NumStu of IS 300 */
update Courses
	set NumStu = (select count(*)
					from Enrollments
					where CNum = 'IS 300')
	where CNum = 'IS 300';

/* #1 Delete enrollment records if the students status is 'Probation' */
Delete 
	from Enrollments
	where SNum in(select SNum from Students where STATUS = 'Probation');

Delete
	from Students
	where STATUS = 'Probation';

/* #2 Update grades to 'W' if the class is 'Cancelled' */
update Enrollments
	set GRADE = 'W'
	where CNum in (select CNum from Courses where STATUS = 'Cancelled');

/* #3 Write a SQL statement to update the standing to 'Senior' for students who took 30 or more courses */
update Students
	set STANDING = 'Senior'
	where SNum in (select SNum
					from Enrollments
					group by SNum
					having count(*)>30);

/* #4 Update status to 'Cancelled' for courses that have 2 or less students enrolled */
update Courses 
	set STATUS = 'Cancelled'
	where CNUM in (select CNUM
					from Enrollments
					group by CNUM
					having count(*) < 2);

/* #5 Display SNum of students who are not enrolled in an classes */
select SNum
	from Students
	where SNum not in (select distinct(SNum)
						from Enrollments);

/* #6 Find how many students who are not enrolled in any course */
select count(SName)
	from Students 
	where SNum not in(select SNum 
						from Enrollments);

/* #7 Display name of students who are not enrolled in any classes */
select SName
	from Students 
	where SNum not in(select SNum 
						from Enrollments);

/* #8 Delete Students who are not enrolled in any courses */
Delete	
	from Students 
	where SNum not in (select SNum 
						from Enrollments );

/* #9 Display how many courses have no students in them */
select count(TITLE)
	from Courses
	where CNum not in (select distinct(CNum)
						from Enrollments);

/* #10 Display title of courses where no student enrolled */
select TITLE
	from Courses
	where CNum not in (select distinct(CNum)
						from Enrollments);