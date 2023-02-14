package repository;

import model.Books;

import java.util.List;

public interface IBookRepository {
    List<Books> showAll();

    List<Books> find();

    boolean deleteBook(String id);

    boolean add(Books books);

    Books selectBooks(String id);

    boolean updateBook(Books books);
}
