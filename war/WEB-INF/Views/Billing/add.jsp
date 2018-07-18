<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%
	List<Product> products = (List<Product>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Añadir Billing</title>
<style>
	b, label{
		color:black;
	}
</style>
</head>

<body>
	<jsp:include page="../Menu/menu2.jsp" flush="true"/>
				<div class="contenedor-form">
					<div id="c">
						<div class="titulo">
							<h1>Añadir Factura</h1>
						</div>
						<div class="formulario">
							<form action="/billing/add" method="post">
								<label>Productos</label><br>
								<%if(!products.isEmpty()){ %>
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
							<a href="/billing" class="link"><h4>Lista de Facturas</h4></a>
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

