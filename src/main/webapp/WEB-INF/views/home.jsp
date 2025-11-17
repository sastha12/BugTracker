<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Home - Bug Tracker</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

<style>
  body {
    background-image: url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=1470&q=80');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    min-height: 100vh;
    color: white;
  }
  .overlay {
    background: rgba(0, 0, 0, 0.6);
    min-height: 100vh;
    padding-top: 80px;
  }
  .container {
    max-width: 600px;
    background: rgba(255, 255, 255, 0.1);
    padding: 30px;
    border-radius: 12px;
  }
  a.btn-custom {
    background-color: #007bff;
    color: white;
    font-weight: 600;
    border-radius: 6px;
  }
  a.btn-custom:hover {
    background-color: #0056b3;
    color: white;
  }
  a.btn-danger-custom { /* Added style for Logout button */
    background-color: #dc3545;
    color: white;
    font-weight: 600;
    border-radius: 6px;
  }
  a.btn-danger-custom:hover {
    background-color: #a71d2a;
    color: white;
  }
</style>

</head>
<body>

<div class="overlay d-flex justify-content-center align-items-center">
  <div class="container text-center">
    <h1 class="mb-4">Perform in-depth debugging and analysis of system failures</h1>
    <p class="lead mb-5">
      Manage our bugs efficiently, collaborate with your team, and keep our software flawless.
    </p>
    
    <div>
      <c:if test="${user.role == 'TeamLeader'}">
        <a href="/addBug" class="btn btn-custom me-3">Add New Bug</a>
      </c:if>
      <a href="/bugs" class="btn btn-custom">View Bug List</a>
    </div>
    <hr class="my-5" />

    <div class="mb-5">
      <a href="mailto:support@qubetra.com?subject=Bug%20Tracker%20Support" class="btn btn-secondary me-3">
        📧 Mail Support
      </a>
      <a href="/logout" class="btn btn-danger-custom">
        🚪 Logout
      </a>
    </div>
    <div>
      <c:if test="${not empty user}">
      <h5>User Info</h5>
      <p>Name: ${user.name}</p>
      <p>Email: ${user.email}</p>
      <p>Role: ${user.role}</p>
      </c:if>
    </div>

  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>