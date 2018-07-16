<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Role"%>
<%@page import="model.entity.Users"%>
<%
	List<Role> roles = (List<Role>)request.getAttribute("roles");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Añadir usuario</title>
<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">

<%
	List<Users> users = (List<Users>) request.getAttribute("users");
	if(users.size()>0){
%>

<script>
function comprobar(){
	var email = document.formulario.email.value;
	<%
		for(int i=0; i<users.size(); i++) {
			Users user = (Users) users.get(i);
	%>
	
	var email2="<%=user.getEmail()%>";
	
	if(email == email2){
		alert("Este usuario ya esta registrado!!");
		return false;
		
	}
	<%}%>
	else{
		document.forms['formulario']['submit'].disabled=true;
	}

}
</script>

<%} %>
</head>
<body>
	
	<jsp:include page="../Menu/menu2.jsp" flush="true"/>

	<div class="contenedor-form">
		<div class="formulario">
			<form action="/user/add"  name = "formulario" method="post" onsubmit="return comprobar()">
				<h1>Añadir Usuario</h1>
				
				<p>Ingrese su nombre </p>
				<input type="text" id="name" name="name" placeholder="Ingrese su nombre" required>
				
				<p>Ingrese su ciudad</p>
				<input type="text" id="city" name="city"  placeholder="Ingrese su ciudad" required>
				
				<p>Ingrese su fecha de Nacimiento</p>
				<input type="date" id="birth" name="birth" 
				placeholder="Ingrese su fecha de Nacimiento" required>
				
				<p>Ingrese su número de celular </p>
				<input type="text" id="cellphone" name="cellphone" placeholder="Ingrese su número de celular" required>
				
				<p>Ingrese su correo </p>
				<input type="email" id="email" name="email" placeholder="Ingrese su correo electrónico" required>
				
				<p>Seleccione su género </p>
				<div class="radio">
					<input type="radio" name="gender" id="hombre" value="true" checked> <label for="hombre">Masculino</label>
					<input type="radio" name="gender" id="mujer" value="false"> <label for="mujer">Femenino</label>
				</div>
				
				<p>Seleccione su rol </p>
				<select name="idroles">
				<% for (Role r: roles){ %>
					<option value="<%=r.getId()%>"><%=r.getName() %></option>
				<%} %>
				</select>
				<input type="submit" id="submit" name="submit" value="Crear Usuario">
				
			</form>
			<script>
				(function(){
					
					var formulario = document.getElementsByName('formulario')[0],
						elementos = formulario.elements,
						boton = document.getElementById('submit');
					
					var validarNombre = function(e){
						if(formulario.name.value == ""){
							alert("Llene el campo nombre");
							e.preventDefault();
						}
						else if(isNaN(formulario.name.value)===false){
							alert("El campo NOMBRE solo debe contener letras");
							e.preventDefault();
						}
					}
					var validarCiudad = function(e){
						if(formulario.city.value == ""){
							alert("Llene el campo ciudad");
							e.preventDefault();
						}
						else if(isNaN(formulario.city.value)===false){
							alert("El campo CIUDAD solo debe contener letras");
							e.preventDefault();
						}
					}
					var validarCelular = function(e){
						if(formulario.cellphone.value == ""){
							alert("Llene el campo celular");
							e.preventDefault();
						}
						else if(isNaN(formulario.cellphone.value)){
							alert("Compelete el campo CELULAR solo con números");
							e.preventDefault();
						}
						else if(formulario.cellphone.value.length < 9 || formulario.cellphone.value.length > 9){
							alert("El campo celular debe contener un número de 9 digitos");
							e.preventDefault();
						}
					}
					var validarCorreo = function(e){
						if(formulario.email.value == ""){
							alert("Llene el campo correo");
							e.preventDefault();
						}
					}
					var validar = function(e){
						validarNombre(e);
						validarCiudad(e);
						validarCelular(e);
						validarCorreo(e);
					}
					
					formulario.addEventListener("submit",validar);
					
					
				}())	
			</script>
		</div>
		<a href="/users"><img src="/img/logo.png"></a>
	</div>
</body>
</html>

