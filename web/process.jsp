<%-- 
    Document   : process
    Created on : Jan 8, 2020, 11:21:48 PM
    Author     : dhtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Blog</title>
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
        <c:if test="${sessionScope.ACCOUNT.role != 'admin'}">
            <c:redirect url="MainController">
                <c:param name="action" value="Home"></c:param>
            </c:redirect>
        </c:if>
        <%@include file="header.jsp" %>
        <div class="container" style="margin-top:30px">
            <form action="MainController" class="form-group">
                <label>Status: </label>
                <select name="articleStatus">
                    <c:if test="${empty requestScope.STATUS}">
                        <option value="New">New</option>
                        <option value="Deleted">Deleted</option>
                        <option value="Active" selected="">Active</option>
                    </c:if>
                    <c:if test="${requestScope.STATUS eq 'New'}">
                        <option value="New" selected="">New</option>
                        <option value="Deleted">Deleted</option>
                        <option value="Active">Active</option>
                    </c:if>
                    <c:if test="${requestScope.STATUS eq 'Deleted'}">
                        <option value="New">New</option>
                        <option value="Deleted" selected="">Deleted</option>
                        <option value="Active">Active</option>
                    </c:if>
                    <c:if test="${requestScope.STATUS eq 'Active'}">
                        <option value="New">New</option>
                        <option value="Deleted">Deleted</option>
                        <option value="Active" selected="">Active</option>
                    </c:if>
                </select>
                <br><label>Title: </label>
                <input type="text" value="${requestScope.TITLE}" name="title" placeholder="Enter title you want to search..." class="form-control" style="width: 50%;"/>
                <label>Content: </label>
                <input type="text" value="${requestScope.SEARCH_VALUE}" name="SearchValue" placeholder="Enter text you want to search..." class="form-control" style="width: 50%;"/>
                <input type="submit" name="action" value="Search" class="btn btn-primary md-2"/>
            </form>

            <div class="text-center">
                <c:if test="${not empty requestScope.MESSAGE_ERROR}">
                    <h3 class="text-danger">Some error meet in article: ${requestScope.MESSAGE}</h3>
                </c:if>
                <c:if test="${requestScope.SUCCESS_STATUS == 1}">
                    <h3 class="text-success">Update status success</h3>
                </c:if>
                <c:if test="${empty requestScope.LIST && not empty requestScope.STATUS}">
                    <h1 class="text-primary">Not found!</h1>
                </c:if>
            </div>

            <c:if test="${not empty requestScope.LIST}">
                <table  class="table" >
                    <thead class="thead-dark">
                        <tr >
                            <th class="col-6">
                                <div><h4>Article</h4></div>
                            </th>
                            <th class="col-2"><h4>Author</h4></th>
                            <th class="col-2"><h4>Time</h4></th>
                            <th class="col-2">
                                <div>
                                    <h4>Choose</h4>
                                </div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="MainController" method="POST">
                        <c:if test="${not empty requestScope.LIST}">
                            <div class="text-center">
                                <input type="hidden" name="articleStatus" value="${requestScope.STATUS}"/>
                                <c:if test="${requestScope.STATUS eq 'Active'}">
                                    <input type="submit" name="action" value="Approval" class="btn btn-success" disabled=""/>
                                    <input type="submit" name="action" value="Deleted" class="btn btn-danger"/>
                                </c:if>
                                <c:if test="${requestScope.STATUS eq 'New'}">
                                    <input type="submit" name="action" value="Approval" class="btn btn-success"/>
                                    <input type="submit" name="action" value="Deleted" class="btn btn-danger"/>
                                </c:if>
                                <c:if test="${requestScope.STATUS eq 'Deleted'}">
                                    <input type="submit" name="action" value="Approval" class="btn btn-success" disabled=""/>
                                    <input type="submit" name="action" value="Restore" class="btn btn-success"/>
                                    <input type="submit" name="action" value="Deleted" class="btn btn-danger" disabled=""/>

                                </c:if>
                            </div>
                            <c:forEach var="article" items="${requestScope.LIST}">
                                <tr>
                                    <td>
                                        <div>
                                            <c:url var="detailPage" value="MainController" >
                                                <c:param name="action" value="View Article"></c:param>
                                                <c:param name="id" value="${article.id}"></c:param>
                                            </c:url>
                                            <div class="">
                                                <div onclick="var a = '${detailPage}';
                                                        window.location.href = a;" class="articleTitle">
                                                    <h2 onclick="">${article.title}</h2>
                                                </div>
                                                <p>${article.shortDescription}</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>${article.author.name}</td>
                                    <td>${article.postingDate}</td>
                                    <td>
                                        <input type="checkbox" name="articles" value="${article.id}" class=""/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </form>
                    </tbody>
                </table>
                <ul class="pagination justify-content-center">
                    <c:forEach var="i" begin="1" end="${requestScope.LIST_PAGE}">
                        <c:url var="pageLink" value="MainController">
                            <c:param name="action" value="Search"></c:param>
                            <c:param name="page" value="${i}"></c:param>
                            <c:param name="articleStatus" value="${requestScope.STATUS}"></c:param>
                            <c:param name="SearchValue" value="${requestScope.SEARCH_VALUE}"></c:param>
                            <c:param name="title" value="${requestScope.TITLE}"></c:param>
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
        <%@include file="footer.jsp" %>
    </body>
</html>
