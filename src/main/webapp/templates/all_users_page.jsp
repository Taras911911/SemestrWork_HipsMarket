<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        <%@include file='css/ad.css' %>
    </style>
</head>
<body>
<h1>Users</h1>
<table class="table table-bordered">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Activated</th>
        <th></th>
        <th></th>
        <th></th>
        <th><a class="btn btn-success" href="/admin/main">Admin</a></th>
    </tr>
    </thead>

    <core:forEach var="user" items="${users}">
        <tbody>
        <tr>
            <sf:form method="post" modelAttribute="user_modify_form">
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td><core:if test="${user.is_confirm == false}">User not activated</core:if>
                    <core:if test="${user.is_confirm == true}">User activated</core:if></td>
                <td><sf:select path="role">
                    <sf:option value="ROLE_ADMIN">Admin</sf:option>
                    <sf:option value="ROLE_USER">User</sf:option>
                    <sf:option value="ROLE_ANONIM">Anonim</sf:option>
                </sf:select></td>

                <td><sf:select path="is_confirm">
                    <sf:option value="true">Actibated</sf:option>
                    <sf:option value="false">No activated</sf:option>
                </sf:select></td>
                <td>
                    <sf:button value="${user.id}" name="user_id" class="btn btn-primary">Update</sf:button>
                </td>
                <td><a class="btn btn-danger" href="/admin/user/delete?id=${user.id}">Delete</a></td>

            </sf:form>
        </tr>
        </tbody>
    </core:forEach>
</table>
</body>
</html>
