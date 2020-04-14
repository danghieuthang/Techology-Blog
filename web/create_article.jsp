<%-- 
    Document   : create_article
    Created on : Jan 9, 2020, 1:04:43 AM
    Author     : dhtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Article</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css"/>
    </head>
    <body>
        <c:if test="${empty sessionScope.ACCOUNT}">
            <c:redirect url="MainController">
                <c:param name="action" value="Login"></c:param>
            </c:redirect>
        </c:if>

        <%@include file="header.jsp" %>
        <div class="container">
            <c:if test="${sessionScope.ACCOUNT.role != 'member'}">
                <h1 class="text-danger text-center"> Only member can't create article. You are not permit!</h1>
            </c:if>

            <h1 class="text-center text-info">Create Article</h1>
            <form action="MainController" method="GET">
                <div class="form-group">
                    <label>Title</label>
                    <input class="form-control" type="text" name="title" required="" value="${requestScope.ARTICLE.title}"/>
                    <h3 class="text-danger">${requestScope.TITLE_ERROR}</h3>
                    <label>Short Description</label>
                    <textarea class="form-control" name="shortDescription" required="" rows="3">${requestScope.ARTICLE.shortDescription}</textarea>
                    <h3 class="text-danger">${requestScope.SHORT_DESCRIPTION_ERROR}</h3>
                    <label>Content</label>
                    <textarea class="form-control" name="content" required="" rows="7">${requestScope.ARTICLE.content}</textarea>
                    <h3 class="text-danger">${requestScope.CONTENT_ERROR}</h3>
                </div>
                <div class="text-center">
                    <c:if test="${sessionScope.ACCOUNT.role != 'member'}">
                        <button class="btn btn-primary" type="submit" name="action" value="Create Article" disabled="">Create Article</button>
                    </c:if>
                    <c:if test="${sessionScope.ACCOUNT.role == 'member'}">
                        <button class="btn btn-primary" type="submit" name="action" value="Create Article">Create Article</button>
                    </c:if>
                </div>
            </form>

            <c:if test="${requestScope.RESULT == 1}">
                <h3 class="text-success text-center">Create Article success! Please wait admin accept</h3>
            </c:if>
            <c:if test="${requestScope.RESULT == 0}">
                <h3 class="text-danger text-center">Create article fail!</h3>
            </c:if>
            <h3 class="text-danger"></h3>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
