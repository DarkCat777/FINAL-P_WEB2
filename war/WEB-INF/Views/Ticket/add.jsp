<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>

<% 
Date fecha = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");

List<Ticket> tickets = (List<Ticket>)request.getAttribute("tickets");

%> 

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">

<title>Create</title>

<link rel="stylesheet" type="text/css" href="../tabla.css">
<style type="text/css">
 td{
 	color: black;
 }
</style>
<script>
function comprobar(){
	var dni = document.formu.dni.value;
	
	<%
	for(int i=0; i<tickets.size(); i++){
		Ticket ticket = (Ticket)tickets.get(i);
	%>
	
	var dni1 = <%=ticket.getCustomerdni()%>;
	
  	if (dni.length != 8)
  	{
    	alert("No es un DNI valido!!");
		return false;
  	}else if(dni == dni1){
  		alert("El DNI ya existe!!");
  		return false;
  	}
  	<%}%>
  	else{
  		document.forms['formu']['Enviar'].disabled=true;
  	}
  	
  	return true;
}
</script>

</head>

<body>

<jsp:include page="../Menu/menu2.jsp" flush="true"/>
<div class="contenedor-form">
<h1>Añadir nuevo ticket</h1>
<form action="/tickets/add" name="formu"  method="post" onsubmit="return comprobar()">
	
	  <div id="table">
	  <table>
		<tr>
			<td>Name</td>
			<td><input type="text" name="namecustomer" required/></td>
		</tr>
		<tr>
			<td>D.N.I.</td>
			<td><input type="number" name="customerdni" maxlength="8" required/></td>
		</tr>
		
		<tr>
			<td>Dirección</td>
			<td><input type="text" name="address" required/></td>
		</tr>
		<tr>
			<td>idProduct</td>
			<td><input type="text" name="idproduct" value="168974652" readonly/></td>
		</tr>
		<tr>
			<td>Estado</td>
			<td>
				<select name="status" required>
					<option value="true">Pagado</option>
					<option value="false">Deuda</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Fecha</td>
			<td><input type="date" name="datecreate" value="<%=sdf.format(fecha)%>" readonly /></td>
		</tr>
		<tr>	
			<td>Descripcion</td>
			<td><input type="text" name="descriptionproduct" value="Aqui va la descripcion del producto" readonly/></td>
		</tr>
		<tr>
			<td>Precio Unitario</td>
			<td>S/<input type="number" name="unitprice" value="100" readonly/></td>
		</tr>
		<tr>
			<td>Cantidad de Productos</td>
			<td><input type="number" name="mountproduct" value="25" min="10" max="50" step="5" required></td>
		</tr>
		<input type="hidden" name="IGV" value="0.18"/>
		
	</table>
	<center>
	<input class="boton" type="submit" name="Enviar">
	</center>
	</div>
	
</form>
</div>

<script>
	(function(){
					
		var formulario = document.getElementsByName('formu')[0],
		elementos = formulario.elements,
		boton = document.getElementById('submit');
					
					
		var validarNombre = function(e){
			
			if(isNaN(formulario.customer.value)===false){
				alert("Ingreso no valido en nombre!");
				document.forms['formu']['Enviar'].disabled=false;
				e.preventDefault();
			}
		}
		
		var validarDireccion = function(e){
			if(isNaN(formulario.address.value===false)){
				alert("Ingreso no valido en direccion!");
				document.forms['formu']['Enviar'].disabled=false;
				e.preventDefault();
			}
		}


		var validar = function(e){
			validarNombre(e);
			validarDireccion(e)
		}
					
		formulario.addEventListener("submit",validar);
					
					
	}())	
</script>


<ul id="list">
	<li><a href="/tickets/add">Nuevo Ticket</a></li>
</ul>

</body>
</html>