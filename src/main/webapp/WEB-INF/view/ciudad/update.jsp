<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page session="false"%>
<html>
<head>
<title>Update.jsp</title>
</head>
<body>
	<a href="#">Ciudades app</a>
	<ul>
		<li><a href="<s:url value="/ciudades/" />" title="View ciudades">View
				ciudades</a></li>
		<li><a href="<s:url value="/ciudades/new" />" title="New ciudad">New
				ciudad</a></li>
	</ul>
	<h1>Update ciudad</h1>
	<s:url var="action" value="/ciudades/saveupdate" />
	<sf:form method="post" action="${action}" modelAttribute="ciudad">
		<sf:hidden path="id" />
		<div class="form-group">
			<label for="nombre">Nombre</label>
			<sf:input path="nombre" placeholder="nombre" />
			<sf:errors path="nombre" cssClass="error" />
		</div>
		<div class="form-group">
			<label for="cpostal">C Postal</label>
			<sf:input path="cpostal" type="cpostal" placeholder="cpostal" />
			<sf:errors path="cpostal" cssClass="error" />
		</div>
		<sf:button>Update</sf:button>
	</sf:form>

	<p class="text-muted">&copy; 2017 Miguel Marzo</p>
</body>
</html>
