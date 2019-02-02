set echo on 

/* start C:\Users\evana\Desktop\IS380\Hw4\query.sql */
spool C:\Users\evana\Desktop\IS380\Hw4\query.txt

/* #1 */
SELECT enrollments.CNum, courses.Ctitle, enrollments.Grade
	FROM students,courses,enrollments
	Where SName = 'Andy'
	AND students.SNum = enrollments.SNum
	AND enrollments.CNum = courses.CNum;

/* #2 */
SELECT students.SNum, students.SName
	FROM students, enrollments
	WHERE enrollments.CNum = 'IS380'
	AND students.SNum = enrollments.SNum;

/* #3 */
SELECT students.SNum, students.SName 
	FROM students, enrollments
	WHERE enrollments.CNum = 'IS380'
	AND enrollments.Grade = 'A'
	AND students.SNum = enrollments.SNum;

/* #4 */
SELECT students.SNum, students.SName
	FROM students, enrollments
	WHERE students.major = 'IS'
	AND enrollments.CNum = 'IS380'
	AND students.SNum = enrollments.SNum;

/* #5 */
SELECT students.SNum, students.SName 
	FROM students, enrollments
	WHERE major = 'IS'
	AND enrollments.CNum = 'IS380'
	AND enrollments.Grade = 'A'
	ANd students.SNum = enrollments.SNum;

spool off 