<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	List<Ticket> tickets = (List<Ticket>)request.getAttribute("tickets");
	Ticket tick=null;
 	for(int i=0; i<tickets.size(); i++) {
		tick = (Ticket)tickets.get(i);
 	}
 	 SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
 %> 
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>View</title>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<link rel="icon" type="image/png" href="favicon.ico">
</head>

<body>

<jsp:include page="../Menu/menu2.jsp" flush="true"/>
<div class="contenido" style="background-color: white;">
<ul style=" position: absolute;
	list-style: none;
	margin-top: 1%;
	margin-left: 10%;	
	font-size: 30px;">
	<li><a href="/tickets/add"  style="text-decoration: none; color: #ffffff;">Nuevo Ticket</a></li>
</ul>
<br><br>

<table  border="0" padding="0" width="100%"
		style="border-collapse: separate; border-spacing: 1px;">
	<tr>
		<td>
			<center><img src = "../favicon.jpeg" width="100px" height="100px"></center>
		</td>
		<td>
			<table border="0" padding="0" bgcolor="#EBFBEE" width="98%" height="80%" 
				   style="border-radius:15px; border-collapse: separate; border-spacing: 1px;">
				<tr><td style="text-align: center; ">Arequipa</td></tr>
				<tr><td style="text-align: center; ">Urb. El palacio II Etapa - Sachaca</td></tr>
				<tr><td style="text-align: center; " >Telf: 959995351</td></tr>
			</table>
		</td>
		<td>
			<table border="0" padding="0" bgcolor="#EBFBEE"	width="100%" height="80%"
	 			   style="border: solid; border-color: black; border-width: 1px; border-radius:15px;
	 			          border-collapse: separate; border-spacing: 1px;">
				<tr><td style="font-weight: bold; text-align: center; font-size: 20px;">R.U.C. 20454348428</td></tr>
				<tr><td style="font-weight: bold; text-align: center;">Boleta Electronica</td></tr>
				<tr><td style="font-weight: bold; text-align: center;">#<%=tick.getId()%></td></tr>
			</table>
		</td>
	</tr>
</table><br>

<table border="0" padding="0" bgcolor="#EBFBEE"	width="100%" height="80%"
	   style="border: solid; border-color: black; border-width: 1px; border-radius:15px;
	   border-collapse: separate; border-spacing: 1px;">
	<tr>
		<td style="font-weight: bold; text-align: center;">Fecha:</td>
		<td style="font-weight: bold; text-align: center;"><%=sdf.format(tick.getCreate())%></td>
	</tr>
	<tr>
		<td style="font-weight: bold; text-align: center;">Señor(a):</td>
		<td style="font-weight: bold; text-align: center;"><%=tick.getNameCustomer() %></td>
	</tr>
	<tr>
		<td style="font-weight: bold; text-align: center;">D.N.I:</td>
		<td style="font-weight: bold; text-align: center;"><%=tick.getCustomerdni() %></td>
	</tr>
	<tr>
		<td style="font-weight: bold; text-align: center;">Dirección:</td>
		<td style="font-weight: bold; text-align: center;"><%=tick.getAddress()%></td>
	</tr>
	<tr>
		<td style="font-weight: bold; text-align: center;">Tipo de Moneda:</td>
		<td style="font-weight: bold; text-align: center;">Nuevos Soles</td>
	</tr>
	<tr>
		<td style="font-weight: bold; text-align: center;">Observación:</td>
		<td style="font-weight: bold; text-align: center;">Venta de Productos Electronicos</td>
	</tr>
</table><br>

<table padding="0" style="width:100%; height: 100%; border: solid; border-color: black; border-width: 1px; border-radius:15px; border-collapse: separate; border-spacing: 1px;">
	<tr>
		<td>Cantidad</td>
		<td>Código</td>
		<td>Descripción</td>
		<td>Valor Unitario</td>
		<td>Descuento</td>
		<td>Importe de Venta(**)</td>
	</tr>
	<tr>
		<td><%=tick.getMountProduct() %></td>
		<td><%=tick.getIdProducts().get(0) %></td>
		<td><%=tick.getDescriptionProduct() %></td>
		<td><%=tick.getUnitPrice() %></td>
		<td><%=tick.getTotal()%></td>
	</tr>
</table><br>

<table bgcolor="#EBFBEE" style="width: 25%;height: 50px; position:absolute;right: 115px; border: solid; border-color: black; border-width: 1px; border-radius:15px; border-collapse: separate; border-spacing: 1px;">
	<tr>
		<td>Otros Campos:</td>
		<td>0.00</td>
	</tr>
	<tr>
		<td>Otros Tributos:</td>
		<td>0.00</td>
	</tr>
	<tr>
		<td>IGV:</td>
		<td><%=tick.getIGV() %></td>
	</tr>
	<tr>
		<td>Importe Total:</td>
		<td><%=tick.getTotal() %></td>
	</tr>	
</table><br></div>


</body>
</html>