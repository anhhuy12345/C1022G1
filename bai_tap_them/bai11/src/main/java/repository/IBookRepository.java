package repository;

import model.Books;

import java.util.List;

public interface IBookRepository {
    List<Books>showAll();

    List<Books>find();

    List<Books>delete();

    boolean add(Books books);
}
