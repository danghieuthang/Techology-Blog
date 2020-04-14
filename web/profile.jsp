<%-- 
    Document   : profile
    Created on : Jan 13, 2020, 9:57:31 PM
    Author     : dhtha
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css"/>
        <style>
            .article{
                padding-bottom: 10px;
            }
            .articleTitle{
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <c:if test="${sessionScope.ACCOUNT==null}">
                <c:redirect url="${homePage}"></c:redirect>
            </c:if>
            <div class="module justify-content-center">
                <div class="module-inner">
                    <div class="content-panel">
                        <h2 class="title text-center">${sessionScope.ACCOUNT.name} Profile</h2>
                        <form class="form-horizontal" action="MainController" method="POST">
                            <fieldset class="fieldset">
                                <h3 class="text-center text-danger">${requestScope.UPDATEMESSAGE}</h3>
                                <div class="form-group avatar">
                                    <figure class="figure col-md-2 col-sm-3 col-xs-12">
                                        <img class="img-rounded img-responsive" src="img/avatar.png" alt="" style="width: 80px;">
                                    </figure>                
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-3 col-xs-12 control-label">Email</label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input type="email" class="form-control" name="email" value="${sessionScope.ACCOUNT.email}" readonly="">

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-3 col-xs-12 control-label">Name</label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input type="text" class="form-control" name="name" value="${sessionScope.ACCOUNT.name}" required="">
                                        <div class="bg-danger">
                                            ${requestScope.NAME_ERROR}
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-3 col-xs-12 control-label">Password</label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input type="password" class="form-control" name="password" value="" required="">
                                        <div class="bg-danger">
                                            ${requestScope.PASSWORD_ERROR}
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-3 col-xs-12 control-label">RePassword</label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input type="password" class="form-control" name="rePassword" value="" required="">
                                        <div class="bg-danger">
                                            ${requestScope.REPASSWORD_ERROR}
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <hr>
                            <div class="form-group text-center">
                                <div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
                                    <input class="btn btn-primary" type="submit" name="action" value="Update Profile">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
