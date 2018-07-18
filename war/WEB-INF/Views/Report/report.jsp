<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.entity.*" %>
<%
	ArrayList<Integer> cantidad = (ArrayList<Integer>)request.getAttribute("cantidad");
	List<Product> products = (List<Product>)request.getAttribute("products");
	ArrayList<Long> idproducts = (ArrayList<Long>)request.getAttribute("idproduct");
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
	<table>
		<tr>
			<th>Id</th>
			<th>Cantidad</th>
		</tr>
		
		<%for(int i=cantidad.size()-1; i>=0; i--){%><tr>
			<th><%=idproducts.get(i)%></th>
			<th><%=cantidad.get(i)%></th>
		 <%}%>
		  
	</table>
	</div>
</body>
</html>