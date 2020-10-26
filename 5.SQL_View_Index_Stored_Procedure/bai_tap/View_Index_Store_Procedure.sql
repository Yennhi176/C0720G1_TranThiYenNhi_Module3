drop database demo;
create database demo;
use demo;

create table products(
id int primary key auto_increment,
productCode varchar(50),
productName varchar(50),
productPrice double,
productAmount double,
productDescription varchar(50),
productStatus varchar(50)
);

insert into products values (null,'ma1','thuoc1',50.0,20.0,'tot','ok');
insert into products values (null,'ma2','thuoc2',60.0,26.0,'tot','ok');
insert into products values (null,'ma3','thuoc3',40.0,24.0,'tot','ok');
insert into products values (null,'ma4','thuoc4',80.0,23.0,'tot','ok');

create unique index productCode1
on products (productCode);

create unique index product
on products (productName,productPrice);

explain select * from products where id = 1;

create view product_view as
select productCode, productName, productPrice, productStatus
from products;
select * from product_view;

update product_view
set productName = 'thuoc5'
where productCode = 'ma1';

drop view product_view;

delimiter //
create procedure findAllProduct()
begin
select * from products;
end //
delimiter ;

delimiter //
create procedure addProduct(id int,productCode varchar(50),productName varchar(50),productPrice double,productAmount double,productDescription varchar(50),productStatus varchar(50))
begin
insert into products values (id,productCode,productName,productPrice,productAmount,productDescription,productStatus);
end //
delimiter ;
call addProduct(6,'ma8','kem',40.0,20.0,'tot','ok');

DELIMITER //
CREATE PROCEDURE update_product(
in idUpdate int, 
productCodeUpdate varchar(50), 
productNameUpdate varchar(50), 
productPriceUpdate double, 
productAmountUpdate double,
productDescriptionUpdate varchar(50), 
productStatusUpdate varchar(50))
BEGIN
	update products
    set productCode = productCodeUpdate, 
    productName = productNameUpdate , 
    productPrice = productPriceUpdate, 
    productAmount = productAmountUpdate,
	productDescription = productDescriptionUpdate, 
    productStatus = productStatusUpdate
    where id = idUpdate;
END //
DELIMITER ;

call update_product(7, 'ma9', 'kem2', 43, 57, 'ok', 'ok');

DELIMITER //
CREATE PROCEDURE delete_product(in idNeedDelete int)
BEGIN
	delete from products
    where id = idNeedDelete;
END //
DELIMITER ;
call delete_product(6);



