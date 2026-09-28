
package com.bookstore.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.bookstore.dao.*;
import com.bookstore.dto.*;

@WebServlet("/BookController")
public class BookController extends HttpServlet {
	private BookDao dao;

	public void init() {
		dao = new BookDaoImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if ("add".equals(action)) {
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			double price = Double.parseDouble(request.getParameter("price"));

			Book book = new Book();
			book.setTitle(title);
			book.setAuthor(author);
			book.setPrice(price);

			boolean success = dao.addBook(book);
			if (success) {
				request.setAttribute("message", "Book added successfully!");
			} else {
				request.setAttribute("message", "Failed to add book.");
			}
			request.getRequestDispatcher("addBook.jsp").forward(request, response);
		}

		if ("view".equals(action)) {
			request.setAttribute("books", dao.getAllBooks());
			request.getRequestDispatcher("viewBooks.jsp").forward(request, response);
		}
	}
}
