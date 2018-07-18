<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%@page import="java.util.Date"%>
<%
	Billing billing = (Billing) request.getAttribute("billing");
	Users user = (Users) request.getAttribute("user");
	List<Product> products = (List<Product>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editar Billing</title>
<style>
b, h2 {
	color: black;
}
</style>
</head>

<body>
	<jsp:include page="../Menu/menu2.jsp" flush="true" />

	<div class="contenedor-form">
		<div id="contenido">
			<div class="titulo">
				<h1>Editar Factura</h1>
			</div>
			<br>
			<div class="contenidoFactura">
				<div class="vista">
					<table>
						<thead>
							<tr>
								<th>Nombre de la Empresa</th>
								<th>Dirección de la Empresa</th>
								<th>Fecha</th>
								<th>SUB Total</th>
								<th>IGV:(18%)</th>
								<th>Total</th>
								<th>Codigo de la Factura</th>
							</tr>
						</thead>
						<tr>
							<td><%=user.getName() %></td>
							<td><%=user.getCity() %></td>
							<td><%=billing.getDateCreate() %></td>
							<td><%=billing.getTotal() %></td>
							<td><%=(billing.getTotal()*billing.getIgv()) %></td>
							<td><%=(billing.getTotal()*(billing.getIgv()+1)) %></td>
							<td><%=billing.getId() %></td>
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
						<tr>
						<!--COntenido de la tabla de productos con los arraylist6 -->
						</tr>
					</table>
				</div>
			</div>
			<div class="formularioAñadirProducto">
				<h3>Añadir mas productos</h3>
				<form action="/billing/edit" method="post">
					<input type="hidden" name="operación" value="añadir"> <label>Producto</label><br>
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
				</form>
			</div>
			<div class="link">
				<a id="add" href="/billing" class="link" title="Lista de Facturas">Lista
					de Facturas</a>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="/JS/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="/JS/ie10-viewport-bug-workaround.js"></script>
</body>
</html>




