<%-- 
   Document   : menu
   Created on : 19-oct-2016, 10:29:27
   Author     : Carlos vera
   --%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="proceso.*" %>
<%@ page import="java.sql.*, java.util.*,java.lang.*,java.util.*, java.text.*,java.io.*,java.util.Date" %>
<%@ page session="true" %>
<%
    String clvdoc="";
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
usuario     u = (usuario)sesionOk.getAttribute("algo");
AES j = new AES();
 clvdoc = j.decencriptar(u.getClvdoc());
System.out.println("la clavo doctor es " + clvdoc);
   }
 
   List<var>listRo = null;
     List<var> listRo2 = null;
   Data objConn = null;
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.open();
   listRo = objConn.selectCale(Integer.parseInt(clvdoc));
   listRo2= objConn.selectOcupado(Integer.parseInt(clvdoc));
   
   
   
   %>
<html lang="en" class="no-js" style="background: none;">
   <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Menu</title>
      <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
      <link rel="stylesheet" href="css/Menu.css">
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <link id="bootstrap-style" href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
      <link id="base-style" href="css/style.css" rel="stylesheet">
      <link id="base-style-responsive" href="css/style-responsive.css" rel="stylesheet">
      <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
      <link href='calendar/fullcalendar.css' rel='stylesheet' />
      <link href='calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
      <script src='calendar/moment.min.js'></script>
      <script src='calendar/jquery.min.js'></script>
      <script src='calendar/fullcalendar.min.js'></script>
      <script src='calendar/locale/es.js'></script>
      <script src='js/angular.min.js'></script>
      <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
      <link rel="stylesheet" type="text/css" href="css/letras.css" />
      <% 
         Date date = new Date();
         DateFormat fecha = new SimpleDateFormat("yyyy/MM/dd");
         
      
      //  String clv = u.getTema();
         %>
         
          <%
         
          List<var>lists = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.setId(request.getParameter("id"));
   
   objConn.open();
    usuario us = (usuario)sesionOk.getAttribute("algo");
