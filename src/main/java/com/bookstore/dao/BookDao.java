package com.bookstore.dao;

import java.util.List;
import com.bookstore.dto.Book;

public interface BookDao {
	boolean addBook(Book book);

	List<Book> getAllBooks();
	
}
