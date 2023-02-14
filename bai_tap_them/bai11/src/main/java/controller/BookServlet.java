package controller;

import model.Books;
import service.IBookService;
import service.Impl.BookServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BookServlet", urlPatterns = "/books")
public class BookServlet extends HttpServlet {
    private IBookService bookService = new BookServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                findAll(request, response);
                break;
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insert(request, response);
                break;
            case "delete":
                deleteBook(request, response);
                break;
            case "edit":
                update(request, response);
                break;
        }
    }


    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        List<Books> bookList = bookService.showAll();
        request.setAttribute("bookList", bookList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/book/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");
        Books books = bookService.selectBooks(id);
        request.setAttribute("book", books);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/book/edit.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        List<Books> booksList = bookService.find();
        request.setAttribute("booksList", booksList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/book/add.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) {
        List<Books> booksList = bookService.find();
        String title = request.getParameter("title");
        String pagesize = request.getParameter("page_size");
        String author = request.getParameter("author");
        String category = request.getParameter("category");


        Books books = new Books(title, pagesize, author, category);
        Map<String, String> errors = bookService.add(books);
        if (errors.isEmpty()) {
            request.setAttribute("mess", "thêm mới thành công");
        } else {
            // lấy lại những gì đã nhập
            request.setAttribute("title", title);
            request.setAttribute("pagesize", pagesize);
            request.setAttribute("author", author);
            request.setAttribute("category", category);


            request.setAttribute("mess", "thêm mới thất bại");
            request.setAttribute("bookList", booksList);
            request.setAttribute("errors", errors);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/book/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void update(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String pagesize = request.getParameter("page_size");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        Books books = new Books(id, title, pagesize, author, category);
        boolean flag = bookService.updateBook(books);
        if (flag != false) {
            request.setAttribute("mess", "edit thành công");
            request.setAttribute("books", books);
        } else {
            request.setAttribute("mess", "edit thất bại");
            request.setAttribute("books", books);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/book/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("deleteId");
        String mess = "Xóa Thành công";
        boolean check = bookService.deleteBook(id);
        if (check) {
            mess = "Xóa Không thành công";
        }
        request.setAttribute("mess", mess);
        findAll(request, response);
    }
}
