<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
    <style>
        <%@include file='css/add.css' %>
    </style>
</head>
<body>
<div class="login-page">
    <div class="form">
        <h1>Add Product</h1>
        <sf:form method="post" modelAttribute="product_form" cssClass="login-form">
            <sf:input path="name" placeholder="Название" cssClass="form_component"/>
            <div class="error">
                <sf:errors path="name"/>
            </div>
            <sf:textarea path="description" placeholder="Описание" cssClass="form_component"/>
            <div class="error">
                <sf:errors path="description"/>
            </div>
            <sf:input path="price" placeholder="Цена" cssClass="form_component"/>
            <div class="error">
                <sf:errors path="price"/>
            </div>
            <sf:select path="type" placeholder="Тип" cssClass="form_component">
                <sf:option value="Head">Head</sf:option>
                <sf:option value="Shoes">Shoes</sf:option>
                <sf:option value="Body">Body</sf:option>
            </sf:select>
            <button type="submit">Add</button>
            <h6><a href="/admin/main">Admin</a></h6>
            <h6><a href="/admin/product/all">Products</a></h6>
        </sf:form>
    </div>
</div>
</body>
</html>
