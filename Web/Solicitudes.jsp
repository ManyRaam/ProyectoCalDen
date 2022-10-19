<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Solicitudes
    Created on : 6/05/2017, 03:08:01 AM
    Author     : alegp
--%>

<%@page import="proceso.usuario"%>
<%@page import="proceso.AES"%>
<%@page import="java.util.List"%>
<%@page import="proceso.Data"%>
<%@page import="proceso.var"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String usuario = "";
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
AES j = new AES( ) ; 
usuario u = (usuario)sesionOk.getAttribute("algo");
   List<var> listsoli = null ;
   Data objConn = null;
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setId(j.decencriptar(u.getClvdoc()));
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   objConn.open();
   listsoli = objConn.SelectSoli2() ; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
    
      <title>Citas</title>
      <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
      <link rel="stylesheet" href="css/Menu.css">
      <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <link rel="stylesheet" type="text/css" href="css/buttons.css" />
      <link rel="stylesheet" href="css/ot/stylePOP.css">
      <link rel="stylesheet" href="css/ajsutestabla.css">
      <link rel="stylesheet" href="css/style-Tabla.css">
      <script src="js/Scroll-table.js"></script>
       <link id="base-style-responsive" href="css/style-responsive.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="css/set3.css" />
      <link rel="stylesheet" type="text/css" href="css/letras.css" />
      <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
         <link rel="stylesheet" type="text/css" href="css/set2.css" />
    </head>
    
    <style>
        #contenedor{
         cursor: default;
          max-width: 57em;
         width: 100%;
        
         
         background: rgba(0,0,0,0.3);
          padding: 30px 30px;
         box-shadow: 0 5px 20px rgba(0,0,0,0.05), 0 15px 30px -10px rgba(0,0,0,0.3);
         -webkit-transition: background 0.4s;
         transition: background 0.4s;
         }
         
         #contenedor:hover {
         background: black;
         
         }
    </style>
    
      <%
         
          List<var>lists = null;
       ArrayList<String> fechas = new ArrayList();
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.setId(request.getParameter("id"));
   
   objConn.open();
    usuario us = (usuario)sesionOk.getAttribute("algo");
