<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.role.RoleControllerIndex"%>
<%@ page import="model.entity.Role"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	List<Role> roles = (List<Role>)request.getAttribute("roles");
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Lista de Roles</title>
</head>
<body>
	<%if(true){%>
		<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<% }else { %>
	<p>Perro</p>
	<%} %>
	<div class="contenedor-form">
	<p>Lista de Roles</p>
		<% if (roles.isEmpty()){ %>
		<p>No se encuentran roles. Añada nuevos</p>
		<%} else { %>
		<table>
			<thead>
				<tr>
					<th>Acciones</th>
					<th>Nombre</th>
					<th>Estado</th>
					<th>Creado</th>
				</tr>
			</thead>
			<% for (Role r: roles){%>
			<tr>
				<td>
					<a id="cambiaColor" href="/role/view?id=<%=r.getId()%>">Ver</a>
					<a id="cambiaColor" href="/role/edit?id=<%=r.getId()%>">Editar</a>
					<a id="cambiaColor" href="/role/delete?id=<%=r.getId()%>">Borrar</a>
				</td>
				<td><%=r.getName()%></td>
				<td><%=r.isStatus() %></td>
				<td><%=sdf.format(r.getMade()) %></td>
			</tr>
			<%} %>
		</table>
		<%} %>
		<div class="link">
			<a id="add"href="/role/add" title="Añadir Rol"><img alt="Añadir usuario" src="img/add.png" id="img"></a>
		</div>
	</div>
</body>
</html>