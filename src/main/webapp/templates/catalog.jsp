<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Catalog</title>
    <link data-require="bootstrap@3.2.0" data-semver="3.2.0" rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.css"/>
    <script data-require="bootstrap@3.2.0" data-semver="3.2.0"
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.js"></script>
    <script data-require="jquery@2.1.1" data-semver="2.1.1"
            src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://bootstrap-ru.com/204/assets/js/bootstrap-tab.js"></script>
    <script src="http://bootstrap-ru.com/204/assets/js/bootstrap-dropdown.js"></script>
    <style>
        <%@include file='css/ad.css' %>
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">HipsterShop</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/">Main</a></li>
            <li><a href="/basket/">Basket</a></li>
            <li><a href="/orders/">Orders</a></li>
        </ul>
        <form class="navbar-form navbar-right" action="/product/all">
            <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="search">
            </div>
            <span class="btn-form-group">
                <button type="submit" class="btn btn-primary">Search</button>
            </span>
        </form>
        <ul class="nav navbar-nav navbar-right">
            <security:authorize access="isAnonymous()">
                <li><a href="/registration">Registation</a></li>
                <li><a href="/login">Log in</a></li>
            </security:authorize>
            <li><a href="/logout">Log out</a></li>
        </ul>
    </div>
</nav>
<i>${error}</i>
<div class="container-fluid">
    <div class="nav navbar-nav">
        <ul class="nav nav-tabs nav-justified">
            <li><a class="link-content" href="#Все" data-toggle="tab">All products</a></li>
            <li><a class="link-content" href="#Head" data-toggle="tab">Head</a></li>
            <li><a class="link-content" href="#Shoes" data-toggle="tab">Shoes</a></li>
            <li><a class="link-content" href="#Body" data-toggle="tab">Body</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="Все">
                <div class="text-content"><h1 class="text-content">All products</h1></div>
                <div>
                    <table class="table table-condensed table table-bordered">
                        <core:forEach var="stocktak" items="${stocktaking}">
                            <tr>
                                <td class="text-content"> <img src="${stocktak.product.img}" alt="No image"> </td>

                                <td class="text-content"><a class="product"
                                                            href="/product/?id=${stocktak.product.id}">${stocktak.product.name}</a>
                                    <h5>${stocktak.product.description}</h5></td>
                                <td class="text-content"><a class="link-content" href="#${stocktak.product.type}"
                                                            data-toggle="tab">${stocktak.product.type}</a></td>
                                <td class="text-content">${stocktak.product.price} р/sub</td>
                                <td class="text-content">city. ${stocktak.stock.city}, str. ${stocktak.stock.street}</td>
                                <td class="text-content">
                                    <core:if test="${stocktak.quantity == 0}">  Not available</core:if>
                                    <core:if test="${stocktak.quantity != 0}">  ${stocktak.quantity} sub</core:if></td>
                                <sf:form method="post" action="/product/buy" modelAttribute="product_form">
                                    <td>
                                        <button class="btn btn-warning" <core:if test="${stocktak.quantity == 0}">disabled</core:if> value="${stocktak.product.id}" type="submit"
                                                name="product_id" id="button_add_${stocktak.product.id}">Buy
                                        </button>
                                    </td>
                                </sf:form>
                            </tr>
                        </core:forEach>
                    </table>
                </div>
            </div>

            <div class="tab-pane fade" id="Head">
                <div class="text-content"><h1>Head</h1></div>
                <div>
                    <table class="table table-condensed table table-bordered">
                        <core:forEach var="stocktak" items="${stocktaking}">
                            <core:set var="type_p" value="Head"/>
                            <core:if test="${stocktak.product.type == type_p}">
                                <tr>
                                    <td class="text-content"> <img src="${stocktak.product.img}" alt="No image"> </td> </td>
                                    <td class="text-content"><a class="product"
                                                                href="/product/?id=${stocktak.product.id}">${stocktak.product.name}</a>
                                        <h5>${stocktak.product.description}</h5></td>
                                    <td class="text-content"><a class="link-content" href="#${stocktak.product.type}"
                                                                data-toggle="tab">${stocktak.product.type}</a></td>
                                    <td class="text-content">${stocktak.product.price} р/sub</td>
                                    <td class="text-content">city. ${stocktak.stock.city}, str. ${stocktak.stock.street}</td>
                                    <td class="text-content"><core:if test="${stocktak.quantity == 0}">  Not available</core:if>
                                        <core:if test="${stocktak.quantity != 0}">  ${stocktak.quantity} sub</core:if></td>
                                    <sf:form method="post" action="/product/buy" modelAttribute="product_form">
                                        <td>
                                            <button class="btn btn-warning" <core:if test="${stocktak.quantity == 0}">disabled</core:if> value="${stocktak.product.id}" type="submit"
                                                    name="product_id" id="button_add_${stocktak.product.id}">Buy
                                            </button>
                                        </td>
                                    </sf:form>
                                </tr>
                            </core:if>
                        </core:forEach>
                    </table>
                </div>
            </div>

            <div class="tab-pane fade" id="Shoes">
                <div class="text-content"><h1>Shoes</h1></div>
                <div>
                    <table class="table table-condensed table table-bordered">
                        <core:forEach var="stocktak" items="${stocktaking}">
                            <core:set var="type_p" value="Shoes"/>
                            <core:if test="${stocktak.product.type == type_p}">
                                <tr>
                                    <td class="text-content"> <img src="${stocktak.product.img}" alt="No image"> </td> </td>
                                    <td class="text-content"><a class="product"
                                                                href="/product/?id=${stocktak.product.id}">${stocktak.product.name}</a>
                                        <h5>${stocktak.product.description}</h5></td>
                                    <td class="text-content"><a class="link-content" href="#${stocktak.product.type}"
                                                                data-toggle="tab">${stocktak.product.type}</a></td>
                                    <td class="text-content">${stocktak.product.price} p/sub</td>
                                    <td class="text-content">city. ${stocktak.stock.city}, str. ${stocktak.stock.street}</td>
                                    <td class="text-content"><core:if test="${stocktak.quantity == 0}">  Not available</core:if>
                                        <core:if test="${stocktak.quantity != 0}">  ${stocktak.quantity} sub</core:if></td>
                                    <sf:form method="post" action="/product/buy" modelAttribute="product_form">
                                        <td>
                                            <button class="btn btn-warning" <core:if test="${stocktak.quantity == 0}">disabled</core:if> value="${stocktak.product.id}" type="submit"
                                                    name="product_id" id="button_add_${stocktak.product.id}">Buy
                                            </button>
                                        </td>
                                    </sf:form>
                                </tr>
                            </core:if>
                        </core:forEach>
                    </table>
                </div>
            </div>
            <div class="tab-pane fade" id="Body">
                <div class="text-content"><h1>Body</h1></div>
                <div>
                    <table class="table table-condensed table table-bordered">
                        <core:forEach var="stocktak" items="${stocktaking}">
                            <core:set var="type_p" value="Body"/>
                            <core:if test="${stocktak.product.type == type_p}">
                                <tr>
                                    <td class="text-content"> <img src="${stocktak.product.img}" alt="No image"> </td> </td>
                                    <td class="text-content"><a class="product"
                                                                href="/product/?id=${stocktak.product.id}">${stocktak.product.name}</a>
                                        <h5>${stocktak.product.description}</h5></td>
                                    <td class="text-content"><a class="link-content" href="#${stocktak.product.type}"
                                                                data-toggle="tab">${stocktak.product.type}</a></td>
                                    <td class="text-content">${stocktak.product.price} p/sub</td>
                                    <td class="text-content">city. ${stocktak.stock.city}, str. ${stocktak.stock.street}</td>
                                    <td class="text-content"><core:if test="${stocktak.quantity == 0}">  Not available</core:if>
                                        <core:if test="${stocktak.quantity != 0}">  ${stocktak.quantity} шт</core:if></td>
                                    <sf:form method="post" action="/product/buy" modelAttribute="product_form">
                                        <td>
                                            <button class="btn btn-warning" <core:if test="${stocktak.quantity == 0}">disabled</core:if> value="${stocktak.product.id}" type="submit"
                                                    name="product_id" id="button_add_${stocktak.product.id}">Buy
                                            </button>
                                        </td>
                                    </sf:form>
                                </tr>
                            </core:if>
                        </core:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
