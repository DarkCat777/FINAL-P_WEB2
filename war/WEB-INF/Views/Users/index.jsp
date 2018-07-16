<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.user.UsersControllerIndex"%>
<%@ page import="model.entity.Users"%>
<%@ page import="model.entity.Role"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	List<Users> users = (List<Users>)request.getAttribute("users");
	List<Role> roles = (List<Role>)request.getAttribute("roles");
	String almacenaRol="";
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Lista de Usuarios</title>
</head>
<body>
	<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<div class="contenedor-form">
	<p>Lista de Usuarios</p>
		<% if (users.isEmpty()){ %>
		<p>No se encuentran usuarios. Añada Usuarios</p>
		<%} else { %>
		<table>
			<thead>
				<tr>
					<th>Aciones</th>
					<th>Nombre</th>
					<th>Rol</th>
					<th>Correo electrónico</th>
					<th>Género</th>
					<th>Estado</th>
					<th>Creado</th>
				</tr>
			</thead>
			<% for (Users us: users){%>
			<tr>
				<td>
					<a id="cambiaColor" href="/user/view?id=<%=us.getId()%>">Ver</a>
					<a id="cambiaColor" href="/user/edit?id=<%=us.getId()%>">Editar</a>
					<a id="cambiaColor" href="/user/delete?id=<%=us.getId()%>">Borrar</a>
				</td>
				<td><%=us.getName()%></td>
				<%if(roles.isEmpty()){ %>
					<td>Asigne un Rol</td>
				<%}else{%>
					<% for (Role r: roles){%>
						<%if(r.getId().equals(us.getIdRol())){
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
				<td><%=us.getEmail()%></td>
				<td>
					<%if(us.isGender()){ %>
						Masculino
					<%} else{ %>
						Femenino
					<%} %>
				</td>
				<td><%=us.isStatus() %></td>
				<td><%=sdf.format(us.getMade()) %></td>
			</tr>
			<%} %>
		</table>
		<%} %>
		<div class="link">
			<a id="add"href="/user/add" title="Añadir Usuario"><img alt="Añadir usuario" src="img/add.png" id="img"></a>
		</div>
	</div>
</body>
</html>