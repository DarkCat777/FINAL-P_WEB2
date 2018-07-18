<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="model.entity.*" %>
<%@ page import="java.util.*"%>

<%
	List<Product> products = (List<Product>)request.getAttribute("productos");
	List<Cart> carts = (List<Cart>)request.getAttribute("cartsuser");
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Carrito</title>
</head>
<body>

	<jsp:include page="../Menu/menu2.jsp" flush="true"/>
<%if(carts.size()>0){%>

	<table>
		<thead>
		<tr>
			<th>Productos añadidos</th>
			<th>Descripción</th>
			<th>Disponibilidad</th>
			<th>Precio</th>
			<th>Cantidad</th>
			<th></th>
			<th>Total</th>
		</tr>
		</thead>
		<%
			int cantidad=0;
			double precio=0;
			double total=0;
		%>
		
		<%for(int i=0; i<carts.size(); i++){%>
			<tr>
				<%for(int j=0; j<products.size(); j++){%>
					<%if(carts.get(i).getIdProduct().equals(products.get(j).getId())){%>
						<th><%=products.get(j).getName()%></th>
						<th><%=products.get(j).getDescription()%></th>
						<%if(products.get(j).getStock()>0)%>
							<th>En Stock</th>
						<th><%=products.get(j).getPrice()%></th>
					<%
					  precio = products.get(j).getPrice();
					  cantidad = carts.get(i).getCantidad();
					  total += (precio*cantidad);
					  }
				  }%>
				  
				  <th><%=carts.get(i).getCantidad()%></th>
				  <th><a href="/cart/delete?idproduct=<%=carts.get(i).getIdProduct()%>">Quitar</a></th>
				  <th><%=(cantidad*precio)%></th>
			</tr>
		<%}%>
		<tr>
			<th></th><th></th><th></th><th></th><th></th><th>TOTAL</th>
			<th><%=total%></th>
		</tr>
		<tr>
			<th>Pagar</th>
			<th>
				<form action="/cart/view" method="get">
					<select name="pago">
						<option value="boleta"> Boleta </option>
						<option value="factura"> Factura </option>
					</select>
					<input type="submit" value="Enviar">
				</form>
			</th>
		</tr>
	</table>
	
<%} else{%>
	<h1>No se han añadido productos a su carrito</h1>
<%}%>

</body>
</html>