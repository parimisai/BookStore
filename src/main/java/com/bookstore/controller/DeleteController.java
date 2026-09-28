package com.bookstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bookstore.dao.BookDaoImpl;

@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
	//private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		BookDaoImpl bookDao = new BookDaoImpl();
		boolean s=bookDao.deleteBook(id);
		if(s) {
			response.sendRedirect("BookListController");
		}
		
		
	}

}
