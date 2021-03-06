<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <style>
        <%@include file='css/registration.css' %>
    </style>
</head>
<body>
<div class="login-page">
    <div class="form">

        <h1>Registration</h1>

        <sf:form action="/registration" method="post" modelAttribute="userform" cssClass="login-form">
            <sf:input path="username" id="inputUsername"
                      placeholder="Login"/>
            <div class="error"><i>${error}</i>
                <sf:errors path="username"/>
            </div>

                <sf:input path="email" id="inputEmail" placeholder="Email"/>
                <div class="error">
                    <sf:errors path="email"/>
                </div>

                    <sf:password path="password" id="inputPassword"
                                 placeholder="password"/>
                    <div class="error">
                        <sf:errors path="password"/>
                    </div>


                        <sf:password path="repassword" id="inputRepassword"
                                     placeholder="password retry"/>
                        <div class="error">
                            <sf:errors path="repassword"/>
                        </div>
            <button type="submit" class="btn btn-primary">Registration</button>
        </sf:form>
    </div>
</div>
</body>
</html>
