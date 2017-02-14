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
<title>Spring forms :: Ciudades</title>
</head>
<body>

	
	<ul>
		<li><a href="<s:url value="/ciudades/" />" title="View ciudades">View
				ciudades</a></li>
		<li><a href="<s:url value="/ciudades/new" />" title="New ciudad">New
				ciudad</a></li>
	</ul>


	<h1>Ciudades list</h1>
	<p>These are the ciudades currently in the system.</p>

	<table class="table">
		<thead>
			<tr>
				<th>Login</th>
				<th>Description</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ciudades}" var="ciudad">
				<tr>
					<td>${ciudad.nombre}</td>
					<td>${ciudad.cpostal}</td>
					<td><a href="<s:url value="/ciudades/${ciudad.id}" />"
						title="Detailed info"> see detail</a> || <a
						href="<c:url value="/ciudades/update/${ciudad.id}" />">update</a>
						|| <a href="<c:url value="/ciudades/delete/${ciudad.id}" />">delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<p>&copy; 2017 Miguel Marzo</p>

</body>
</html>