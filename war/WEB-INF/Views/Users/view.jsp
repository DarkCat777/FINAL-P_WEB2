<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Users"%>
<%@page import="model.entity.Role" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Users user = (Users) request.getAttribute("user");
	List<Role> roles = (List<Role>)request.getAttribute("roles");
	String almacenaRol="";
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title><%=user.getName() %></title>
	<link rel="stylesheet" href="/css/vista.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
</head>
<body>
		<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<div class="contenido">
		<h2 id="id" name="<%=user.getId() %>">Perfil de Usuario: </h2>
		<table class="vertical-table">
			<tr>
				<th>ID de usuario</th>
				<td><%=user.getId()%></td>
			</tr>
			<tr>
				<th>Nombre</th>
				<td><%=user.getName()%></td>
			</tr>
			<tr>
				<th>Ciudad</th>
				<td><%=user.getCity()%></td>
			</tr>
			<tr>
				<th>Fecha de Nacimiento</th>
				<td><%=sdf.format(user.getBirth()) %></td>
			</tr>
			<tr>
				<th>Celular</th>
				<td><%=user.getCellphone()%></td>
			</tr>
			<tr>
				<th>Correo Electrónico</th>
				<td><%=user.getEmail()%></td>
			</tr>
			<tr>
				<th>Género</th>
				<td>
					<%if(user.isGender()){ %>
					Masculino
					<%} else{ %>
					Femenino
					<%} %>
				</td>
			</tr>
			<tr>
				<th>Rol</th>
				<%if(roles.isEmpty()){ %>
					<td>Asigne un rol</td>
				<%}else{%>
					<% for (Role r: roles){%>
						<%if(r.getId().equals(user.getIdRol())){
							almacenaRol=r.getName();%>
						<%} %>
					<%} %>	
					<% if(almacenaRol.equals("")) {%>
						<td>Asigne un Rol2 </td>
					<%} else { %>
						<td><%= almacenaRol %></td>
						<%= almacenaRol="" %>
					<%} %>
				<%} %>
			</tr>
			<tr>
				<th>Creado</th>
				<td><%=sdf.format(user.getMade())%></td>
			</tr>
			<tr>
				<th>Estado</th>
				<td><%=user.isStatus()%></td>
			</tr>
		</table>
		<div class ="links">
			<table>
				<tr>
					<th><a href="/user"><img src="/img/logo.png"></a></th>
					<td><a href="/user/edit?id=<%=user.getId() %>"><img src="/img/edit.png"></a></td>
					<th>
						<div class="borrar">
							<form action="/user/delete" method="post">
							<input type="hidden" value="<%=user.getId()%>" name="id"> 
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