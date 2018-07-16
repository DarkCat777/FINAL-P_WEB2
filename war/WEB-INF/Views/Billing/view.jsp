<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.entity.*"%>
<%@ page import="com.google.appengine.api.users.*"%>
<%
	Billing billing = (Billing) request.getAttribute("billing");
	UserService use = UserServiceFactory.getUserService();
	User user = use.getCurrentUser();
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
			<div class="titulo">
				<h1>Factura</h1>
			</div>
			<div class="vista">
			<table>
				<thead>
					<tr>
						<th>Nombre de la Empresa</th>
						<th>Dirección de la Empresa</th>
						<th>Fecha</th>
						<th>Producto</th>
						<th>Precio Unitario</th>
						<th>Cantidad</th>
						<th>SUB Total</th>
						<th>IGV:(18%)</th>
						<th>Total</th>
					</tr>
				</thead>
					<tr class="contenido">
						<td><%=billing.getCustomer()%></td>
						<td><%=billing.getAddress()%></td>
						<td><%=billing.getDateIn()%></td>
						<td><%=billing.getDescriptionProduct()%></td>
						<td><%=billing.getUnitPriceProduct()%></td>
						<td><%=billing.getMountProduct()%></td>
						<td><%=billing.getTotal()%></td>
						<td><%=(billing.getTotal() * 0.18)%></td>
						<td><%=(billing.getTotal() * 1.18)%></td>
					</tr>
			</table>
			</div>
			<br>
			<form action="/billing/delete" method="get">
				<input type="hidden" value="<%=billing.getId()%>" name="id">
				<input class="boton" type="submit" value="Borrar">
			</form>
			<form action="/billing/edit" method="get">
				<input type="hidden" value="<%=billing.getId()%>" name="id">
				<input class="boton" type="submit" value="Editar">
			</form>
			<div class=link>
				<a href="/billing" title="Añadir Factura">Lista de Facturas</a>
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



