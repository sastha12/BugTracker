<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Bug List</title>

<!-- Bootstrap CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

<style>
  body {
    background: #f8f9fa;
  }
  h2 {
    margin-top: 30px;
    margin-bottom: 30px;
    color: #343a40;
  }
  .table thead {
    background-color: #343a40;
    color: white;
  }
  .btn-primary {
    background-color: #007bff;
    border: none;
  }
  .btn-primary:hover {
    background-color: #0056b3;
  }
  .btn-danger {
    background-color: #dc3545;
    border: none;
  }
  .btn-danger:hover {
    background-color: #a71d2a;
  }
  .search-box {
    max-width: 300px;
    margin-bottom: 20px;
  }
</style>

<script>
  // Simple client-side search filter
  function searchBugs() {
    let input = document.getElementById("searchInput");
    let filter = input.value.toLowerCase();
    let table = document.getElementById("bugTable");
    let tr = table.getElementsByTagName("tr");

    for (let i = 1; i < tr.length; i++) {
      let tdTitle = tr[i].getElementsByTagName("td")[1];
      let tdDesc = tr[i].getElementsByTagName("td")[2];
      if (tdTitle || tdDesc) {
        let titleText = tdTitle.textContent || tdTitle.innerText;
        let descText = tdDesc.textContent || tdDesc.innerText;
        if (titleText.toLowerCase().indexOf(filter) > -1 || descText.toLowerCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  }
</script>

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="/home">Inspect with Developers</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/addBug">Add Bug</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="mailto:support@qubetra.com?subject=Bug%20Tracker%20Support&body=Describe%20your%20issue%20here.">Mail Support</a>
        </li>
        <li class="nav-item">
          <a class="nav-link btn btn-danger text-white ms-3 px-3" href="logout">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">

  <h2>All Bugs</h2>

  <input
    type="text"
    id="searchInput"
    onkeyup="searchBugs()"
    class="form-control search-box"
    placeholder="Search bugs by title or description..."
  />

  <table class="table table-striped table-hover align-middle" id="bugTable">
    <thead>
      <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Priority</th>
        <th>Status</th>
        <th>Created By</th>
        <th>Last Updated By</th>
        <th>Edit</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="b" items="${buglist}">
        <tr>
          <td>${b.id}</td>
          <td>${b.title}</td>
          <td>${b.description}</td>
          <td>
            <c:choose>
              <c:when test="${b.priority == 'High'}">
                <span class="badge bg-danger">High</span>
              </c:when>
              <c:when test="${b.priority == 'Medium'}">
                <span class="badge bg-warning text-dark">Medium</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-secondary">Low</span>
              </c:otherwise>
            </c:choose>
          </td>
          <td>
            <c:choose>
              <c:when test="${b.status == 'Open'}">
                <span class="badge bg-success">Open</span>
              </c:when>
              <c:when test="${b.status == 'In Progress'}">
                <span class="badge bg-info text-dark">In Progress</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-secondary">Closed</span>
              </c:otherwise>
            </c:choose>
          </td>
          <td>${b.createdBy}</td>
          <td>${b.updatedBy}</td>
          <td>
            <a href="edit?id=${b.id}" class="btn btn-primary btn-sm">Edit</a>
          </td>
          <td>
            <a href="delete?id=${b.id}" class="btn btn-danger btn-sm"
               onclick="return confirm('Are you sure you want to delete?');">
              Delete
            </a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

</div>

<!-- Bootstrap JS Bundle CDN (Popper + Bootstrap JS) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
