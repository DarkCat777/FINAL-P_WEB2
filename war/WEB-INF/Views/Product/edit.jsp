<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.entity.Product"%>
<%@page import="java.util.Date"%>
<%
	Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editar Product: <%=product.getId()%></title>
<script type="text/javascript" src="/validar.js"></script>
</head>
<style>
input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

div {
	border-radius: 5px;
	padding: 20px;
}

* {
	padding: 0px;
	margin: 0px;
}

#header {
	font-family: 'Montserrat', sans-serif;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.nav>li {
	float: left;
}

.nav li ul {
	display: none;
}

.nav li:hover>ul {
	display: block;
}

ul li a:hover, ul li a:active {
	background-color: #05319c;
}
</style>
<body>
	<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<div class="titulo">
		<h2>Editar Producto</h2>
	</div>

	<form action="/product/edit" method="post">
		<label>Edite el nombre </label> <input type="text" name="name"
			value="<%=product.getName()%>" required
			placeholder="Ingrese el nombre del producto"> <br> <br>
		<br> <label>Edite la descripcion</label> <input type="text"
			name="description" class="redondeado"
			value="<%=product.getDescription()%>" required
			placeholder="Ingrese la descripcion"> <br> <br> <br>
		<input type="text" name="descuento"
			value="<%=product.getDescuento()%>" required
			placeholder="Ingrese el descuento"> <br> <br> <br>
		<label>Edite el precio</label> <input type="text" name="price"
			class="redondeado" value="<%=product.getPrice()%>" required
			placeholder="Ingrese el precio"> <br> <br> <br>
		<select name="status">
			<label>Edite el Estado </label>
			<option value="true">Activo</option>
			<option value="false">Desactivado</option>
			<label>Edite el stock</label>
			<input type="text" name="stock" class="redondeado"
			value="<%=product.getStock()%>" required>
			<br>
			<br>
			<br>
			<input type="hidden" name="id" value="<%=product.getId()%>">
			<input type="submit" value="Editar">
	</form>
	<center>
		<a href="/product"><img src="/lista.png" width="50" height="50"></a>
	</center>
</body>
</html>