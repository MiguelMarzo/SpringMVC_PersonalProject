<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page session="false"%>
<html>
<head>
<title>SaveUpdate Task</title>
</head>
<body>
	<a href="#">City clients app</a>
	<ul>
			<li><a href="<s:url value="/clientes/${cliente.ciudad.id}" />" 
				title="Back to ciudad">Back to Ciudad</a></li>
		<li><a href="<s:url value="/ciudades/" />" title="View ciudades">View
				ciudades</a></li>
		<li><a href="<s:url value="/ciudades/new" />" title="New ciudad">New
				ciudad</a></li>
	</ul>
	<h1>Ok, ${cliente.id} cliente called ${cliente.nombre} was UPDATED</h1>


	<p>&copy; 2017 Miguel Marzo</p>
</body>
</html>
