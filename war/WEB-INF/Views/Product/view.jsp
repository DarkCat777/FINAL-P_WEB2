<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.entity.Product"%>
<%@page import="java.util.*"%>
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
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	<title>Product <%=product.getName() %></title>
	<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
	<style>
		th{
                background-color: rgb(80, 71, 207);
                color: white;
            }
            tr{
            color:white;
            }
	</style>
</head>
<body>
	<jsp:include page="../Menu/menu2.jsp" flush="true" />
	<div class="contenedor-form">
	<center>
	<h2>
		Producto
		<%=product.getName()%></h2></center>	
	<a id="add" href="/product" title="Añadir Producto"></a>
	<div id="tabla">

		<center>
			<table style="width: 40%;">
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
		<form action="/product/delete" method="get">
			<input type="hidden" value="<%=product.getId()%>" name="id">
			<input type="image" src="/delete.png" width="50" height="60" />
	</center>
	</form>
	<div class="contenedor-form">
	<div class="formulario">
		<center>
			<h1>COMENTARIOS</h1>
			<br>
			<div>
			<b>AÑADIR COMENTARIO: </b>
			<br><br>
			<form action="/product/addcoment" method="GET">
			<input type="text" maxlength="60" name="coment" placeholder="¿Que piensas del producto?">
			<input type="hidden" value="<%=product.getId()%>" name="id">
			<input type="submit" value="Publicar comentario">
			<br>
			<br>
			</form>
			</div>
			<div>
			<%if(product.getComents().isEmpty()) {%>
			<p>No hay comentarios.</p>
			<% }else{%>
				<table>
				<%for(int i=0;i<product.getComents().size();i++){%>
					<tr>
						<td><b>Anonimo: --></b>
						</td>
						<td><%=product.getComents().get(i) %>
						</td>
					</tr>
					<% }%>
				</table>
				<%}%>
			</div>
			</div>
		</center>
	</div>
</div>
</body>
</html>