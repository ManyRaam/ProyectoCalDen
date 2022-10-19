<%-- 
   Document   : Sesion
   Created on : 08-nov-2016, 7:09:59
   Author     : Carlos vera
   --%>
<%@page import="proceso.AES"%>
<%@page import="proceso.usuario"%>
<%@page import="proceso.Data"%>
<%@page import="proceso.Data"%>
<%@page import="java.util.List"%>
<%@page import="proceso.var"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<%
   String usuario = "";
   var con = new var();
   HttpSession sesionOk = request.getSession();
   if (sesionOk.getAttribute("usuario") == null) {
   %>
<jsp:forward page="index.html">
   <jsp:param name="error" value="Es
      obligatorio identificarse"/>
</jsp:forward>
<%
   } else {
   usuario = (String)sesionOk.getAttribute("usuario");
   }
   
   
   usuario us = (usuario)sesionOk.getAttribute("algo");
AES j = new AES();

    
    


   List<var>lists = null;
   
   Data objConn = null;
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.setId(request.getParameter("id"));
   
   objConn.open();
   lists = objConn.Sesion((Integer.parseInt(j.decencriptar(us.getClvdoc()))));
   
   %>
<!DOCTYPE html>
<html>
   <head>
       
       
           
       
      <meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1">
      <title>Sesion</title>
      <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
      <link rel="stylesheet" href="css/Menu.css">
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <link rel="stylesheet" type="text/css" href="css/buttons.css" />
      <link rel="stylesheet" href="css/ot/stylePOP.css">
      <link rel="stylesheet" href="css/ajsutestabla.css">
      <link rel="stylesheet" href="css/style-Tabla.css">
      <script src="js/Scroll-table.js"></script>
      <link rel="stylesheet" type="text/css" href="css/set3.css" />
      <link rel="stylesheet" type="text/css" href="css/letras.css" />
      <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
      <link rel="stylesheet" type="text/css" href="css/ComponenteRegistro.css" />
      <style>
         body{
         background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#252A34), color-stop(100%,#FF2E63));
         }
         .menu--ceres .menu__link:focus {
         color: #FF2E63;
         }
         .menu--ceres .menu__item--current .menu__link {
         color:  #FF2E63;
         }
         .menu--ceres .menu__item::before,
         .menu--ceres .menu__item::after,
         .menu--ceres .menu__link::after {
         content: '';
         position: absolute;
         bottom: 0;
         background: #FF2E63;
         }
         #contenedor{
         cursor: default;
         width: 80%;
         background: black;
         padding-top: 30px;
         border: 30px solid rgba(82, 18, 98, 0);
         border-radius: 4px;
         box-shadow: 0 5px 20px rgba(0,0,0,0.05), 0 15px 30px -10px rgba(0,0,0,0.3);
         -webkit-transition: background 0.4s;
         transition: background 0.4s;
         }
         #contenedor:hover {
         background: rgba(0, 0, 0, 0.74);
         }
         .input{
         margin:-0.70em;
         }
      <%
         
          
         
                     if( lists != null )
                     {
                     for(var objvar : lists )
                     {
                     System.out.println("color:"+objvar.getBarra()); 
                         
                     %>
         
      
      
       
         .menu--ceres .menu__link:focus {
         color: <%=objvar.getBarra()%>;
         }
         .menu--ceres .menu__item--current .menu__link {
         color:  <%=objvar.getBarra()%>;
         }
         .menu--ceres .menu__item::before,
         .menu--ceres .menu__item::after,
         .menu--ceres .menu__link::after {
             
         content: '';
         position: absolute;
         bottom: 0;
         background: <%=objvar.getBarra()%>;
         }
         html{
              background: none;
          }
          .a{
                background: rgba(255, 255, 255, 0.41);
    border: none;
    border-radius: 5px;
    padding: 5px;
          }
          .b{
                 background: rgba(255, 255, 255, 0.41);
    border: none;
    border-radius: 5px;
    padding: 5px;
          }
          .pricing__item {
              
          background: black;    
          
          }
          .ninput{
                  width: calc(50% - 0.1em);
    background: rgba(73, 78, 87, 0.64);
    position: relative;
    right: -20%;
    border: none;
    padding: 10px;
    color: white;
    margin: 7px;
    border-radius: 5px;
          }
          
          canvas{
         display: <%=objvar.getParticulas()%>;
         }
         body{
            
             
            
            background: linear-gradient(to right, <%=objvar.getFondo()%>, <%=objvar.getFondoB()%>);
              <%
             

            if(objvar.getFondo().equals("#252A34")){
             %>
            
            background: linear-gradient(to bottom right, #111, <%=objvar.getFondoB()%>);
             
          <% } %>
         }
         
         <%
      
        String x =objvar.getFondo(); 
        System.out.println("fondo:::::::::"+x);
        if(x.equals("#C61951")){%>
          
 
         .menu--ceres .menu__link{
             color: #56132a;
         }
        <%}%>
        
          canvas{
         z-index: -1;
         position: fixed;}
      </style>
      
       <%
         }
                }
         objConn.close();
         %>
      <header>
      <div id="particles-js"></div>
      <script src="particles.js"></script>
      <script src="particulas.js"></script>
         <div style="background: none;" class="menus" >
         
            <nav class="menu menu--ceres">
               <ul class="menu__list">
                  <li class="menu__item" ><a href="menu.jsp" class="menu__link">Calendario</a></li>
                  <li class="menu__item"><a href="alum.jsp" class="menu__link">Pacientes</a></li>
                  <li class="menu__item "><a href="Registrar.jsp" class="menu__link">Registrars</a></li>
                  <li class="menu__item"><a href="reportes.jsp" class="menu__link">Reportes</a></li>
                  <li class="menu__item menu__item--current "><a href="#" class="menu__link">Cuenta</a></li>
                   <li class="menu__item"><a href="Solicitudes.jsp" class="menu__link">Citas</a></li>
                  <li class="menu__item"><a href="cerrars.jsp" class="menu__link">Salir</a></li>
               </ul>
            </nav>
         </div>
      </header>
   </head>
   <body>
       
      
       
      <div class="container">
         <section class="R bg-1" style="background:none">
            <!-- <h2 class="pricing-section__title">Registro</h2>--><br><br><br>
            <div class="pricing pricing--sonam" >
               <div class="pricing__item" style="background:rgba(31, 31, 31, 0.12);">
                  <h3 class="pricing__title">Cuenta</h3>
                  <%
   
                     if( lists != null )
                     {
                     for(var objvar : lists )
                     {
                     
                  %>
                  <form name="sesion" action="modificar" nombre ="forma">
                  <p>     Nombre: <input class="ninput" value="<%=objvar.getNombre()%>" id="nombre" pattern="[a-zA-Z]{3,15}" title="Solo letras con 15 caracteres maximo " required name="nombre"  disabled> <br>
                     <br>
                  <p>       Apellido Pa.:<input class="ninput" value= "<%=objvar.getApellidop()%>" pattern="[a-zA-Z]{3,15}" title="Solo letras con 15 caracteres maximo " required id ="ap" disabled name="ap"> <br>
                     <br>   
                  <p>       Apellido Ma.:<input class="ninput" pattern="[a-zA-Z]{3,15}" title="Solo letras con 15 caracteres maximo " value= "<%=objvar.getApellidom()%>" required id ="am" disabled name="am" <br>
                      
                     <br>  
                 
                  <p>        Contraseña <input  type="password"  required class="ninput" value="<%=objvar.getPassword()%>" maxlength="15"   pattern="[a-zA-Z0-9-]+"  title="Solo letras y numeros con 15 caracteres maximo "id ="usuario" disabled name="contra" ><br>
                        <p>    <input class="a" type="submit" disabled id="submit" >
                          <input  type="hidden" value ="<%=us.getClvdoc()%>" name="id">
                  
                  </form>
                       <br>   
                    <input class="a" type="button"  value="editar"  onclick="forma()">
        
                      <script> 
                          function forma(){
                          document.getElementById("nombre").disabled = false;
                              document.getElementById("ap").disabled = false;
                                  document.getElementById("am").disabled = false;
                                      document.getElementById("usuario").disabled = false;
                                       document.getElementById("submit").disabled = false;}
                                   
                                   
                                          
                          </script> 
                          
               </div>
            </div>
         </section>
      </div>
      <%
         }
                }
         objConn.close();
         %>
      <script src="js/Letras.js"></script>
      <script src="js/menu.js"></script>
      <div id="contenedorB">
         <center>
            <h4>INSTITUTO POLITÉCNICO NACIONAL</h4>
            D.R. Instituto Politécnico Nacional (IPN), Av. Luis Enrique Erro S/N, Unidad Profesional Adolfo López Mateos, Zacatenco, Delegación Gustavo A. Madero, C.P. 07738, Ciudad de México; México 2009-2013.
            <p>   Este sitio es una obra intelectual protegida por la Ley Federal del Derecho de Autor, puede ser reproducida con fines no lucrativos, siempre y cuando no se mutile, se cite la fuente completa y su dirección electrónica; su uso para otros fines, requiere autorización previa y por escrito del Director General del Instituto.
         </center>
      </div>
   </body>
</html>