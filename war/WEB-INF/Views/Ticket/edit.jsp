<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*" %>
<%
	Ticket ticket = (Ticket) request.getAttribute("ticket");
	Users user = (Users) request.getAttribute("user");
	List<Product> products = (List<Product>) request.getAttribute("products");
 %>    
<!DOCTYPE html>
<html>
<head>
<style>
	td{
		color:black;
	}	
</style>

<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<meta>
<title>Update</title>

<link rel="stylesheet" type="text/css" href="../tabla.css">


<link rel="icon" type="image/png" href="favicon.ico">
</head>

<body>

<jsp:include page="../Menu/menu2.jsp" flush="true" />

	<div class="contenedor-form">
		<div id="contenido">
			<div class="titulo">
				<h1>Editar Boleta</h1>
			</div>
			<br>
			<div class="contenidoFactura">
				<div class="vista">
					<table>
						<thead>
							<tr>
								<th>Nombre </th>
								<th>Dirección </th>
								<th>Fecha</th>
								<th>SUB Total</th>
								<th>IGV:(18%)</th>
								<th>Total</th>
								<th>Codigo de la Factura</th>
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
								<td>Quitar</td>
							</tr>
						</thead>
						<%
							for (int i = 0; i < ticket.getIdProducts().size(); i++) {
						%>
						<tr>
							<!--COntenido de la tabla de productos con los arraylist6 -->
							<%
								for (Product product : products) {
										if (product.getId().equals(ticket.getIdProducts().get(i))) {
							%>
							<td><%=product.getName()%></td>
							<td><%=product.getDescription()%></td>
							<td><%=product.getMarca()%></td>
							<td><%=product.getModel()%></td>
							<td><%=ticket.getCantidad().get(i)%></td>
							<td><%=product.getPrice()%></td>
							<td>
								<form action="/tickets/edit" method="post">
									<input type="hidden" name="id" value="<%=ticket.getId()%>">
									<input type="hidden" name="operacion" value="eliminar">
									<input type="hidden" name="idproduct" value="<%=product.getId()%>">
									<input type="submit" value="Quitar producto">
								</form>
							</td>
							<%
								}
									}
							%>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>
			<div class="formularioAñadirProducto">
				<h3>Añadir mas productos</h3>
				<form action="/tickets/edit" method="post">
				<input type="hidden" name="id" value="<%=ticket.getId()%>">
					<input type="hidden" name="operacion" value="anadir"> <label>Producto</label><br>
					<select name="idproduct">
						<%
							for (Product product : products) {
						%>
						<option value="<%=product.getId()%>"><%=product.getName()%></option>
						<%
							}
						%>
					</select> <br> <label>Cantidad</label><br> <input type="number"
						min="1" name="cantidad" required>
					<input type="submit" value="Añadir a la Boleta">
				</form>
			</div>
			<div class="link">
				<a id="add" href="/tickets" class="link" title="Lista de Facturas">Lista
					de Boletas</a>
			</div>
		</div>
	</div>
</body>
</html>