drop database cac_ham_thong_dung;
create database cac_ham_thong_dung;
use cac_ham_thong_dung;

create table danhSach(
id int primary key auto_increment,
ten varchar(50),
tuoi int,
khoaHoc varchar(50),
soTien int
);

insert into danhSach values (null,'Hoang',21,'CNTT',400000);
insert into danhSach values (null,'Viet',19,'DTVT',320000);
insert into danhSach values (null,'Thanh',18,'KTDN',400000);
insert into danhSach values (null,'Nhan',19,'CK',450000);
insert into danhSach values (null,'Huong',20,'TCNH',500000);
insert into danhSach values (null,'Huong',20,'TCNH',200000);

select * from danhSach where ten = 'Huong';
select sum(soTien) from danhSach where ten = 'Huong';
select distinct ten from danhSach;