<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style type="text/css">
body {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
    background: linear-gradient(to bottom, #87CEEB, #00BFFF); /* Sky blue gradient */
    background-size: cover; /* Keeps the gradient stretched to cover the entire background */
    background-position: center center;
    background-repeat: no-repeat;
    font-family: 'Roboto', sans-serif; /* Added custom font */
}

.container {
    width: 80%;
    max-width: 400px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 1, 0.5);
    background-color: #FFFFFF; /* White background for the container */
    text-align: center; /* Align text to the center */
}

h1 {
    font-weight: bold;
    color: #333;
    margin-bottom: 20px;
}

h3 {
    font-size: 18px;
    color: #555;
    margin-bottom: 20px;
}

label {
    display: block;
    margin: 10px 0;
    color: #555;
}

input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

button {
    width: 100%;
    padding: 12px;
    cursor: pointer;
    background-color: #007BFF;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

button:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}

p {
    font-size: 16px;
    color: #333;
}

a {
    text-decoration: none;
    color: #007BFF;
    font-weight: bold;
}

a:hover {
    color: #0056b3;
}

</style>
</head>
<body>
    <%
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("login.jsp");
            return; // Don't render the rest of the page
        }
    %>

    <div class="container">
        <h1>Welcome, <%= username %>!</h1>
        <p>We're delighted to have you on our platform. 🌟</p>
        <h3>Explore, learn, and connect with our vibrant community! 🚀</h3>
        <p>Feel free to stay as long as you like, and when you're ready,</p> 
       <form action="logout" method="get">
            you can <a href="index.html">LOGOUT</a> securely.
        </form>
    </div>
</body>
</html>
