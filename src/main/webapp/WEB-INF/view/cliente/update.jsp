<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page session="false"%>
<html>
<head>
<title>Update user task</title>
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
	<h1>Update user task</h1>
	<s:url var="action" value="/tasks/saveupdate" />
	<sf:form method="post" action="${action}" modelAttribute="task">
		<sf:hidden path="id" />
		<sf:hidden path="user.id" />
		<div class="form-group">
			<label for="name">Name</label>
			<sf:input path="name" placeholder="name" />
		</div>
		<div class="form-group">
			<label for="description">Description</label>
			<sf:textarea path="description" placeholder="Description" />
		</div>
		<sf:button>Update</sf:button>
	</sf:form>

	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
</body>
</html>
