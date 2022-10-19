<%-- 
   Document   : citas
   Created on : 13-oct-2016, 19:01:35
   Author     : Carlos vera
   --%>
<%@page import="proceso.var"%>
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
  
   
   
   
  
   }
   %>
<%
     usuario = (String)sesionOk.getAttribute("usuario");
    ArrayList<String> fechas = new ArrayList();
        List<var>listRo = null;
   
   Data objConn = null;
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   usuario u = (usuario)sesionOk.getAttribute("algo");
   AES j = new AES();

   objConn.open();
   listRo = objConn.selectCaleaftertoday(Integer.parseInt(j.decencriptar(u.getClvdoc())));
   List <var>listC = null;
   String  id="";
       id = request.getParameter("id").replace(' ','+');
 String  id2 = j.decencriptar(id);
   System.out.println("id alumno " + id2);
   objConn.setId(id2);       
   objConn.open();
   //listC = objConn.selectC();
   %>
<html lang="en" class="no-js">
   <head>
      <meta charset="ISO-8859-1" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>citas</title>
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
      <style>
         body{
         background: #1B1A1C;
         }
         #contenedor{
         padding: 1em;
         cursor: default;
         width: 24em;
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
      </style>
      </head
   <body>
      <header>
         <div style="background: #1B1A1C;" class="menus" >
           
            
            <nav class="menu menu--ceres">
               <ul class="menu__list">
                  <li class="menu__item" ><a href="menu.jsp" class="menu__link">Calendario</a></li>
                  <li class="menu__item"><a href="alum.jsp" class="menu__link">Pacientes</a></li>
                  <li class="menu__item menu__item--current"><a href="" class="menu__link">Citas</a></li>
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
                <script>
      
                    <% System.out.println("olaa");%>
                
            <%for(var algo:listRo ) {
                fechas.add(algo.getFecha());
                System.out.println(algo.getFecha());
            }%>
                var fechas = [
              <%  for(String algo:fechas){ %>
         <%="'"+algo+"',"%> 
        <%}%>
            ];
              function enviar(){
            var valido = true;
            var fechaselc = document.citas.fecha.value+"T"+document.citas.hora.value;
            
        for (i = 0; i < fechas.length; i++) {
   if(fechaselc === fechas[i]){
       valido = false;
       alert("la fecha/hora seleccionada ya esta ocupada");
} 



}
return valido;
}
 </script><h3 class="title">Citas</h3>
            <script language="javascript" type="text/javascript" src="validaformulario.js"> </script> 
            <form name = "citas" class="text" method="post" action="citas"  onsubmit=" return enviar()">
               <!--onSubmit = "return validarC(this)" action = "ValidaFormulario.html"--> 
             
               <span class="input input--kozakura">
                  <select id="pro" name="pro" class="select" Value="pro">
                     <option value="1"><label  class="label">Procedimiento:</label></option>
                     <option value="2">Alergias</option>
                     <option value="3">DX</option>
                     <option value="4">Profilaxis</option>
                     <option value="5">Ter.Cep</option>
                     <option value="6">Obtulacion</option>
                     <option value="7">Resina/Amalgama</option>
                     <option value="8">Extraccion</option>
                     <option value="9">Endodoncia</option>
                  </select>
               </span>
              
               <span class="input input--kozakura">
                 
                 
                  <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                     <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                  </svg>
               </span>
               <span class="input input--kozakura">
                  <h2>Fecha</h2>
 <%
            DateFormat fecha2 = new SimpleDateFormat("yyyy-MM-dd");
                     Calendar cal = Calendar.getInstance();
                
            %>
    <div class
         ="form-row show-inputbtns">
        <input name="fecha" type="date"   min="<%=fecha2.format(cal.getTime())%>" required/>
    </div>
    <div class="form-row">
    </div>
                  <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                     <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                  </svg>
               </span>
               <input type="text" name="clvpac" style="visibility:hidden; position: absolute;"  value="<%=id %>" >
              
               <span class="input input--kozakura">
                  <select id="hora" name="hora" class="select" >
                     <option value=""><label  class="label">Hora:</label></option>
                     <option value="15:00:00">3:00</option>
                     <option value="15:30:00">3:30</option>
                     <option value="16:00:00">4:00</option>
                     <option value="16:30:00">4:30</option>
                     <option value="17:00:00">5:00</option>
                     <option value="17:30:00">5:30</option>
                     <option value="18:00:00">6:00</option>
                     <option value="18:30:00">6:30</option>
                     <option value="19:00:00">7:00</option>
                     <option value="19:30:00">7:30</option>
                     <option value="20:00:00">8:00</option>
                     <option value="20:30:00">8:30</option>
                  </select>
               </span>
               <span class="input input--kozakura" style="float: right;">
               <input class="button1" type='submit' name='button'  value='Crear'>
               </span>
            </form>
            <br> <br> <br>
         </div>
      </section>
      </div>
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