<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Edit Bug</title>
    <style>
        /* Reset and base */
        * {
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            margin: 0; padding: 0;
            color: #333;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            background: white;
            border-radius: 12px;
            padding: 30px 40px;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
        h2 {
            text-align: center;
            color: #4b2e83;
            margin-bottom: 25px;
            font-weight: 700;
            letter-spacing: 1.1px;
        }

        /* Navigation buttons */
        .nav-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-bottom: 25px;
        }
        .nav-buttons a {
            background-color: #764ba2;
            color: white;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 6px;
            font-weight: 600;
            transition: background-color 0.3s ease;
            font-size: 14px;
        }
        .nav-buttons a:hover {
            background-color: #5a3570;
        }

        /* Form styling */
        form p {
            margin-bottom: 18px;
            font-weight: 600;
            color: #444;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px 12px;
            border: 1.8px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: border-color 0.3s ease;
            resize: vertical;
        }
        input[type="text"]:focus, textarea:focus, select:focus {
            border-color: #764ba2;
            outline: none;
        }
        textarea {
            min-height: 100px;
        }

        button[type="submit"] {
            background-color: #764ba2;
            color: white;
            padding: 14px 0;
            width: 100%;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 15px;
        }
        button[type="submit"]:hover {
            background-color: #5a3570;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="nav-buttons">
        <a href="home">Home</a>
        <a href="logout">Logout</a>
        <a href="mailto:support@bugtracker.com">Mail</a>
    </div>

    <h2>Edit Bug</h2>

    <form action="update" method="post">
        <input type="hidden" name="id" value="${bug.id}" />

        <p>Title:</p>
        <input type="text" name="title" value="${bug.title}" required />

        <p>Description:</p>
        <textarea name="description" required>${bug.description}</textarea>

        <p>Priority:</p>
        <select name="priority" required>
            <option value="Low" ${bug.priority == 'Low' ? 'selected' : ''}>Low</option>
            <option value="Medium" ${bug.priority == 'Medium' ? 'selected' : ''}>Medium</option>
            <option value="High" ${bug.priority == 'High' ? 'selected' : ''}>High</option>
        </select>

        <p>Status:</p>
        <select name="status" required>
            <option value="Open" ${bug.status == 'Open' ? 'selected' : ''}>Open</option>
            <option value="In Progress" ${bug.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
            <option value="Closed" ${bug.status == 'Closed' ? 'selected' : ''}>Closed</option>
        </select>

        <button type="submit">Update Bug</button>
    </form>

</div>

</body>
</html>
