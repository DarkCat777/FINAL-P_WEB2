<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%
	List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
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
	<%
		if (tickets.size() > 0) {
	%>
	<div id="topbar">
	<h1>Tickets</h1>
	</div>
	
	<div id="table">
	<table>
	<thead>
		<tr>
			<th>Id</th>
			<th>Cliente</th>
			<th>Direccion</th>
			<th>Descripcion</th>
			<th>Estado</th>
			<th>Opciones</th>
		</tr>
		</thead>
		<%
			for (int i = 0; i < tickets.size(); i++) {
					Ticket tick = (Ticket) tickets.get(i);
		%>
		<tr>
			<td><%=tick.getId()%></td>
			<td><%=tick.getNameCustomer()%></td>
			<td><%=tick.getAddress()%></td>
			<td><%=tick.getDescriptionProduct()%></td>
			<td><%=tick.isStatus()%></td>
			<td><a href="/tickets/view?id=<%=tick.getId()%>">View</a> <a href="/tickets/edit?id=<%=tick.getId()%>">Edit</a> <a href="/tickets/delete?id=<%=tick.getId()%>">Delete</a></td>
		</tr>
		<%
			}
		%>
	</table>
	</div>
	<%}else {%>
		<div id="topbar">
		<h1>No hay Tickets que mostrar</h1>
		</div>
	<%} %>

<ul id="list">
<li><a href="/tickets/add">Nuevo Ticket</a></li>
</ul>
</div>
</body>
</html>