AES j = new AES();
   lists = objConn.Sesion(Integer.parseInt(j.decencriptar(us.getClvdoc())));
         
                     if( lists != null )
                     {
                     for(var objvar : lists )
                     {
                     System.out.println("color:"+objvar.getBarra()); 
                         
                     %>
         
      <style>
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
         canvas{
         display: <%=objvar.getParticulas()%>;
         }
         body{
             
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,<%=objvar.getFondo()%>), color-stop(100%,<%=objvar.getFondoB()%>));
             
         }
         <%
      
        String x =objvar.getFondo(); 
        System.out.println("fondo:::::::::"+x);
        if(x.equals("#C61951")){%>
          
 
         .menu--ceres .menu__link{
             color: #56132a;
         }
        <%}%>
      </style>
      
       <%
         }
                }
         objConn.close();
         %>
         
      <!--
         <canvas id="myCanvas" width="2900" height="72">
         Your browser does not support the HTML5 canvas tag.</canvas>-->
      <script>
         var c = document.getElementById("myCanvas");
         var ctx = c.getContext("2d");
         ctx.beginPath(0,0);
         ctx.moveTo(665, 63);
         ctx.strokeStyle = 'rgba(116,40,68,1)';
         ctx.lineWidth = 2;
         ctx.lineTo(2900, 63);
         ctx.stroke();
         
      </script>
      
   <div ng-app>
     
    <div Style="background: {{data.singleSelect}}">
            
      <div id="contenedor">
         <header>
            <div class="menus">
             
               <nav class="menu menu--ceres" style="position: none">
                  <ul class="menu__list" >
                     <li class="menu__item menu__item--current"><a href="#" class="menu__link">Calendario</a></li>
                     <li class="menu__item"><a href="alum.jsp" class="menu__link" >Pacientes</a></li>
                     <li class="menu__item"><a href="Registrar.jsp" class="menu__link">Registrar</a></li>
                     <li class="menu__item"><a href="reportes.jsp" class="menu__link">Reportes</a></li>
                     <li class="menu__item"><a href="Sesion.jsp" class="menu__link">Cuenta</a></li>
                                  <li class="menu__item"><a href="Solicitudes.jsp" class="menu__link">Citas</a></li>
                     <li class="menu__item"><a href="cerrars.jsp" class="menu__link" >Salir</a></li>
                  </ul>
               </nav>
            </div>
         </header>
         <%
            DateFormat fecha2 = new SimpleDateFormat("yyyy-MM-dd");
                     Calendar cal = Calendar.getInstance();
                 
            %>
         <script>
            $(document).ready(function() {
            	
            	$('#calendar').fullCalendar({
                                  lang: 'es',
                                monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
                   monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
                                dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
               dayNamesShort: ['Dom','Lun','Mar','Mié','Jue','Vie','Sáb'],
            		header: {
            			left: 'prev,next today',
            			center: 'title',
            			right: 'month,agendaWeek,agendaDay,listWeek'
            		},
            		defaultDate: '<%=fecha2.format(cal.getTime())%>',
            		navLinks: true, // can click day/week names to navigate views
            		editable: true,
            		eventLimit: true, // allow "more" link when too many events
            		events: [
                                       <%if(listRo2!=null) {%>
                                           
                                          <% for(var objvar : listRo2 )
               {%>
                                           
                                           {        color: '<%=objvar.getColor()%>',
            				title: '<%=objvar.getProcedimiento()%>' , 
            				start: '<%=objvar.getFecha()%>',
                                                    end: '<%=objvar.getEnd()%>'
            			},
                                           
                                           
                                       <%}} %>
                                       
                                                           <%
               if( listRo != null )
               {
                   
                  
                   
               for(var objvar : listRo )
               {
                   
                   
               %>
                                       
                                       
            			{        color: '<%=objvar.getColor()%>',
            				title: '<%=objvar.getProcedimiento()%> <% if(objvar.getNombre()!=null){ %> - Paciente: <%=objvar.getNombre()%> <%=objvar.getApellidop()%>' <%}%>, 
            				start: '<%=objvar.getFecha()%>',
                                                    end: '<%=objvar.getEnd()%>'
            			},
            			
                                           
                                                       <%
               }
                      }
               objConn.close();
               %>
                       
            		]
            	});
            	
            });
            
         </script>
         <link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
         <style>   
              .menu {
  
     margin: 0;
        }
    .menu__link {
    font-size: 1.19em;}
      
            body {
            padding: 0;
            font-family: 'Poiret One', cursive;
            font-size: 14px;
            color:white;
            }
            canvas{
         z-index: -1;
         position: fixed;
         display: {{particulas}};
         }
            #calendar {
            max-width: 1000px;
            margin: 0 auto;
            background: rgba(0, 0, 0, 0.17);
            border: 30px solid rgba(0, 0, 0, 0);
            border-radius: 5px;
            }
            .boton{
                    background: rgba(231, 237, 243, 0.21);
    border: none;
    border-radius: 3px;
    color: #fff;
    display: inline-block;
    font-size: 14px;
    padding: 8px 15px;
    text-decoration: none;
    text-align: center;
    min-width: 60px;
    position: relative;
    transition: color .1s ease;
    padding: 5px 5px;
     outline:0px;    
    border:none;
                     left: 90%;
            }
            .boton:hover{
                    background: #357ebd;
            }
            select{
                background: rgba(255, 255, 255, 0.32);
                 outline:0px;    
    border:none;
     left: 80%;
     color: white;
            }
            option{
                
               color:black;
                 outline:0px;    
    border:none;
            }
  canvas{
      z-index: -1;
      position: fixed;
      }
      #circle {
	width: 10px;
	height: 10px;
	background: red;
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	border-radius: 50px;
}

 #myDIV{
         position:relative;
         display:none;
         }
 .menu--ceres .menu__link:focus {
         color:  {{data.singleSelect === "#252A34" ? "#FF2E63" : ""}}
         {{data.singleSelect === "#522546" ? "#E23E57" : ""}}
         {{data.singleSelect === "#BE3144" ? "#C9707C" : ""}}
         {{data.singleSelect === "#F38181" ? "#FCE38A" : ""}}
         {{data.singleSelect === "#3EC1D3" ? "#F6F7D7" : ""}}
         {{data.singleSelect === "#95E1D3" ? "#F38181" : ""}}
         {{data.singleSelect === "#10DDC2" ? "#F5F5F5" : ""}}
         {{data.singleSelect === "#FF89C0" ? "#6DF1CC" : ""}}
         {{data.singleSelect === "#AA96DA" ? "#A8D8EA" : ""}}
         {{data.singleSelect === "#C61951" ? "#56132A" : ""}}
         ;
         }
         .menu--ceres .menu__item--current .menu__link {
         color:  
              {{data.singleSelect === "#252A34" ? "#FF2E63" : ""}}
         {{data.singleSelect === "#522546" ? "#E23E57" : ""}}
         {{data.singleSelect === "#BE3144" ? "#C9707C" : ""}}
         {{data.singleSelect === "#F38181" ? "#FCE38A" : ""}}
         {{data.singleSelect === "#3EC1D3" ? "#F6F7D7" : ""}}
         {{data.singleSelect === "#95E1D3" ? "#F38181" : ""}}
         {{data.singleSelect === "#10DDC2" ? "#F5F5F5" : ""}}
         {{data.singleSelect === "#FF89C0" ? "#6DF1CC" : ""}}
         {{data.singleSelect === "#AA96DA" ? "#A8D8EA" : ""}}
         {{data.singleSelect === "#C61951" ? "#56132A" : ""}}
         ;
         }
         .menu--ceres .menu__item::before,
         .menu--ceres .menu__item::after,
         .menu--ceres .menu__link::after {
         content: '';
         position: absolute;
         bottom: 0;
         background: 
         {{data.singleSelect === "#252A34" ? "#FF2E63" : ""}}
         {{data.singleSelect === "#522546" ? "#E23E57" : ""}}
         {{data.singleSelect === "#BE3144" ? "#C9707C" : ""}}
         {{data.singleSelect === "#F38181" ? "#FCE38A" : ""}}
         {{data.singleSelect === "#3EC1D3" ? "#F6F7D7" : ""}}
         {{data.singleSelect === "#95E1D3" ? "#F38181" : ""}}
         {{data.singleSelect === "#10DDC2" ? "#F5F5F5" : ""}}
         {{data.singleSelect === "#FF89C0" ? "#6DF1CC" : ""}}
         {{data.singleSelect === "#AA96DA" ? "#A8D8EA" : ""}}
         {{data.singleSelect === "#C61951" ? "#56132A" : ""}}
         ;
         }
         .menu--ceres .menu__link{
             
             color: {{data.singleSelect === "#F38181" ? "#5f5f5f" : ""}}
             {{data.singleSelect === "#3EC1D3" ? "#5f5f5f" : ""}}
             {{data.singleSelect === "#95E1D3" ? "#5f5f5f" : ""}}
             {{data.singleSelect === "#10DDC2" ? "#5f5f5f" : ""}}
             {{data.singleSelect === "#FF89C0" ? "#5f5f5f" : ""}}
             {{data.singleSelect === "#AA96DA" ? "#5f5f5f" : ""}};
         }
         .menu--ceres .menu__link{
             
             color: {{data.singleSelect === "#C61951" ? "#56132a" : ""}};
         }
         </style>
   </head>
   <body>
           <div id="particles-js"></div>
      <script src="particles.js"></script>
      <script src="particulas.js"></script>
   <br><br><br><br>
   <!-- <div class="grid__item color-11">
      <center><a class="link link--yaku" href="#" style="font-size: 400%; color:#2b2e4a">
      <span>C</span><span>a</span><span>l</span><span>e</span><span>n</span><span>d</span><span>a</span><span>r</span><span>i</span><span>o</span>					
      </a></center>
      </div>-->
   <br>
   
   <div id=myDIV>
       <table align="center">
           <tr><td>
   <select name="singleSelect" values="colores" style=" position: absolute;" ng-model="data.singleSelect">
        <option value="">Colores</option>
        <option value=" ">Original</option>
      <option value="#252A34">Opcion 1</option>
      <option value="#522546">Opcion 2</option>
      <option value="#FED8A7">Opcion 3</option>
      <option value="#F38181">Opcion 4</option>
      <option value="#3EC1D3">Opcion 5</option>
      <option value="#95E1D3">Opcion 6</option>
      <option value="#10DDC2">Opcion 7</option>
      <option value="#FF89C0">Opcion 8</option>
      <option value="#AA96DA">Opcion 9</option>
      <option value="#C61951">Opcion 10</option>
      
      
    </select>
               <br><br><br>
   <select name="p" value="particulas" style=" position: absolute;" ng-model="particulas">
         <option value="">Particulas</option>
      <option value="block">Si</option>
      <option value="none">No</option>
      
    </select>
               </td></tr>
   </table>
   
     <form name = "tema" class="text" method="post" action="Tema">
       
       
       <input name="tema" id="tema" value='{{data.singleSelect === " " ? "1" : ""}}{{data.singleSelect === "#252A34" ? "2" : ""}}{{data.singleSelect === "#522546" ? "3" : ""}}{{data.singleSelect === "#BE3144" ? "4" : ""}}{{data.singleSelect === "#F38181" ? "5" : ""}}{{data.singleSelect === "#3EC1D3" ? "6" : ""}}{{data.singleSelect === "#95E1D3" ? "7" : ""}}{{data.singleSelect === "#10DDC2" ? "8" : ""}}{{data.singleSelect === "#FF89C0" ? "9" : ""}}{{data.singleSelect === "#AA96DA" ? "10" : ""}}{{data.singleSelect === "#C61951" ? "11" : ""}}' type="hidden">
       <input name="particulas" id="particulas" value='{{particulas}}' type="hidden">
      
       <br><br>
       <input  type='submit' name='button'  class="boton" style="background:  hsla(340, 82%, 52%, 0.53); left: 92%;"  value='Guardar'>
   </form>
       </div>
  <button onclick="myFunction()" class="boton">Personalizar</button>
   
   <script>
       
 function myFunction() {
    document.getElementById("myDIV").style.display = "block";
}
       
   </script> 
    
     
    
  <!--  <tt>Fondo = {{data.singleSelect}}</tt>
    <br>
    Barra = {{data.singleSelect === "#252A34" ? "#FF2E63" : ""}}-->
   <div id='calendar'></div>
   </div>
   <script src="js/Letras.js"></script>
   <script src="js/menu.js"></script>
   <br><br>
   <br>
   
   <div id="contenedorB">
       
       
      
  
  
   <center><h4>INSTITUTO POLITÉCNICO NACIONAL</h4>
   D.R. Instituto Politécnico Nacional (IPN), Av. Luis Enrique Erro S/N, Unidad Profesional Adolfo López Mateos, Zacatenco, Delegación Gustavo A. Madero, C.P. 07738, Ciudad de México; México 2009-2013.
   Este sitio es una obra intelectual protegida por la Ley Federal del Derecho de Autor, puede ser reproducida con fines no lucrativos, siempre y cuando no se mutile, se cite la fuente completa y su dirección electrónica; su uso para otros fines, requiere autorización previa y por escrito del Director General del Instituto.
   </center>
   </div>
   </div></div>
   </body>
  
</html>