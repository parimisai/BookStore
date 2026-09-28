<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bookstore.dto.Book" %>

<%
    Book book = (Book) request.getAttribute("book");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Book</title>

<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #74ebd5, #ACB6E5);
    color: #333;
    margin: 0;
    padding: 0;
}

.container {
    width: 50%;
    margin: 80px auto;
    background-color: white;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
}

h2 {
    text-align: center;
    color: #4A148C;
    font-size: 30px;
    margin-bottom: 30px;
}

form {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

label {
    font-weight: bold;
}

input[type="text"] {
    padding: 10px;
    border: 2px solid #ccc;
    border-radius: 8px;
    width: 100%;
}

input[type="text"]:focus {
    border-color: #7B1FA2;
    outline: none;
}

input[type="submit"] {
    background-color: #7B1FA2;
    color: white;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 25px;
    padding: 12px;
    cursor: pointer;
    margin-top: 15px;
}

input[type="submit"]:hover {
    background-color: #9C27B0;
}

.error-msg {
    color: red;
    font-size: 14px;
    margin-bottom: 10px;
}

.back-link {
    display: block;
    text-align: center;
    margin-top: 20px;
    background-color: #4A148C;
    color: white;
    padding: 10px 20px;
    border-radius: 25px;
    text-decoration: none;
    font-weight: bold;
}

footer {
    text-align: center;
    color: white;
    margin-top: 40px;
    font-size: 14px;
}
</style>

<script>
function restrictToLetters(inputId, errorId) {
    const input = document.getElementById(inputId);
    const error = document.getElementById(errorId);

    // Block invalid typing
    input.addEventListener("keydown", function (e) {
        const key = e.key;

        if (
            key === "Backspace" ||
            key === "Delete" ||
            key === "Tab" ||
            key === "ArrowLeft" ||
            key === "ArrowRight" ||
            key === " "
        ) {
            error.innerHTML = "";
            return;
        }

        if (!/^[A-Za-z]$/.test(key)) {
            e.preventDefault();
            error.innerHTML = "Only letters are allowed";
        } else {
            error.innerHTML = "";
        }
    });

    // Handle paste
    input.addEventListener("input", function () {
        if (!/^[A-Za-z ]*$/.test(input.value)) {
            input.value = input.value.replace(/[^A-Za-z ]/g, "");
            error.innerHTML = "Only letters are allowed";
        } else {
            error.innerHTML = "";
        }
    });
}

function validatePrice() {
    const price = document.getElementById("price");
    const error = document.getElementById("priceError");

    if (!/^[0-9]*\.?[0-9]{0,2}$/.test(price.value)) {
        price.value = price.value.replace(/[^0-9.]/g, "");
        error.innerHTML = "Only numbers allowed";
    } else {
        error.innerHTML = "";
    }
}

function validateForm() {
    const title = document.getElementById("title").value.trim();
    const author = document.getElementById("author").value.trim();
    const price = document.getElementById("price").value.trim();

    if (title === "" || author === "" || price === "") {
        return false;
    }
    return true;
}

window.onload = function () {
    restrictToLetters("title", "titleError");
    restrictToLetters("author", "authorError");
};
</script>

</head>

<body>

<div class="container">
    <h2>✏️ Update Book Details</h2>

    <form action="UpdateController" method="post" onsubmit="return validateForm();">
        <input type="hidden" name="id" value="<%= book.getId() %>">

        <label>Title:</label>
        <input type="text" id="title" name="title" value="<%= book.getTitle() %>">
        <div id="titleError" class="error-msg"></div>

        <label>Author:</label>
        <input type="text" id="author" name="author" value="<%= book.getAuthor() %>">
        <div id="authorError" class="error-msg"></div>

        <label>Price:</label>
        <input type="text" id="price" name="price"
               value="<%= book.getPrice() %>"
               oninput="validatePrice()">
        <div id="priceError" class="error-msg"></div>

        <input type="submit" value="Update Book">
    </form>

    <a class="back-link" href="BookListController">📚 Back to Book List</a>
</div>

<footer>
    &copy; 2025 BookStore App | Designed by Rajani 🌸
</footer>

</body>
</html>
