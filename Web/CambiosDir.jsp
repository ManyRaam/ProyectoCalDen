<%-- 
   Document   : citas
   Created on : 13-oct-2016, 19:01:35
   Author     : Carlos vera
   --%>
<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="proceso.*" %>
<%@ page import="java.sql.*, java.util.*,java.lang.*,java.util.*, java.text.*,java.io.*,java.util.Date" %>
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
   %>
<html lang="en" class="no-js">
   <head>
      <meta charset="ISO-8859-1" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Cambios</title>
      <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
      <link rel="stylesheet" type="text/css" href="css/normalize.css" />
      <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
      <link rel="stylesheet" type="text/css" href="css/demo.css" />
      <link rel="stylesheet" type="text/css" href="css/set2.css" />
      <link rel="stylesheet" href="css/Menu.css">
      <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <link rel="stylesheet" type="text/css" href="css/ComponenteRegistro.css" />
      <style>
         body{
         background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#252A34), color-stop(100%,#FF2E63));
         }
         .menu--ceres .menu__link:focus {
         color: #F3368D;
         }
         .menu--ceres .menu__item--current .menu__link {
         color:  #FFFFFF;
         }
         .menu--ceres .menu__item::before,
         .menu--ceres .menu__item::after,
         .menu--ceres .menu__link::after {
         content: '';
         position: absolute;
         bottom: 0;
         background: #FFFFFF;
         }
         #contenedor {
         width: 40%;
         height: 50%;
         margin: 0 auto;
         background-color: #d94f5c;
         border: 10px solid #d94f5c;
         border-radius: 20px;
         box-shadow: 0 6px  #d94f5c;
         }
         .input{
         margin:-0.70em;
         }
      </style>
   </head>
   <body>
      <header>
         <div style="background: none;" class="menus" >
       
         <div style="background: none;" class="menus">
            <nav class="menu menu--ceres"  >
               <ul class="menu__list">
                  <li class="menu__item "><a href="menu.jsp?clvdoc" class="menu__link" style="color:#FFFFFF;">Calendario</a></li>
                  <li class="menu__item menu__item--current"><a href="alum.jsp?clvdoc" class="menu__link"style="color:#FFFFFF;">Pacientes</a></li>
                  <li class="menu__item"><a href="Registrar.jsp?clvdoc" class="menu__link"style="color:#FFFFFF;">Registrar</a></li>
                  <li class="menu__item"><a href="reportes.jsp?clvdoc" class="menu__link"style="color:#FFFFFF;">Reportes</a></li>
                  <li class="menu__item"><a href="#" class="menu__link"style="color:#FFFFFF;">Cuenta</a></li>
                  <li class="menu__item"><a href="cerrars.jsp" class="menu__link"style="color:#FFFFFF;">Salir</a></li>
               </ul>
            </nav>
         </div>
      </header>
      <style type="text/css">
         #capainicio{
         position:relative;
         }
         #capaexpansion{
         position:relative;
         display:none;
         }
         #capaexpansion2{
         position:relative;
         display:none;
         }
         #capaexpansion3{
         position:relative;
         display:none;
         }
         #capaexpansion4{
         position:relative;
         display:none;
         }
         #capaexpansion5{
         position:relative;
         display:none;
         }
         #capaexpansion6{
         position:relative;
         display:none;
         }
         #capaexpansion7{
         position:relative;
         display:none;
         }
         #capafinal{
         position:relative;
         }
      </style>
      <%   String A = null;String alumno =request.getParameter("T"); System.out.println("datooooooooooo="+ alumno); 
         String tipo="";
         
         
         %>
      <script language="javascript" type="text/javascript" src="validaformulario.js"> </script> 
      <div class="container">
      <section class="R bg-1" style="background:none">
         <!-- <h2 class="pricing-section__title">Registro</h2>--><br><br><br>
         <div class="pricing pricing--sonam">
            <div class="pricing__item">
               <h3 class="pricing__title">Cambios</h3>
               <form name ="citas" class="text" method="post" action="ModificarUsuariosD">
                  <input type="text" name="clvpac" name="clvpac" style="visibility:hidden; position: absolute;"  value="<%=request.getParameter("id")%>">
                  <% System.out.println("columnaaaaaaPR::"+request.getParameter("clvpac"));%>
                          
                  <div class="pricing__price"><span class="pricing__currency">Tipos</span> </div>
                  <p class="pricing__sentence">
                     Campo: 
                     <select id="T" name="T" class="select" onchange="expandir_formulario()" >
                        <option value="0">opcion</option>
                
                        <option value="area">Area</option>
                        <option value="edad">Edad</option>
                        <option value="sexo">Sexo</option>
                     </select>
                  </p>
                  <br>
                  <br>
                 
                  <div id=capaexpansion4>
                     <span class="input input--kozakura">
                        <input class="input__field input__field--kozakura" type="text" id="dato4" name="dato4" />
                        <label class="input__label input__label--kozakura" for="dato4">
                        <span class="input__label-content input__label-content--kozakura" data-content="Area">Area</span>
                        </label>
                        <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                           <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                        </svg>
                     </span>
                  </div>
                  <div id=capaexpansion5>
                     <span class="input input--kozakura">
                        <input class="input__field input__field--kozakura" type="text" id="dato5" name="dato5"/>
                        <label class="input__label input__label--kozakura" for="dato5">
                        <span class="input__label-content input__label-content--kozakura" data-content="Edad">Edad</span>
                        </label>
                        <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                           <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                        </svg>
                     </span>
                  </div>
                  <div id=capaexpansion6>
                     <span class="input input--kozakura">
                        <label  class="label">Sexo:</label>
                        <select id="dato7" name="dato7" class="select" >
                           <option value="">Seleccionar</option>
                           <option value="x">Hombre</option>
                           <option value="y">Mujer</option>
                        </select>
                     </span>
                  </div>
                  <br>
                  <br><br><br><br><br><br>
                  <input class="pricing__action" type='submit' name='button'  value='Cambiar'>
               </form >
            </div>
      </section>
      </div>
      <script> 
         function expandir_formulario(){ 
         if (document.citas.T.value == "0"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'none') 
         xDisplay('capaexpansion6', 'none')
         
         
         } 
         
         if (document.citas.T.value == "nombre"){ 
         xDisplay('capaexpansion', 'block') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'none') 
         xDisplay('capaexpansion6', 'none')
         
         } 
         
         if (document.citas.T.value == "apellidom"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'block') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'none') 
         xDisplay('capaexpansion6', 'none')
         
         } 
         if (document.citas.T.value == "apellidop"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'block') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'none') 
         xDisplay('capaexpansion6', 'none')
         
         } 
         if (document.citas.T.value == "area"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'block') 
         xDisplay('capaexpansion5', 'none')
         xDisplay('capaexpansion6', 'none')
         
         } 
         if (document.citas.T.value == "edad"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'block') 
         xDisplay('capaexpansion6', 'none') 
         
         } 
         if (document.citas.T.value == "sexo"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'none') 
          xDisplay('capaexpansion6', 'block')
         
         }
         
         }    
             
      </script> 
      <script src="js/Scroll.js"></script>
      <script src="js/menu.js"></script>
      <script src="js/jquery-1.9.1.min.js"></script>
      <script src="js/jquery-migrate-1.0.0.min.js"></script>
      <script src="js/jquery-ui-1.10.0.custom.min.js"></script>
      <script src="js/jquery.ui.touch-punch.js"></script>
      <script src="js/modernizr.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/jquery.cookie.js"></script>
      <script src='js/fullcalendar.min.js'></script>
      <script src='js/jquery.dataTables.min.js'></script>
      <script src="js/excanvas.js"></script>
      <script src="js/jquery.flot.js"></script>
      <script src="js/jquery.flot.pie.js"></script>
      <script src="js/jquery.flot.stack.js"></script>
      <script src="js/jquery.flot.resize.min.js"></script>
      <script src="js/jquery.chosen.min.js"></script>
      <script src="js/jquery.uniform.min.js"></script>
      <script src="js/jquery.cleditor.min.js"></script>
      <script src="js/jquery.noty.js"></script>
      <script src="js/jquery.elfinder.min.js"></script>
      <script src="js/jquery.raty.min.js"></script>
      <script src="js/jquery.iphone.toggle.js"></script>
      <script src="js/jquery.uploadify-3.1.min.js"></script>
      <script src="js/jquery.gritter.min.js"></script>
      <script src="js/jquery.imagesloaded.js"></script>
      <script src="js/jquery.masonry.min.js"></script>
      <script src="js/jquery.knob.modified.js"></script>
      <script src="js/jquery.sparkline.min.js"></script>
      <script src="js/counter.js"></script>
      <script src="js/retina.js"></script>
      <script src="js/custom.js"></script>
      <script type='text/javascript' src='js/formexp.js'></script>
      <script src="js/menu.js"></script>
      <br><br>
      <br>
      <br>
      <div id="contenedorB">
         <center>
            <h4>INSTITUTO POLITÉCNICO NACIONAL</h4>
            D.R. Instituto Politécnico Nacional (IPN), Av. Luis Enrique Erro S/N, Unidad Profesional Adolfo López Mateos, Zacatenco, Delegación Gustavo A. Madero, C.P. 07738, Ciudad de México; México 2009-2013.
            <p>   Este sitio es una obra intelectual protegida por la Ley Federal del Derecho de Autor, puede ser reproducida con fines no lucrativos, siempre y cuando no se mutile, se cite la fuente completa y su dirección electrónica; su uso para otros fines, requiere autorización previa y por escrito del Director General del Instituto.
         </center>
      </div>
   </body>
</html>