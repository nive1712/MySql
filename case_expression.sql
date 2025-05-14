-- case expression

create table quantity (
order_id int not null primary key,
product_name varchar(10),
quantity int );

insert into quantity( order_id, product_name , quantity)
values(1,'lays',25);
insert into quantity( order_id, product_name , quantity)
values(2,'borboun',9);
insert into quantity( order_id, product_name , quantity)
values(3,'horlicks',6);
insert into quantity( order_id, product_name , quantity)
values(4,'oats mix',30);
select * from quantity;

select order_id, quantity,
case 
when quantity <19 then ' the quantity is less,refill it'
when quantity >=20 then 'quantity doesnt need to be refilled now'
else 'product not found'
end as summary
from quantity;
