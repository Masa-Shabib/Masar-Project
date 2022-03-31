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
function initMap() {
	  const map = new google.maps.Map(document.getElementById("map"), {
	    zoom: 12,
	    center: { lat: 31.92789083995335, lng: 35.17532556430331 },
	    
	  });
	  
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
	  { lat: -31.56391, lng: 147.154312 },
	  { lat: -33.718234, lng: 150.363181 },
	  
	];

</script>
<style type="text/css">
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
  height: 65%;
  width: 50%;
  margin-left: 333px;
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
  
  <div class = "container-md-fluid  p-5">
  <div class = "row justify-content-around ">
<div class = "col-7  p-3 mt-3 ">
  <h3>Name:<c:out value="${trail.name}"></c:out></h3>
  </div>
</div>
  <div class = "row justify-content-around ">
            <div class = "col-7 border p-3 ">
    <img src="${trail.imgUrl}"  alt="..." />
    </div>
</div>
</div>
  
  
   <div id="map"></div>
    
   
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly&channel=2"
      defer
    ></script>
  


<div class = "container-md-fluid  p-5">
<div class = "row justify-content-around ">
 <div class = "col-7 border p-3 mt-3 ">
	<h5>Location:<c:out value="${trail.location}"></c:out></h5>
	<h5>Category<c:out value="${trail.category}"></c:out></h5>
	<h5>Distance<c:out value="${trail.distance}"></c:out></h5>
	<h5>Description<c:out value="${trail.description}"></c:out></h5>
   </div>
</div>
<div class = "row justify-content-around ">
<div class = "col-7 border p-3 mt-3 ">
<h5>User Experience</h5>
<form:form action="/masar/trails/${trail.id}/addcomment" method="post"  modelAttribute="comment">
  <form:input path="commentTrail" value="${trail.id}"  class="form-control" type="hidden" />
  <form:input path="commentUser" value="${currenUser.id}"  class="form-control" type="hidden" />
 <form:label path="comment"  class="col-form-label"> </form:label>
  
  <form:errors path="comment"/>
  
    <form:input path="comment"  class="form-control" />
  
  
  <button type="submit" class="btn btn-primary mt-3">Submit</button>
  
  </form:form>
</div>
</div>
</div>

  </body>
</html>