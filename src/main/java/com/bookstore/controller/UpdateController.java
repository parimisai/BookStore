package com.bookstore.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bookstore.dao.BookDaoImpl;
import com.bookstore.dto.Book;

@WebServlet("/UpdateController")
public class UpdateController extends HttpServlet {
   // private static final long serialVersionUID = 1L;

    private BookDaoImpl bookDao = new BookDaoImpl();

    // Step 1: Show existing data in form
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book existingBook = bookDao.getBookById(id); // <-- Fetch book by ID from DB

        request.setAttribute("book", existingBook); // <-- Store it in request scope

        RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
        rd.forward(request, response);
    }

    // Step 2: Update data in DB
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));

        Book updatedBook = new Book(id, title, author, price);
        boolean updated = bookDao.updateBook(updatedBook);

        if (updated) {
            response.sendRedirect("BookListController"); // redirect to list page
        } else {
            response.getWriter().println("Update failed!");
        }
    }
}
