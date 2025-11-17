<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Login - Bug Tracker</title>
<style>
  /* Full screen background image */
  body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1470&q=80') no-repeat center center fixed;
    background-size: cover;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  /* Form container with translucent background */
  .login-container {
    background: rgba(0, 0, 0, 0.7);
    padding: 40px 50px;
    border-radius: 10px;
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
    color: white;
    width: 350px;
    text-align: center;
  }

  h2 {
    margin-bottom: 30px;
    font-weight: 700;
    letter-spacing: 1.5px;
  }

  input[type="text"],
  input[type="password"] {
    width: 100%;
    padding: 12px 15px;
    margin: 10px 0 20px 0;
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
    display: inline-block;
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

<div class="login-container">
  <h2>Debugger Login</h2>
  <form action="login" method="post">
    <input type="text" name="username" placeholder="Username" required />
    <input type="password" name="password" placeholder="Password" required />
    <button type="submit">Login</button>
  </form>
  <a href="forgot-password">Forgot Password?</a>
  <a href="register">New User? Register Here</a>
  
</div>

</body>
</html>
