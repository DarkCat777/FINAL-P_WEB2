<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.Role"%>
   
<!DOCTYPE html>
<html lang="es">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Añadir Rol</title>
<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">

<%
	List<Role> roles = (List<Role>) request.getAttribute("roles");
	if(roles.size()>0){
%>

<script>
function comprobar(){
	var rol = document.formulario.nameRol.value;
	<%
		for(int i=0; i<roles.size(); i++) {
			Role rol = (Role) roles.get(i);
	%>
	
	var rol2="<%=rol.getName()%>";
	
	if(rol == rol2){
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

<%} %>
</head>
<body>
	<jsp:include page="../Menu/menu2.jsp" flush="true"/>

	<div class="contenedor-form">
		<div class="formulario">
			<form action="/role/add"  name = "formulario" method="post" onsubmit="return comprobar()">
				<h1>Añadir Nuevo Rol</h1>
				
				<p>Ingrese el nombre del Rol</p>
				<input type="text" id="nameRol" name="nameRol" placeholder="Ingrese el nombre del rol">
				
				<p>Seleccione su estado</p>
				<select name="status">	
					<option value="true">true</option>
					<option value="false">false</option>
				</select>
				
				<input type="submit" id="submit" value="Crear Rol">
				
			</form>
			<script>
				(function(){
					
					var formulario = document.getElementsByName('formulario')[0],
						elementos = formulario.elements,
						boton = document.getElementById('submit');
					
					var validarNombre = function(e){
						if(formulario.nombre.value == ""){
							alert("Llene el campo nombre");
							e.preventDefault();
						}
						else if(isNaN(formulario.nombre.value)===false){
							alert("El campo NOMBRE solo debe contener letras");
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