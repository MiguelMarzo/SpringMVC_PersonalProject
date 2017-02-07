<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- No pueden convivir c & sgf? da error y no arranca -->
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Spring forms :: Clientes</title>

</head>
<body>

	<a href="#">Clientes app</a>

	<ul>
		<li><a href="<s:url value="/ciudades/${cliente.ciudad.id}" />" 
				title="Back to ciudad">Back to ciudad</a></li>
		<li><a href="<s:url value="/ciudades/" />" title="View ciudades">View
				ciudades</a></li>
		<li><a href="<s:url value="/ciudades/new" />" title="New ciudad">New
				ciudad</a></li>
	</ul>

	<h1>Task created</h1>

	<div class="alert alert-success" role="alert">The following cliente
		has been created successfully</div>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Dirección</th>
				<th>Ciudad</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${cliente.id}</td>
				<td>${cliente.nombre}</td>
				<td>${cliente.direccion}</td>
				<td>${cliente.ciudad.nombre}</td>
			</tr>
		</tbody>
	</table>

	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>

</body>
</html>