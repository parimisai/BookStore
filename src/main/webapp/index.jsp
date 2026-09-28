<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Book Store Home</title>

<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #1e3c72, #2a5298);
    color: #333;
    margin: 0;
    padding: 0;
}

.container {
    width: 60%;
    margin: 100px auto;
    background-color: #ffffff;
    padding: 45px;
    border-radius: 22px;
    box-shadow: 0px 12px 30px rgba(0, 0, 0, 0.3);
    text-align: center;
}

h2 {
    color: #2a5298;
    font-size: 34px;
    margin-bottom: 15px;
    letter-spacing: 1px;
}

p {
    color: #555;
    font-size: 17px;
    margin-bottom: 30px;
}

/* Buttons */
a {
    text-decoration: none;
    color: white;
    background: linear-gradient(45deg, #5f2c82, #49a09d);
    padding: 14px 30px;
    margin: 12px;
    border-radius: 35px;
    transition: all 0.3s ease;
    font-weight: bold;
    display: inline-block;
}

a:hover {
    transform: translateY(-4px) scale(1.05);
    box-shadow: 0px 10px 25px rgba(0,0,0,0.25);
    background: linear-gradient(45deg, #49a09d, #5f2c82);
}

/* Footer */
footer {
    text-align: center;
    color: #e0e0e0;
    margin-top: 50px;
    font-size: 14px;
}

/* Responsive */
@media (max-width: 768px) {
    .container {
        width: 85%;
        margin: 70px auto;
    }
}
</style>

</head>

<body>

<div class="container">
    <h2>📚 Welcome to the Book Store</h2>
    <p>Manage your collection with ease – add, view, update, or delete books.</p>

    <a href="addBook.jsp">➕ Add Book</a>
    <a href="BookListController">📖 View Books</a>
</div>

<footer>
    &copy; 2025 BookStore App | Designed by Rajani 🌸
</footer>

</body>
</html>
