<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%@ page import="com.google.appengine.api.users.*"%>
<%
	List<Billing> billings = (List<Billing>) request.getAttribute("billings");
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
	<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Añadir Billing</title>
<style>
	b{
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
								<label><b>Nombre de la Empresa: </b></label> <br> <input
									type="text" name="customer" class="dato"
									placeholder="Ingrese el nombre de la empresa" required>
								<br> <label><b>Dirección:</b></label> <br> <input
									type="text" name="address" class="dato"
									placeholder="Ingrese la direccion de la empresa" required>
								<br> <label><b>Producto:</b></label> <br> <input
									type="text" name="descriptionproduct" class="dato"
									placeholder="Ingrese la nombre del producto" required>
								<br> <label><b>Precio Unitario:</b></label> <br>
								<input type="text" name="unitpriceproduct" class="dato"
									placeholder="Ingrese precio unitario del producto" pattern="^[0-9]+(.[0-9]+)?$" required>
								<br> <label><b>Cantidad:</b></label> <br> <input
									type="text" name="mount" class="dato"
									placeholder="Ingrese la direccion de la empresa" pattern="^[0-9]+(.[0-9]+)?$" required>
								<br> <input class="boton" type="submit"
									value="Añadir">
							</form>
						</div>
						<div class=link>
							<a href="/billing"  class="link"><h4>Lista de Facturas</h4></a>
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

