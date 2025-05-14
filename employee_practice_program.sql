create database test;
use test;
create table employee(
id int primary key not null,
first_name varchar(20),
last_name varchar(20),
age int ,
salary int);

select* from employee;
insert into employee( id,first_name , last_name , age, salary)
values(1,'Nivedha','sundar',21,2000);
insert into employee( id,first_name , last_name , age, salary)
values(2,'Saru','pugazh',20,1000);
insert into employee( id,first_name , last_name , age, salary)
values(3,'Vivek','raj',19,1500);
insert into employee( id,first_name , last_name , age, salary)
values(4,'akash','selvam',21,1000);

select * from employee;
start transaction;
SAVEPOINT sp1;

insert into employee(id,first_name,last_name,age,salary)
values(5,'raji','moorthy',30,2300);

insert into employee(id,first_name,last_name,age,salary)
values(6,'srija','gurram',19,null);

select* from employee;
ROLLBACK TO SAVEPOINT sp1;


select*from employee;
start transaction;
insert into employee(id,first_name,last_name,age,salary)
values(7,'varsha','rajesh',20,1000);

select*from employee;
truncate employee;
rollback;

-- view
-- add/create 
CREATE VIEW DetailsView AS
SELECT first_name , salary
FROM employee
WHERE id < 3;

CREATE OR REPLACE VIEW DetailsView AS
SELECT id,first_name, last_name, salary
FROM employee
WHERE salary < 2000;

-- update 
update detailsview set first_name ='sarulatha ' where id=2;


select * from DetailsView;
select * from employee;


select first_name , last_name from employee ;
select first_name , last_name from employee where age=21;
select first_name , last_name from employee where age=21 or salary=1000 ;
alter table employee add city varchar(10);

update employee set city='chennai' where id=1;
update employee set city='trichy' where id=2;
update employee set city='chennai' where id=3;
update employee set city='pondy' where id=4;
update employee set city='chennai' where id=5;
update employee set city='trichy' where id=6;
update employee set city='chennai' where id=7;

select* from employee;
select first_name from employee where city='chennai' ;
select first_name , last_name from employee where age between 19 and 21;
update employee set age =26 where id=2;
select * from employee;

alter table employee add rating int ;
update employee set rating =5 where id=1;
update employee set rating=7 where id=2;
update employee set rating=8 where id=3;
update employee set rating=9 where id=4;
update employee set rating =9 where id=5;
update employee set rating =7 where id=6;
update employee set rating =5 where id=7;

select* from employee;

select count(salary) from employee;
select count(first_name) from employee;

select max(salary) from employee;
select min(salary ) from employee;
select avg(salary) from employee;

select sum(rating )from employee;
select first_name from employee where rating= (select min(rating) from employee);
select first_name , last_name from employee where age between 20 and 22;
select first_name , last_name from employee where age=(select max(age) from employee);

SELECT city, AVG(rating) AS average_ratings
FROM employee
GROUP BY city;

select city,avg(rating) as average_ratings from employee group by city having avg(rating)> 8;
select first_name from employee order by first_name desc;
select first_name from employee order by age desc;

select * from employee where age=21 and city='pondy';
select * from employee where age=21 or city='pondy';
select * from employee where not city='pondy';

select first_name from employee where age>21;
select first_name , last_name from employee where city like 'c%'; -- starts with
select first_name , last_name from employee where city like '%c%'; -- present anywhere 
select first_name , last_name from employee where city like 'tri___'; 
select first_name from employee  where salary is NULL;
select first_name from employee  where salary is not NULL;
