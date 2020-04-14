<%-- 
    Document   : my_article.jsp
    Created on : Jan 17, 2020, 12:56:51 PM
    Author     : dhtha
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Article</title>
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
        <c:if test="${sessionScope.ACCOUNT.role != 'member'}">
            <c:redirect url="${loginPage}"></c:redirect>
        </c:if>
        <div class="container">
            <c:if test="${not empty requestScope.LIST}">
                <c:forEach var="article" items="${requestScope.LIST}">
                    <tr>
                        <td>
                            <div>
                                <c:url var="detailPage" value="MainController" >
                                    <c:param name="action" value="Detail"></c:param>
                                    <c:param name="id" value="${article.id}"></c:param>
                                </c:url>
                                <div class="">
                                    <div onclick="var a = '${detailPage}';
                                            window.location.href = a;" class="articleTitle">
                                        <h2 onclick="" class="text-info">${article.title}</h2>
                                    </div>
                                    <p>${article.shortDescription}</p>
                                </div>
                            </div>
                        </td>
                        <td><h5>Posting Date:  ${article.postingDate}</h5></td>  
                        <c:if test="${article.status eq 'Active'}">
                            <td><h3 class="text-success">Status:  ${article.status}</h3></td>
                        </c:if>
                        <c:if test="${article.status eq 'Deleted'}">
                            <td><h3 class="text-danger">Status:  ${article.status}</h3></td>
                        </c:if>
                        <c:if test="${article.status eq 'New'}">
                            <td><h3 class="text-primary">Status:  ${article.status}</h3></td>
                        </c:if>
                    <div class="border"></div>
                    </tr>
                </c:forEach>
            </c:if>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
