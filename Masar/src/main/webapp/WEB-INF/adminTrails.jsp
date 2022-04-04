<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Trails</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
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
                        <a class="nav-link active" aria-current="page" href="/masar"
                            style=" font-size: 20px;">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/masar/trails" style="font-size: 20px;">Trails</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/masar/businessTrails" style="font-size: 20px;">Business Trails</a>
                    </li>
							    		
		                     <li class="nav-item">
				                <a class="nav-link" href="/admin/trails/new" style="font-size: 20px;">Add Trail</a>
				             </li>
				           <li class="nav-item">
				               <a class="nav-link" href="/admin/trails" style="font-size: 20px;">Your Trails</a>
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
 <div class="row mt-5" style="height:100vh">
		<div class="col-8 offset-2">
			
			<div class="row align-items-around">
				<div class="col-10 mb-4">
					<h4>
						All Trails added by admins:
					</h4>
				</div>
			
						<div class="col-2">
							<a class="btn btn-success" href="/admin/trails/new">Add a New Trail</a>
						</div>
				
			</div>
			<table class="table table-bordered text-center">
				<thead>
					<tr>
						<th scope="col">Trail Name</th>
						<th scope="col">Location</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="trail" items="${allTrails}">
						<tr>
							<td>
								<a href="/masar/trails/${trail.id}"><c:out value="${trail.name}" /></a>		
							</td>
							<td>
							<c:out value="${trail.location}"/>
							</td>	
							<td class="d-flex justify-content-around">
								<a href="/admin/trails/${trail.id}/edit" class="btn  btn-warning">Edit</a>
								<a href="/admin/trails/${trail.id}/delete" class="btn  btn-danger">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			
			</div>
		</div>
		<footer style="background-color:#ebebeb;padding: 15px;text-align: center;">
		<p style="color: gray;">"We're constantly shown the "real world" on our screens but we come face to face with the real world out on the trail." - We Dream of Travel</p>
        <p style="color: gray;">Copyright © 2022 Private Ownership - Masar Team - Palestine</p>
	  </footer >
</body>
</html>