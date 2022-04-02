<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${businessTrail.name} Details</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light p-2">
        <div class="container-fluid">
            <a class="navbar-brand me-5" href="/masar"><img
                    src="https://i.ibb.co/L9TyH4d/masar.png"
                    alt="logo" style="width: 200px; height: 60px;"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/"
                            style=" font-size: 20px;">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/masar/trails" style="font-size: 20px;">Trails</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/masar/businessTrails" style="font-size: 20px;">Business Trails</a>
                    </li>
                    
						<c:set var="user2" value="2"/>
						<c:set var="user3" value="3"/>
							         <li class="nav-item">
				                        <a class="nav-link" href="/client/businessTrails/new" style="font-size: 20px;">Add Trail</a>
				                    </li>
				                    <li class="nav-item">
				                        <a class="nav-link" href="/client/businessTrails" style="font-size: 20px;">Your Trails</a>
				                    </li>

							 <li class="nav-item">
				                 <form id="logoutForm" method="POST" action="/logout">
								        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								        <input type="submit" value="Logout!"  class="btn btn-outline-secondary "/>
								    </form>
				              </li>
		                </ul>
		            </div>
		        </div>
		    </nav>
<div class="container "  style="height:75vh">

				<div class="row my-5 mb-1">
			<div class="col-6 ">
				<div class="row mb-5">
					<div class="col">
						<h4>Trail Name: ${businessTrail.name}</h4>
						<p>${businessTrail.description}</p>
						<p>Number of joined hikers: ${joinedUsers.size()} </p>
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
	                        <th scope="col" class="col-4">Joined Hikers</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:forEach var="joinedUser" items="${joinedUsers}">
	                        <tr>
	                            <td>
	                                <c:out value="${joinedUser.username}"></c:out> 
	                            </td>
	                        </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	            </div>
	            </div>
						</div>
			<footer style="background-color:#ebebeb;padding: 15px;text-align: center;">
				<p style="color: gray;">"We're constantly shown the "real world" on our screens but we come face to face with the real world out on the trail." - We Dream of Travel</p>
		        <p style="color: gray;">Copyright © 2022 Private Ownership - Masar Team - Palestine</p>
			 </footer >
</body>
</html>