<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js">	
</script>
<script src="<c:url value="/resources/js/validateUserForm.js" />"></script>
<title>Spring forms :: Ciudades</title>

</head>
<body>

	<a href="#">Users app</a>
	<ul>
		<li><a href="<s:url value="/ciudades/" />" title="View ciudades">View
				ciudades</a></li>
		<li><a href="<s:url value="/ciudades/new" />" title="New ciudad">New
				ciudad</a></li>
	</ul>
	<h1>New ciudad</h1>
	<p>See this ciudad info</p>

	<c:url var="post_ciudad"  value="/ciudades/new" />
	<sf:form method="post" modelAttribute="ciudad" action="${post_ciudad}" id="newCiudad">
		<div class="form-group">
			<label for="nombre">Nombre</label>
			<sf:input path="nombre" placeholder="nombre" />
			<sf:errors path="nombre" cssClass="error" />
		</div>
		<div class="form-group">
			<label for="cpostal">Codigo Postal</label>
			<sf:input path="cpostal" placeholder="cpostal" />
			<sf:errors path="cpostal" cssClass="error" />
		</div>
		<sf:button>Create</sf:button>
	</sf:form>

	<p class="text-muted">&copy; 2017 Miguel Marzo</p>

</body>
<script src="<c:url value="/resources/js/validateCiudadForm.js" />"></script>
</html>