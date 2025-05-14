create table student (
student_id int primary key not null,
first_name varchar(25),
last_name varchar(20),
gpa decimal(2,1) ,
enrollment_date date ,
major varchar(20));

create table programs(
program_name varchar(20),
program_start_date date,
student_ref_id int , foreign key (student_ref_id) references students(student_id)
);

create table scholarships(
scholarship_date date,
scholarship_amt decimal(6,2),
student_ref_id int , foreign key (student_ref_id) references students(student_id));

select* from student;
select* from programs;
select * from scholarships;

insert into student(student_id ,first_name,last_name,gpa ,enrollment_date,major)
values(1,'Nivedha','Sundar',9.1,'2023-01-09','csc');
insert into student(student_id ,first_name,last_name,gpa ,enrollment_date,major)
values(2,'Saru','Pugazh',9.2,'2023-02-09','ece');
insert into student(student_id ,first_name,last_name,gpa ,enrollment_date,major)
values(3,'Varsha','rajesh',8.1,'2023-01-09','csc');
insert into student(student_id ,first_name,last_name,gpa ,enrollment_date,major)
values(4,'Srija','Sridhar',9.4,'2023-01-08','ece');
insert into student(student_id ,first_name,last_name,gpa ,enrollment_date,major)
values(5,'Akash','Selvam',9.1,'2023-01-09','mech');
insert into student(student_id ,first_name,last_name,gpa ,enrollment_date,major)
values(6,'Kavya','Keerthana',9.2,'2023-01-08','csc');
insert into student(student_id ,first_name,last_name,gpa ,enrollment_date,major)
values(7,'Prem','jey',8.5,'2023-02-09','eee');
insert into student(student_id ,first_name,last_name,gpa ,enrollment_date,major)
values(8,'Shivansh','guru',9.4,'2023-02-09','eee');
select* from student;

insert into programs(program_name,program_start_date ,student_ref_id ) 
values('bach of technology' ,'2023-02-09',1);
insert into programs(program_name,program_start_date ,student_ref_id ) 
values('bach of technology' ,'2023-03-09',2);
insert into programs(program_name,program_start_date ,student_ref_id ) 
values('bach of technology' ,'2023-02-09',3);
insert into programs(program_name,program_start_date ,student_ref_id ) 
values('bach of technology' ,'2023-03-09',4);
insert into programs(program_name,program_start_date ,student_ref_id ) 
values('bach of engineering' ,'2023-02-10',5);
insert into programs(program_name,program_start_date ,student_ref_id ) 
values('bach of technology' ,'2023-02-09',6);
insert into programs(program_name,program_start_date ,student_ref_id ) 
values('bach of engineering' ,'2023-04-09',7);
insert into programs(program_name,program_start_date ,student_ref_id ) 
values('bach of engineering' ,'2023-04-09',8);

select* from programs;
select* from students;

insert into scholarships(scholarship_date,scholarship_amt ,student_ref_id)
values('2023-10-01',7000.50,1);
insert into scholarships(scholarship_date,scholarship_amt ,student_ref_id)
values('2023-09-01',5000.50,2 );

insert into scholarships(scholarship_date,scholarship_amt ,student_ref_id)
values('2023-10-01',7000.50,3 );
insert into scholarships(scholarship_date,scholarship_amt ,student_ref_id)
values('2023-09-01',5000.50,4 );
insert into scholarships(scholarship_date,scholarship_amt ,student_ref_id)
values('2023-11-01',4500.50,5 );
insert into scholarships(scholarship_date,scholarship_amt ,student_ref_id)
values('2023-10-01',7000.50,6);
insert into scholarships(scholarship_date,scholarship_amt ,student_ref_id)
values('2023-11-01',6000.50,7 );
insert into scholarships(scholarship_date,scholarship_amt ,student_ref_id)
values('2023-11-01',6000.50,8 );

select * from scholarships;

select upper(first_name) as  student_name from students;

select * from students;

select distinct major From students;
select left(first_name ,3) from students;
Select position('a' in first_name ) AS position from student Where first_name = 'shivansh';
select distinct major,length(major) as length From students;
select concat(first_name,' ', last_name) as complete_name from students;
select * from students order by  first_name asc;
select * from students order by major desc;
select * from students where first_name='prem';
select * from students where first_name='shivansh';
select first_name from students where first_name like '%h';
select * from students where first_name in('prem','shivansh');
