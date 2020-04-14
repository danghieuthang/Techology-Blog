<%-- 
    Document   : update_detail
    Created on : Jan 9, 2020, 10:48:45 PM
    Author     : dhtha
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.ARTICLE.title}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css"/>
    </head>
    <body>
        <c:if test="${empty requestScope.ARTICLE}">
            <c:redirect url="MainController">
                <c:param name="action" value="Home"></c:param>
            </c:redirect>
        </c:if>
        <c:if test="${sessionScope.ACCOUNT.role != 'admin'}">
            <c:redirect url="MainController">
                <c:param name="action" value="Home"></c:param>
            </c:redirect>
        </c:if>
        <%@include file="header.jsp" %>
        <div class="container" style="margin-top:30px">
            <c:if test="${requestScope.UPDATE_STATUS eq 1}">
                <h3 class="text-success text-center">${requestScope.STATUS} success</h3>
            </c:if>
            <c:if test="${requestScope.UPDATE_STATUS eq 0}">
                <h3 class="text-success text-center">${requestScope.STATUS} fail!</h3>
            </c:if>
            <h1>${requestScope.ARTICLE.title}</h1>
            <h3 class="bg-light">${requestScope.ARTICLE.author.name} <small><i>Posted on ${requestScope.ARTICLE.postingDate}</i></small></h3>
            <p>${requestScope.ARTICLE.content}</p>
            <div class="text-center">
                <form action="MainController" method="POST">
                    <input type="hidden" name="articleID" value="${requestScope.ARTICLE.id}"/>
                    <input type="hidden" name="action" value="Update Article"/>
                    <c:if test="${requestScope.ARTICLE.status eq 'Active'}">
                        <input type="submit" name="status" value="Approval" class="btn btn-success" disabled=""/>
                        <input type="submit" name="status" value="Deleted" class="btn btn-danger"/>
                    </c:if>
                    <c:if test="${requestScope.ARTICLE.status eq 'New'}">
                        <input type="submit" name="status" value="Approval" class="btn btn-success"/>
                        <input type="submit" name="status" value="Deleted" class="btn btn-danger"/>
                    </c:if>
                    <c:if test="${requestScope.ARTICLE.status eq 'Deleted'}">
                        <input type="submit" name="status" value="Approval" class="btn btn-success" disabled=""/>
                        <input type="submit" name="status" value="Restore" class="btn btn-success"/>
                        <input type="submit" name="status" value="Deleted" class="btn btn-danger" disabled=""/>
                    </c:if>
                </form>

            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
