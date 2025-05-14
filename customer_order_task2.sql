create table customer(
customer_id int not null primary key,
customer_name varchar(20),
customer_city varchar(20)
);

create table order_table(
order_id int primary key not null,
order_date date ,
customer_id int , foreign key (customer_id ) references customer(customer_id )
);

create table product(
product_id int Primary Key not null,
product_name varchar(20),
product_price decimal);

create table Order_Details(
order_detail_id int Primary Key not null,
order_id int , Foreign Key (order_id) references Order_Table(order_id),
product_id int , Foreign Key(product_id) references product(product_id),
quantity int );

insert into customer(customer_id, customer_name,customer_city)
values(1,'Nivedha','Chennai');
insert into customer(customer_id, customer_name,customer_city)
values(2,'Sarulatha','Trichy');
insert into customer(customer_id, customer_name,customer_city)
values(3,'Akash','Bangalore');
insert into customer(customer_id, customer_name,customer_city)
values(4,'Raji','Chennai');
insert into customer(customer_id, customer_name,customer_city)
values(5,'Sathvika','Bangalore');
insert into customer(customer_id, customer_name,customer_city)
values(6,'pugazh','chennai');


insert into order_table(order_id, order_date, customer_id)
values(101,'2024-09-11',1);
insert into order_table(order_id, order_date, customer_id)
values(106,'2024-09-12',1);
insert into order_table(order_id, order_date, customer_id)
values(111,'2024-09-12',1);
insert into order_table(order_id, order_date, customer_id)
values(102,'2024-07-10',2);
update order_table set order_date ='2024-09-11' where customer_id=2;
insert into order_table(order_id, order_date, customer_id)
values(103,'2024-08-11',3);
insert into order_table(order_id, order_date, customer_id)
values(104,'2024-04-09',4);
insert into order_table(order_id, order_date, customer_id)
values(105,'2024-03-12',5);
insert into order_table(order_id, order_date, customer_id)
values(107,'2024-08-11',3);
insert into order_table(order_id, order_date, customer_id)
values(110,'2024-08-01',6);

select* from order_table;

insert into product(product_id, product_name ,product_price)
values(11112,'Mobile',20000);
insert into product(product_id, product_name ,product_price)
values(11113,'Smart watch',9000);
insert into product(product_id, product_name ,product_price)
values(11114,'Tablet',7000);
insert into product(product_id, product_name ,product_price)
values(11115,'headphones',2000);
insert into product(product_id, product_name ,product_price)
values(11116,'Laptop',30000);
insert into product(product_id, product_name ,product_price)
values(11118,'Powerbank',3500);
insert into product(product_id, product_name ,product_price)
values(11120,'airdopes',2700);
select* from product;

insert into Order_Details(order_detail_id ,order_id ,product_id ,quantity  )
values(555,103,11114,2);
insert into Order_Details(order_detail_id ,order_id ,product_id ,quantity  )
values(521,107,11113,1);
insert into Order_Details(order_detail_id ,order_id ,product_id ,quantity  )
values(525,111,11113,1);
insert into Order_Details(order_detail_id ,order_id ,product_id ,quantity  )
values(554,101,11112,3);
insert into Order_Details(order_detail_id ,order_id ,product_id ,quantity  )
values(553,102,11113,1);
insert into Order_Details(order_detail_id ,order_id ,product_id ,quantity  )
values(552,105,11116,2);
insert into Order_Details(order_detail_id ,order_id ,product_id ,quantity  )
values(551,104,11115,1);
insert into Order_Details(order_detail_id ,order_id ,product_id ,quantity  )
values(550,106,11115,1);
insert into Order_Details(order_detail_id ,order_id ,product_id ,quantity  )
values(590,110,11113,1);
select * from order_details;

-- overall data 
SELECT c.customer_id,c.customer_name,c.customer_city,
       o.order_id,o.order_date,p.product_id, p.product_name,
       p.product_price,od.quantity,od.order_detail_id
FROM customer c
JOIN order_table o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN product p ON od.product_id = p.product_id;
    
SELECT customer_name
FROM customer
inner join order_table ON customer.customer_id = order_table.customer_id
WHERE order_date = '2024-09-11'; -- 1

SELECT customer_name as customer ,product.product_id ,
product_name as product_purchased,QUANTITY
FROM customer 
JOIN order_table ON customer.customer_id = order_table.customer_id
JOIN order_details ON order_table.order_id = order_details.order_id
JOIN product ON order_details.product_id = product.product_id
WHERE customer_city = 'chennai'; -- 2

SELECT customer.customer_name ,order_table.order_id, product.product_name, order_details.quantity
FROM customer
JOIN order_table ON customer.customer_id = order_table.customer_idscholarships
JOIN order_details ON order_table.order_id = order_details.order_id
JOIN product ON order_details.product_id = product.product_id
WHERE order_table.order_id = 101; -- 3 

select customer.customer_name as customer , product.product_price as price , 
order_details.quantity as quantity ,order_details.quantity * product.product_price
AS total_price
from customer
JOIN order_table ON customer.customer_id = order_table.customer_id
JOIN order_details ON order_table.order_id = order_details.order_id
JOIN product ON order_details.product_id = product.product_id
where order_table.order_id = 101; -- 4

SELECT c.customer_name,c.customer_id,COUNT(o.order_id) AS max_order
FROM customer c
JOIN order_table o ON c.customer_id = o.customer_id
GROUP BY c.customer_name,c.customer_id
ORDER BY max_order DESC limit 1; -- 5 

SELECT p.product_id,p.product_name,od.quantity
FROM product p
left JOIN order_details od ON p.product_id = od.product_id
WHERE od.quantity IS NULL; -- 6


SELECT p.product_name, AVG(od.quantity) AS avg_quantity
FROM product p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name; -- 7

SELECT  c.customer_name,c.customer_city
FROM customer c
JOIN order_table o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN product p ON od.product_id = p.product_id
WHERE p.product_name = 'smart watch'
GROUP BY   c.customer_name,c.customer_city;-- 7

SELECT sum(p.product_price * od.quantity) AS total_revenue
FROM order_table o
JOIN order_details od ON o.order_id = od.order_id
JOIN product p ON od.product_id = p.product_id
WHERE MONTH(o.order_date) = 8; -- 8

SELECT AVG(total_amount) AS overall_average
FROM (
    SELECT SUM(p.product_price * od.quantity) AS total_amount
    FROM order_details od
    JOIN product p ON od.product_id = p.product_id
    GROUP BY od.order_id
) AS order_totals; -- total average

SELECT c.customer_id, c.customer_name -- 9 
FROM customer c
JOIN (
    SELECT o.customer_id, SUM(p.product_price * od.quantity) AS total_amount
    FROM order_table o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN product p ON od.product_id = p.product_id
    GROUP BY o.customer_id
) AS customer_totals ON c.customer_id = customer_totals.customer_id
WHERE customer_totals.total_amount > (
    SELECT AVG(total_amount) AS overall_avg_amount
    FROM (
        SELECT SUM(p.product_price * od.quantity) AS total_amount
        FROM order_details od
        JOIN product p ON od.product_id = p.product_id
        GROUP BY od.order_id
    ) AS order_totals
);
