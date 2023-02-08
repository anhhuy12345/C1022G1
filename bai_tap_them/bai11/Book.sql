create database if not exists book_manage;
use book_manage;

create table if not exists book(
id int auto_increment primary key,
title varchar(50),
page_size int,
author varchar(50),
category varchar(30)
);

insert into book(title, page_size, author, category) values
('Số Đỏ',20,'Vũ Trọng Phụng','Văn Học'),
('Truyện Kiều',20,'Nguyễn Du','Thơ'),
('Nhật Ký Trong Tù',20,'Hồ Chí Minh','Văn Học')