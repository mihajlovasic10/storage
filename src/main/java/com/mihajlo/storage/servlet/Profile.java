package com.mihajlo.storage.servlet;

import com.mihajlo.storage.entity.User;
import com.mihajlo.storage.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Profile extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loggedUser = (User) req.getSession().getAttribute("loggedUser");

        if (loggedUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        req.getRequestDispatcher("/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loggedUser = (User) req.getSession().getAttribute("loggedUser");

        loggedUser.setPassword(req.getParameter("password"));
        loggedUser.setEmail(req.getParameter("email"));
        loggedUser.setName(req.getParameter("user-name"));
        loggedUser.setImage(req.getParameter("image"));

        req.getSession().setAttribute("loggedUser", userService.update(loggedUser));

        doGet(req, resp);
    }
}
