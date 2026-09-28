<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Book</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg, #74ebd5, #ACB6E5);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.container {
    max-width: 500px;
    margin-top: 80px;
    background: white;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
}

.error-msg {
    color: red;
    font-size: 14px;
}

.success {
    color: green;
    font-weight: bold;
}
</style>

<script>
function restrictToLetters(inputId, errorId) {
    const input = document.getElementById(inputId);
    const error = document.getElementById(errorId);

    // Block invalid keys
    input.addEventListener("keydown", function (e) {
        const key = e.key;

        // allow control keys & space
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

        // allow only letters
        if (!/^[A-Za-z]$/.test(key)) {
            e.preventDefault(); // ❌ block typing
            error.innerHTML = "Only letters are allowed (numbers & symbols not allowed)";
        } else {
            error.innerHTML = "";
        }
    });

    // Handle paste & drag-drop
    input.addEventListener("input", function () {
        if (!/^[A-Za-z ]*$/.test(input.value)) {
            input.value = input.value.replace(/[^A-Za-z ]/g, "");
            error.innerHTML = "Only letters are allowed (numbers & symbols not allowed)";
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
        error.innerHTML = "Only numbers are allowed";
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

// Initialize after page load
window.onload = function () {
    restrictToLetters("title", "titleError");
    restrictToLetters("author", "authorError");
};
</script>

</head>

<body>

<div class="container">
    <h3 class="text-center text-primary mb-4">Add New Book</h3>

    <form action="BookController" method="post" onsubmit="return validateForm();">
        <input type="hidden" name="action" value="add">

        <!-- Title -->
        <div class="mb-3">
            <input type="text" class="form-control"
                   id="title" name="title"
                   placeholder="Enter book title">
            <div id="titleError" class="error-msg"></div>
        </div>

        <!-- Author -->
        <div class="mb-3">
            <input type="text" class="form-control"
                   id="author" name="author"
                   placeholder="Enter author name">
            <div id="authorError" class="error-msg"></div>
        </div>

        <!-- Price -->
        <div class="mb-3">
            <input type="text" class="form-control"
                   id="price" name="price"
                   placeholder="Enter price"
                   oninput="validatePrice()">
            <div id="priceError" class="error-msg"></div>
        </div>

        <button type="submit" class="btn btn-primary w-100">Add Book</button>
    </form>

    <p class="success text-center mt-3">${message}</p>

    <div class="text-center mt-3">
        <a href="index.jsp" class="btn btn-secondary">🏠 Back to Home</a>
    </div>
</div>

</body>
</html>
