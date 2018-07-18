<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>

<% 
	List<Product> products = (List<Product>) request.getAttribute("products");

%> 

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">

<title>Create</title>

<link rel="stylesheet" type="text/css" href="../tabla.css">
<style type="text/css">
 td{
 	color: black;
 }
</style>
</head>

<body>

	<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<div class="contenedor-form">
					<div id="c">
						<div class="titulo">
							<h1>Añadir Boleta</h1>
						</div>
						<div class="formulario">
							<form action="/tickets/add" method="post">
								<label>Productos</label><br>
								<%if(!products.isEmpty()){ %>
								<label>DNI</label>
								<input type="text" placeholder="Inrgrese DNI" name="dni">
								<select name="idproduct">
									<%for(Product product:products){ %>
									<option value="<%=product.getId()%>"><%=product.getName() %></option>
									<%}%>
								</select><br>
								<label>Cantidad</label><br>
								<input type="number" min="1" name="cantidad">
								<%} else{%>
								<a href="/product/add">Añadir producto</a>
								<%} %>
								<input type="submit" value="Añadir">
							</form>
						</div>
						<div class=link>
							<a href="/tickets" class="link"><h4>Lista de Boletas</h4></a>
						</div>
					</div>
				</div>

</body>
</html>