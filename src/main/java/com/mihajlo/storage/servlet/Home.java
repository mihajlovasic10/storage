package com.mihajlo.storage.servlet;

import com.mihajlo.storage.entity.StorageItem;
import com.mihajlo.storage.entity.User;
import com.mihajlo.storage.service.StorageItemService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

public class Home extends HttpServlet {

    private final StorageItemService itemService = new StorageItemService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loggedUser = (User) req.getSession().getAttribute("loggedUser");

        if (loggedUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if (req.getParameter("delete") != null) itemService.delete(Long.parseLong(req.getParameter("delete")));
        if (req.getParameter("edit") != null) {
            req.setAttribute("edit", itemService.getById(Long.parseLong(req.getParameter("edit"))));
        }

        req.setAttribute("create", req.getParameter("create"));

        String search = Optional.ofNullable(req.getParameter("search")).orElse("");

        req.setAttribute("items", itemService.search(search));
        req.getRequestDispatcher("/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loggedUser = (User) req.getSession().getAttribute("loggedUser");

        if (loggedUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loggedUser = (User) req.getSession().getAttribute("loggedUser");

        if (loggedUser == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if (req.getParameter("edit-id") != null) {
            handleUpdate(req, resp);
        }

        if (req.getParameter("create-id") != null) {
            handleCreate(req, resp);
        }

        req.removeAttribute("edit");
        req.removeAttribute("create");
        req.removeAttribute("delete");

        doGet(req, resp);
    }

    private void handleCreate(HttpServletRequest req, HttpServletResponse resp) {
        StorageItem item = new StorageItem();
        item.setName(req.getParameter("create-name"));
        item.setUnitOfMesure(req.getParameter("create-unit-of-mesure"));
        item.setTotal(req.getParameter("create-total"));
        item.setTotalPrice(req.getParameter("create-total-price"));

        itemService.create(item);
    }

    private void handleUpdate(HttpServletRequest req, HttpServletResponse resp) {
        StorageItem item = itemService.getById(Long.parseLong(req.getParameter("edit-id")));

        item.setName(req.getParameter("edit-name"));
        item.setUnitOfMesure(req.getParameter("edit-unit-of-mesure"));
        item.setTotal(req.getParameter("edit-total"));
        item.setTotalPrice(req.getParameter("edit-total-price"));

        itemService.update(item);
    }
}
