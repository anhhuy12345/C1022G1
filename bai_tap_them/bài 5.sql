use libary;

--  Viết 1 stored procedure thêm mới book trong database với tham số kiểu IN
delimiter //
create procedure add_books(in book_id1 int, title1 varchar(50),in page_size1 int,in id_author1 int,in id_category1 int
)
begin
insert into book(book_id, title,page_size,author_id,category_id) values (book_id1,title1,page_size1,id_author1,id_category1);
end // delimiter //;
-- DROP PROCEDURE add_books;
call add_books(6,'Sinh',34,5,4);

-- Tao index cho cột  title của bảng books
create index index_title on book(title);

-- Tạo 1 view để lấy ra danh sách các quyển sách đã được mượn, có hiển thị thêm cột số lần đã được mượn
create view views_borrows as
   select book.title, count(book.book_id) as 'số lần đã mượn' from borrows
   left join book on book.book_id= borrows.book_id
   group by book.book_id 
   order by book.book_id
  ;

drop view views_borrows;