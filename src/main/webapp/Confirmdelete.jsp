<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Delete</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #f0f4ff, #cce0ff);
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .container {
        background-color: white;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
        text-align: center;
    }
    h2 {
        color: #333;
        margin-bottom: 30px;
    }
    .btn {
        text-decoration: none;
        padding: 10px 20px;
        border-radius: 6px;
        color: white;
        font-weight: bold;
        margin: 0 10px;
        display: inline-block;
    }
    .yes-btn {
        background-color: #dc3545;
    }
    .no-btn {
        background-color: #28a745;
    }
    .yes-btn:hover { background-color: #c82333; }
    .no-btn:hover { background-color: #218838; }
</style>
</head>
<body>

<%
    String id = request.getParameter("id");
%>

<div class="container">
    <h2>Are you sure you want to delete Book ID <%= id %>?</h2>

    <a href="DeleteController?id=<%= id %>" class="btn yes-btn">Yes, Delete</a>
    <a href="BookListController" class="btn no-btn">No, Go Back</a>
</div>

</body>
</html>
