package controller;


import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "FuramaSverlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private static List<User> userList = new ArrayList<>();

    static {
        userList.add(new User(1, "admin", "123abc"));
     }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean rememberMe = Boolean.parseBoolean(request.getParameter("rememberMe"));
        // xác thực
        User userLogin = null;
        for (User user : userList) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                userLogin = user;
                break;
            }
        }
        String messLogin = "";

        if (userLogin != null) {
            // đăng nhập thành công
            response.sendRedirect("/Successs.jsp");
        } else {
            // đăng nhập thấ bại
            messLogin = "Tên Đăng Nhập Hoặc Mật Khẩu Không Đúng!";
            request.setAttribute("messLogin", messLogin);
            request.getRequestDispatcher("login/login.jsp").forward(request, response);
        }
    }
}

