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
<title><s:message code="title"></s:message></title>
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
			<h1><s:message code="cityList"></s:message></h1>
			<p><s:message code="citiesInTheSystem"></s:message></p>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th><p>
							<s:message code="cityID"></s:message>
						</p></th>
					<th><p>
							<s:message code="name"></s:message>
						</p></th>
					<th><p>
							<s:message code="postalCode"></s:message>
						</p></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ciudades}" var="ciudad">
					<tr>
						<td>${ciudad.nombre}</td>
						<td>${ciudad.cpostal}</td>
						<td><a href="<s:url value="/ciudades/${ciudad.id}" />"
							title="Detailed info">
							<s:message code="seeDetail"></s:message></a> || <a
							href="<c:url value="/ciudades/update/${ciudad.id}" />">
							<s:message code="update"></s:message></a>
							|| <a href="<c:url value="/ciudades/delete/${ciudad.id}" />">
							<s:message code="delete"></s:message></a>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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