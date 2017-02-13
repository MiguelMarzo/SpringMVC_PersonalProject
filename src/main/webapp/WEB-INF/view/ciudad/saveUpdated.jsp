<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page session="false"%>
<html>
<head>
<title>SaveUpdate.jsp</title>
</head>
<body>
	<a href="#">Ciudades app</a>
	<ul>
		<li><a href="<s:url value="/ciudades/" />" title="View ciudades">View
				ciudades</a></li>
		<li><a href="<s:url value="/ciudades/new" />" title="New ciudad">New
				ciudad</a></li>
	</ul>
	<h1>Ok, ciudad ${ciudad.id} called ${ciudad.nombre} was UPDATED</h1>


	<p>&copy; 2017 Miguel Marzo</p>
</body>
</html>
