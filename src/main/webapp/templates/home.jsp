<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Главная</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        <%@include file="css/home.css" %>
    </style>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">HipsterShop</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/product/all">Catalog</a></li>
            <li><a href="/basket/">Basket</a></li>
            <li><a href="/orders/">Orders</a></li>
            <security:authorize access="hasRole('ROLE_ADMIN')">
                <li><a href="/admin/main">Admin</a></li>
            </security:authorize>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <security:authorize access="isAnonymous()">
                <li><a href="registration">Registration</a></li>
                <li><a href="login">Log in</a></li>
            </security:authorize>
            <li><a href="logout">Log out</a></li>
        </ul>
    </div>
</nav>

</body>
</html>