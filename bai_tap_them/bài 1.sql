create database if not exists book_management;
use book_management;

create table if not exists books(
id int,
`name` varchar(50),
page_size int,
author varchar(50)
);

insert into books (id,`name`, page_size, author) values
	(1, 'Toán', 45, 'Nguyễn Thái Học'),
	(2, 'Văn', 34, 'Trần Mình Hoàng'),
	(3, 'Sử', 56, 'Dương Trung Quốc'),
	(4, 'Địa', 76, 'Lê Văn Hiến'),
	(5, 'Hoá', 32, 'Hà Văn Minh');

-- xuất bảng
select * from books;
-- xoá bảng
drop table books;
-- xoá database
drop database book_management;
-- xoá sách id = 5
set sql_safe_updates = 0;
delete from books where id = 5;
--  Cập nhật số trang page_size=50 với sách có title = "Sử"
update books set page_size = 50 where `name` = "Sử";
