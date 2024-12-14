<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<style type="text/css">

body {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
    background: linear-gradient(to bottom, #87CEEB, #00BFFF); /* Sky blue gradient */
    background-size: cover; /* Keeps the gradient stretched to cover the entire background */
    background-position: center center;
    background-repeat: no-repeat;
}

.container {
    width: 80%;
    max-width: 400px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 1, 0.5);
    background-color: #FFFFFF; /* White background for the container */
    text-align: left; /* Align text to the left */
}

h1 {
    font-weight: bold;
    text-align: center; /* Align the heading to the center */
    color: #333;
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
    text-align: center;  /* Center-align the text */
    font-size: 16px;     /* Optional: You can adjust the font size */
    color: #333;         /* Optional: You can adjust the text color */
}

a {
    text-decoration: none;
    color: #007BFF;
    font-weight: bold;
}

a:hover {
    color: #0056b3;
}

.error-message {
    color: red;
    font-size: 16px;
    text-align: center;
    margin-bottom: 15px;
}

.success-message {
    color: green;
    font-size: 16px;
    text-align: center;
    margin-bottom: 15px;
}

</style>
</head>
<body>

<div class="container">
    <h1>Login</h1>
    <form action="login" method="post">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" placeholder="Enter your Email" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required><br>

        <button type="submit">Login</button>
    </form>

    <p>Don't have an account? <a href="register.jsp">Register</a></p>

    <%-- Display error message if login fails --%>
   <% 
    String error = (String) session.getAttribute("error"); 
    if (error != null) {
    %>
    <div class="error-message">
        <%= error %>
    </div>
     <% 
        // Clear the error message after displaying it
        session.removeAttribute("error"); 
     }
    %>
</div>

</body>
</html>
