set echo off
set feedback off
set verify off
set heading off

drop table Enrollments;
drop table SchClasses;

/* start C:\Users\evana\Desktop\sqlPractice\tables.sql */
create table SchClasses(
	call_Num varchar2(5) PRIMARY KEY,
	dept varchar2(10),
	code varchar2(10),
	section number(2),
	semester varchar2(10),
	year number(4),
	instructor varchar2(15));

create table Enrollments(
	call_Num varchar2(5),
	stu_num varchar(9),
	grade varchar(1),
	grade_point number(1),
	PRIMARY KEY (call_Num,stu_num),
	constraint fk_Enrollments_call_Num foreign key (call_Num) references SchClasses(call_Num));

insert into SchClasses values('10111','IS','380',1,'Fall',2012,'Lee');
insert into SchClasses values('10112','IS','380',2,'Fall',2012,'Smith');
insert into SchClasses values('10113','IS','480',1,'Fall',2012,'Lee');
insert into SchClasses values('10114','Fin','380',1,'Fall',2012,'Murphy');
insert into SchClasses values('10115','Fin','401',1,'Fall',2012,'Smith');
insert into SchClasses values('10116','IS','380',1,'Spring',2013,'Lee');
insert into SchClasses values('10117','IS','380',2,'Spring',2013,'Lee');
insert into SchClasses values('10118','IS','480',1,'Spring',2013,'Lee');
insert into SchClasses values('10119','Fin','380',1,'Spring',2013,'Murphy');
insert into SchClasses values('10120','Fin','401',1,'Spring',2013,'Murphy');

insert into Enrollments values('10111','111','A','4');
insert into Enrollments values('10111','222','B','3');
insert into Enrollments values('10111','333','A','4');
insert into Enrollments values('10111','444','B','3');

insert into Enrollments values('10112','555','B','3');
insert into Enrollments values('10112','666','A','4');
insert into Enrollments values('10112','777','B','3');

insert into Enrollments values('10113','888','A','4');
insert into Enrollments values('10113','999','B','3');

insert into Enrollments values('10114','222','C','2');
insert into Enrollments values('10114','444','B','3');
insert into Enrollments values('10114','666','B','3');
insert into Enrollments values('10114','777','A','4');

insert into Enrollments values('10116','111','A','4');
insert into Enrollments values('10116','222','B','3');

insert into Enrollments values('10118','333','C','2');
insert into Enrollments values('10118','444','B','3');
insert into Enrollments values('10118','555','A','4');
insert into Enrollments values('10118','666','A','4');

insert into Enrollments values('10119','777','B','3');









