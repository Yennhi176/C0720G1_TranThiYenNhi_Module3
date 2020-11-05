<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 11/4/2020
  Time: 9:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new product</title>
    <style>
        message{
            color: green;
        }
    </style>
</head>
<body>
<h1>Tạo sản phẩm mới</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Quay về danh sách sản phẩm</a>
</p>
<form method="post">
<fieldset>
    <legend>Thông tin sản phẩm</legend>
    <table>
        <tr>
            <td>Tên:</td>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <tr>
            <td>Gía:</td>
            <td><input type="text" name="price" id="price"></td>
        </tr>
        <tr>
            <td>Mô tả SP:</td>
            <td><input type="text" name="describe"></td>
        </tr>
        <tr>
            <td>Nhà sx SP:</td>
            <td><input type="text" name="producer"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Tạo SP"></td>
        </tr>
    </table>
</fieldset>
</form>

</body>
</html>
