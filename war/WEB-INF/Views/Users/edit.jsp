<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.entity.Users"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Role"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
	List<Role> roles = (List<Role>)request.getAttribute("roles");
%>
<%
	List<Users> users = (List<Users>)request.getAttribute("users");
	Users user = (Users) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Editar Usuario</title>
	<link rel="stylesheet" type="text/css" href="/css/estilosEdit.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	
	<script>
	function comprobar(){
		var email = document.formulario.email.value;
		var email1 = "<%=user.getEmail()%>";
		
		<%
			for(int i=0; i<users.size(); i++) {
				Users user1 = (Users) users.get(i);
		%>
		
		var email2="<%=user1.getEmail()%>";
		
		if(email == email2 && email!=email1){
			alert("Este email ya existe!!");
			return false;
			
		}
		<%}%>else{
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
			<form action="/user/edit" method="post" name="formulario" onsubmit="return comprobar()">
				<h1>Editar Usuario</h1>
				
				<p>Edite su nombre</p>
				<input type="text" name="name"  placeholder="Ingrese su nombre" value="<%=user.getName()%>" required>
				
				<p>Edite su Ciudad de Origen</p>
				<input type="text"name="city" placeholder="Ingrese su ciudad" value="<%=user.getCity()%>" required>
				
				<p>Ingrese su fecha de Nacimiento</p>
				<input type="date" id="birth" name="birth"
				placeholder="edite su fecha de Nacimiento" value="<%=sdf.format(user.getBirth())%>" required>
				
				<p>Edite su número de celular</p>
				<input type="text" name="cellphone" placeholder="Ingrese su celular" value="<%=user.getCellphone()%>" required>
				
				<p>Edite su correo</p>
				<input type="email" name="email" placeholder="Ingrese su correo electronico" value="<%=user.getEmail()%>" required> 
				<p>Edite su género</p>
				<% String hc="", mc="";
				if (user.isGender()) hc="checked"; else mc="checked";%>
				<div class="radio">
					<input type="radio" name="gender" id="hombre" value="true" <%=hc %>> <label for="hombre">Masculino</label>
					<input type="radio" name="gender" id="mujer" value="false" <%=mc %>> <label for="mujer">Femenino</label>
				</div>
				<p>Edite su rol</p>
				<select name="idroles">
				<% for (Role r: roles){ %>		
					<option value="<%=r.getId()%>"><%=r.getName() %></option>
				<%} %>
				</select>
				<p>Edite su estado</p>
				<select name="status">	
					<option value="true">true</option>
					<option value="false">false</option>
				</select>
				<input type="hidden" name="id" value="<%=user.getId()%>">
				<input type="submit" name="submit" value="Editar Información">
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
					var validarCiudad = function(e){
						if(formulario.ciudad.value == ""){
							alert("Llene el campo ciudad");
							e.preventDefault();
						}
						else if(isNaN(formulario.ciudad.value)===false){
							alert("El campo CIUDAD solo debe contener letras");
							e.preventDefault();
						}
					}
					var validarEdad = function(e){
						if(formulario.edad.value == ""){
							alert("Llene el campo edad");
							e.preventDefault();
						}
						else if(formulario.edad.value <= 18 && formulario.edad.value >=65 ){
							alert("Usted debe tener entre 18 y 65 años para registrarse");
							e.preventDefault();
						}
					}
					var validarCelular = function(e){
						if(formulario.celular.value == ""){
							alert("Llene el campo celular");
							e.preventDefault();
						}
						else if(isNaN(formulario.celular.value)){
							alert("Compelete el campo CELULAR solo con números");
							e.preventDefault();
						}
						else if(formulario.celular.value.length < 9 || formulario.celular.value.length > 9){
							alert("El campo celular debe contener un número de 9 digitos");
							e.preventDefault();
						}
					}
					var validarCorreo = function(e){
						if(formulario.correo.value == ""){
							alert("Llene el campo correo");
							e.preventDefault();
						}
					}
					var validar = function(e){
						validarNombre(e);
						validarCiudad(e);
						validarEdad(e);
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

