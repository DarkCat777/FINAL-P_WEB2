<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.access.AccessControllerIndex"%>
<%@ page import="model.entity.Access"%>
<%@ page import="model.entity.Resource"%>
<%@ page import="model.entity.Role"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%

	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");

	List<Access> access = (List<Access>)request.getAttribute("access");

	List<Role> roles = (List<Role>)request.getAttribute("roles");
	List<Resource> resources = (List<Resource>)request.getAttribute("resources");
	
	String almacenaRol="";
	String almacenaResource="";
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Lista de Access</title>
</head>
<body>
	<%if(true){%>
		<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<% }else { %>
	<p>Perro</p>
	<%} %>
	<div class="contenedor-form">
	<p>Lista de Access</p>
		<% if (access.isEmpty()){ %>
		<p>No se encuentran access. Añada nuevos</p>
		<%} else { %>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Rol</th>
					<th>Resource</th>
					<th>Status</th>
					<th>Creado</th>
				</tr>
			</thead>
			<% for (Access a: access){%>
			<tr>
				<td><a id="cambiaColor" href="/access/view?id=<%=a.getId()%>"><%=a.getId()%></a></td>
				
				<!--  ROLES -->
				<%if(roles.isEmpty()){ %>
					<td>Asigne un Rol</td>
				<%}else{%>
					<% for (Role r: roles){%>
						<%if(r.getId().equals(a.getIdRole())){
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
				
				<!--  RESOURCES -->
				<%if(resources.isEmpty()){ %>
					<td>Asigne un Resource</td>
				<%}else{%>
					<% for (Resource re: resources){%>
						<%if(re.getId().equals(a.getIdUrl())){
							almacenaResource=re.getUrl();%>
						<%} %>
					<%} %>	
					<% if(almacenaResource.equals("")) {%>
						<td>Asigne un Resource2 </td>
					<%} else { %>
						<td><%= almacenaResource %></td>
						<%= almacenaResource="" %>
					<%} %>		
				<%} %>
				<td><%=a.isStatus() %></td>
				<td><%=sdf.format(a.getCreate()) %></td>
			</tr>
			<%} %>
		</table>
		<%} %>
		<div class="link">
			<a id="add"href="/access/add" title="Añadir Access"><img alt="Añadir access" src="img/add.png" id="img"></a>
		</div>
	</div>
</body>
</html>