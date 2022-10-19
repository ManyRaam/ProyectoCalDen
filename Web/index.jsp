<%-- 
   Document   : citas
   Created on : 13-oct-2016, 19:01:35
   Author     : Carlos vera
   --%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
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
<%
   List <var>listC = null;
   Data objConn = null;
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   String id ="";
   
   id=request.getParameter("id");
   
   
   System.out.print("Tu id es: "+id);
   objConn.setId(id);       
   
   
   objConn.open();
   //listC = objConn.selectC();
   %>
<html lang="en" class="no-js">
   <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>historail</title>
      <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
      <link rel="stylesheet" type="text/css" href="css/normalize.css" />
      <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
      <link rel="stylesheet" type="text/css" href="css/demo.css" />
      <link rel="stylesheet" type="text/css" href="css/set2.css" />
      <link rel="stylesheet" href="css/Menu.css">
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
      <style>
         body{
         background: #1B1A1C;
         }
         #contenedor{
         padding: 1em;
         cursor: default;
         width: 35em;
         background: rgba(88, 85, 85, 0.38);
         padding-top: 30px;
         border: 30px solid rgba(82, 18, 98, 0);
         border-radius: 4px;
         box-shadow: 0 5px 20px rgba(0,0,0,0.05), 0 15px 30px -10px rgba(0,0,0,0.3);
         -webkit-transition: background 0.4s;
         transition: background 0.4s;
         }
         #contenedor:hover {
         background: rgba(0, 0, 0, 0.74);;
         }
         .bg-1 {
         background: #1B1A1C;
         background-size: cover;
         color: #fff;
         }
         .R {
         padding: 2em 0 8em;
         min-height: 100vh;
         position: relative;
         }
         .title {
         font-size: 2em;
         width: 100%;
         margin: 0 0 0.25em;
         padding: 0 0 0.5em;
         border-bottom: 3px solid rgb(27, 26, 28);
         }
       
         .input{
         width: calc(100% - 0.1em);
         background:#494e57;
             position: relative;
                right: -30%;
                border: none;
                padding: 10;
                color: white;
                margin: 7;
         }
         .button1{
         width: calc(100% - 0.1em);
         margin: 14px 0px;
         }
         .select{
         width: calc(100% - 0.1em);
         ont-family: arial;
         overflow: hidden;
         padding: 1em 0.5em;
         display: inline-block;
         color: #a1a3a4;
         font-weight: bold;
         border-radius: 0px;
         }
         td{
         padding: 15px;
         text-align: left;
         vertical-align: middle;
         font-weight: 300;
         font-size: 14px;
         color: #fff;
         border-bottom: solid 1px rgba(255,255,255,0.1);
         }
         cosa{
           
             
         }
      </style>
   </head>
   <body>
      <header>
         <div style="background: #1B1A1C;" class="menus" >
           
            <nav class="menu menu--ceres">
               <ul class="menu__list">
                  <li class="menu__item" ><a href="menu.jsp" class="menu__link">Calendario</a></li>
                  <li class="menu__item"><a href="alum.jsp" class="menu__link">Pacientes</a></li>
                  <li class="menu__item menu__item--current"><a href="" class="menu__link">Historial</a></li>
                  <li class="menu__item"><a href="reportes.jsp" class="menu__link">Reportes</a></li>
                  <li class="menu__item"><a href="Sesion.jsp" class="menu__link">Cuenta</a></li>
                  <li class="menu__item"><a href="cerrars.jsp" class="menu__link">Salir</a></li>
               </ul>
            </nav>
         </div>
      </header>
      <br>
      <br> <br> <br> <br>
      <section class="R bg-1">
         <div id="contenedor">
            <form  action="Parte1" method="get">
               <h1>Seccion 1-3</h1>
               <h3>¿Ha tenido alguna historia de alguna de las siguientes?</h3>
               <h4>Marque todas las que apliquen:</h4>
               <table>
                  <br>
                  <tr >
                     <td >
                        <input type="checkbox" name="e1" id="e1" value="1">HPTA
                        <input type="checkbox" name="e2" value="2">Alergias (Estacionales)
                        <input type="checkbox" name="e3" value="3">Anemia
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <input type="checkbox" name="e4" value="4">Asma
                        <input type="checkbox" name="e5" value="5">Sangrado o Transtornos de la sangre
                        <input type="checkbox" name="e6" value="6">Cáncer
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <input type="checkbox" name="e7" value="7">Paralisis Cerebral
                        <input type="checkbox" name="e8" value="8">Sinusistis Crónica
                        <input type="checkbox" name="e9" value="9">Diabetes
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <input type="checkbox" name="e10" value="10">Dolores de oido
                        <input type="checkbox" name="e11" value="11">Epilepsia
                        <input type="checkbox" name="e12" value="12">Desmayo
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <input type="checkbox" name="e13" value="13">Problemas de crecimiento
                        <input type="checkbox" name="e14" value="14">Audicion
                        <input type="checkbox" name="e15" value="15">Corazón
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <input type="checkbox" name="e16" value="16">Soplo Cardiaco
                        <input type="checkbox" name="e17" value="17">Alergia al Latex
                        <input type="checkbox" name="e18" value="18">Embarazo(adolescentes) 
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <input type="checkbox" name="e19" value="19">Convulsiones
                        <input type="checkbox" name="e20" value="20">Tiroides
                        <input type="checkbox" name="e21" value="21">Tabaco/El uso de drogas
                     </td>
                  </tr>
               </table>
               
               <input name="clvpac" id="clvpac" value="<%=request.getParameter("id")%>" type="hidden">
                <h4>- ¿Cuenta con alguna otra enfermedad?:</h4> 
               <input  class="input"  name="Otra" type="text" value="Ninguna">
                 
                  <h4>-  ¿Es alergico a algún medicamento o algo en particualar?</h4>
                  <input class="input"  name="SiMedica" type="text" value="Ninguno" onFocus="javascript:this.value=''">
 <h4>- ¿Está tomando cualquier medicamento de venta libre o de prescripcion en este momento?:<br></h4>
                  <input class="input"  name="SiToma" type="text" value="Ninguno" onFocus="javascript:this.value=''">
 <h4>- ¿Has tenido algun problema con Anestecia?:<br></h4>
 <input class="input"  name="SiAnestecia" type="text" value="Ninguna" onFocus="javascript:this.value=''">
 
                  
                  
                  <input class="button1" type="submit" value="Aceptar">
            </form>
        <!--      <h3><font style="color: #3E6B89;"> NOTA: Si usted no cuenta con ninguna enfermedad señalada 
               anteriormente y cuenta con alguna diferente dar en siguiente</font>
            </h3>
          <form action="Parte1" method="post">
                
               <input name="clvpac" id="clvpac" value="<%=request.getParameter("id")%>" type="hidden">
                     <input type="hidden" name="e22" value="22">
               <input class="button1" type="submit" value="Siguiente">
            </form> -->
         </div>
      </section>
      <script src="js/Scroll.js"></script>
      <script src="js/menu.js"></script>
      <br><br>
      <br>
      <br>
      <script>
         (function() {
         
         if (!String.prototype.trim) {
         	(function() {
         		
         		var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
         		String.prototype.trim = function() {
         			return this.replace(rtrim, '');
         		};
         	})();
         }
         
         [].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
         	
         	if( inputEl.value.trim() !== '' ) {
         		classie.add( inputEl.parentNode, 'input--filled' );
         	}
         
         	
         	inputEl.addEventListener( 'focus', onInputFocus );
         	inputEl.addEventListener( 'blur', onInputBlur );
         } );
         
         function onInputFocus( ev ) {
         	classie.add( ev.target.parentNode, 'input--filled' );
         }
         
         function onInputBlur( ev ) {
         	if( ev.target.value.trim() === '' ) {
         		classie.remove( ev.target.parentNode, 'input--filled' );
         	}
         }
         })();
         
      </script>
      <div id="contenedorB">
         <center>
            <h4>INSTITUTO POLITÉCNICO NACIONAL</h4>
            D.R. Instituto Politécnico Nacional (IPN), Av. Luis Enrique Erro S/N, Unidad Profesional Adolfo López Mateos, Zacatenco, Delegación Gustavo A. Madero, C.P. 07738, Ciudad de México; México 2009-2013.
            <p>  Este sitio es una obra intelectual protegida por la Ley Federal del Derecho de Autor, puede ser reproducida con fines no lucrativos, siempre y cuando no se mutile, se cite la fuente completa y su dirección electrónica; su uso para otros fines, requiere autorización previa y por escrito del Director General del Instituto.
         </center>
      </div>
   </body>
</html>