<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.bookstore.dto.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            margin: 0;
            padding: 40px;
            color: #333;
        }

        .container {
            width: 85%;
            margin: auto;
            background-color: white;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #4A148C;
            font-size: 32px;
            margin-bottom: 25px;
            letter-spacing: 1px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #7B1FA2;
            color: white;
            font-size: 18px;
        }

        tr:nth-child(even) {
            background-color: #f3e5f5;
        }

        tr:nth-child(odd) {
            background-color: #ede7f6;
        }

        tr:hover {
            background-color: #d1c4e9;
            transition: 0.3s ease;
        }

        a {
            text-decoration: none;
            color: white;
            padding: 8px 15px;
            border-radius: 25px;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .edit-btn {
            background-color: #28a745;
        }
        .edit-btn:hover {
            background-color: #2ecc71;
            transform: scale(1.1);
        }

        .delete-btn {
            background-color: #e74c3c;
        }
        .delete-btn:hover {
            background-color: #c0392b;
            transform: scale(1.1);
        }

        .home-link {
            display: inline-block;
            margin-top: 25px;
            background-color: #4A148C;
            padding: 10px 25px;
            border-radius: 30px;
            color: white;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .home-link:hover {
            background-color: #6A1B9A;
            transform: scale(1.1);
        }

        footer {
            text-align: center;
            color: white;
            margin-top: 40px;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>📚 Book List</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>

            <%
                List<Book> books = (List<Book>) request.getAttribute("list");
                if (books != null && !books.isEmpty()) {
                    for (Book b : books) {
            %>
            <tr>
                <td><%= b.getId() %></td>
                <td><%= b.getTitle() %></td>
                <td><%= b.getAuthor() %></td>
                <td>₹<%= b.getPrice() %></td>
                <td>
                    <a class="edit-btn" href="UpdateController?id=<%= b.getId() %>">✏️ Edit</a>
                    <a class="delete-btn" href="Confirmdelete.jsp?id=<%= b.getId() %>">Delete</a>

                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5">No Books Found!</td>
            </tr>
            <%
                }
            %>
        </table>

        <div style="text-align:center;">
            <a class="home-link" href="index.jsp">🏠 Back to Home</a>
        </div>
    </div>

    <footer>
        &copy; 2025 BookStore App | Designed by Rajani 🌸
    </footer>
</body>
</html>
