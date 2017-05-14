
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Log in</title>
    <style>
        <%@include file='css/login.css' %>
    </style>
</head>
<body>
<c:if test="${not empty error}">
    <h2 class="error">Wrong log or password</h2>
</c:if>
<div class="login-page">
    <div class="form">
        <h1>Log in</h1>
        <form class="login-form" action="/login/process" method="post">
            <input type="text" name="login" placeholder="Login" path="login"/>
            <input type="password" name="password" placeholder="Password" path="password"/>
            <button type="submit">Log in</button>
            <h6><a href="/registration">Registration</a></h6>
            <h6><a href="/">Main</a></h6>
        </form>
    </div>
</div>
</body>
</html>
