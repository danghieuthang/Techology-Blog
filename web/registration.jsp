<%-- 
    Document   : registration
    Created on : Jan 7, 2020, 2:38:11 PM
    Author     : dhtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
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
                            <h3 class="text-center text-info">Registration</h3>
                            <div class="form-group">
                                <label for="email" class="text-info">Email:</label><br>
                                <input type="email" name="email"  class="form-control" required="" value="${requestScope.ACCOUNT.email}">
                                <div class="bg-danger">
                                    ${requestScope.EMAIL_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name" class="text-info">Name:</label><br>
                                <input type="text" name="name"  class="form-control" required="" value="${requestScope.ACCOUNT.name}">
                                <div class="bg-danger">
                                    ${requestScope.NAME_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password"  class="form-control" required="">
                                <div class="bg-danger">
                                    ${requestScope.PASSWORD_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="rePassword" class="text-info">RePassword:</label><br>
                                <input type="password" name="rePassword"  class="form-control" required="">
                                <div class="bg-danger">
                                    ${requestScope.REPASSWORD_ERROR}
                                </div>
                            </div>
                            <div  class="text-center">
                                <div class="form-group">
                                    <button type="submit" name="action" value="Registration" class="btn btn-info btn-md">Registration</button>
                                </div>
                            </div>
                            <div class="bg-danger">
                                ${requestScope.MESSAGE}
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</body>
</html>
