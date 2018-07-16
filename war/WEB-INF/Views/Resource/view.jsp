<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.entity.Resource"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Resource resources = (Resource) request.getAttribute("resources");
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title><%=resources.getUrl() %></title>
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
		<h2 id="id" name="<%=resources.getId() %>">Datos del Resource </h2>
		<table class="vertical-table">
			<tr>
				<th>ID del resource</th>
				<td><%=resources.getId()%></td>
			</tr>
			<tr>
				<th>Nombre del Resource</th>
				<td><%=resources.getUrl()%></td>
			</tr>
			<tr>
				<th>Fecha de Creación</th>
				<td><%=sdf.format(resources.getCreate())%></td>
			</tr>
			<tr>
				<th>Estado</th>
				<td><%=resources.isStatus()%></td>
			</tr>
		</table>
		<div class ="links">
			<table>
				<tr>
					<th><a href="/resource"><img src="/img/logo.png"></a></th>
					<td><a href="/resource/edit?id=<%=resources.getId() %>"><img src="/img/edit.png"></a></td>
					<th>
						<div class="borrar">
							<form action="/resource/delete" method="post">
							<input type="hidden" value="<%=resources.getId()%>" name="id"> 
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