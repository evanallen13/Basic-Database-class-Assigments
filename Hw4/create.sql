set echo on 
/* start C:\Users\evana\Desktop\IS380\Hw4\create.sql */

spool C:\Users\evana\Desktop\IS380\Hw4\create.txt

drop table enrollments;
drop table courses;
drop table students;

create table students(
	SNum number(3) PRIMARY KEY,
	SName varchar(25),
	Major varchar(20),
	GPA number(3,2));

create table courses(
	CNum varchar(8) PRIMARY KEY,
	CTitle varchar(25),
	Instr varchar(25));

create table enrollments(
	SNum number(3),
	CNum varchar(8),
	Grade varchar(1),
	PRIMARY KEY (SNum,CNum),
	constraint fk_enrollments_SNum foreign key (SNum) references students(SNum),
	constraint fk_enrollments_CNum foreign key (CNum) references courses(CNum));

insert into students values ('101','Andy','IS',3.2);
insert into students values ('102','Betty','FIN',1.8);
insert into students values ('103','Cindy','IS',3.8);

insert into courses values('IS380','Database','Lee');
insert into courses values('IS385','Systems','Smith');
insert into courses values('IS355','Telecomm','Lee');

insert into enrollments values('101','IS380','B');
insert into enrollments values('101','IS385','A');
insert into enrollments values('102','IS380','A');
insert into enrollments values('103','IS355','B');

update students set SName= 'John'
	where SNum = 101;

update 

spool off 