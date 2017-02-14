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
<title>Spring forms :: Users</title>

<!-- Bootstrap -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Users app</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<s:url value="/ciudades/" />"
						title="View ciudades">View ciudades</a></li>
					<li><a href="<s:url value="/ciudades/new" />"
						title="New ciudad">New ciudad</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="true"><s:message
								code="navbar.language"></s:message> <span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="?locale=en"><img src="blank.gif"
									class="flag flag-gb"
									alt="<s:message code="english"></s:message>" /> <s:message
										code="english"></s:message></a></li>
							<li><a href="?locale=es"><img src="blank.gif"
									class="flag flag-es"
									alt="<s:message code="spanish"></s:message>" /> <s:message
										code="spanish"></s:message></a></li>
						</ul></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1>Ciudades detail</h1>
			<p>See this ciudad info</p>
		</div>
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
						<sf:input path="nombre" placeholder="Nombre" class="form-control" />
					</div>
					<div class="form-group">
						<label for="direccion">Direccion</label>
						<sf:textarea path="direccion" placeholder="direccion"
							class="form-control" />
					</div>
					<div class="form-group">
						<label for="telefono">Telefono</label>
						<sf:textarea path="telefono" placeholder="telefono"
							class="form-control" />
					</div>
					<div class="form-group">
						<label for="email">Email</label>
						<sf:textarea path="email" placeholder="email" class="form-control" />
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
				<div>A ciudad with the id specified has not been found.
					Please, try again</div>
			</c:otherwise>
		</c:choose>
	</div>
	<footer class="footer">
		<div class="container">
			<p class="text-muted">&copy; 2017 Miguel Marzo</p>
		</div>
	</footer>
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

</body>
</html>