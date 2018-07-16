<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.product.ProductControllerIndex"%>
<%@ page import="model.entity.Product"%>
<%
	List<Product> products = (List<Product>) request.getAttribute("products");
%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NET & JAC</title>
</head>



<body>
	<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<div class="contenedor-form">
				<p>Lista de Productos</p>
				<%
					if (products.isEmpty()) {
				%>
				<p>No se encuentran productos.Añada Productos</p>
				<%
					} else {
				%>
				<table>
						<thead>
						<tr>
							<th>ID</th>
							<th>Nombre</th>
							<th>Marca</th>
							<th>Modelo</th>
							<th>Descripcion</th>
							<th>Precio</th>
							<th>Descuento</th>
							<th>Estado</th>
							<th>Stock</th>
							<th>Creado</th>
						</tr>
				</thead>
				<%
					for (Product p : products) {
				%>
				<tr>
							<td><a href="/product/view?id=<%=p.getId()%>"> <%=p.getId()%></a></td>
							<td><%=p.getName()%></td>
							<td><%=p.getMarca()%></td>
							<td><%=p.getModel()%></td>
							<td><%=p.getDescription()%></td>
							<td><%=p.getDescuento()%></td>
							<td><%=p.getPrice()%></td>
							<td><%=p.isStatus()%></td>
							<td><%=p.getStock()%></td>
							<td><%=p.getMade()%></td>

						</tr>
						<%
							}
						%>
				</table>
				<%
					}
				%>
	</div>

</body>
</html>

