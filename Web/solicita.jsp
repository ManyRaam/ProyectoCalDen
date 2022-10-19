<%@page import="java.util.ArrayList"%>
<%@page import="proceso.AES"%>
<%@page import="proceso.usuario"%>
<%@page import="proceso.Data"%>
<%@page import="java.util.List"%>
<%@page import="proceso.var"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Solicita.jsp
Created on : 4/05/2017, 03:21:07 PM
    Author     : Alejandro El mas rico de todos los godinez :v
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
      <%
          
HttpSession ok = request.getSession();
if (ok.getAttribute("paciente") == null) {
   %>
<jsp:forward page="loginnuevo.jsp">
   <jsp:param name="error" value="Es
      obligatorio identificarse"/>
</jsp:forward>
<%
   } 
else
{
    
}
        ArrayList<String> fechas = new ArrayList();
        List<var>listRo = null;
   var con = new var();
   Data objConn = null;
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   usuario u = (usuario)ok.getAttribute("paciente");
   AES j = new AES();

   objConn.open();
   listRo = objConn.selectCaleaftertoday(Integer.parseInt(j.decencriptar(u.getClvdoc())));
     

     
      %>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
      <link rel="stylesheet" type="text/css" href="css/normalize.css" />
      <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
      <link rel="stylesheet" type="text/css" href="css/demo.css" />
      <link rel="stylesheet" type="text/css" href="css/set2.css" />
      <link rel="stylesheet" href="css/Menu.css">
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <link rel="stylesheet" type="text/css" href="css/ComponenteRegistro.css" />
      <link rel="stylesheet" type="text/css" href="css/D.css" />
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
      <link rel="stylesheet" type="text/css" href="css/letras.css" />
    </head>
    <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
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
          .pricing__item {
          cursor: default;
          max-width: 57em;
         width: 100%;
        border-radius: 1px;
         background: rgba(0,0,0,0.3);
          padding: 30px 30px;
         box-shadow: 0 5px 20px rgba(0,0,0,0.05), 0 15px 30px -10px rgba(0,0,0,0.3);
         -webkit-transition: background 0.4s;
         transition: background 0.4s;
          }
          .pricing__item:hover {
              background: black;
          }
        .input{
         width: calc(100% - 0.1em);
         background:#494e57;
             position: relative;
              
                border: none;
                padding: 10;
                color: white;
                margin: 7;
                border-radius: 3px;
         }
.hide-replaced.ws-inputreplace {
    display: none !important;
}
.input-picker .picker-list td > button.othermonth {
    color: #888888;
    background: #fff;
}
.ws-inline-picker.ws-size-2, .ws-inline-picker.ws-size-4 {
    width: 49.6154em;
}
.ws-size-4 .ws-index-0, .ws-size-4 .ws-index-1 {
    border-bottom: 0.07692em solid #eee;
    padding-bottom: 1em;
    margin-bottom: 0.5em;
}
.picker-list.ws-index-2, .picker-list.ws-index-3 {
    margin-top: 3.5em;
}
div.ws-invalid input {
    border-color: #c88;
}
.ws-invalid label {
    color: #933;
}
div.ws-success input {
    border-color: #8c8;
}
form {
    margin: 10px auto;
    width: 700px;
    min-width: 49.6154em;
    border: 1px solid #000;
    padding: 10px;
}
.form-row {
    padding: 5px 10px;
    margin: 5px 0;
}
label {
    display: block;
    margin: 3px 0;
}
.form-row input {
    width: 220px;
    padding: 3px 1px;
    border: 1px solid #ccc;
    box-shadow: none;
}
.form-row input[type="checkbox"] {
    width: 15px;
}
.date-display {
    display: inline-block;
    min-width: 200px;
    padding: 5px;
    border: 1px solid #ccc;
    min-height: 1em;
}
.show-inputbtns .input-buttons {
    display: inline-block;
}
    </style>
     <div style="background: none;" class="menus" >
         
            <nav class="menu menu--ceres">
               <ul class="menu__list">
                    <li class="menu__item  " ><a href="paginaalumno.jsp" class="menu__link">Citas</a></li>
                    
                  <li class="menu__item menu__item--current"  ><a href="#" class="menu__link">Solicita una cita</a></li>
                 
                  <li class="menu__item"><a href="cerrars.jsp" class="menu__link">Salir</a></li>
               </ul>
            </nav>
         </div>
    <body style="background: #252a34;">
             <div id='calendar'></div>
   </div>
   <script>
       <%
            DateFormat fecha2 = new SimpleDateFormat("yyyy-MM-dd");
                     Calendar cal = Calendar.getInstance();
                
            %>
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
                                       
                                       
                                                           <%
               if( listRo != null )
               {
                   
                
                   
               for(var objvar : listRo )
               {
                   fechas.add(objvar.getFecha());
                   
              %>
                                       
                                       
            			{        color: '<%=objvar.getColor()%>',
            				title: '<%=objvar.getProcedimiento()%>', 
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
             
<!-- polyfiller file to detect and load polyfills -->

    <link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
    
         <div class="container">
         <section class="R bg-1" style="background:#252a34">
           
             
             
           
            <div class="pricing pricing--sonam">
                <div style="border-radius: 1px;   background: rgba(0,0,0,0.3);
         
         box-shadow: 0 5px 20px rgba(0,0,0,0.05), 0 15px 30px -10px rgba(0,0,0,0.3); "class="pricing__item">
                <h3 class="pricing__title" >Solicitud</h3>
                
                <script>
      
        var fechas = [
            <%for(String algo:fechas){ %>
       <%="'"+algo+"',"%> 
        <%}%>];
              function enviar(){
            var valido = true;
            var fechaselc = document.nombre.fecha.value+"T"+document.nombre.hora.value;
            
        for (i = 0; i < fechas.length; i++) {
   if(fechaselc === fechas[i]){
       valido = false;
       alert("la fecha/hora seleccionada ya esta ocupada");
} 
        }
return valido;


}
 </script>
        <form name="nombre" action ="respuestasoli"  onsubmit="return enviar();">      
            
            
            
         
     <h2>Fecha</h2>

    <div class="form-row show-inputbtns">
        <input name="fecha" type="date"   min="<%=fecha2.format(cal.getTime())%>" required/>
    </div>
    <div class="form-row">
    </div>
    
                     Hora : <select id="hora" name="hora" class="select" required>
                
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
                      </select><br>
                      <br>
         <input class="button1" type ="submit" value="Solicitar Cita" >
      
        </form>
</div>  </div>  </div>  
        
          <script src="js/Scroll.js"></script>
      <script src="js/menu.js"></script>
     
 
      <script src="js/counter.js"></script>
      <script src="js/retina.js"></script>
      <script src="js/custom.js"></script>
      <script src="js/menu.js"></script>
    </body>
</html>
