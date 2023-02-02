use libary;

insert into category (id, name) values
	('1', 'Tự nhiên'),
	('2', 'Xã Hội'),
	('3', 'Truyện'),
	('4', 'Tiểu Thuyết'),
	('5', 'Khác');
    
    insert into author(id, name) values
	('1', 'Nguyễn Thái Học'),
	('2', 'Trần Mình Hoàng'),
	('3', 'Dương Trung Quốc'),
	('4', 'Lê Văn Hiến'),
	('5', 'Hà Văn Minh');
    
    insert into student(id, name, birthday, class_name) values
	('1', 'Nguyễn Văn A', '1999-12-12', 'C0822G1'),
	('2', 'Nguyễn Văn B', '1999-12-13', 'C0822G1'),
	('3', 'Nguyễn Văn C', '1999-12-14', 'C0822G1'),
	('4', 'Nguyễn Văn D', '1999-12-15', 'C0922G1'),
	('5', 'Nguyễn Văn E', '1999-12-16', 'C1022G1');
    
    insert into book (book_id, title , page_size, author_id, category_id) values
	('1', 'Toán', '45', '1', '1'),
	('2', 'Văn', '34', '2', '2'),
	('3', 'Sử', '56', '3', '2'),
	('4', 'Địa', '76', '4', '2'),
	('5', 'Hoá', '32', '5', '1');
    
    insert into borrows (id, student_id, book_id, borrow_date, borrow_end) values
	('1', '1', '1', '2022-12-12', '2022-12-13'),
	('2', '2', '2', '2022-12-12', '2022-12-15'),
	('3', '3', '3', '2022-12-12', '2022-12-15'),
	('4', '4', '4', '2022-12-12', '2022-12-12'),
	('5', '1', '5', '2022-12-13', '2022-12-15'),
	('6', '1', '5', '2022-12-14', '2022-12-14'),
	('7', '3', '4', '2022-12-15', '2022-12-29'),
	('8', '3', '3', '2022-12-8', '2022-12-14'),

	('9', '1', '2', '2022-12-6', '2022-12-30');
    
    
    -- Lấy ra toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả
    set SQL_SAFE_UPDATES = 0;
    select book.title, book.page_size, author.name,category.name from book
   left join category on category.id = book.category_id
   left join author on author.id = book.author_id;
   
   --  Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp danh sách theo theo tên từ a->z
   select student.name from borrows
   left join student on student.id = borrows.student_id
   order by name;
   
   -- Lấy ra  2 quyển sách được mượn nhiều nhất
   select book.title, count(book.book_id) from borrows
   left join book on book.book_id= borrows.book_id
   group by book.book_id 
   order by book.book_id desc limit 2
  ;
