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
   
   
   
   
   System.out.println("clave doctor:::::::::"+request.getParameter("clvdoc"));
   }




   %>
   
   <%
   List<var>listRo = null;
   AES j = new AES();

   Data objConn = null;
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.open();
   listRo = objConn.selectAlum();
   //#5dffc9;
   %>
   
<html lang="en" class="no-js">
   <head>
      <meta charset="ISO-8859-1" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Cambios</title>
      <link rel="stylesheet" type="text/css" href="css/normalize.css" />
      <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
      <link rel="stylesheet" type="text/css" href="css/demo.css" />
      <link rel="stylesheet" type="text/css" href="css/set2.css" />
      <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
      <link rel="stylesheet" href="css/Menu.css">
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
      <link rel="stylesheet" type="text/css" href="css/ComponenteRegistro.css" />
      <style>
         body{
         
           background: linear-gradient(to right, #111, #781342);
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
         select{
             
              outline:0px;    
    border:none;
         }
      </style>
   </head>
   <body>
      <header>
         <div style="background: none;" class="menus" >
         <%String cl=request.getParameter("clvdoc");
            %>
         <div style="background: none;" class="menus">
            <nav class="menu menu--ceres"  >
               <ul class="menu__list">
                  <li class="menu__item "><a href="menu.jsp" class="menu__link" style="color:#FFFFFF;">Calendario</a></li>
                  <li class="menu__item menu__item--current"><a href="alum.jsp" class="menu__link"style="color:#FFFFFF;">Pacientes</a></li>
                  <li class="menu__item"><a href="Registrar.jsp" class="menu__link"style="color:#FFFFFF;">Registrar</a></li>
                  <li class="menu__item"><a href="reportes.jsp" class="menu__link"style="color:#FFFFFF;">Reportes</a></li>
                  <li class="menu__item"><a href="#" class="menu__link"style="color:#FFFFFF;">Cuenta</a></li>
                  <li class="menu__item"><a href="cerrars.jsp" class="menu__link"style="color:#FFFFFF;">Salir</a></li>
               </ul>
            </nav>
         </div>
      </header>
      <style type="text/css">
      
         .pricing__item :hover {
         background: rgba(0, 0, 0, 0.74);}
     
         
      </style>
      <%   String A = null;String alumno =request.getParameter("T"); 
         String tipo="";
         
         
         %>
      <script language="javascript" type="text/javascript" src="validaformulario.js"> </script> 
      <div class="container">
      <section class="R bg-1" style="background:none">
         <!-- <h2 class="pricing-section__title">Registro</h2>--><br><br><br>
         <div class="pricing pricing--sonam">
            <div class="pricing__item" style="  border-radius: 50px;">
               <h3 class="pricing__title">Cambios</h3>
               <form name ="citas" class="text" method="post" action="ModificarUsuarios">
                  <input type="text" name="clvpac" name="clvpac" style="visibility:hidden; position: absolute;"  value="<%=request.getParameter("id")%>">
                 
                  <input type="text" name="clvdoc" name="clvdoc" style="visibility:hidden; position: absolute;"  value="<%=cl%>">          
                  <div class="pricing__price"><span class="pricing__currency" style="    color: #771342;">Seleccionar</span> </div>
                  <p class="pricing__sentence">
                    
                    
                  </p>
                  <br>
                  <br>
                   <%
                     if( listRo != null )
                     {
                     for(var objvar : listRo )
                     {
                     %>
                   <div id=capaexpansion5>
                     <span class="input input--kozakura">
                        <input class="input__field input__field--kozakura" type="text" id="d1" name="d1" value="<%=objvar.getNombre()%>"/>
                        <label class="input__label input__label--kozakura" for="d1">
                        <span class="input__label-content input__label-content--kozakura" data-content="Nombre">Nombre</span>
                        </label>
                        <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                           <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                        </svg>
                     </span>
                        <span class="input input--kozakura">
                        <input class="input__field input__field--kozakura" type="text" id="d2" name="d2" value="<%=objvar.getApellidop()%>"/>
                        <label class="input__label input__label--kozakura" for="d2">
                        <span class="input__label-content input__label-content--kozakura" data-content="Apellidop">ApellidoP</span>
                        </label>
                        <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                           <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                        </svg>
                     </span>
                        <span class="input input--kozakura">
                        <input class="input__field input__field--kozakura" type="text" id="d3" name="d3" value="<%=objvar.getApellidom()%>"/>
                        <label class="input__label input__label--kozakura" for="d3">
                        <span class="input__label-content input__label-content--kozakura" data-content="Apellidop">ApellidoM</span>
                        </label>
                        
                        <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                           <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                        </svg>
                     </span>
                  </div>
                  <div id=capaexpansion5>
                     <span class="input input--kozakura">
                        <input class="input__field input__field--kozakura" type="text" id="d4" name="d4" value="<%=objvar.getEdad()%>"/>
                        <label class="input__label input__label--kozakura" for="d4">
                        <span class="input__label-content input__label-content--kozakura" data-content="Edad">Edad</span>
                        </label>
                        <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                           <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                        </svg>
                     </span>
                  </div>
                  
                 
                         <%
                     }
                            }
                     objConn.close();
                     %>
                  <br>
                  <br><br><br><br><br><br>
                  
                  <style>
                          .p{
                            background: #781342;
                             border-radius: 50px;
                                 font-weight: bold;
                            margin-top: auto;
                            padding: 0.75em 2em;
                         border: none;

                            -webkit-transition: background 0.3s;
                            transition: background 0.3s;
                            color: white;
                            
                        }

                                 .p:hover {
                            background: #494e57;
                        }
                  </style>
                  
                  <input class="p" type='submit' name='button' value='Cambiar'>
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
         xDisplay('capaexpansion7', 'none')
         
         } 
         
         if (document.citas.T.value == "nombre"){ 
         xDisplay('capaexpansion', 'block') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'none') 
         xDisplay('capaexpansion6', 'none')
         xDisplay('capaexpansion7', 'none')
         } 
         
         if (document.citas.T.value == "apellidom"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'block') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'none') 
         xDisplay('capaexpansion6', 'none')
         xDisplay('capaexpansion7', 'none')
         } 
         if (document.citas.T.value == "apellidop"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'block') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'none') 
         xDisplay('capaexpansion6', 'none')
         xDisplay('capaexpansion7', 'none')
         } 
         if (document.citas.T.value == "boleta"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'block') 
         xDisplay('capaexpansion5', 'none')
         xDisplay('capaexpansion6', 'none')
         xDisplay('capaexpansion7', 'none')
         } 
         if (document.citas.T.value == "edad"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'block') 
         xDisplay('capaexpansion6', 'none') 
         xDisplay('capaexpansion7', 'none')
         } 
         if (document.citas.T.value == "semestre"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'none') 
          xDisplay('capaexpansion6', 'block')
         xDisplay('capaexpansion7', 'none')
         }
         if (document.citas.T.value == "sexo"){ 
         xDisplay('capaexpansion', 'none') 
         xDisplay('capaexpansion2', 'none') 
         xDisplay('capaexpansion3', 'none') 
         xDisplay('capaexpansion4', 'none') 
         xDisplay('capaexpansion5', 'none') 
         xDisplay('capaexpansion6', 'none')
         xDisplay('capaexpansion7', 'block')
         }
         }    
             
      </script> 
      <script src="js/Scroll.js"></script>
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

