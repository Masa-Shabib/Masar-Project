<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Trails</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
<div class="row mt-5">
		<div class="col-8 offset-2">
			<div class="row align-items-center">
				<div class="col mb-4">
					<h4>
						All Trails added by admins:
					</h4>
				</div>
				<div class="col text-end">
					<div class="row">
						<div class="col">
							<a class="btn btn-danger mb-4" href="/logout">Logout</a>
						</div>

					</div>
					
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
								<a href="/trails/${trail.id}"><c:out value="${trail.name}" /></a>		
							</td>
							<td>
							<c:out value="${trail.location}"/>
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
			
			<div class="row">
						<div class="col">
							<a class="btn btn-success" href="/trails/new">Add a New Trail</a>
						</div>
					</div>

</body>
</html>