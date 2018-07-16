<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.entity.Access"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Role"%>
<%@page import="model.entity.Resource"%>
<%
	List<Role> roles = (List<Role>)request.getAttribute("roles");
	List<Resource> resources = (List<Resource>)request.getAttribute("resources");
%>
<%
	
	List<Access> accessComp = (List<Access>) request.getAttribute("accessComp");
	Access access = (Access) request.getAttribute("access");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Editar Access</title>
	<link rel="stylesheet" type="text/css" href="/css/estilosEdit.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	
	
	
	<script>
	function comprobar(){
		var idrol = document.formulario.idrole.value;
		var idurl = document.formulario.idresource.value;
		
		var id="<%=access.getId()%>";
		
		<%
			for(int i=0; i<accessComp.size(); i++) {
				Access access1 = (Access) accessComp.get(i);
		%>
		
		var idrol2="<%=access1.getIdRole()%>";
		var idurl2="<%=access1.getIdUrl()%>";
		var id2="<%=access1.getId()%>";
		
		if(idrol === idrol2 && idurl === idurl2 && id2!=id){
			alert("Este Access ya existe!!");
			return false;
			
		}
		<%}%>
		document.forms['formulario']['submit'].disabled=true;

		return true;
	}
	</script>
</head>
<body>
	<%if(true){%>
		<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<% }else { %>
	<p>Perro</p>
	<%} %>
	<div class="contenedor-form">
		<div class="formulario">
			<form action="/access/edit" method="post" name="formulario" onsubmit="return comprobar()">
				<h1>Editar Access</h1>
				
				<p>Edite su rol</p>
				<select name="idrole">
				<% for (Role r: roles){ %>		
					<option value="<%=r.getId()%>"><%=r.getName() %></option>
				<%} %>
				</select>
				
				<p>Edite su resource</p>
				<select name="idresource">
				<% for (Resource re: resources){ %>		
					<option value="<%=re.getId()%>"><%=re.getUrl() %></option>
				<%} %>
				</select>
				
				<p>Edite su estado</p>
				<select name="status">	
					<option value="true">true</option>
					<option value="false">false</option>
				</select>
				<input type="hidden" name="id" value="<%=access.getId()%>">
				
				<input type="submit" id="submit" name="submit" value="Editar Información">
			</form>
		</div>
		<a href="/access"><img src="/img/logo.png"></a>
	</div>
</body>
</html>