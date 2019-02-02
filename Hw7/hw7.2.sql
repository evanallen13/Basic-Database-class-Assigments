set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\380Project\hw7.2.sql */
spool C:\Users\evana\Desktop\380Project\hw7.txt

prompt *_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _*
prompt *	_ _New Customer Program_ _	*   
prompt *_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _*
prompt 

accept Vssn prompt 'Please enter the customer''s social security number: '
accept Vlast prompt 'Please enter the customer''s Last Name: '
accept Vfirst prompt 'Please enter the customer''s first Name: '
accept Vmiddle prompt 'Please enter the customer''s Middle Name: '
accept Vphone prompt 'Please enter the customer''s Phone Number: '

prompt
prompt *- - -The following record has been updated: - - -*

insert into Cust values('&Vssn','&Vlast','&Vfirst','&Vmiddle','&Vphone');

commit;

select 'Social Security Number: '||substr(ssn,1,3)||'-'||substr(ssn,4,2)||'-'||substr(ssn,6,4)
	||chr(10)
	||chr(10)||'Name: '||initcap(lastName)||', '||initcap(firstName)||' '||initcap(substr(middle,1,1))||'.'
	||chr(10)
	||chr(10)||'Phone: '||'('||substr(phone,1,3)||')'||substr(phone,4,3)||'-'||substr(phone,7,4)
	from Cust 
	where &Vssn = ssn;

spool off