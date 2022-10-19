<%-- 
    Document   : error
    Created on : 24-abr-2016, 23:58:29
    Author     : Carlos vera
--%>

<%@page pageEncoding="ISO-8859-1"%>

<% 
    
    
    HttpSession ok =request.getSession();
    String error = ""; 
     if(ok.getAttribute("Error") != null) {
      error = (String) ok.getAttribute("Error")  ;
     
     
     
     
     
     }
     
    %>

<html>
<head>
<title>.error</title>
 <link rel="stylesheet" href="css/style.css">
 <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
		    <link rel="stylesheet" type="text/css" href="css/ot/demo.css" />
<style type="text/css">

 #contenedor {
  width: 1024px;
  margin: 10 auto;
  background: white;
 
		 border: 10px solid white;
          border-radius: 5px;
          box-shadow: 3 0px  white;
}
   #contenedor2 {
  width: 1024px;
  margin: 0 auto;
  background: none;
 
		 border: 0px solid black;
          border-radius: 0px;
          box-shadow:  0px  white;
}
        body {
    
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#e7e5e4), color-stop(100%,#e7e5e4));
  
  
    font-family: "Helvetica Neue", Helvetica, Arial;
    padding-top: 0px;
  
}
button.button {
   border: none;
   width: 250px;
   
height: 220px;
	font-family: inherit;
	font-size: 32px;
	color: inherit;
	background: none;
	cursor: pointer;
	padding: 79px 35px;
	display: inline-block;
	margin: 100px 100px;
	text-transform:  lowercase;
	letter-spacing: 0px;
	fnt-weight: 200;
	outline: none;
	position: centered;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s
       
}

button.button  {
    background:white;
    color: none;
    box-shadow: 0px none;
    -webkit-transition: none;
    -moz-transition: none;
    transition: none;
}
button.button {
	border-radius: 0px;
}
button.button:hover {
	box-shadow: 0px none;
	top: 2px;
}

button.button:active {
	box-shadow: 0 0 none;
	top: 6px;
}







</style>
</head>
<body color="#e7e5e4">
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  
  <tr align="center">
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr align="center">
    <td colspan="2">
      <!--<h4><a href="MostrarProductos.jsp">Consultar Productos</a> | <a href="AgregarProducto1.jsp">Agregar al Carrito</a> | <a href="SCerrarSesion">Cerrar Sesion</a> </h4></td>
  --></tr>
  <tr>
    </tr>

  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
<center><h1 class="elegantshadow  ">Error</h1></center>
<script>
    <%if(error.equals("")){
        
    }
    else{
        %>
    alert("<%=error%>");


<%}%>
    </script>
<center><a HREF="<%=request.getHeader("Referer")%>"> <button class="button" type="button" ><label style="text-transform: uppercase;" ><h1 class="insetshadow ">volver</h1></label></button></a></center>

</body>
</html>
