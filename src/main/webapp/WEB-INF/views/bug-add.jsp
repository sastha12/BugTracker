<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Add Bug - Bug Tracker</title>

<!-- Bootstrap CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

<style>
  body {
    background: linear-gradient(135deg, #667eea, #764ba2);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }
  .form-container {
    background: rgba(255, 255, 255, 0.15);
    padding: 30px 40px;
    border-radius: 15px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
    width: 100%;
    max-width: 450px;
  }
  h2 {
    margin-bottom: 25px;
    font-weight: 700;
    text-align: center;
    color: #f8f9fa;
  }
  label {
    font-weight: 600;
    margin-top: 15px;
  }
  select, input[type="text"], textarea {
    background: rgba(255, 255, 255, 0.8);
    border: none;
    border-radius: 8px;
    padding: 10px 15px;
    font-size: 1rem;
    color: #333;
    width: 100%;
    box-sizing: border-box;
    transition: box-shadow 0.3s ease;
  }
  select:focus, input[type="text"]:focus, textarea:focus {
    outline: none;
    box-shadow: 0 0 8px #764ba2;
  }
  button {
    margin-top: 25px;
    width: 100%;
    background: #764ba2;
    border: none;
    padding: 12px;
    border-radius: 12px;
    font-weight: 700;
    font-size: 1.1rem;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  button:hover {
    background: #5a3577;
  }
</style>

</head>
<body>

<div class="form-container">
  <h2>Add New Bug</h2>
  
  <form action="/save" method="post" autocomplete="off">

    <label for="title">Title:</label>
    <input type="text" id="title" name="title" placeholder="Enter bug title" required />

    <label for="description">Description:</label>
    <textarea id="description" name="description" rows="4" placeholder="Describe the bug" required></textarea>

    <label for="priority">Priority:</label>
    <select id="priority" name="priority" required>
      <option value="" disabled selected>Select priority</option>
      <option value="Low">Low</option>
      <option value="Medium">Medium</option>
      <option value="High">High</option>
    </select>

    <label for="status">Status:</label>
    <select id="status" name="status" required>
      <option value="" disabled selected>Select status</option>
      <option value="Open">Open</option>
      <option value="In Progress">In Progress</option>
      <option value="Closed">Closed</option>
    </select>

    <button type="submit">Save Bug</button>

  </form>
</div>

<!-- Bootstrap JS Bundle CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
