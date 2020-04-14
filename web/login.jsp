<%-- 
    Document   : login
    Created on : Jan 7, 2020, 3:39:40 PM
    Author     : dhtha
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css"/>

    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class="container" style="margin-top: 100px" >
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="MainController" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="email" class="text-info">Email:</label><br>
                                <input type="email" name="email" id="username" class="form-control" required="" value="${requestScope.EMAIL}">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" id="password" class="form-control" required="">
                            </div>
                            <div class="form-group">
                                <input type="submit" name="action" class="btn btn-info btn-md" value="Login">

                            </div>
                            <div class="bg-danger">
                                ${requestScope.MESSAGE}
                            </div>
                        </form>

                        <div id="register-link" class="text-right">
                            <c:url var="registerPage"  value="MainController">
                                <c:param name="action" value="Registration Page"></c:param>
                            </c:url>
                            <a href="${registerPage}" class="text-info">Register here</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>