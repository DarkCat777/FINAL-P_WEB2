<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%
List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
List<Product> products = (List<Product>) request.getAttribute("products");
List<Users> users = (List<Users>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Ticket Index</title>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<link rel="stylesheet" type="text/css" href="../tabla.css">

</head>

<body background="fondo.png">
<jsp:include page="../Menu/menu2.jsp" flush="true"/>
					<div class="contenedor-form">
						<div class="titulo">
							<h1>Tickets Disponibles</h1>
						</div>
						<div >
							<a href="/tickets/add" class="link" title="Añadir Ticket">Añadir Ticket</a>
						</div>
						<div class="vista">
						 	<%
								if (tickets.isEmpty()) {
							%>
							<h4>No se encuentran tickets. Añada tickets</h4>
							<%
								} else {
							%>
							<table>
							<thead>
								<tr>
									<th><b>Usuario</b></th>
									<th><b>Fecha de Boleta</b></th>
									<th><b>Código de la Boleta</b></th>
									<th><b>Operaciones</b></th>
								</tr>
								</thead>
								<%
									for (Ticket tick : tickets) {
								%>
								<tr class="contenido">
									<%for(Users us:users){
										if(us.getId().equals(tick.getIdUser())){%>
											<td><%=us.getEmail()%></td>
									<% }}%>
									<td><%=tick.getCreate()%></td>
									<td><%=tick.getId()%></td>
									<td>
										<a href="/tickets/view?id=<%=tick.getId()%>">Ver</a>
										<a href="/tickets/edit?id=<%=tick.getId()%>">Editar</a>
										<a href="/tickets/delete?id=<%=tick.getId()%>">Borrar</a>
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

</body>
</html>