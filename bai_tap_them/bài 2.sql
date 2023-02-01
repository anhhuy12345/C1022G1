create database if not exists libary;
use libary;

create table student(
id int primary key,
class_name varchar(50),
`name` varchar(50),
`birthday` date 
);

create table book(
book_id int primary key,
title varchar(20),
page_size int,
author_id int, 
category_id int,
foreign key( author_id) references author(id),
foreign key (category_id) references category(id)
);

create table author(
id int primary key,
`name` varchar(50)
);

create table borrows(
student_id int,
book_id int,
primary key(student_id,book_id),
borrow_date datetime,
borrow_end datetime,
foreign key(student_id) references student(id),
foreign key(book_id) references book(book_id)
);

create table category(
id int primary key,
`name` varchar(50)
);



