package service;

import model.Books;

import java.util.List;
import java.util.Map;

public interface IBookService {
    List<Books>showAll();

    List<Books>find();

    List<Books>delete();

    Map<String, String> add(Books books);
}
