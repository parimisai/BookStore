package com.bookstore.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.bookstore.dao.BookDaoImpl;
import com.bookstore.dto.Book;

@WebServlet("/BookListController")
public class BookListController extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookDaoImpl b = new BookDaoImpl();
		List<Book> a = b.getAllBooks();
		request.setAttribute("list", a);

		RequestDispatcher d = request.getRequestDispatcher("viewsBooks.jsp");
		d.forward(request, response);
	}

}
