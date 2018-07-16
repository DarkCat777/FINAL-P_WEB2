<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.resource.ResourceControllerIndex"%>
<%@ page import="model.entity.Resource"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
List<Resource> resources = (List<Resource>)request.getAttribute("resources");
SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Lista de Resources</title>
</head>
<body>
	<%if(true){%>
		<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<% }else { %>
	<p>Perro</p>
	<%} %>
	<div class="contenedor-form">
	<p>Lista de Resources</p>
		<% if (resources.isEmpty()){ %>
		<p>No se encuentran resources. Añada nuevos</p>
		<%} else { %>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nombre</th>
					<th>Estado</th>
					<th>Creado</th>
				</tr>
			</thead>
			<% for (Resource r: resources){%>
			<tr>
				<td><a id="cambiaColor" href="/resource/view?id=<%=r.getId()%>"><%=r.getId()%></a></td>
				<td><%=r.getUrl()%></td>
				<td><%=r.isStatus() %></td>
				<td><%=sdf.format(r.getCreate()) %></td>
			</tr>
			<%} %>
		</table>
		<%} %>
		<div class="link">
			<a id="add"href="/resource/add" title="Añadir Resource"><img alt="Añadir resource" src="img/add.png" id="img"></a>
		</div>
	</div>
</body>
</html>