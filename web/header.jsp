<%-- 
    Document   : header
    Created on : Jan 7, 2020, 2:26:42 PM
    Author     : dhtha
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="jumbotron text-center" style="margin-bottom:0;  background-image: url('img/background.jpg'); background-repeat: no-repeat; background-size: cover;">
    <h1 class="title">Technology Blog</h1>
    <p class="contentTitle">The source for Technology</p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container">
        <c:url var="homePage" value="MainController">
            <c:param name="action" value="Home"></c:param>
        </c:url>
        <a class="navbar-brand" href="${homePage}"><img src="img/icon.png" style="width: 40px;" class="rounded-circle"/></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse navbar-dark" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <c:url var="profilePage" value="MainController">
                    <c:param name="action" value="Profile"></c:param>
                </c:url>

                <li class="nav-item">
                    <a class="nav-link" href="${homePage}">Home</a>
                </li>
                <c:url var="createArticlePage" value="MainController">
                    <c:param name="action" value="Article Page"></c:param>
                </c:url>
                <li class="nav-item">
                    <a class="nav-link" href="${createArticlePage}">Create Article</a>
                </li>
                <c:url var="myArticlePage" value="MainController">
                    <c:param name="action" value="My Article"></c:param>
                </c:url>
                <li class="nav-item">
                    <a class="nav-link" href="${myArticlePage}">My Article</a>
                </li>
                <c:if test="${sessionScope.ACCOUNT.role == 'admin'}">
                    <c:url var="processPage" value="MainController">
                        <c:param name="action" value="Process Page"></c:param>
                        <c:param name="articleStatus" value="Active"></c:param>
                    </c:url>
                    <li class="nav-item">
                        <a class="nav-link" href="${processPage}">Process</a>
                    </li>
                </c:if>
                <c:url var="loginPage" value="MainController">
                    <c:param name="action" value="Login Page"></c:param>
                </c:url>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <c:if test="${sessionScope.ACCOUNT == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="${loginPage}">Login</a>
                    </li>  
                </c:if>
                <c:if test="${sessionScope.ACCOUNT != null}">
                    <li class="nav-item">
                        <a class="nav-link dissable" href="${profilePage}">Welcome ${sessionScope.ACCOUNT.name}</a>
                    </li>  
                </c:if>
                <c:url var="logout" value="MainController">
                    <c:param name="action" value="Logout"></c:param>
                </c:url>
                <c:if test="${sessionScope.ACCOUNT != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="${logout}">Logout</a>
                    </li>  
                </c:if>
            </ul>
        </div>  
    </div>
</nav>
