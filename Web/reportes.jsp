<%@page import="proceso.AES"%>
<%@page import="proceso.usuario"%>
<%@page import="java.util.Calendar"%>
<%@page import="proceso.var"%>
<%@page import="java.util.List"%>
<%@page import="proceso.Data"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
﻿
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
   String usuario = "";
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
       Data objConn = null;
                       var con = new var();
   %>
<%
   List<var>listA = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.open();
   listA = objConn.DatosReporteAl();
   %>
<%
   List<var>listD = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.open();
   listD = objConn.DatosReporteDir();
   
   
   
   List<var>listDoc = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.open();
   listDoc = objConn.DatosReporteDoc();
   
   
     List<var>listE = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.open();
   listE = objConn.DatosReporteE();
   
   
   
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
   %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Informe Odontologico</title>
      <link rel="shortcut icon" href="img/ipn.jpg" type="image/png"/>
      <link rel="stylesheet" type="text/css" href="css/normalize.css" />
      <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
      <link rel="stylesheet" type="text/css" href="css/demo.css" />
      <link rel="stylesheet" type="text/css" href="css/set2.css" />
      <link rel="stylesheet" href="css/Menu.css">
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <link rel="stylesheet" type="text/css" href="css/ComponenteRegistro.css" />
      <div id="particles-js"></div>
      <script src="particles.js"></script>
      <script src="particulas.js"></script>
      <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
      <style>
         
              .menu {
  
      margin-top: -22;
        }
         html{
         background: none;
         }
         td{
         text-align: center;
         }
         input {
         width: 100%;
         }
         select {
         width: 100%;
         }
         body{
         background:#FFFFFF;
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
         #contenedor {
         width: 40%;
         height: 50%;
         margin: 0 auto;
         background-color: #d94f5c;
         border: 10px solid #d94f5c;
         border-radius: 20px;
         box-shadow: 0 6px  #d94f5c;
         }
           .pricing--sonam .pricing__action {
             background:   rgba(255, 46, 99, 0.3);
              z-index: 1;
                  margin-top: 10px;
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
          .pricing__item {
              
          background: black;    
          
          }
          canvas{
         display: <%=objvar.getParticulas()%>;
         }
         body{
            
             
            
            background: linear-gradient(to right, <%=objvar.getFondo()%>, <%=objvar.getFondoB()%>);
              <%
             

            if(objvar.getFondo().equals("#252A34")){
             %>
             
            background: radial-gradient(circle, #111, <%=objvar.getFondoB()%>, #111);
             
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
      <script>
         var num = 1;
         function myFunction() {
             window.print();
         }
             var today = new Date();
             var dd = today.getDate();
             var mm = today.getMonth()+1;
             var yyyy = today.getFullYear();
             if(dd<10){
                 dd='0'+dd
             } 
             if(mm<10){
                 mm='0'+mm
             } 
             var today = dd+'/'+mm+'/'+yyyy;
             document.getElementById("DATE").value = today;
         
         
         
      </script>
   </head>
   <body>
      <%   String A = null;String alumno =request.getParameter("T");%>
      <%
         String x=request.getParameter("n2");
          %>
      <%
         DateFormat fecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
           DateFormat fecha2 = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
         // System.out.println("fecha::::::"+fecha.format(cal.getTime()));
         //System.out.println("fecha2::::::"+fecha2.format(cal.getTime()));
         
         
         
         %>        
      <%
         String nombre=" ";
         for(var objvar : lists )
         {
         
         
         nombre = objvar.getNombre()+" "+objvar.getApellidop()+" "+objvar.getApellidom();
         
         
         
         
         
         }
             
         %>
      <%if(x==null) {%> 
   
      
      <header>
         <div style="background: none;" class="menus" >
            <nav class="menu menu--ceres">
               <ul class="menu__list">
                  <li class="menu__item" ><a href="menu.jsp" class="menu__link">Calendario</a></li>
                  <li class="menu__item"><a href="alum.jsp" class="menu__link">Pacientes</a></li>
                  <li class="menu__item "><a href="Registrar.jsp" class="menu__link">Registrar</a></li>
                  <li class="menu__item menu__item--current "><a href="" class="menu__link">Reportes</a></li>
                  <li class="menu__item"><a href="Sesion.jsp" class="menu__link">Cuenta</a></li>
                   <li class="menu__item"><a href="Solicitudes.jsp" class="menu__link">Citas</a></li>
                  <li class="menu__item"><a href="cerrars.jsp" class="menu__link">Salir</a></a></li>
               </ul>
            </nav>
         </div>
      </header>
      <script language="javascript" type="text/javascript" src="validaformulario.js"> </script> 
      <div class="container">
      <section class="R bg-1" style="background:none">
         <!-- <h2 class="pricing-section__title">Registro</h2>--><br><br><br>
         <div class="pricing pricing--sonam">
            <div class="pricing__item" style="//background: black;">
               <h3 class="pricing__title">Reportes</h3>
               <form name = "citas" class="text" method="post" action="reportes.jsp">
                  <div class="pricing__price"><span class="pricing__currency" style=" color: #FF2E63;">Tipos</span> </div>
                  <p class="pricing__sentence">
                     Seleccionar: 
                     <input name="n2" id="n2" value="true" type="hidden">
                     <select id="T" name="T" class="select" >
                        <option value="1">Alumno</option>
                        <option value="2">Administrativo</option>
                        <option value="3">Externo</option>
                        <option value="4">Docente</option>
                     </select>
                  </p>
                  <br>
                  <br>
                  <br>
                  <br><br><br><br><br><br>
                  <input class="pricing__action" type='submit' name='button'  value='Consultar'>
               </form >
            </div>
            <%  
               // int y =Integer.parseInt(request.getParameter("T"));
                  String y = request.getParameter("T");
                %>
            <%}%> 
            <%   if( request.getParameter("n2")!=null && alumno.equals("1")) {%> 
            <table style="width: 100%">
               <tr>
                   
                  <th>
                      <img src="img/ipn2.png" style="width:20% ;height:auto;">


                  </th>
                  <th align = "center">
                     INSTITUTO POLITECNICO NACIONAL<br>
                     CENTRO DE ESTUDIOS CIENTIFICOS Y TECNOLOGICOS JUAN DE DIOS BATIZ<br>
                     DIRECCION DE SERVICIOS ESTUDIANTILES<BR>
                     DEPARTAMENTO DE SERVICIOS MEDICOS
                     <br><br>
                     INFORME ODONTOLOGICO
                  </th>
                  <th>
                      <img src="img/cecyt9.jpg" style="width:20% ;height:auto;">
                  </th>
               </tr>
            </table>
            <br><br>
            <table style="width: 100%">
               <TR>
                  <th align ="rigth">
                     RESPONSABLE: <%=nombre%>
                  </th>
                  <TH align ="rigth">
                     FECHA:<script>document.write(today);</script>
                  </TH>
               </TR>
            </table>
            <br>
            <table border="1" style="width: 100%">
               <tr>
                  <th colspan="4"></th>
                  <th colspan="2">Sexo</th>
                  <th colspan="9">Tratamientos</th>
                  <th></th>
               </tr>
               <tr id="lala">
                  <th>No.</th>
                  <th>Visita</th>
                  <th>Nombre</th>
                  <th>Boleta</th>
                  <th>F</th>
                  <th>M</th>
                  <th>Alergia</th>
                  <th>DX</th>
                  <th>Profilaxis</th>
                  <th>Ter. Cep</th>
                  <th>Obtulacion</th>
                  <th>Resina/Amalgama</th>
                  <th>Extracción</th>
                  <th>Endodoncia</th>
                  <th>Otros</th>
                  <th>Observaciones</th>
               </tr>
               <tbody>
                  <%
                     if( listA != null )
                     { %>
                  <%
                     int n=1;
                     for(var objvar : listA )
                     {%>
                  <tr>
                     <td colspan="1" ><%=n++%></td>
                     <td>
                        <select style="border: none;" name = 'T'>
                           <option selected='selected' value='Si'>Si</option>
                           <option selected='selected' value='No'>No</option>
                        </select>
                     </td>
                     <td><%=objvar.getNombre()%> <%=objvar.getApellidop()%> <%=objvar.getApellidom()%></td>
                     <center>
                        <td><%=objvar.getBoleta()%></td>
                     </center>
                     <%if(objvar.getSexoo().equals("x")){%>
                     <td> </td>
                     <td>X</td>
                     <%}%> 
                     <%if(objvar.getSexoo().equals("y")){%>
                     <td>X</td>
                     <td> </td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("alergia")){%>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("DX")){%>
                     <td>NO</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Profilaxis")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Ter.Cep")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Obtulacion")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Resina/Amalgama")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Extraccion")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>Si</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("engodoncia")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>Si</td>
                     <%}%> 
                     <td> <input type='text' style="border: none;"> </td>
                     <td> <input type='text' style="border: none;" ></td>
                  </tr>
                  <%}%>
               </tbody>
            </table>
            <%
               } else{%>
            <tr>
                 <center><h1>no hay citas hoy</h1></center>
            </tr>
            <% }
               %>
            </table>
            <button onclick="myFunction()">Imprimir
            </button>
            <%}%> 
            <%   if( request.getParameter("n2")!=null && alumno.equals("2")) {%> 
            <table style="width: 100%">
               <tr>
                  <th>
                      <img src="img/ipn2.png" style="width:20% ;height:auto;">


                  </th>
                  <th align = "center">
                     INSTITUTO POLITECNICO NACIONAL<br>
                     CENTRO DE ESTUDIOS CIENTIFICOS Y TECNOLOGICOS JUAN DE DIOS BATIZ<br>
                     DIRECCION DE SERVICIOS ESTUDIANTILES<BR>
                     DEPARTAMENTO DE SERVICIOS MEDICOS
                     <br><br>
                     INFORME ODONTOLOGICO
                  </th>
                  <th>
                      <img src="img/cecyt9.jpg" style="width:20% ;height:auto;">
                  </th>
               </tr>
            </table>
            <br><br>
            <table style="width: 100%">
               <TR>
                  <th align ="rigth">
                     RESPONSABLE: <%=nombre%>
                  </th>
                  <TH align ="rigth">
                     FECHA:<script>document.write(today);</script>
                  </TH>
               </TR>
            </table>
            <br>
            <table border="1" style="width: 100%">
               <tr>
                  <th colspan="4"></th>
                  <th colspan="2">Sexo</th>
                  <th colspan="9">Tratamientos</th>
                  <th></th>
               </tr>
               <tr id="lala">
                  <th>No.</th>
                  <th>Visita</th>
                  <th>Nombre</th>
                  <th>Area</th>
                  <th>F</th>
                  <th>M</th>
                  <th>Alergia</th>
                  <th>DX</th>
                  <th>Profilaxis</th>
                  <th>Ter. Cep</th>
                  <th>Obtulacion</th>
                  <th>Resina/Amalgama</th>
                  <th>Extracción</th>
                  <th>Endodoncia</th>
                  <th>Otros</th>
                  <th>Observaciones</th>
               </tr>
               <tbody>
                  <%
                     if( listD != null )
                     { %>
                  <%
                     int n=1;
                     for(var objvar : listD )
                     {%>
                  <tr>
                     <td colspan="1" ><%=n++%></td>
                     <td>
                        <select style="border: none;" name = 'T'>
                           <option selected='selected' value='Si'>Si</option>
                           <option selected='selected' value='No'>No</option>
                        </select>
                     </td>
                     <td><%=objvar.getNombre()%> <%=objvar.getApellidop()%> <%=objvar.getApellidom()%></td>
                     <center>
                        <td><%=objvar.getArea()%></td>
                     </center>
                     <%if(objvar.getSexoo().equals("x")){%>
                     <td> </td>
                     <td>X</td>
                     <%}%> 
                     <%if(objvar.getSexoo().equals("y")){%>
                     <td>X</td>
                     <td> </td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("alergia")){%>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("DX")){%>
                     <td>NO</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Profilaxis")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Ter.Cep")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Obtulacion")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Resina/Amalgama")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Extraccion")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>Si</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("engodoncia")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>Si</td>
                     <%}%> 
                     <td> <input type='text' style="border: none;"> </td>
                     <td> <input type='text' style="border: none;" ></td>
                  </tr>
                  <%}%>
               </tbody>
            </table>
            <%
               } else{%>
            <tr>
                 <center><h1>no hay citas hoy</h1></center>
            </tr>
            <% }
               %>
            </table>
            <button onclick="myFunction()">Imprimir
            </button>
            <%}%> 
            
             <%   if( request.getParameter("n2")!=null && alumno.equals("4")) {%> 
            <table style="width: 100%">
               <tr>
                  <th>
                      <img src="img/ipn2.png" style="width:20% ;height:auto;">


                  </th>
                  <th align = "center">
                     INSTITUTO POLITECNICO NACIONAL<br>
                     CENTRO DE ESTUDIOS CIENTIFICOS Y TECNOLOGICOS JUAN DE DIOS BATIZ<br>
                     DIRECCION DE SERVICIOS ESTUDIANTILES<BR>
                     DEPARTAMENTO DE SERVICIOS MEDICOS
                     <br><br>
                     INFORME ODONTOLOGICO
                  </th>
                  <th>
                      <img src="img/cecyt9.jpg" style="width:20% ;height:auto;">
                  </th>
               </tr>
            </table>
            <br><br>
            <table style="width: 100%">
               <TR>
                  <th align ="rigth">
                     RESPONSABLE: <%=nombre%>
                  </th>
                  <TH align ="rigth">
                     FECHA:<script>document.write(today);</script>
                  </TH>
               </TR>
            </table>
            <br>
            <table border="1" style="width: 100%">
               <tr>
                  <th colspan="4"></th>
                  <th colspan="2">Sexo</th>
                  <th colspan="9">Tratamientos</th>
                  <th></th>
               </tr>
               <tr id="lala">
                  <th>No.</th>
                  <th>Visita</th>
                  <th>Nombre</th>
                  <th>Area</th>
                  <th>F</th>
                  <th>M</th>
                  <th>Alergia</th>
                  <th>DX</th>
                  <th>Profilaxis</th>
                  <th>Ter. Cep</th>
                  <th>Obtulacion</th>
                  <th>Resina/Amalgama</th>
                  <th>Extracción</th>
                  <th>Endodoncia</th>
                  <th>Otros</th>
                  <th>Observaciones</th>
               </tr>
               <tbody>
                  <%
                     if( listDoc != null )
                     { %>
                  <%
                     int n=1;
                     for(var objvar : listDoc )
                     {%>
                  <tr>
                     <td colspan="1" ><%=n++%></td>
                     <td>
                        <select style="border: none;" name = 'T'>
                           <option selected='selected' value='Si'>Si</option>
                           <option selected='selected' value='No'>No</option>
                        </select>
                     </td>
                     <td><%=objvar.getNombre()%> <%=objvar.getApellidop()%> <%=objvar.getApellidom()%></td>
                     <center>
                        <td><%=objvar.getArea()%></td>
                     </center>
                     <%if(objvar.getSexoo().equals("x")){%>
                     <td> </td>
                     <td>X</td>
                     <%}%> 
                     <%if(objvar.getSexoo().equals("y")){%>
                     <td>X</td>
                     <td> </td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("alergia")){%>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("DX")){%>
                     <td>NO</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Profilaxis")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Ter.Cep")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Obtulacion")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Resina/Amalgama")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Extraccion")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>Si</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("engodoncia")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>Si</td>
                     <%}%> 
                     <td> <input type='text' style="border: none;"> </td>
                     <td> <input type='text' style="border: none;" ></td>
                  </tr>
                  <%}%>
               </tbody>
            </table>
            <%
               } else{%>
            <tr>
            <center><h1>no hay citas hoy</h1></center>
            </tr>
            <% }
               %>
            </table>
            <button onclick="myFunction()">Imprimir
            </button>
            <%}%> 
            
            <%   if( request.getParameter("n2")!=null && alumno.equals("3")) {%> 
            <table style="width: 100%">
               <tr>
                 <th>
                      <img src="img/ipn2.png" style="width:20% ;height:auto;">


                  </th>
                  <th align = "center">
                     INSTITUTO POLITECNICO NACIONAL<br>
                     CENTRO DE ESTUDIOS CIENTIFICOS Y TECNOLOGICOS JUAN DE DIOS BATIZ<br>
                     DIRECCION DE SERVICIOS ESTUDIANTILES<BR>
                     DEPARTAMENTO DE SERVICIOS MEDICOS
                     <br><br>
                     INFORME ODONTOLOGICO
                  </th>
                  <th>
                      <img src="img/cecyt9.jpg" style="width:20% ;height:auto;">
                  </th>
               </tr>
            </table>
            <br><br>
            <table style="width: 100%">
               <TR>
                  <th align ="rigth">
                     RESPONSABLE: <%=nombre%>
                  </th>
                  <TH align ="rigth">
                     FECHA:<script>document.write(today);</script>
                  </TH>
               </TR>
            </table>
            <br>
            <table border="1" style="width: 100%">
               <tr>
                  <th colspan="3"></th>
                  <th colspan="2">Sexo</th>
                  <th colspan="9">Tratamientos</th>
                  <th></th>
               </tr>
               <tr id="lala">
                  <th>No.</th>
                  <th>Visita</th>
                  <th>Nombre</th>
                  <th>F</th>
                  <th>M</th>
                  <th>Alergia</th>
                  <th>DX</th>
                  <th>Profilaxis</th>
                  <th>Ter. Cep</th>
                  <th>Obtulacion</th>
                  <th>Resina/Amalgama</th>
                  <th>Extracción</th>
                  <th>Endodoncia</th>
                  <th>Otros</th>
                  <th>Observaciones</th>
               </tr>
               <tbody>
                  <%
                     if( listE != null )
                     { %>
                  <%
                     int n=1;
                     for(var objvar : listE )
                     {%>
                  <tr>
                     <td colspan="1" ><%=n++%></td>
                     <td>
                        <select style="border: none;" name = 'T'>
                           <option selected='selected' value='Si'>Si</option>
                           <option selected='selected' value='No'>No</option>
                        </select>
                     </td>
                     <td><%=objvar.getNombre()%> <%=objvar.getApellidop()%> <%=objvar.getApellidom()%></td>
                     <%if(objvar.getSexoo().equals("x")){%>
                     <td> </td>
                     <td>X</td>
                     <%}%> 
                     <%if(objvar.getSexoo().equals("y")){%>
                     <td>X</td>
                     <td> </td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("alergia")){%>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("DX")){%>
                     <td>NO</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Profilaxis")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Ter.Cep")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Obtulacion")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Resina/Amalgama")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>Si</td>
                     <td>NO</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("Extraccion")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>Si</td>
                     <td>NO</td>
                     <%}%> 
                     <%if(objvar.getNombreProcM().equals("engodoncia")){%>
                     <td>NO</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>No</td>
                     <td>NO</td>
                     <td>NO</td>
                     <td>Si</td>
                     <%}%> 
                     <td> <input type='text' style="border: none;"> </td>
                     <td> <input type='text' style="border: none;" ></td>
                  </tr>
                  <%}%>
               </tbody>
            </table>
            <%
               } else{%>
            <tr>
                <center><h1>no hay citas hoy</h1></center>
            </tr>
            <% }
               %>
            </table>
            <button onclick="myFunction()">Imprimir
            </button>
            <%}%> 
      </section>
      </div>
      <script src="js/Scroll.js"></script>
      <script src="js/menu.js"></script>
   </body>
</html>