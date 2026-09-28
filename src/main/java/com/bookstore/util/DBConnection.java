package com.bookstore.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/batch12", "root", "root");
		} catch (Exception e) {
			System.out.println(e);
			;
		}
		return con;
	}
}
