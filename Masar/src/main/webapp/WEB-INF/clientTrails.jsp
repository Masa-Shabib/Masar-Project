<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Trails</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<div class="row my-5">
<div class= "col-10">


<table class="table table-bordered text-center">
                <thead>
                    <tr>
                        <th scope="col" class="col-6">Trail Name</th>
                        <th scope="col" class="col-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="trail" items="${allBusinessTrails}">
                        <tr>
                            <td>
                                <a href="/trails/${trail.id}"><c:out value="${trail.name}" /></a>
                            </td>
                           
                            <td class="d-flex justify-content-around">
                                <a href="/trails/${trail.id}/edit" class="btn  btn-warning">Edit</a>
                                <form:form action="/trails/${trail.id}/delete" method="post">
                                <input type="hidden" name="_method" value="delete">
                                <button type="submit" class="btn btn-sm btn-danger">Delete
                                </button>
                                </form:form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
            </div>
            </div>
</body>
</html>