use ineuron;
select * from courses_det;

## DML

insert into courses_det
values("DA101","Data Analytics",6,100,"online","Rafi");
select * from courses_det;
insert into courses_det
values("DV101","Sofware Development",5,50,"offline","John");

## Multiple rows insertion

insert into courses_det
values("DV103","Cloud Development",7,150,"offline","Alex"),("DS102","Data Science",7,150,"online","Alex");

select * from courses_det;

# inseting values for specific column

insert into courses_det(Course_id,Course_Name,Faculty)
values ("ML101","Machine Learning fundamentals","Jimmy");

insert into courses_det(Course_id,Course_Name,Faculty)
values ("ML101","Machine Learning fundamentals 2.0",19);

insert into courses_det(Course_id,Course_Name,Time_duration,Faculty)
values ("ML101","Machine Learning fundamentals 2.0","Bappi");


Alter table courses_det change column Course_id Course_id varchar(10) unique;

delete from courses_det
where Faculty=19;
delete from courses_det
where faculty="Jimmy";

drop table courses_det;

create table courses (Course_id char(5),Course_Title varchar(30),Time_duration int,Students_intake int);
Alter table courses add column lecture_type varchar(40);
Alter table courses add column Faculty varchar(25);
select * from courses;
Alter table courses change column Course_Title Course_Name varchar(40);
insert into courses
values("DA101","Data Analytics",6,100,"online","Rafi");
insert into courses
values("DV101","Sofware Development",5,50,"offline","John");
## Multiple rows insertion
insert into courses
values("DV103","Cloud Development",7,150,"offline","Alex"),("DS102","Data Science",7,150,"online","Alex");
insert into courses(Course_id,Course_Name,Faculty)
values ("ML101","Machine Learning fundamentals","Jimmy");

# Adding a constaints
Alter table courses change column Course_id Course_id varchar(10) unique; ## after this code I cannot enter the duplicate value in Course_id column

insert into courses(Course_id,Course_Name,Faculty)
values ("ML101","Machine Learning fundamentals 2.0","Bappy"); # it will not take the entry because Course_id is a unique row

alter table courses change column Course_Name Course_Title varchar(30) Not Null;
insert into courses
values("DA101","Data Analytics",6,100,"online","Rafi");
