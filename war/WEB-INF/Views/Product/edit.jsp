<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.entity.Product"%>
<%@page import="java.util.Date"%>
<%
	Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
<link rel="stylesheet" type="text/css" href="/css/estilosEdit.css">
<title>Editar Product: <%=product.getId()%></title>
</head>
<body>

	<jsp:include page="../Menu/menu2.jsp" flush="true" />
	<div class="contenedor-form">
		<div class="formulario">
			<form action="/product/edit" method="post" name="formulario" >
			<h1>Editar Producto</h1>
	
			<p>Edite el nombre </p>
			 <input type="text" name="name" value="<%=product.getName()%>" placeholder="Ingrese el nombre del producto" required>
			
			<p>Edite el modelo </p>
			 <input type="text" name="model" value="<%=product.getModel()%>" placeholder="Ingrese el modelo del producto" required>
			
			<p>Edite el marca </p>
			 <input type="text" name="marca" value="<%=product.getMarca()%>" placeholder="Ingrese la marca del producto" required>
			
			<p>Edite la descripcion</p>
			<input type="text" name="description" value="<%=product.getDescription()%>" placeholder="Ingrese la descripcion" required>
					
			<p>Edite el descuento</p>
			<input type="text" name="descuento" value="<%=product.getDescuento()%>" placeholder="Ingrese el descuento" required>
			
			<p>Edite el precio</p> 
			<input type="text" name="price" value="<%=product.getPrice()%>" placeholder="Ingrese el precio" required>  
			
			<p>Edite el stock</p>
			<input type="text" name="stock"	value="<%=product.getStock()%>" placeholder="Ingrese el stock" required>
			
			<p>Edite el Estado </p>
			<select name="status">
				<option value="true">Activo</option>
				<option value="false">Desactivado</option>
			</select>
			<input type="hidden" name="id" value="<%=product.getId()%>">
			<input type="submit" name="submit" value="Editar Informacion">
			</form>
	
			</div>
		<a href="/product"><img src="/lista.png" width="70" height="70"></a>
	</div>
</body>
</html>