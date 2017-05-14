<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Stock</title>
    <style>
        <%@include file='css/add.css' %>
    </style>
</head>




        <body>
<div class="login-page">
    <div class="form">
        <h1>Add Stock</h1>
        <sf:form method="post" modelAttribute="stock_form" cssClass="login-form">
            <sf:input path="city" placeholder="Город" cssClass="form_component"/>
            <div class="error">
                <sf:errors path="city"/>
            </div>
            <sf:input path="street" placeholder="Улица" cssClass="form_component"/>
            <div class="error">
                <sf:errors path="street"/>
            </div>
            <button type="submit">Add</button>
            <h6><a href="/admin/main">Admin</a></h6>
            <h6><a href="/admin/stock/all">Stocks</a></h6>
        </sf:form>
    </div>
</div>


</body>
</html>