AES aes = new AES();
   lists = objConn.Sesion(Integer.parseInt(aes.decencriptar(us.getClvdoc())));
         
                     if( lists != null )
                     {
                     for(var objvar : lists )
                     {
                     System.out.println("color:"+objvar.getBarra()); 
                         
                     %>
         
      <style>
          html{
              background: none;
          }
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
            
             
            
            background: linear-gradient(to right, <%=objvar.getFondo()%>, <%=objvar.getFondoB()%>);
              <%
             

            if(objvar.getFondo().equals("#252A34")){
             %>
             
             background: linear-gradient(to right, #111, <%=objvar.getFondoB()%>);
             
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
      
    <body>
        <div style="background: none;" class="menus">
        <nav class="menu menu--ceres"  >
               <ul class="menu__list">
               <li class="menu__item "><a href="menu.jsp" class="menu__link">Calendario</a></li>
                     <li class="menu__item"><a href="alum.jsp" class="menu__link" >Pacientes</a></li>
                     <li class="menu__item"><a href="Registrar.jsp" class="menu__link">Registrar</a></li>
                     <li class="menu__item"><a href="reportes.jsp" class="menu__link">Reportes</a></li>
                     <li class="menu__item"><a href="Sesion.jsp" class="menu__link">Cuenta</a></li>
                     <li class="menu__item menu__item--current"><a href="#" class="menu__link">Solicitudes</a></li>
                     <li class="menu__item"><a href="cerrars.jsp" class="menu__link" >Salir</a></li>
                      </ul>
            </nav>
                     </div>
                     
       <div id="particles-js"></div>
      <script src="particles.js"></script>
      <script src="particulas.js"></script>
      <br><br><br>
      <div id="contenedor">
          <div class="grid__item color-9">
            <center><a class="link B" style="font-size: 3em; color:#d8e8e3;" href="#"><span>Solici</span><span>tudes</span></a></center>
         </div>
          <br>
          <div  class="tbl-header">
    <%  if(listsoli!=null) { %>
    <h1 > Citas Pendientes </h1>
     <table cellpadding="0" cellspacing="0" border="0">
               <thead>
                  <tr>
                    
                     <th>Fecha</th>
                     <th>Paciente</th>
                     <th>Procedimiento</th>
                    
                  </tr>
               </thead>
            </table>
    
    
    </div>
      <div  class="tbl-content">
          <table cellpadding="0" cellspacing="0" border="0"  id="myTable">
              <tbody>
     <% for (var a:listsoli){    fechas.add(a.getFecha());%>
     
     <tr> <td >  <%=a.getFecha()%> </td> <td> <%String nombre = a.getNombre()+" "+a.getApellidop();%> 
         <%=nombre%> </td> <td> <%=a.getProcedimiento()%> </td> 
     
     
     
     
        
     <% }  %> 
     </div></div>
    </table > 
      
  <%  } else{  %>
  <label  style="    padding: 0 17em;" class="label">NO HAY  CITAS </label>
  
  

  <%} %>
    <br><br><br><br><br><br><br><br>
      <div id="contenedor">
    Voy a estar ocupado  
    
   <form name="forma" onsubmit="return validar()" action="ocupado">
       <%
            DateFormat fecha2 = new SimpleDateFormat("yyyy-MM-dd");
                     Calendar cal = Calendar.getInstance();
                
            %>
        <input name="fecha" type="date"  id="fechain" min="<%=fecha2.format(cal.getTime())%>" required />
          <input name="fechafinal" id="fechafin" type="date"   min="<%=fecha2.format(cal.getTime())%>" style="visibility:hidden" />
       <select name="horainic"  id="horain">
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
          <select name="horafinal"  id="horafin"> 
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
       <select name="tipo" onchange="metodin()" value="Tipo"> 
           <option value="0">Horas en un dia determinado </option> 
           <option value="1"> Varios dias </option>
           <option value="2"> Un dia completo </option>
       </select>
       <input type="submit" value="agregar">
       <script> 
           var horas = ["15:00:00","15:30:00","16:00:00","16:30:00","17:00:00","17:30:00","18:00:00","18:30:00","19:00:00","19:30:00","20:00:00","20:30:00"]
          var fechas = [   <%  for(String algo:fechas){ %>
         <%="'"+algo+"',"%> 
        <%}%>
            ];
            function metodin() {
            if (document.forma.tipo.value === "0") {
                   document.getElementById("fechafin").style.visibility = 'hidden';
                      document.getElementById("horafin").required = false;
                document.getElementById("horafin").style.visibility = 'visible';
                 document.getElementById("horafin").required = true;
                document.getElementById("horain").style.visibility = 'visible';
                 document.getElementById("horain").required = true;
            }
            if (document.forma.tipo.value === "1") {
                document.getElementById("fechafin").style.visibility = 'visible';
                   document.getElementById("fechafin").required = true;
                document.getElementById("horafin").style.visibility = 'hidden';
                document.getElementById("horain").style.visibility = 'hidden';
                   document.getElementById("horain").required = false;
                      document.getElementById("horafin").required = true;
               
            }
            if (document.forma.tipo.value === "2") {
                  document.getElementById("fechafin").style.visibility = 'hidden';
                document.getElementById("horafin").style.visibility = 'hidden';
                document.getElementById("horain").style.visibility = 'hidden';
                   document.getElementById("horain").required = false;
                      document.getElementById("horafin").required = false;
                         document.getElementById("fechafin").required = false;
            }
        }
        function validar(){
            if(document.forma.tipo.value === "2" ){
                var fechaselec = document.getElementById("fechain").value;
                var año = fechaselec.substring(0, 4);
                var mes = fechaselec.substring(5,7);
                var dia = fechaselec.substring(8,10);
               fechaselec= dia +"-" +mes +"-"+ año;
               for(var i=0;i<fechas.length;i++){
                   if(fechaselec===fechas[i].substring(0,10)){
                       alert("Esa fecha tienes cita") ;
                       return false;
                   }
               }
            }
            if(document.forma.tipo.value==="0"){
                 var fechaselec = document.getElementById("fechain").value;
                 var horain = document.getElementById("horain").value;
                var horafin = document.getElementById("horafin").value;
                 if (horafin===horain) {
                alert("la hora es la misma") ;      
                return false;
                 }
                 
                 var año = fechaselec.substring(0, 4);
                var mes = fechaselec.substring(5,7);
                var dia = fechaselec.substring(8,10);
               fechaselec= dia +"-" +mes +"-"+ año;
                for(var i=0;i<fechas.length;i++){
                    for(var d=horas.indexOf(horain);d<=horas.indexOf(horafin);d++){
                    
                   if((fechaselec+" "+horas[d])===fechas[i]){
                       alert("Durante esas horas tienes una cita") ;
                       return false;
                   }}
               }
            }
             if(document.forma.tipo.value==="1"){
                      var fechaselec = document.getElementById("fechain").value;
                var año = fechaselec.substring(0, 4);
                var mes = fechaselec.substring(5,7);
                var dia = fechaselec.substring(8,10);
                 fechaselec= dia +"-" +mes +"-"+ año;
                 var fechaselec2 = document.getElementById("fechafin").value;
                 mes2 = fechaselec2.substring(5,7);
                 dia2 = fechaselec2.substring(8,10);
            if(mes!==mes2){
                alert("separe en 2 el primer rango que termine en el ultimo  dia del mes y el segundo empezando en el primer dia del siguiente mes");
                return false;
            }
               for(var i=0;i<fechas.length;i++){
                   for(var j  = dia;j<=dia2;j++){
                        fechaselec= j +"-" +mes +"-"+ año;
                   if(fechaselec===fechas[i].substring(0,10)){
                       alert("Durante esas fechas tienes citas") ;
                       return false;
                   }}
               }
            }
    
        }
           </script> 
       
   </form></div>
      </body>
         <script src="js/Letras.js"></script>
      <script src="js/Scroll.js"></script>
      <script src="js/menu.js"></script>
</html>
