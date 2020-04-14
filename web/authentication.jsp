<%-- 
    Document   : authentication
    Created on : Jan 12, 2020, 12:49:32 AM
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
        <title>Authentication Page</title>
        <<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css"/>
        <style>
            body{
                background-color: window;
            }
        </style>
    </head>

    <body>
        <div class="container" style="margin-top: 100px" >
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="MainController" method="post">
                            <h3 class="text-center text-info">Authentication</h3>
                            <h6>Please enter code that was received in email</h6>
                            <div class="form-group">
                                <label for="code" class="text-info">Code: </label><br>
                                <input type="number" name="code" id="code" class="form-control" >
                            </div>
                            <input type="hidden" name="email" value="${requestScope.EMAIL}"/>
                            <input type="hidden" name="action" value="Authentication"/>
                            <input type="submit" name="signal" value="Resend code" class="btn btn-primary"/>
                            <input type="submit" name="signal" value="Verify" class="btn btn-primary"/>
                            <div class="bg-success">
                                ${requestScope.MESSAGE}
                            </div>
                        </form>
                        <div id="register-link" class="text-right">
                            <c:url var="homeLink"  value="MainController">
                                <c:param name="action" value="Home"></c:param>
                            </c:url>
                            <a href="${homeLink}" class="text-info">Go Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>