create database baitap1;
use baitap1;
create table customers(
customer_number int primary key,
fullname varchar(50),
address varchar(100),
email varchar(100),
phone int unique
);
create table accounts(
account_number int primary key,
account_type varchar(50),
dates date,
balance int 
); 
create table transactions(
tran_number int primary key,
account_number int,
dates date,
amounts int,
descriptions varchar(1000),
foreign key(account_number)references accounts(account_number)
);
