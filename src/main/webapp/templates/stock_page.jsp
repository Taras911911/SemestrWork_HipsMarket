<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Stock</title>
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
        <li><a href="/admin/order/all">Order list</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li><a href="logout">Admin off</a></li>
    </ul>
</nav>
<h1>Stock</h1>
<div >
    <h4>City: ${stock.city}</h4>
</div>
<div>
    <h4>Street: ${stock.street}</h4>
</div>
<div>
    <h4>Quantity products: ${quantity}</h4>
</div>
<h2>Product list</h2>
<table class="table table-bordered">
    <thead>
    <tr>
        <td>Product</td>
        <td>Quantity</td>
        <td></td>
        <td></td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="stock" items="${stocktaking}">
        <tr>
            <td>${stock.product.name}</td>
            <td>${stock.quantity}</td>
            <sf:form method="post" modelAttribute="modify_quantity">
                <td><sf:input path="quantity" cssClass="form-control"/></td>
                <td><sf:button value="${stock.id}" name="stocktaking"
                               class="btn btn-primary">Update</sf:button></td>
            </sf:form>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
