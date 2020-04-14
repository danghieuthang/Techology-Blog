<%-- 
    Document   : Index
    Created on : Jan 7, 2020, 2:17:23 PM
    Author     : dhtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simple Blog</title>
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
        <div class="container" style="margin-top:30px">
            <div class="text-center text-info"> 
                <h3>${requestScope.MESSAGE}</h3>
            </div>
            <div class="row">
                <div class="col-sm-10">
                    <h1>${requestScope.NAME}</h1>
                    <c:if test="${requestScope.LIST == null}">
                        <c:redirect url="MainController">
                            <c:param name="action" value="Search"></c:param>
                        </c:redirect>
                    </c:if> 
                    <c:if test="${empty requestScope.LIST}">
                        <h1 class="text-primary">Not found!</h1>
                    </c:if>

                    <c:if test="${not empty requestScope.LIST}">
                        <c:forEach var="article" items="${requestScope.LIST}" varStatus="index">
                            <%--
                            <c:set var="begin" value="${(requestScope.PAGE-1)*5}"></c:set>
                            <c:set var="end" value="${(requestScope.PAGE)*5}"></c:set>
                            <c:set var="no" value="${index.count}"></c:set>
                            <c:if test="${no>begin && no <=end}">
                                <c:url var="detailPage" value="MainController" >
                                    <c:param name="action" value="Detail"></c:param>
                                    <c:param name="id" value="${article.id}"></c:param>
                                </c:url>
                                <div class="article">
                                    <div onclick="var a = '${detailPage}';
                                            window.location.href = a;" class="articleTitle">
                                        <h2 onclick="">${article.title}</h2>
                                    </div>
                                    <h3 class="bg-secondary">${article.author} <small><i>Posted on ${article.postingDate}</i></small></h3>
                                    <p>${article.shortDescription}</p>
                                    <a href="${detailPage}">Read more...</a>
                                </div> 
                            </c:if> --%>

                            <c:url var="detailPage" value="MainController" >
                                <c:param name="action" value="Detail"></c:param>
                                <c:param name="id" value="${article.id}"></c:param>
                            </c:url>
                            <div class="article">
                                <div onclick="var a = '${detailPage}';
                                        window.location.href = a;" class="articleTitle">
                                    <h2 onclick="">${article.title}</h2>
                                </div>
                                <h3 class="bg-secondary">${article.author.name} <small><i>Posted on ${article.postingDate}</i></small></h3>
                                <p>${article.shortDescription}</p>
                                <a href="${detailPage}">Read more...</a>
                            </div> 
                        </c:forEach>
                        <%--
                        <c:set var="list" value="${requestScope.LIST}"></c:set>
                        <c:set var="sizeList" value="${fn:length(list) / 5}"></c:set>
                        <c:if test="${sizeList % 1 != 0}">
                            <c:set var="sizeList" value="${sizeList+1}"></c:set>
                        </c:if>
                        <ul class="pagination justify-content-center">
                            <c:forEach var="i" begin="1" end="${sizeList}">
                                <c:url var="pageLink" value="MainController">
                                    <c:param name="action" value="Search"></c:param>
                                    <c:param name="page" value="${i}"></c:param>
                                    <c:param name="SearchValue" value="${requestScope.SEARCH_VALUE}"></c:param>
                                </c:url>
                                <li class="page-item"><a class="page-link" href="${pageLink}">${i}</a></li>
                                </c:forEach>
                        </ul>  
                        --%>
                        <ul class="pagination justify-content-center">
                            <c:forEach var="i" begin="1" end="${requestScope.LIST_PAGE}">
                                <c:url var="pageLink" value="MainController">
                                    <c:param name="action" value="Search"></c:param>
                                    <c:param name="page" value="${i}"></c:param>
                                    <c:param name="SearchValue" value="${requestScope.SEARCH_VALUE}"></c:param>
                                </c:url>
                                <c:if test="${requestScope.PAGE == i}">
                                    <li class="page-item active">
                                        <a class="page-link" href="${pageLink}">${i}</a>
                                    </li>
                                </c:if>
                                <c:if test="${requestScope.PAGE != i}">
                                    <li class="page-item">
                                        <a class="page-link" href="${pageLink}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>  
                    </c:if>

                </div>
                <div class="col-sm-2">
                    <form action="MainController" class="form-inline">
                        <input type="text" value="${requestScope.SEARCH_VALUE}" name="SearchValue" placeholder="Enter text you want to search..." class="form-control mb-2 mr-sm-2"/>
                        <input type="submit" name="action" value="Search" class="btn btn-primary md-2"/>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script type="text/javascript">
            function disableF5(e) {
                var a = '${requestScope.MESSAGE eq 'Hello to Technology Blog'}';


            }
        </script>
    </body>
</html>
