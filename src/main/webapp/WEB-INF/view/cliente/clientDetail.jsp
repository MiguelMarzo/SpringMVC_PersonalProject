<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- No pueden convivir c & sgf? da error y no arranca -->
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
<title>Spring forms :: ciudad cliente details</title>

</head>
<body>

	<a href="#">Clientes app</a>
	<ul>
			<li><a href="<s:url value="/ciudads/${cliente.ciudad.id}" />" 
				title="Back to ciudad">Back to ciudad</a></li>
		<li><a href="<s:url value="/ciudads/" />" title="View ciudads">View
				ciudads</a></li>
		<li><a href="<s:url value="/ciudads/new" />" title="New ciudad">New
				ciudad</a></li>
	</ul>

	<h1>ciudad cliente detail</h1>
	<p>See this cliente info</p>

	<c:choose>
		<c:when test="${not empty cliente}">
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Direccion</th>
						<th>Telefono</th>
						<th>Email</th>
						<th>Ciudad</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${cliente.id}</td>
						<td>${cliente.nombre}</td>
						<td>${cliente.direccion}</td>
						<td>${cliente.telefono}</td>
						<td>${cliente.email}</td>
						<td>${cliente.ciudad.id}</td>
					</tr>
				</tbody>
			</table>
		
			
		</c:when>
		<c:otherwise>
			<div>A cliente with the id specified has not been found. Please,
				try again</div>
		</c:otherwise>
	</c:choose>

	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>

</body>
</html>