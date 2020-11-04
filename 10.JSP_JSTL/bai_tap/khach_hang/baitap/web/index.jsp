<%@ page import="dao.CustomerDao" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 11/3/2020
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<%
request.setAttribute("listCustomer", CustomerDao.showCustomer());
%>
<div class="container">
  <h2 style="text-align: center">Danh Sách Khách Hàng</h2>
  <table class="table">
    <thead>
    <tr>
      <th>Tên</th>
      <th>Ngày Sinh</th>
      <th>Địa Chỉ</th>
      <th>Ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${requestScope.listCustomer}">
    <tr>
      <td><c:out value="${customer.name}"/></td>
      <td><c:out value="${customer.birthday}"/></td>
      <td><c:out value="${customer.address}"/></td>
      <td>
       <img style="width: 100px; height: 140px" src="<c:out value="${customer.img}"/>">
      </td>
    </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
