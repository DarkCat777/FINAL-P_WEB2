<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Añadir Resource</title>
<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">

<%
	List<Resource> resources = (List<Resource>) request.getAttribute("resources");
	if(resources.size()>0){
%>

<script>
function comprobar(){
	var resource = document.formulario.url.value;
	<%
		for(int i=0; i<resources.size(); i++) {
			Resource resource = (Resource) resources.get(i);
	%>
	
	var resource2="<%=resource.getUrl()%>";
	
	if(resource == resource2){
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
			<form action="/resource/add"  name = "formulario" method="post" onsubmit="return comprobar()">
				<h1>Añadir Nuevo Resource</h1>
				
				<p>Ingrese el nombre del Resource</p>
				<input type="text" id="url" name="url" placeholder="Ingrese el url del resource">
				
				<p>Seleccione su estado</p>
				<select name="status">	
					<option value="true">true</option>
					<option value="false">false</option>
				</select>
				
				<input type="submit" id="submit" name="submit" value="Crear Resource">
				
			</form>
			<script>
				(function(){
					
					var formulario = document.getElementsByName('formulario')[0],
						elementos = formulario.elements,
						boton = document.getElementById('submit');
					
					var validarNombre = function(e){
						if(formulario.nombre.value == ""){
							alert("Llene el campo nombre del RECURSO");
							e.preventDefault();
						}
						else if(isNaN(formulario.nombre.value)===false){
							alert("El campo NOMBRE DEL RECURSO debe solo debe contener letras");
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
		<a href="/resource"><img src="/img/logo.png"></a>
	</div>
</body>
</html>