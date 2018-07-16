<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*" %>
<%
	Ticket tick = (Ticket)request.getAttribute("ticket");
	List<Ticket> tickets = (List<Ticket>)request.getAttribute("tickets");
 %>    
<!DOCTYPE html>
<html>
<head>
<style>
	td{
		color:black;
	}	
</style>

<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<meta>
<title>Update</title>

<link rel="stylesheet" type="text/css" href="../tabla.css">

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
<link rel="icon" type="image/png" href="favicon.ico">
</head>

<body>

<jsp:include page="../Menu/menu2.jsp" flush="true"/>
<div class="contenedor-form">
<div id="table">
<h1>Edtar <%=tick.getId() %></h1>
	<form  action="/tickets/edit" method="get">
		<input type="hidden" name="id" value="<%=tick.getId()%>"/>
	 
	 
	<table>
		<tr>
			<td>Id</td>
			<td><%= tick.getId() %></td>
		</tr>
		
		<tr>
			<td>Cliente</td>
			<td><input type="text" name="customer" value="<%= tick.getNameCustomer()%>"/></td>
		</tr>
		
		<tr>	
			<td>Dirección</td>
			<td><input type="text" name="address" value="<%= tick.getAddress()%>"/></td>
		</tr>	
			
		<tr>	
			<td>Descripcion</td>
			<td><input type="text" name="address" value="<%= tick.getDescriptionProduct()%>"/></td>
		</tr>	
		
		<tr>
			<td>Estado</td>
			<td>
				<select name="status">
						<option value="pagado" <%if(tick.isStatus()==true){%>selected<%} %>>Pagado</option>
						<option value="deuda" <%if(tick.isStatus()==false){%>selected<%} %>>Deuda</option>
				</select>
			</td>
		</tr>
		
		<tr>	
			<td>Cantidad</td>
			<td><input type="number" name="mountProduct" value="<%=tick.getMountProduct()%>" min="10" max="50" step="5" required></td>
		</tr>
		<tr>
		<td>
		<center>
		<input type="submit" value="Modificar">
		</center>
		<td>
		</tr>
	</table>
	</form>
	
	<script>
		(function(){
						
			var formulario = document.getElementsByName('formu')[0],
			elementos = formulario.elements,
			boton = document.getElementById('submit');
						
						
			var validarNombre = function(e){
				
				if(isNaN(formulario.customer.value)===false){
					alert("Ingreso no valido!");
					e.preventDefault();
					document.forms['formu']['Enviar'].disabled=false;
				}
			}
			
			var validarDireccion = function(e){
				if(isNaN(formulario.address.value===false)){
					alert("Ingreso no valido!");
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

</div>
</div>
<ul id="list">
	<li><a href="/tickets/add">Nuevo Ticket</a></li>
</ul>

</body>
</html>