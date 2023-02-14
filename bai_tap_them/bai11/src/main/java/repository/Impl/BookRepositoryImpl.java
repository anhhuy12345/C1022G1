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
    private static final String INSERT_BOOK_SQL = "insert into book(title, page_size, author, category) values(?,?,?,?)";
    private static final String SELECT_BOOK_ID = "select * from book where id =?";
    private static final String UPDATE_BOOK_SQL = "update book set title = ?,page_size = ?,author = ?,category = ? where id = ?;";
    private final String DELETE_BOOK = "delete from book where id = ?;";
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
    public boolean deleteBook(String id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps2 = connection.prepareStatement(DELETE_BOOK);
            ps2.setString(1, id);
            ps2.executeUpdate();
            return ps2.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }


    @Override
    public boolean add(Books books) {

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_BOOK_SQL)) {
            ps.setString(1, books.getTitle());
            ps.setString(2, books.getPageSize());
            ps.setString(3, books.getAuthor());
            ps.setString(4, books.getCategory());
            int update = ps.executeUpdate();
            if (update != 0) {
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Books selectBooks(String id) {
        Books books = null;
        try (Connection connection = BaseRepository.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_ID);) {
            preparedStatement.setString(1, id);
            // Step 3: Execute the query or update query
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String title = resultSet.getString("title");
                String pagesize = resultSet.getString("page_size");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                books = new Books(id, title, pagesize, author, category);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return books;
    }

    @Override
    public boolean updateBook(Books books) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_BOOK_SQL);

            ps.setString(1, books.getTitle());
            ps.setString(2, books.getPageSize());
            ps.setString(3, books.getAuthor());
            ps.setString(4, books.getCategory());
            ps.setString(5, books.getId());
            return  ps.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        // thêm mới thất bại
        return false;
    }
}
