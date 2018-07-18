<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
Ticket ticket= (Ticket) request.getAttribute("ticket");
Users user = (Users) request.getAttribute("user");
List<Product> products=(List<Product>)request.getAttribute("products");
 %> 
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>View</title>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<link rel="icon" type="image/png" href="favicon.ico">
</head>

<body>

<body>
	<jsp:include page="../Menu/menu2.jsp" flush="true" />

	<div class="contenedor-form">
		<div class="titulo">
			<h1>Factura</h1>
		</div>
		<div class="vista">
			<table>
				<thead>
					<tr>
						<th>Nombre </th>
						<th>Dirección</th>
						<th>Fecha</th>
						<th>SUB Total</th>
						<th>IGV:(18%)</th>
						<th>Total</th>
						<th>Codigo de la Boleta</th>
					</tr>
				</thead>
				<tr>
					<td><%=user.getName()%></td>
					<td><%=user.getCity()%></td>
					<td><%=ticket.getCreate()%></td>
					<td><%=ticket.getTotal()%></td>
					<td><%=(ticket.getTotal() * ticket.getIGV())%></td>
					<td><%=(ticket.getTotal() * (ticket.getIGV() + 1))%></td>
					<td><%=ticket.getId()%></td>
				</tr>
			</table>
			<br>
			<table>
				<thead>
					<tr>
						<td>Nombre del Producto</td>
						<td>Descripción del Producto</td>
						<td>Marca del Producto</td>
						<td>Modelo del Producto</td>
						<td>Cantidad</td>
						<td>Precio Unitario</td>
					</tr>
				</thead>
				<%for(int i=0;i<ticket.getIdProducts().size();i++){ %>
				<tr>
					<!--COntenido de la tabla de productos con los arraylist6 -->
					<%for(Product product:products){ 
						if(product.getId().equals(ticket.getIdProducts().get(i))){%>
							<td><%=product.getName() %></td>
							<td><%=product.getDescription() %></td>
							<td><%=product.getMarca() %></td>
							<td><%=product.getModel() %></td>
							<td><%=ticket.getCantidad().get(i) %></td>
							<td><%=product.getPrice() %></td>
					<%}} %>
				</tr>
				<%} %>
			</table>
		</div>
		<br>
		<form action="/tickets/delete" method="get">
			<input type="hidden" value="<%=ticket.getId()%>" name="id">
			<input class="boton" type="submit" value="Borrar">
		</form>
		<form action="/tickets/edit" method="get">
			<input type="hidden" value="<%=ticket.getId()%>" name="id">
			<input class="boton" type="submit" value="Editar">
		</form>
		<div class=link>
			<a href="/tickets" title="Añadir Boleta">Lista de Boletas</a>
		</div>
	</div>
</body>
</html>