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
<title>Spring forms :: Ciudades</title>

</head>
<body>

	<a href="#">Ciudad app</a>
	<ul>
		<li><a href="<s:url value="/ciudades/" />" title="View ciudades">View
				ciudades</a></li>
		<li><a href="<s:url value="/ciudades/new" />" title="New ciudad">New
				ciudad</a></li>
	</ul>

	<h1>Ciudades detail</h1>
	<p>See this ciudad info</p>

	<c:choose>
		<c:when test="${not empty ciudad}">
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Cpostal</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${ciudad.id}</td>
						<td>${ciudad.nombre}</td>
						<td>${ciudad.cpostal}</td>
					</tr>
				</tbody>
			</table>

			<h3>Clientes</h3>
			<h4>Insert new cliente</h4>
			<c:url var="post_cliente" value="/clientes/new" />
			<sf:form method="post" modelAttribute="cliente"
				action="${post_cliente}">
				<sf:hidden path="ciudad.id" />
				<div class="form-group">
					<label for="nombre">Nombre</label>
					<sf:input path="nombre" placeholder="Nombre" />
				</div>
				<div class="form-group">
					<label for="direccion">Direccion</label>
					<sf:textarea path="direccion" placeholder="direccion" />
				</div>
				<div class="form-group">
					<label for="telefono">Telefono</label>
					<sf:textarea path="telefono" placeholder="telefono" />
				</div>
				<div class="form-group">
					<label for="email">Email</label>
					<sf:textarea path="email" placeholder="email" />
				</div>
				<sf:button>Create</sf:button>
			</sf:form>
			<c:choose>
				<c:when test="${not empty ciudad}">
					<p>These are the clientes for this ciudad.</p>
					<table class="table">
						<thead>
							<tr>
								<th>Id</th>
								<th>Nombre</th>
								<th>Direccion</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ciudad.clientes}" var="cliente">
								<tr>
									<td>${cliente.id}</td>
									<td>${cliente.nombre}</td>
									<td>${cliente.direccion}</td>
									<td>${cliente.telefono}</td>
									<td>${cliente.email}</td>
									<td><a href="<s:url value="/clientes/${cliente.id}" />"
										title="Detailed info"> See detail</a> || <a
										href="<c:url value="/clientes/update/${cliente.id}" />">Update</a>
										|| <a href="<c:url value="/clientes/delete/${cliente.id}" />">Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
			</c:choose>
		</c:when>
		<c:otherwise>
			<div>A ciudad with the id specified has not been found. Please,
				try again</div>
		</c:otherwise>
	</c:choose>

	<p class="text-muted">&copy; 2017 Miguel Marzo</p>

</body>
</html>