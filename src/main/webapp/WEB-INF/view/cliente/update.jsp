<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page session="false"%>
<html>
<head>
<title>Update ciudad cliente</title>
</head>
<body>
	<a href="#">ciudades cliente app</a>
	<ul>
		<li><a href="<s:url value="/ciudades/${cliente.ciudad.id}" />"
			title="Back to ciudad">Back to ciudad</a></li>
		<li><a href="<s:url value="/ciudades/" />" title="View ciudades">View
				ciudades</a></li>
		<li><a href="<s:url value="/ciudades/new" />" title="New ciudad">New
				ciudad</a></li>
	</ul>
	<h1>Update ciudad cliente</h1>
	<s:url var="action" value="/clientes/saveupdate" />
	<sf:form method="post" action="${action}" modelAttribute="cliente">
		<sf:hidden path="id" />
		<sf:hidden path="ciudad.id" />
		<div class="form-group">
			<label for="nombre">Nombre</label>
			<sf:input path="nombre" placeholder="nombre" />
		</div>
		<div class="form-group">
			<label for="telefono">Telefono</label>
			<sf:textarea path="telefono" placeholder="telefono" />
		</div>
		<div class="form-group">
			<label for="direccion">Direccion</label>
			<sf:textarea path="direccion" placeholder="direccion" />
		</div>
		<div class="form-group">
			<label for="email">Email</label>
			<sf:textarea path="email" placeholder="email" />
		</div>
		<sf:button>Update</sf:button>
	</sf:form>

	<p class="text-muted">&copy; 2017 Eugenia Perez</p>
</body>
</html>
