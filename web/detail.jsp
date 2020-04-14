<%-- 
    Document   : detail
    Created on : Jan 7, 2020, 10:01:33 PM
    Author     : dhtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <c:if test="${empty requestScope.ARTICLE}">
            <c:redirect url="MainController">
                <c:param name="action" value="Home"></c:param>
            </c:redirect>
        </c:if>
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
        <%@include file="header.jsp" %>
        <div class="container" style="margin-top:30px">
            <h3 class="text-center text-info">${requestScope.MESSAGE}</h3>
            <div class="row">

                <div class="col-sm-8">
                    <h1>${requestScope.ARTICLE.title}</h1>
                    <h3 class="bg-light">${requestScope.ARTICLE.author.name} <small><i>Posted on ${requestScope.ARTICLE.postingDate}</i></small></h3>
                    <p>${requestScope.ARTICLE.content}</p>
                    <h1 class="text-center"><b>Comment</b></h1>
                    <h6>Leave a Reply</h6>

                    <form action="MainController" method="POST">
                        <textarea required="" name="message"  placeholder="Enter your comment here..." style="overflow: hidden; width: 100%;">${requestScope.COMMENT_POST}</textarea>
                        <input type="hidden" name="id" value="${requestScope.ARTICLE.id}"/>
                        <div class="text-right">
                            <input type="submit" class="btn btn-dark" name="action" value="Comment" />
                        </div>
                    </form>
                  
                    <c:if test="${not empty requestScope.LIST_COMMENT}">
                        <c:forEach var="comment" items="${requestScope.LIST_COMMENT}">
                            <div class="media border p-3">
                                <img src="img/avatar.png" alt="" class="mr-3 rounded-circle" style="width: 60px;">
                                <div class="media-body">
                                    <h4>${comment.author.name} <small><i>Posted on ${comment.postingDate}</i></small></h4>
                                    <p>${comment.message}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <div class="col-sm-4">
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
