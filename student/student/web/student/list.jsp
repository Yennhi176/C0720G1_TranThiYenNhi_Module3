<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 11/9/2020
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>show list Student</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
<div class="container">
    <div>
        <h2>List Student</h2>
        <a href="/student?action=create" class="btn btn-success" role="button" style="margin-top: 10px">Create new</a>
    </div>
    <form action="/student?action=search" method="post">
        <input style="margin-top: 10px" type="text" name="search" placeholder="search by name">
        <button style="margin-top: 10px" type="submit" value="search">Search</button>

    </form>
    <table class="table table-striped" style="margin-top: 30px">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Age</th>
            <th>ClassCode</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${requestScope.studentListService}">
            <tr>
                <td><a href="/student?action=search&id=${student.id}">${student.id}</a></td>
                <td>${student.name}</td>
                <td>${student.age}</td>
                <td>${student.classCode}</td>
                <td>
                    <a href="/student?action=update&id=${student.id}"><i class="fas fa-edit"></i></a>
                    <button type="button" class="btn btn-primary ml-2" onclick="onDelete(${student.id})"
                            data-toggle="modal" data-target="#modelDelete"><a href="/student?action=delete&id=${student.id}" style="color: black"><i class="fas fa-trash-alt"></i></a>
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>
