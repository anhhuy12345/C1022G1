package repository.Impl;

import model.Books;
import repository.BaseRepository;
import repository.IBookRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepositoryImpl implements IBookRepository {
    private static final String SELECT_BY_ID = "select * from book where id = ?";
    private static final String INSERT_BOOK_SQL ="insert into book(title, page_size, author, category) values(?,?,?,?)";

    @Override
    public List<Books> showAll() {
        List<Books> bookList = new ArrayList<>();

        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("select * from book");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String bookId = resultSet.getString("id");
                String bookName = resultSet.getString("title");
                String pageSize = resultSet.getString("page_size");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                bookList.add(new Books(bookId, bookName, pageSize, author, category));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookList;
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
    public boolean add(Books books) {

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_BOOK_SQL)) {
            ps.setString(1, books.getId());
            ps.setString(2, books.getTitle());
            ps.setString(3, books.getPageSize());
            ps.setString(4, books.getAuthor());
            ps.setString(6, books.getCategory());
            int update = ps.executeUpdate();
            if (update != 0) {
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
