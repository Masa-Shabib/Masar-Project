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
</body>
</html>