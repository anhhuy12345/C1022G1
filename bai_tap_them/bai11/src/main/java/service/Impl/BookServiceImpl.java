package service.Impl;

import model.Books;
import repository.IBookRepository;
import repository.Impl.BookRepositoryImpl;
import service.IBookService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookServiceImpl implements IBookService {
    private IBookRepository bookRepository =new BookRepositoryImpl();

    @Override
    public List<Books> showAll() {
        return bookRepository.showAll();
    }

    @Override
    public List<Books> find() {
        return null;
    }

    @Override
    public List<Books> delete() {
        return null;
    }

    @Override
    public Map<String, String> add(Books books){
        Map<String , String> errors = new HashMap<>();
        if(errors.isEmpty()) {
            // chuyển dd/mm/yyyy thành yyyy/mm/dd để chuyển qua cho mySQL

//            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
//            DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy/MM/dd");
//            String birthdayFormat = LocalDate.parse(customer.getBirthday(), formatter).format(formatter2);
//            customer.setBirthday(birthdayFormat);
            bookRepository.add(books);
        }
        return errors;

    }

    @Override
    public Books selectBooks(String id) {
        return bookRepository.selectBooks(id);
    }

    @Override
    public boolean updateBook(Books books) {
        return bookRepository.updateBook(books);
    }

    @Override
    public boolean deleteBook(String id) {
        bookRepository.deleteBook(id);
        return false;
    }
}
