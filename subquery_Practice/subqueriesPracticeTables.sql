set echo off
set feedback off
set heading off
set verify off

/* start C:\Users\evana\Desktop\topic17\subqueriesPracticeTables.sql */
drop table Enrollments;
drop table Students;
drop table Courses;


create table Students(
	SNum number(3) PRIMARY KEY,
	SNAME varchar2(15),
	STANDING varchar2(15),
	STATUS varchar2(15),
	GPA number(2,1));

create table Courses(
	CNUM varchar2(10) PRIMARY KEY,
	TITLE varchar2(20),
	STATUS varchar2(15),
	NumStu number(3));

create table Enrollments(
	SNum number(3),
	CNUM varchar2(10),
	Grade varchar2(1),
	PRIMARY KEY (SNum,CNUM),
	constraint fk_Enrollments_SNum foreign key (SNum) references Students(SNum),
	constraint fk_Enrollments_CNUM foreign key (CNUM) references Courses(CNUM));

insert into Students values(101,'Andy','Freshman','Active',NULL);
insert into Students values(102,'Betty','Freshman','Active',NULL);
insert into Students values(103,'Cindy','Junior','Probation',NULL);
insert into Students values(104,'David','Senior','Active',NULL);
insert into Students values(105,'Ellen','Sophomore','Probation',NULL);

insert into Courses values('IS 300','Intro to IS','Active',NULL);
insert into Courses values('IS 380','Database','Active',NULL);
insert into Courses values('IS 385','Systems','Cancelled',NULL);
insert into Courses values('IS 445','Telecomm','Active',NULL);

insert into Enrollments values(101,'IS 300',4);
insert into Enrollments values(102,'IS 300',4);
insert into Enrollments values(103,'IS 300',2);
insert into Enrollments values(101,'IS 380',3);
insert into Enrollments values(102,'IS 380',4);
insert into Enrollments values(103,'IS 385',1);	