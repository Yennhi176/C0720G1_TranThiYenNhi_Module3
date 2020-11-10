<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 11/7/2020
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>show list user</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div>
        <h2>List User</h2>
        <a href="/users?action=create" class="btn btn-success" role="button" style="margin-top: 10px">Create new</a>
    </div>
    <table class="table table-striped" style="margin-top: 30px">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userListService}">
            <tr>
                <td><a href="/users?action=detail&id=${user.id}">${user.id}</a></td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td>
                    <a href="/users?action=update&id=${user.id}">edit</a>
                    <button type="button" class="btn btn-primary ml-2" onclick="onDelete(${user.id})"
                            data-toggle="modal" data-target="#modelDelete"><a href="/users?action=delete&id=${user.id}" style="color: black">Delete</a>
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
