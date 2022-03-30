<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trail Business Details</title>
</head>
<body>

<div class="container">

		
				<div class="row mb-5">
					<div class="col">
						<h3>${businessTrail.name}</h3>

					</div>
					</div>
					<div class="row my-5">
<div class= "col-10">


<table class="table table-bordered text-center">
                <thead>
                    <tr>
                        <th scope="col" class="col-6">Trail Name</th>
                        <th scope="col" class="col-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="trail" items="${allBusinessTrails}">
                        <tr>
                            <td>
                                <a href="/trails/${trail.id}"><c:out value="${trail.name}" /></a>
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