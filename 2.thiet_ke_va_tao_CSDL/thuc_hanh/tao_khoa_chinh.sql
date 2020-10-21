create database thuc_hanh2;
use thuc_hanh2;
create table users(
   user_id int auto_increment primary key,
   username varchar(40),
   password varchar(255),
   email varchar(255)
);