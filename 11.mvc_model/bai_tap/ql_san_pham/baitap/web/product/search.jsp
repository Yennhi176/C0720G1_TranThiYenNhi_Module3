<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 11/4/2020
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Products</h1>
<table border="1">
    <tr>
        <td>Tên SP</td>
        <td>Gía SP</td>
        <td>Mô Tả SP</td>
        <td>Nhà sx SP</td>
        <td>Sửa</td>
        <td>Xóa</td>
    </tr>
    <c:forEach items='${requestScope["product"]}' var="product">
        <tr>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">Sửa</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">Xóa</a></td>
        </tr>
    </c:forEach>

</table>
<tr>
    <td></td>
    <td><a href="/products">Quay về danh sách sản phẩm</a></td>
</tr>
</body>
</html>
