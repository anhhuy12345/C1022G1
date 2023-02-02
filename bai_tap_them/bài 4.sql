use libary;

-- Thông kê các đầu sách được mượn nhiều nhất
select book.book_id,book.title as name,count(book.book_id) as sl from borrows
join book on book.book_id = borrows.book_id
group by book.book_id
having sl = (
select count(book.book_id) as sl from borrows
join book  on book.book_id = borrows.book_id
group by book.book_id
order by sl desc limit 1
);

-- Thông kê các đầu sách chưa được mượn
select book.book_id,book.title as name,count(book.book_id) as sl from borrows
join book on book.book_id = borrows.book_id
group by book.book_id
having sl = (
select count(book.book_id) as sl from borrows
join book  on book.book_id = borrows.book_id
group by book.book_id
order by sl desc limit 0
);

-- Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp  theo số lượng mượn sách từ lớn đến nhỏ
select s.name , count(b.id) as sl from borrows as b
join student as s on s.id = b.student_id
group by s.name
order by sl desc;

-- Lấy ra các học viên mượn sách nhiều nhất của thư viện
select s.name , count(b.id) as sl from borrows as b
join student as s on s.id = b.student_id
group by s.name
order by sl desc limit 1;
