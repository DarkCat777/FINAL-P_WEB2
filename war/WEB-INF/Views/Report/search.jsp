<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.text.*"%>

<%
	List<Billing> billings = (List<Billing>)request.getAttribute("billings");
%>

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NET & JAC</title>
</head>
<body>
	<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	<div class="contenedor-form">
	<%if(billings.size()>0){%>
		<form action="/report/search" method="post">
			<input type="date" name="date1"/>
			<input type="date" name="date2"/>
			
			
			
			<input type="submit" value="Consultar"/>
		</form>
	<%}else{%>
		<h1>No hay facturas para hacer la consulta</h1>
	<%}%>
	</div>
</body>
</html>