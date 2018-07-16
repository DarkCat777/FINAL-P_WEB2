<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.entity.Role"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Role roles = (Role) request.getAttribute("roles");
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title><%=roles.getName() %></title>
	<link rel="stylesheet" href="/css/vista.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
</head>
<body>
	<%if(true){%>
		<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<% }else { %>
	<p>Perro</p>
	<%} %>
	<div class="contenido">
		<h2 id="id" name="<%=roles.getId() %>">Datos del Rol </h2>
		<table class="vertical-table">
			<tr>
				<th>ID del rol</th>
				<td><%=roles.getId()%></td>
			</tr>
			<tr>
				<th>Nombre del Rol</th>
				<td><%=roles.getName()%></td>
			</tr>
			<tr>
				<th>Fecha de Creación</th>
				<td><%=sdf.format(roles.getMade())%></td>
			</tr>
			<tr>
				<th>Estado</th>
				<td><%=roles.isStatus()%></td>
			</tr>
		</table>
		<div class ="links">
			<table>
				<tr>
					<th><a href="/role"><img src="/img/logo.png"></a></th>
					<td><a href="/role/edit?id=<%=roles.getId() %>"><img src="/img/edit.png"></a></td>
					<th>
						<div class="borrar">
							<form action="/role/delete" method="post">
							<input type="hidden" value="<%=roles.getId()%>" name="id"> 
							<input type="image" src="/img/elimina.png" heigth="50px">
						</form>
						</div>
					</th>
				</tr>
				</table>
			</div>
		</div>
	</body>
</html>