<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ page isErrorPage="true" %>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Add a new Trail</title>
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
                    src="https://lh6.googleusercontent.com/QS_3nsqb4MyzTGWUkOaze2C2DRbchtBTJ-1XKSSWlddQmfRHzMR8TgVlqUA3mhWh20TZktkM3KGXA2-tRiXsIWh154ummjsgpMeTSRj_-RWeK8FBMnKcaom1WgSgTCZeuw=w1280"
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
								 <c:forEach var="item" items="${currentUser.roles}">
							<c:choose>
							    <c:when test="${(item.id == user3)}">
							         <li class="nav-item">
				                        <a class="nav-link" href="/client/businessTrails/new" style="font-size: 20px;">Add Trail</a>
				                    </li>
				                    <li class="nav-item">
				                        <a class="nav-link" href="/client/businessTrails" style="font-size: 20px;">Your Trails</a>
				                    </li>
								</c:when>   
							    <c:otherwise>
							   
							    	<c:if test="${item.id == user2}">
							    		
		                             <li class="nav-item">
				                        <a class="nav-link" href="/admin/trails/new" style="font-size: 20px;">Add Trail</a>
				                    </li>
				                    <li class="nav-item">
				                        <a class="nav-link" href="/admin/trails" style="font-size: 20px;">Your Trails</a>
				                    </li>
							    		</c:if>
                        			</c:otherwise>
							</c:choose>
									</c:forEach>
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
	<div class="container">

		<div class="row my-5">
			<div class="col-6 offset-3">
				<div class="row mb-5">
					<div class="col">
						<h3>Create a new trail</h3>

					</div>
					<div class="col text-end">
						<a class="btn btn-primary" href="/masar">Back to Homepage</a>
					</div>
				</div>
				<div class="row">
					<div class="col text-start">


						<form:form action="/admin/trails/new" method="post" modelAttribute="trail">
						<form:input type="hidden" path="admin" value="${currentUser.id}"/> 
							<div class="form-floating mb-3">
								<form:input type="text" class="form-control" id="name"
								path="name" placeholder="name" />
								<form:label path="name" for="floatingInput">name</form:label>
								<form:errors class="text-danger" path="name" />
							</div>
							<div class="form-floating mb-3">
								<form:input class="form-control" type="text" id="location"
								path="location" placeholder="Location" rows="3"></form:input>
								<form:label path="location" for="floatingInput">Location</form:label>
								<form:errors class="text-danger" path="location" />
							</div>
							<div class="form-floating mb-3">
								<form:input class="form-control" type="text" id="longitude"
								path="longitude" placeholder="Trail Start Longitude" rows="3"></form:input>
								<form:label path="longitude" for="floatingInput">Trail Start Longitude</form:label>
								<form:errors class="text-danger" path="longitude" />
							</div>
							<div class="form-floating mb-3">
								<form:input class="form-control" type="text" id="latitude"
								path="latitude" placeholder="Trail Start Latitude" rows="3"></form:input>
								<form:label path="latitude" for="floatingInput">Trail Start Latitude</form:label>
								<form:errors class="text-danger" path="latitude" />
							</div>
							<div class="form-floating mb-3">
								<form:input class="form-control" type="text" id="endLongitude"
								path="endLongitude" placeholder="Trail End Longitude" rows="3"></form:input>
								<form:label path="endLongitude" for="floatingInput">Trail End Longitude</form:label>
								<form:errors class="text-danger" path="endLongitude" />
							</div>
							<div class="form-floating mb-3">
								<form:input class="form-control" type="text" id="endLatitude"
								path="endLatitude" placeholder="Trail End Latitude" rows="3"></form:input>
								<form:label path="endLatitude" for="floatingInput">Trail End Latitude</form:label>
								<form:errors class="text-danger" path="endLatitude" />
							</div>
							<div class="form-floating mb-3">
								<form:select class="form-control" type="text" id="category"
								path="category" placeholder="Category" rows="3">
								<form:option value="Hiking">Hiking</form:option>
								<form:option value="Mountain Biking">Mountain Biking</form:option>
								<form:option value="Road Biking">Road Biking</form:option>
								<form:option value="Trail Running">Trail Running</form:option>
								
								</form:select>
								<form:label path="category" for="floatingInput">Category</form:label>
								<form:errors class="text-danger" path="category" />
							</div>
							<div class="form-floating mb-3">
								<form:input class="form-control" type="text" id="distance"
								path="distance" placeholder="Distance" rows="3" />
								<form:label path="distance" for="floatingInput">Distance</form:label>
								<form:errors class="text-danger" path="distance" />
							</div>
							<div class="form-floating mb-3">
								<form:input class="form-control" type="text" id="imgUrl"
								path="imgUrl" placeholder="Image URL" rows="3" />
								<form:label path="distance" for="floatingInput">Image URL</form:label>
								<form:errors class="text-danger" path="imgUrl" />
							</div>
							<div class="form-floating mb-3">
								<form:textarea class="form-control" id="description"
								path="description" placeholder="Description" rows="3"></form:textarea>
								<form:label path="description" for="floatingInput">Description</form:label>
								<form:errors class="text-danger" path="description" />
							</div>
							<button type="submit" class="btn btn-success float-end ms-2">Submit</button>
							<a href="/masar" class="btn btn-danger float-end">Cancel</a>
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<footer style="background-color:#ebebeb;padding: 15px;text-align: center;">
		<p style="color: gray;">"We're constantly shown the "real world" on our screens but we come face to face with the real world out on the trail." - We Dream of Travel</p>
        <p style="color: gray;">Copyright  2022 Private Ownership - Axsos Academy - Ramllah, Palestine</p>
	  </footer >
</body>
</html>