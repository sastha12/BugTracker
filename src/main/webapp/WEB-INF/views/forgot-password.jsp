<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Forgot Password - Bug Tracker</title>
<style>
  body {
    margin: 0; padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1470&q=80') no-repeat center center fixed;
    background-size: cover;
    height: 100vh;
    display: flex; justify-content: center; align-items: center;
  }
  .container {
    background: rgba(0, 0, 0, 0.7);
    padding: 40px 50px;
    border-radius: 10px;
    color: white;
    width: 350px;
    text-align: center;
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
  }
  h2 {
    margin-bottom: 30px;
    font-weight: 700;
  }
  input[type="email"] {
    width: 100%;
    padding: 12px 15px;
    margin: 10px 0 20px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
  }
  button {
    width: 100%;
    padding: 14px 0;
    background-color: #007bff;
    border: none;
    border-radius: 6px;
    color: white;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  button:hover {
    background-color: #0056b3;
  }
  a {
    display: block;
    margin-top: 20px;
    color: #aad8ff;
    text-decoration: none;
    font-weight: 500;
  }
  a:hover {
    text-decoration: underline;
  }
</style>
</head>
<body>

<div class="container">
  <h2>Forgot Password</h2>
  <form action="forgot-password" method="post">
    <input type="email" name="email" placeholder="Enter your registered email" required />
    <button type="submit">Send Reset Link</button>
  </form>
  <a href="login">Back to Login</a>
</div>

</body>
</html>
