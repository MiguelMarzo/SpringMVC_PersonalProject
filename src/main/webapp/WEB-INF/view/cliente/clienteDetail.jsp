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
<title><s:message code="title"></s:message></title>

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
				<a class="navbar-brand" href="#"><s:message code="title"></s:message></a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<s:url value="/ciudades/" />"
						title="View ciudades"><s:message code="viewCities"></s:message></a></li>
					<li><a href="<s:url value="/ciudades/new" />"
						title="New ciudad"><s:message code="newCity"></s:message></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="true"><s:message
								code="language"></s:message> <span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="?locale=en"><img src="blank.gif"
									class="flag flag-gb"
									alt="<s:message code="english"></s:message>"/> <s:message
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
			<h1><s:message code="clientDetail"></s:message></h1>
			<p><s:message code="seeClientInfo"></s:message></p>
		</div>
		<c:choose>
			<c:when test="${not empty cliente}">
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th><s:message code="name"></s:message></th>
							<th><s:message code="address"></s:message></th>
							<th><s:message code="phonenumber"></s:message></th>
							<th><s:message code="email"></s:message></th>
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
				<div><s:message code="clientWithIdNotFound"></s:message></div>
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