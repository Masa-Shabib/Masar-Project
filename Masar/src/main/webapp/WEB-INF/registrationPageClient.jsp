<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Page</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
     <div class="container-lg-fluid m-3 p-3 " >
	<div class="row justify-content-around mb-4">
	<div class = "col-4 mt-5">
   <h1>Register!</h1>
    
    <p><form:errors path="user.*"/></p>
    
    <form:form method="POST" action="/registration/client" modelAttribute="user">
        <div class="form-floating my-3">
            <form:input path="username" class="form-control" id="floatingInput"/>
            <form:label path="username" for="floatingInput">Username:</form:label>
        </div>
        <div class="form-floating my-3">
			<form:input type="email" path="email" class="form-control" id="floatingInput"/>
            <form:label path="email" for="floatingInput">Email:</form:label>
        </div>
        <div class="form-floating my-3">
            <form:password path="password" class="form-control" id="floatingInput"/>
            <form:label path="password" for="floatingInput">Password:</form:label>
        </div>
        <div class="form-floating my-3">
            <form:password path="passwordConfirmation" class="form-control" id="floatingInput"/>
            <form:label path="passwordConfirmation" for="floatingInput">Password Confirmation:</form:label>
        </div>
        
        <input type="submit" value="Register!"  class="btn btn-outline-warning align-self-center"/>
    </form:form>
    </div>
    </div>
    </div>
</body>
</html>