create database if not exists student_list;
use student_list;
create table if not exists student(
id int primary key auto_increment,
name varchar(50),
point double
);
insert into student (id,name,point) values
(1,'Lê Trần Anh Huy',100),
(2,'Đinh Minh Thông',80),
(3,'Lê Đức Nghĩa',50),
(4,'Nguyễn Hoàng Duy',60);
select*from student;