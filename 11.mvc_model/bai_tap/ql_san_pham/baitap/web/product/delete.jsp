<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 11/5/2020
  Time: 8:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting product</title>
</head>
<body>
<h1>Xóa sản phẩm</h1>
<p>
    <a href="/products">Quay về danh sách sản phẩm</a>
</p>
<form method="post">
    <h3>Bạn có chắc không?</h3>
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên:</td>
                <td>${requestScope["product"].getName()}</td>
            </tr>
            <tr>
                <td>Gía:</td>
                <td>${requestScope["product"].getPrice()}</td>
            </tr>
            <tr>
                <td>Mô tả SP:</td>
                <td>${requestScope["product"].getDescribe()}</td>
            </tr>
            <tr>
                <td>Nhà sx SP:</td>
                <td>${requestScope["product"].getProducer()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Xóa sản phẩm"></td>
                <td><a href="/products">Quay về danh sách sản phẩm</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
