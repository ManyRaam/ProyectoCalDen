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
       <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
      <meta charset="ISO-8859-1" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Historial</title>
      <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
      <link rel="stylesheet" type="text/css" href="css/normalize.css" />
      <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
      <link rel="stylesheet" type="text/css" href="css/demo.css" />
      <link rel="stylesheet" type="text/css" href="css/set2.css" />
      <link rel="stylesheet" href="css/Menu.css">
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <style>
         body{
         background: #1B1A1C;
         }
         #contenedor{
         padding: 1em;
         cursor: default;
         width: 25em;
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
         width: 100%;
             max-width: none; 
             height: 40px;
         }
         .button1{
         width: calc(100% - 0.1em);
         margin: 14px 0px;
         }
         .select{
         width: calc(100% - 15em);
         ont-family: arial;
         overflow: hidden;
         padding: 1em 0.5em;
         display: inline-block;
         color: #a1a3a4;
         font-weight: bold;
         border-radius: 0px;
          outline:0px;    
    border:none;
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
         textArea{
         background:  hsl(0, 0%, 79%);
         }
         option{
               border-radius: 20px;
             
         }
      </style>
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



#capafinal{
position:relative;

}


    
    .pricing__item :hover {
	 background: rgba(0, 0, 0, 0.74);
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
                  <li class="menu__item menu__item--current"><a href="#" class="menu__link">Historial</a></li>
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
            <h1>Cambios</h1>
            
        
            <form name="c" action="CambiarHistorial" method="post">
                
              
               
               
                    <h4>Enfermedad:</h4>
                <input class="input"  name="Otra" type="text" value="<%=request.getParameter("enfermedad")%>">
                 
               
               <br>
               <br>
               <h4>  Alergias:</h4>
             
               <br>
             
                 <input class="input"  name="SiMedica" type="text" value="<%=request.getParameter("alergias")%>">
              
               <br>
               <br>
               <h4> Medicamentos:<br></h4>
              
               <br>
              
                 <input class="input"  name="SiToma" type="text" value="<%=request.getParameter("prescripciones")%>">
             
               <br>
               <br>
               <h4>  Anestecia:<br></h4>
                
               <br>
              
                 <input class="input"  name="SiAnestecia" type="text" value="<%=request.getParameter("anestecia")%>">
          
               <br>
              
               <input name="clvpac" id="clvpac" value="<%=request.getParameter("id")%>" type="hidden">
               <input  class="button1" type="submit" value="Aceptar">
            </form>
            
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