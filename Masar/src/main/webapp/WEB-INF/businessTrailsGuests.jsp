<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Trail to join</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
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
		<div class="container-lg-fluid m-3 p-3 border" >
		<div class="row justify-content-between mb-4">
			<div class="col-6 p-4"><h1 style="font-size: 55px;" >Trails to join </h1></div>
			<div class="col-4 p-4"><form class="d-flex mt-3" action="/masar/businessTrails/search" >
					<input class="form-control me-2" name="location" type="search" placeholder="Search by location" id="trails" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form></div>
		</div>
		<div class="row p-3 ">
			<div class="col-2 p-4" style="border-right:1px solid gray">
			
				<form action="/masar/businessTrails/filter_category" >
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
							<form action="/masar/businessTrails/filter_location" >
								<p class="mt-3" style="font-size: 20px;"><b>filter by Location</b></p>
								<input type="radio" name="t_location" value="" checked style="display: none;">
								 <c:forEach var="item" items="${bTrails}">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="t_location" value="${item.location}"
											id="flexRadioDefault1">
										<label class="form-check-label" for="${item.location}" style="font-size: 12px;">
											<c:out value="${item.location}"></c:out>
										</label>
									</div>
								</c:forEach>
								<button type="submit" class="btn btn-outline-secondary mt-4 ">Apply filter</button>
							</form>
			</div>
			<div class="col-10">
				 <div class="row row-cols-1 row-cols-md-2 row-cols-sm-2 g-4">
					<c:forEach var="item" items="${bTrails}">
							            <div class="col">
							            	<div class="card h-100"  >
											  <h5 class="card-header">Added by <c:out value="${item.client.username}"></c:out></h5>
											  <div class="card-body">
											    <h5 class="card-title"><c:out value="${item.name}"></c:out> Trail</h5>
											     <p class="card-text"><strong>Location: </strong><c:out value="${item.location}"></c:out></p>
											    <p class="card-text"><strong>Description: </strong><c:out value="${item.description}"></c:out></p>
											    <p class="card-text"><strong>Category: </strong><c:out value="${item.category}"></c:out></p>
											    	<p><strong>Price: </strong> <c:out value="${item.price}"></c:out> NIS</p>
											     <c:choose>
					                                <c:when test="${item.relatedTrail == 0}">
					                                    <a href="/masar/trails" class="btn btn-outline-secondary ">Details</a>
					                                </c:when>
					                                <c:otherwise>
					                                     <a href="/masar/trails/${item.relatedTrail}" class="btn btn-outline-secondary ">Details</a>
					                                </c:otherwise>
					                            </c:choose>
											   
	
		                            <c:set var="attending" value="${false}"/>
		                            <c:forEach items="${item.joinedGuests}" var="attendee">
		                            <c:set var="user1" value="${attendee.id}"/>
										<c:set var="user2" value="${currentUser.id}"/>
			                            <c:if test="${user1 == user2}">
		                                    <c:set var="attending" value="${true}"/>
		                                </c:if>
		                            </c:forEach>
		                            <c:choose>
		                                <c:when test="${attending == false}">
		                                    <a href="/masar/businessTrails/${item.id}/join" class="btn btn-outline-secondary ">Join</a>
		                                </c:when>
		                                <c:otherwise>
		                                    <a href="/masar/businessTrails/${item.id}/cancel" class="btn btn-outline-secondary ">cancel</a>
		                                </c:otherwise>
		                            </c:choose>
											  </div>
											  <div class="card-footer text-muted">
											    <p class="card-text">Added on:
											    <fmt:formatDate value="${item.createdAt}" type="date" pattern="h:m aa  MMM dd"/></p>
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
        <p style="color: gray;">Copyright © 2022 Private Ownership - Masar Team - Palestine</p>
	  </footer >
</body>
</html>