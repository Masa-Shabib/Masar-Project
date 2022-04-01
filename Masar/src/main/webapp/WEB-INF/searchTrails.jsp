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
<div class="container-lg-fluid m-3 p-3 border" style="height: 100vh;">
		<div class="row justify-content-between mb-4">
			<div class="col-4 p-4"><h1 style="font-size: 55px;" >Palestinian Trails </h1></div>
			<div class="col-4 p-4"><form class="d-flex mt-3" action="/masar/trails/search" >
					<input class="form-control me-2" name="location" type="search" placeholder="Search by location" id="trails" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form></div>
		</div>
		<div class="row p-3 ">
			<div class="col-2 p-4" style="border-right:1px solid gray">
				<form action="/masar/trails/filter_category" >
								<p style="font-size: 20px;"><b>filter by Category</b></p>
								<input type="radio" name="t_category" value="" checked style="display: none;">
								
								<div class="form-check">
									<input class="form-check-input" type="radio" name="t_category" value="Hiking"id="flexRadioDefault1">
									<label class="form-check-label" for="Hiking" style="font-size: 12px;">Hiking</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="t_category" value="Mountain Biking"id="flexRadioDefault1">
									<label class="form-check-label" for="Mountain Biking" style="font-size: 12px;">Mountain Biking</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="t_category" value="Road Biking"id="flexRadioDefault1">
									<label class="form-check-label" for="Road Biking" style="font-size: 12px;">Road Biking</label>
								</div>
								<div class="form-check">	
									<input class="form-check-input" type="radio" name="t_category" value="Trail Running"id="flexRadioDefault1">
									<label class="form-check-label" for="Trail Running" style="font-size: 12px;">Trail Running</label>
								</div>
								
								<button type="submit" class="btn btn-outline-secondary mt-4 ">Apply filter</button>
							</form>
							<form action="/masar/trails/filter_location" >
								<p class="mt-3" style="font-size: 20px;"><b>filter by Location</b></p>
								<input type="radio" name="t_location" value="" checked style="display: none;">
								 <c:forEach var="item" items="${locations}">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="t_location" value="${item}"
											id="flexRadioDefault1">
										<label class="form-check-label" for="${item}" style="font-size: 12px;">
											<c:out value="${item}"></c:out>
										</label>
									</div>
								</c:forEach>
								<button type="submit" class="btn btn-outline-secondary mt-4 ">Apply filter</button>
							</form>
			</div>
			<div class="col-10">
				 <div class="row row-cols-1 row-cols-md-4 row-cols-sm-2 g-4">
					<c:forEach var="item" items="${trails}">
							            <div class="col">
							              <div class="card h-100">
							                <img
							                  src="${item.imgUrl}" class="card-img-top h-75" alt="Trail Image"/>
							                <div class="card-body">
							                  <h5 class="card-title"><c:out value="${item.name}"></c:out> Trail</h5>
							                  <p class="card-text">Distance: <c:out value="${item.distance}"></c:out></p>
							                  <ul class="list-group list-group-flush">
							                    <li class="list-group-item">
							                      <a
							                        href="/masar/trails/${item.id}"
							                        class="btn btn-outline-secondary "
							                        >Details</a
							                      >
							                    </li>
							                    <li class="list-group-item">
							                      <c:out value="${item.location}"></c:out>
							                    </li>
							                  </ul>
							                </div>
							              </div>
							            </div>
									</c:forEach>
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