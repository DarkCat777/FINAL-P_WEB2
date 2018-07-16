<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Role"%>
<%@page import="model.entity.Resource"%>
<%@page import="model.entity.Access" %>
<%
	List<Role> roles = (List<Role>)request.getAttribute("roles");
	List<Resource> resources = (List<Resource>)request.getAttribute("resources");
	
%>
<!DOCTYPE html>
<html lang="es">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Añadir Access</title>
<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">


<%
	List<Access> access = (List<Access>) request.getAttribute("access");
	if(access.size()>0){
%>
<script>
function comprobar(){
	var idrol = document.formulario.idrole.value;
	var idurl = document.formulario.idresource.value;
	<%
		for(int i=0; i<access.size(); i++) {
			Access access1 = (Access) access.get(i);
	%>
	
	var idrol2="<%=access1.getIdRole()%>";
	var idurl2="<%=access1.getIdUrl()%>";
	
	if(idrol == idrol2 && idurl === idurl2){
		alert("Este Access ya existe!!");
		return false;
		
	}
	<%}%>
	document.forms['formulario']['submit'].disabled=true;

	return true;
}
</script>

<%} %>
</head>
<body>
	<%if(true){%>
		<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<% }else { %>
	<p>Perro</p>
	<%} %>
	<div class="contenedor-form">
		<div class="formulario">
			<form action="/access/add"  name = "formulario" method="post" onsubmit="return comprobar()">
				<h1>Añadir Nuevo Access</h1>
				
				<p>Seleccione su rol </p>
				<select name="idrole">
				<% for (Role r: roles){ %>		
					<option value="<%=r.getId()%>"><%=r.getName() %></option>
				<%} %>
				</select>
				
				<p>Seleccione su resource </p>
				<select name="idresource">
				<% for (Resource r: resources){ %>		
					<option value="<%=r.getId()%>"><%=r.getUrl() %></option>
				<%} %>
				</select>
				
				<p>Seleccione su estado</p>
				<select name="status">	
					<option value="true">true</option>
					<option value="false">false</option>
				</select>
				
				
				<input type="submit" id="submit" name="submit" value="Crear Access">
				
			</form>
		</div>
		<a href="/access"><img src="/img/logo.png"></a>
	</div>
</body>
</html>