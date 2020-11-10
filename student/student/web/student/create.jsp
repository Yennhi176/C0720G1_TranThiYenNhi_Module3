<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 11/9/2020
  Time: 9:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create student</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Create new</h2>
    <a href="/student?action">back home</a>
    <form action="/student?action=create" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="name" class="form-control" id="name" placeholder="Enter name" name="name">
        </div>
        <div class="form-group">
            <%--@declare id="age"--%><label for="age">Age:</label>
            <input type="age" class="form-control" id="email" placeholder="Enter age" name="age">
        </div>
        <div class="form-group">
            <%--@declare id="classcode"--%><label for="classCode">classCode:</label>
            <input type="classCode" class="form-control" id="country" placeholder="Enter classCode" name="classCode">
        </div>
        <button type="submit" class="btn btn-primary">Add</button>
    </form>

</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>