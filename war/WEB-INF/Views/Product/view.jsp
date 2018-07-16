<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.entity.Product"%>
<%
	Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


</head>
<style>
*{
padding: 0px;
margin: 0px;
}
#header{
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
.nav > li{
float: left;
}
.nav li ul{
display: none;
}

.nav li:hover > ul{
 display: block;
}
ul li a:hover, ul li a:active {
	background-color: #05319c;
}

</style>

<body>
<jsp:include page="../Menu/menu2.jsp" flush="true"/>
<h2>
	Producto
	<%=product.getId()%></h2>
	<a id="add" href="/product" title="Añadir Producto"></a>
	<div id="tabla">

		<center>
			<table>
				<tr>
					<th>ID de usuario</th>
					<td><%=product.getId()%></td>
				</tr>
				<tr>
					<th>Nombre</th>
					<td><%=product.getName()%></td>
				</tr>
				<tr>
					<th>Marca</th>
					<td><%=product.getMarca()%></td>
				</tr>
				<tr>
					<th>Modelo</th>
					<td><%=product.getModel()%></td>
				</tr>
				<tr>
					<th>Descripcion</th>
					<td><%=product.getDescription()%></td>
				</tr>
				<tr>
					<th>Precio</th>
					<td><%=product.getPrice()%></td>
				</tr>
				<tr>
				<tr>
					<th>Descuento</th>
					<td><%=product.getDescuento()%></td>
				</tr>
				<tr>
				
					<th>Stock</th>
					<td><%=product.getStock()%></td>
				</tr>

				<tr>
					<th>Estado</th>
					<td><%=product.isStatus()%></td>
				</tr>
				
				<tr>
					<th>Creado</th>
					<td><%=product.getMade()%></td>
				</tr>

			</table>
		</center>
	</div>

		<center>
			<a href="/product/edit?id=<%=product.getId()%>"><img
				src="/edit.png" width="50" height="50" /> </a> <a href="/product"><img
				src="/lista.png" width="50" height="50"> </a>
			<form action="/product/delete" method="post">
				<input type="hidden" value="<%=product.getId()%>" name="id">
				<input type="image" src="/delete.png" width="30" height="30" />
		</center>
		</form>
	
</body>
</html>