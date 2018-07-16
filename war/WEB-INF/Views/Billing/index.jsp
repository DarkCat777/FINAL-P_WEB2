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
<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NET & JAC</title>
</head>

<body>
<jsp:include page="../Menu/menu2.jsp" flush="true"/>
				<div class="inner cover">
				<br><br><br><br>
					<div class="contenedor-form">
						<div class="titulo">
							<h1>Facturas Disponibles</h1>
						</div>
						<div >
							<a href="/billing/add" class="link" title="Añadir Factura">Añadir Factura</a>
						</div>
						<div class="vista">
						 	<%
								if (billings.isEmpty()) {
							%>
							<h4>No se encuentran facturas. Añada facturas</h4>
							<%
								} else {
							%>
							<table>
							<thead>
								<tr>
									<th><b>Empresa</b></th>
									<th><b>Producto</b></th>
									<th><b>Valor de Venta</b></th>
									<th><b>Fecha de Facturación</b></th>
									<th><b>Código de la Factura</b></th>
									<th><b>Operaciones</b></th>
								</tr>
								</thead>
								<%
									for (Billing bill : billings) {
								%>
								<tr class="contenido">
									<td><%=bill.getCustomer()%></td>
									<td><%=bill.getDescriptionProduct()%></td>
									<td><%=bill.getTotal()%></td>
									<td><%=bill.getDateIn()%></td>
									<td><%=bill.getId()%></td>
									<td>
										<a href="/billing/view?id=<%=bill.getId()%>">Ver</a>
										<a href="/billing/edit?id=<%=bill.getId()%>">Editar</a>
										<a href="/billing/delete?id=<%=bill.getId()%>">Borrar</a>
									</td>
								</tr>
								<%
									}
								%>
							</table>
							<%
								}
							%>
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

