<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Catalog</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        <%@include file='css/ad.css' %>
    </style>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation">
    <ul class="nav navbar-nav">
        <div class="navbar-header">
            <a href="/" class="navbar-brand">HipsterShop</a>
        </div>
        <li><a href="/admin/product/add">Add product</a></li>
        <li><a href="/admin/stock/add">Add stock</a></li>
        <li><a href="/admin/stocktaking/add">Add user log</a></li>
        <li><a href="/admin/user/all">User list</a></li>
        <li><a href="/admin/product/all">Product list</a></li>
        <li><a href="/admin/stock/all">Stock list</a></li>
        <li><a href="/admin/order/all">Odders list</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li><a href="logout">Admin off</a></li>
    </ul>
</nav>
<div class="collapse navbar-collapse"><a class="btn btn-success" href="/admin/main" class="href">Admin</a>
    <a class="btn btn-success" href="/admin/product/add" class="href">Add product</a></div>
<h1>Products</h1>
<table class="table table-bordered">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>About</th>
        <th>Price</th>
        <th>Type</th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
    </tr>
    </thead>

    <core:forEach var="product" items="${products}">
        <tbody>
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>${product.price} р</td>
            <td>${product.type}</td>
            <sf:form method="post" modelAttribute="modify_product">
                <td><sf:input path="name"/></td>
                <td><sf:textarea path="description"/></td>
                <td><sf:input path="price"/></td>

                <td><sf:select path="type">
                    <sf:option value="Head">Head</sf:option>
                    <sf:option value="Body">Body</sf:option>
                    <sf:option value="Shoes">Shoes</sf:option>
                </sf:select></td>
                <td>
                    <sf:button value="${product.id}" name="id" class="btn btn-success">Update</sf:button>
                </td>
            </sf:form>
        </tr>
        </tbody>
    </core:forEach>

</table>
</body>
</html>
