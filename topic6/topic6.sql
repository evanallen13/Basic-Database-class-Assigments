set echo on 

spool C:\Users\evana\Desktop\sql_practice\topic6.txt
/* C:\Users\evana\Desktop\sql_practice\topic6.sql */

drop table students;
drop table advisors;

create table students( 
	snum number(3),
	sname char(15),
	standing char(15),
	major char(15),
	gpa number(3,2),
	advunm number(2),
	PRIMARY KEY (snum));

insert into students values (101,'Andy','Junior','IS',3.50,91);
insert into students values (102,'Betty','Senior','MKT',3.20,93);
insert into students values (103,'Cindy','Sophmore','IS',2.80,92);
insert into students values (102,'David','Junior','ACC',3.10,92);

create table advisors(
	advnum number(2),
	advname char(10),
	advoffice number(7));

insert into advisors values (91,'Lee',9859001);
insert into advisors values (92,'Jones',9859002);
insert into advisors values (93, 'Smith',9859003);

select * from students;
select * from advisors;


spool off 











