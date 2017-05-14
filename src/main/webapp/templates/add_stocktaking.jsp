<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add user log</title>
    <style>
        <%@include file='css/add.css' %>
    </style>
</head>
<body>
<div class="login-page">
    <div class="form">
        <h1>Add user log</h1>
        <sf:form method="post" modelAttribute="stocktaking_form" cssClass="login-form">
            <sf:select path="product" placeholder="Продукт" cssClass="form_component">
                <core:forEach var="product" items="${products}">
                    <sf:option value="${product.id}">${product.name}, ${product.type}, ${product.price} рублей</sf:option>
                </core:forEach>
            </sf:select>
            <sf:select path="stock" placeholder="Склад" cssClass="form_component">
                <core:forEach var="stock" items="${stocks}">
                    <sf:option value="${stock.id}">${stock.city}, ${stock.street}</sf:option>
                </core:forEach>
            </sf:select>
            <sf:input path="quantity" cssClass="form_component"/>
            <button type="submit">Add</button>
            <h6><a href="/admin/main">Admin</a></h6>
            <h6><a href="/admin/stock/all">Stocks</a></h6>
        </sf:form>
    </div>
</div>
</body>
</html>
