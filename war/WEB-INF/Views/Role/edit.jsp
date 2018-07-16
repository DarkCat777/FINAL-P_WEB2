<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Role"%>
<%
	List<Role> rolesComp = (List<Role>)request.getAttribute("rolesComp");
	Role roles = (Role) request.getAttribute("roles");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Editar Rol</title>
	<link rel="stylesheet" type="text/css" href="/css/estilosEdit.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">

<script>
function comprobar(){
	var rol = document.formulario.nameRol.value;
	var roledit = "<%=roles.getName()%>";
	<%
		for(int i=0; i<rolesComp.size(); i++) {
			Role rol1 = (Role) rolesComp.get(i);
	%>
	
	var rol2="<%=rol1.getName()%>";
	
	if(rol == rol2 && rol != roledit){
		alert("Este Rol ya existe!!");
		return false;
		
	}
	<%}%>
	else{
		document.forms['formulario']['submit'].disabled=true;
	}

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
			<form action="/role/edit" method="post" name="formulario" onsubmit="return comprobar()">
				<h1>Editar Rol</h1>
				
				<p>Edite el nombre del rol</p>
				<input type="text" name="nameRol"   placeholder="Ingrese el nombre del rol" value="<%=roles.getName()%>" required>
				 
				<p>Edite su estado</p>
				<select name="status">	
					<option value="true">true</option>
					<option value="false">false</option>
				</select>
				<input type="hidden" name="id" value="<%=roles.getId()%>">
				<input type="submit" name="submit" value="Editar Información">
			</form>
			<script>
				(function(){
					
					var formulario = document.getElementsByName('formulario')[0],
						elementos = formulario.elements,
						boton = document.getElementById('submit');
					
					var validarNombre = function(e){
						if(formulario.nombre.value == ""){
							alert("Llene el campo NOMBRE DEL ROL");
							e.preventDefault();
						}
						else if(isNaN(formulario.nombre.value)===false){
							alert("El campo NOMBRE DEL ROL solo debe contener letras");
							e.preventDefault();
						}
					}
					var validar = function(e){
						validarNombre(e);
					}
					
					formulario.addEventListener("submit",validar);
					
					
				}())	
			</script>
		</div>
		<a href="/role"><img src="/img/logo.png"></a>
	</div>
</body>
</html>