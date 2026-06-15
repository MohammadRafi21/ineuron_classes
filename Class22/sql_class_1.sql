create database ineuron;
use ineuron;
create table courses_det (Course_id char(5),Course_Title varchar(30),Time_duration int,Students_intake int);
select * from courses_det;
Alter table courses_det add column lecture_type varchar(40);
select * from courses_det;
Alter table courses_det add column Faculty varchar(25);
select * from courses_det;
Alter table courses_det change column Course_Title Course_Name varchar(40);
select * from courses_det;

