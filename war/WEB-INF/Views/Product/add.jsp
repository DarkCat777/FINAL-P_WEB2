<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.entity.Product"%>
<%@ page import="java.util.List"%>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
<link rel="stylesheet" type="text/css" href="/css/fonts.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Añadir producto</title>

<script type="text/javascript" src="/validar.js"></script>
</head>

<%
	List<Product> products = (List<Product>) request.getAttribute("products");
	if (products.size() > 0) {
%>

<script>
function comprobar(){
	var product = document.formu.model.value.price.stock;
	<%for (int i = 0; i < products.size(); i++) {
					Product product = (Product) products.get(i);%>
	
	var product2="<%=product.getModel()%>";
	if(product == product2){
		alert("Este modelo ya existe!!");
		return false;
		
	}
	<%}%>
	else{
		document.forms['formu']['Enviar'].disabled=true;
	}

	return true;
	
	}
</script>

<%
	}
%>



<body>
	<jsp:include page="../Menu/menu2.jsp" flush="true"/>
	
	
	<div class="contenedor-form"></div>
	
		<div class="formulario">
				<form action="/product/add" method="post" name="formu" onsubmit="return comprobar();">
					<h1>Añadir Producto</h1>
					
					<p>Ingrese el nombre </p>
					<input type="text" id="name" name="name" placeholder="Ingrese el nombre del producto"> 
					
					<p>Ingrese la marca </p>
					<input type="text" id="marca"name="marca" placeholder="Ingrese la marca del producto"> 
					
					<p>Ingrese el modelo </p>
					<input type="text" id="model" name="model" placeholder="Ingrese el modelo">  
					
					<p>Ingrese la descripcion </p>
					<input type="text" id="description" name="description"placeholder="Ingrese la descripcion"> 
						
					<p>Ingrese el descuento </p>	
					<input type="text" id="descuento" name="descuento" placeholder="Ingrese el descuento"> 
					<label for="descuento"> Ingrese el descuento</label> 
						
					<p>Ingrese el precio </p>	
					<input type="text" id="price" name="price" placeholder="Ingrese el precio"> 
				
					<p>Seleccione su estado</p>
					<select name="status">	
						<option value="true">Activo</option>
						<option value="false">Desactivado</option>
					</select>
					
					<p>Seleccione el stock</p>	
					<input type="text" id="stock" name="stock">

					<input type="submit" id="submit" value="Añadir">
				</form>
			</div>
			<a href="/product"><img src="/lista.png" width="50" height="50"></a>
	</div>
</body>
</html>