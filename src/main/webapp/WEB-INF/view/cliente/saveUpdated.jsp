<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page session="false"%>
<html>
<head>
<title>SaveUpdate Task</title>
</head>
<body>
	<a href="#">Users task app</a>
	<ul>
			<li><a href="<s:url value="/users/${task.user.id}" />" 
				title="Back to user">Back to user</a></li>
		<li><a href="<s:url value="/users/" />" title="View users">View
				users</a></li>
		<li><a href="<s:url value="/users/new" />" title="New user">New
				user</a></li>
	</ul>
	<h1>Ok, ${task.id} task called ${task.name} was UPDATED</h1>


	<p>&copy; 2015 Eugenia Pérez</p>
</body>
</html>
