
package com.bookstore.dao;

import java.sql.*;
import java.util.*;
import com.bookstore.dto.Book;
import com.bookstore.util.DBConnection;

public class BookDaoImpl implements BookDao {

	@Override
	public boolean addBook(Book book) {
		boolean result = false;
		String query = "INSERT INTO books(title, author, price) VALUES(?,?,?)";
		try (Connection con = DBConnection.getConnection(); 
		    PreparedStatement ps = con.prepareStatement(query)) {
			ps.setString(1, book.getTitle());
			ps.setString(2, book.getAuthor());
			ps.setDouble(3, book.getPrice());
			result = ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Book> getAllBooks() {
		List<Book> list = new ArrayList<>();
		String query = "SELECT * FROM books";
		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				list.add(new Book(rs.getInt("id"), rs.getString("title"), rs.getString("author"),
						rs.getDouble("price")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean updateBook(Book book) {
		boolean result = false;
		String query = "UPDATE books SET title = ?, author = ?, price = ? WHERE id = ?";

		try (Connection con = DBConnection.getConnection(); 
			PreparedStatement ps = con.prepareStatement(query)) {

			ps.setString(1, book.getTitle());
			ps.setString(2, book.getAuthor());
			ps.setDouble(3, book.getPrice());
			ps.setInt(4, book.getId());

			int n = ps.executeUpdate();
			if (n > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public Book getBookById(int id) {
		Book book = null;
		String query = "SELECT * FROM books WHERE id = ?";

		try (Connection con = DBConnection.getConnection(); 
			PreparedStatement ps = con.prepareStatement(query)) {

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				book = new Book();
				book.setId(rs.getInt("id"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getDouble("price"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return book;
	}

	public boolean deleteBook(int id) {
		boolean result = false;
		String query = "delete from books WHERE id = ?";

		try (Connection con = DBConnection.getConnection(); 
			PreparedStatement ps = con.prepareStatement(query)) {

			ps.setInt(1, id);

			int n = ps.executeUpdate();
			if (n > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
