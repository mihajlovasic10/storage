package com.mihajlo.storage.servlet;

import com.mihajlo.storage.entity.User;
import com.mihajlo.storage.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Login extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User loggedUser = userService.findByEmailAndPassword(email, password);

        if (loggedUser == null) {
            req.setAttribute("error", "User not found!");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession();
        session.setAttribute("loggedUser", loggedUser);
        session.setAttribute("role", loggedUser.getRole().getKey());

        req.setAttribute("loggedUser", loggedUser);

        resp.sendRedirect(req.getContextPath() + "/home");
    }
}
