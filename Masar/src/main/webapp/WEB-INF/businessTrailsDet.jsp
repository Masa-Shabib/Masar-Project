<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trail Business Details</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container ">

				<div class="row my-5 mb-1">
			<div class="col-6 ">
				<div class="row mb-5">
					<div class="col">
						<h4>Trail Name: ${businessTrail.name}</h4>
					</div>
					</div>
					</div>
					
					<div class="col ">
						<a class="btn btn-primary" href="/client/businessTrails">Back</a>
					</div>
				</div>
					<div class="row my-5 mt-2 ">
				<div class= "col-5 ">
				<table class="table table-bordered text-center">
	                <thead>
	                    <tr>
	                        <th scope="col" class="col-4">Joined Guests</th>
	                        
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:forEach var="joinedUser" items="${joinedUsers}">
	                        <tr>
	                            <td>
	                                <c:out value="${joinedUser.username}"></c:out> />
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