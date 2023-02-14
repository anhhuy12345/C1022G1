package service;

import model.Books;

import java.util.List;
import java.util.Map;

public interface IBookService {
    List<Books>showAll();

    List<Books>find();

    List<Books>delete();

    Map<String, String> add(Books books);

    Books selectBooks(String id);

    boolean updateBook(Books books);

    boolean deleteBook(String id);
}
