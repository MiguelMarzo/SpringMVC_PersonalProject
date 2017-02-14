<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page session="false"%>
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
			<h1><s:message code="updateClient"></s:message></h1>
		</div>
		<s:url var="action" value="/clientes/saveupdate" />
		<sf:form method="post" action="${action}" modelAttribute="cliente">
			<div>
				<label for="ciudad"><s:message code="city"></s:message></label>
				<sf:select path="ciudad.id" class="form-control">
					<sf:options items="${ciudad}" itemLabel="nombre" itemValue="id" />
				</sf:select>
			</div>
			<sf:hidden path="id" />
			<sf:hidden path="ciudad.id" />
			<div class="form-group">
				<label for="nombre"><s:message code="name"></s:message></label>
				<sf:input path="nombre" placeholder="nombre" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="telefono"><s:message code="phonenumber"></s:message></label>
				<sf:textarea path="telefono" placeholder="telefono" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="direccion"><s:message code="address"></s:message></label>
				<sf:textarea path="direccion" placeholder="direccion" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="email"><s:message code="email"></s:message></label>
				<sf:textarea path="email" placeholder="email" class="form-control"/>
			</div>
			<sf:button><s:message code="update"></s:message></sf:button>
		</sf:form>
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
