<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Marker Clustering</title>
    <!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js">
    </script>
<script type="text/javascript">
/*<![CDATA[*/
function initMap() {
	  const map = new google.maps.Map(document.getElementById("map"), {
	    zoom: 14,
	    center: { lat:  ${trail.longitude} , lng: ${trail.latitude} },
	    
	  });
	  /*]]>*/	  
	  const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	  
	  const markers = locations.map((location, i) => {
	    return new google.maps.Marker({
	      position: location,
	      label: labels[i % labels.length],
	    });
	  });

	  
	  new MarkerClusterer(map, markers, {
	    imagePath:
	      "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m",
	  });
	}

	const locations = [
	  { lat:  ${trail.longitude} , lng: ${trail.latitude}},
	  { lat:  ${trail.endLongitude} , lng: ${trail.endLatitude}},
	  
	];

</script>
<style type="text/css">
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
  height: 65%;
  width: 50%;
  margin: 0 auto;
}

/* Optional: Makes the sample page fill the window. */
html,
body {
  height: 100%;
  margin: 0;
  padding: 0;
}
</style>
    <!-- jsFiddle will insert css and js -->
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
  <div class = "container-md-fluid  p-5">
  <div class = "row justify-content-around ">
<div class = "col-7  p-3 mt-3 ">
  <h3>Name:<c:out value="${trail.name}"></c:out></h3>
  </div>
</div>
  <div class = "row justify-content-around ">
            <div class = "col-7 border p-3 ">
		    <img class="card-img-top h-100" src="${trail.imgUrl}"  alt="${trail.name}" />
		    </div>
</div>
</div>

   <div  id="map"></div>

   
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly&channel=2"
      defer
    ></script>
  


<div class = "container-md-fluid  p-5">
<div class = "row justify-content-around ">
 <div class = "col-7 border p-3 mt-3 ">
	<p><strong>Location: </strong> <c:out value="${trail.location}"></c:out></p>
	<p><strong>Category:</strong> <c:out value="${trail.category}"></c:out></p>
	<p><strong>Distance: </strong> <c:out value="${trail.distance}"></c:out></p>
	<p><strong>Description: </strong> <c:out value="${trail.description}"></c:out></p>
   </div>
</div>
<div class = "row justify-content-around ">
<div class = "col-7 border p-3 mt-3 ">
<h5>User Experience</h5>
<form:form action="/masar/trails/${trail.id}/comment" method="post"  modelAttribute="comment">
  <form:input path="commentTrail" value="${trail.id}"  class="form-control" type="hidden" />
  <form:input path="commentUser" value="${currentUser.id}"  class="form-control" type="hidden" />
 <form:label path="text"  class="col-form-label"> </form:label>
  <form:errors path="text"/>
    <form:input path="text"  class="form-control" />
  <button type="submit" class="btn btn-primary mt-3">Post</button>
  </form:form>
  	<c:forEach var="item" items="${trail.trailComments}">
		<p><c:out value="${item.text}"></c:out></p>
	</c:forEach>
</div>
</div>
</div>
		<footer style="background-color:#ebebeb;padding: 15px;text-align: center;">
		<p style="color: gray;">"We're constantly shown the "real world" on our screens but we come face to face with the real world out on the trail." - We Dream of Travel</p>
        <p style="color: gray;">Copyright  2022 Private Ownership - Axsos Academy - Ramllah, Palestine</p>
	  </footer >
  </body>
</html>