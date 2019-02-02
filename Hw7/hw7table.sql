set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\380Project\hw7table.sql */

drop table Cust;

create table Cust(
	ssn varchar(9) primary key,
	lastName varchar(30),
	firstName varchar(30),
	middle varchar(30),
	phone varchar(10));