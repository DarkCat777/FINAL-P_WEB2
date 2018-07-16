<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Resource"%>
<%
	List<Resource> resourcesComp = (List<Resource>)request.getAttribute("resourcesComp");
	Resource resources = (Resource) request.getAttribute("resources");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Editar Resource</title>
	<link rel="stylesheet" type="text/css" href="/css/estilosEdit.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	
	<script>
function comprobar(){
	var resource = document.formulario.url.value;
	var edit = "<%=resources.getUrl()%>";
	<%
	Resource resource = null;
		for(int i=0; i<resourcesComp.size(); i++) {
			Resource resource1 = (Resource) resourcesComp.get(i);
	%>
	
	var resource2="<%=resource1.getUrl()%>";
	
	if(resource == resource2 && resource != edit){
		alert("Este url ya existe!!");
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
			<form action="/resources/edit" method="post" name="formulario" onsubmit="return comprobar()">
				<h1>Editar Resource</h1>
				
				<p>Edite el nombre del resource</p>
				<input type="text" name="url"  placeholder="Ingrese su url"
				value="<%=resources.getUrl()%>" required>
				 
				<p>Edite su estado</p>
				<select name="status">	
					<option value="true">true</option>
					<option value="false">false</option>
				</select>
				<input type="hidden" name="id" value="<%=resources.getId()%>">
				<input type="submit" name="submit" value="Editar Información">
			</form>
			<script>
				(function(){
					
					var formulario = document.getElementsByName('formulario')[0],
						elementos = formulario.elements,
						boton = document.getElementById('submit');
					
					var validarNombre = function(e){
						if(formulario.nombre.value == ""){
							alert("Llene el campo NOMBRE DEL RESOURCE");
							e.preventDefault();
						}
						else if(isNaN(formulario.nombre.value)===false){
							alert("El campo NOMBRE DEL RESOURCE solo debe contener letras");
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
		<a href="/resources"><img src="/img/logo.png"></a>
	</div>
</body>
</html>