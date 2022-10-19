<%-- 
   Document   : Inicio
   Created on : 27-may-2016, 20:27:21
   Author     : NiÃ±os Roman
   --%>
<%@page import="proceso.Fecha"%>
<%@page import="proceso.usuario"%>
<%@page import="proceso.AES"%>
<%@page import="proceso.Data"%>
<%@page import="java.util.*" %>
<%@page import="proceso.var"%>
<%@page import="java.util.ArrayList"%>
<%@page import="proceso.RefreshDatos"%>
<%@page import="proceso.Alumnos"%>
<%@page import="java.sql.Connection"%>
<%@page import="proceso.Conexion"%>
<%@page import="java.sql.Statement"%>
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
   %>
<%
   List<var>listRo = null;
   Fecha as;
   AES j = new AES();
usuario u = (usuario)sesionOk.getAttribute("algo");
String clvdoc = u.getClvdoc();
   Data objConn = null;
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   AES o = new AES ();
   
   objConn.open();
   
   listRo = objConn.selectAlum(o.decencriptar(clvdoc));
   //#5dffc9;
   %>
<%
   List<var>listDir = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.open();
   listDir = objConn.selectDirec(o.decencriptar(clvdoc));
   
   %>
   
   <%
   List<var>listDoc = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.open();
   listDoc = objConn.selecDocente(o.decencriptar(clvdoc));
   
   %>
   
<%
   List<var>listExt = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   
   objConn.open();
   listExt = objConn.selectExt(o.decencriptar(clvdoc));
   
   %>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1">
      <title>Datos</title>
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
      <style>
          
          
        .menu--ceres .menu__link:focus {
         color: black;
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
         .modal-footer{
             
                padding: 10px 0px;
             
         }
      </style>
      
         <div style="background: none;" class="menus">
       
            <nav class="menu menu--ceres"  >
               <ul class="menu__list">
                  <li class="menu__item "><a href="menu.jsp" class="menu__link" style="">Calendario</a></li>
                  <li class="menu__item menu__item--current"><a href="" class="menu__link" style="">Pacientes</a></li>
                  <li class="menu__item"><a href="Registrar.jsp" class="menu__link" style="">Registrar</a></li>
                  <li class="menu__item"><a href="reportes.jsp" class="menu__link" style="">Reportes</a></li>
                  <li class="menu__item"><a href="Sesion.jsp" class="menu__link" style="">Cuenta</a></li>
                  <li class="menu__item"><a href="Solicitudes.jsp" class="menu__link">Citas</a></li>
                  <li class="menu__item"><a href="cerrars.jsp" class="menu__link" style="">Salir</a></li>
               </ul>
            </nav>
         </div>
      
   </head>
   <script> 
      window.onload=function(){ 
      var pos=window.name || 0; 
      window.scrollTo(0,pos); 
      } 
      
      window.onunload=function(){ 
      window.name=self.pageYOffset || (document.documentElement.scrollTop+document.body.scrollTop);
      } 
   </script>
   <style>
      /* Set basic style for video */
      canvas{
      z-index: -1;
      position: fixed;
      }
      body {
      background: none;
      }
      .select {
      padding: 5px;
      border: solid 5px #c9c9c9;
      transition: border 0.3s;
      border-radius: 20px;
      }
      .select:focus {
      border: solid 5px #969696;
      border-radius: 20px;
      }
      #content {
      width: 200px;
      margin: 0px auto;
      }
      #column-left {
      background-color: none;
      border: 1px solid none;
      border-radius: 8px 8px 8px 8px;
      float: left;
      position: fixed;
      min-height: 225px;
      margin-bottom: 10px;
      margin-left: 10px;
      overflow: hidden;
      text-align: center;
      width: 1600px;
      z-index: 7;
      }
      #central {
      background-color: #EBE9EA;
      border: 1px solid #D2D2D2;
      border-radius: 8px 8px 8px 8px;
      float: right;
      height: 5000px;
      margin-bottom: 10px;
      width: 985px;}
     
   
     
      #contenedor{
      width: 95%;
      }
      #contenedor5{
      width: 75%;
      background:#25b7c4;
      }
      td{
      text-align: center;
      input-align: center;
      submit-align: center;
      form: center; 
      max-width: 20px;
    
      }
      tr{
          
          width: 50px;
          
      }
      
     
       </style>
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
      <div id="particles-js"></div>
      <script src="particles.js"></script>
      <script src="particulas.js"></script>
      <br><br><br><br><br><br> <br><br> 
      <div id="contenedor">
         <div class="grid__item color-9">
            <center><a class="link B" style="font-size: 3em; color:#d8e8e3;" href="#"><span>Alum</span><span>nos</span></a></center>
         </div>
         <span class="input input--nao">
            <input class="input__field input__field--nao" type="text" id="myInput" onkeyup="myFunction()" /><!--en scroll-table-->
            <label class="input__label input__label--nao" for="myInput">
            <span class="input__label-content input__label-content--nao">Boleta</span>
            </label>
            <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
               <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
            </svg>
         </span>
         <div  class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
               <thead>
                  <tr>
                    
                     <th>Nombre</th>
                     <th>Boleta</th>
                     <th>Sexo</th>
                     <th>Edad</th>
                     <th>Generar Cita</th>
                     <th>Historial</th>
                     <th> Eliminar </th>
                     
                  </tr>
               </thead>
            </table>
         </div>
         <div  class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0"  id="myTable">
               <tbody>
                  <%
                     if( listRo != null )
                     {
                     for(var objvar : listRo )
                     {
                     %>
                  <tr>
                     
                     <td><%=objvar.getNombre() %> <%=objvar.getApellidom() %> <%=objvar.getApellidop() %></td>
                     <td><%=objvar.getBoleta() %></td>
                     
                     <%String sexo="";
              sexo = objvar.getSexo()+ "";
              if(sexo.equals("x")){
                  sexo = "Hombre";
              }
                     else{
                  sexo = "Mujer";
                     }
%>
                     <td><%=sexo %></td>
                     <td><% 
                         String fecha =objvar.getEdad();
                           System.out.println(fecha);
                           int año = Integer.parseInt(fecha.substring(0, 4)
                );
                         
                int mesi = Integer.parseInt(fecha.substring(5, 7));
                int dias = Integer.parseInt(fecha.substring(8, 10));
                         
                         
                         as = new Fecha(dias,mesi,año); %>
                         
                         
                         <%=as.CalcularEdad() %></td>
                     
                     <td>
                        <form method="post" action="citas.jsp?id=<%=j.encriptar(objvar.getClvpac()+"")%>">
                           <div class="modal-footer">
                              <input type="submit" class="btn" value="Crear">
                           </div>
                        </form>
                     </td>
                    
                     <td>
                        <form method="post" action="Historial.jsp?id=<%=j.encriptar(objvar.getClvpac()+"")%>">
                           <div class="modal-footer">
                              <input type="submit" class="btn" value="Ver">
                           </div>
                        </form>
                     </td>
                     <td> <form action="EliminarC" ><input type="hidden" name="clvpac" value ="<%=j.encriptar(objvar.getClvpac()+ "")%>" > <input type ="submit"  class="btn" value="Eliminar" > </form>    </td>
                  </tr>
                  <%
                     }
                            }
                     objConn.close();
                     %>
               </tbody>
            </table>
         </div>
         <br>
      </div>
      <br>  <br>
      <div id="contenedor">
         <div class="grid__item color-9">
            <center><a class="link B" style="font-size: 3em; color:#d8e8e3;" href="#"><span>ADMINIS</span><span>TRATIVOS</span></a></center>
         </div>
         <span class="input input--nao">
            <input class="input__field input__field--nao" type="text" id="myInputt" onkeyup="Direc()" /><!--en scroll-table-->
            <label class="input__label input__label--nao" for="myInputt">
            <span class="input__label-content input__label-content--nao">Nombre</span>
            </label>
            <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
               <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
            </svg>
         </span>
         <div  class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
               <thead>
                  <tr>
                     
                     <th>Nombre</th>
                     <th>Area</th>
                     <th>Edad</th>
                     <th>Sexo</th>
                     <th>Generar Cita</th>
                    
                     <th>Historial</th>
                     <th> Eliminar </th>
                  </tr>
               </thead>
            </table>
         </div>
         <div  class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0"  id="myTablee">
               <tbody>
                  <%
                     if( listDir != null )
                     {
                     for(var objvar : listDir )
                     {
                     %>
                  <tr>
                    
                     <td><%=objvar.getNombre() %> <%=objvar.getApellidom() %> <%=objvar.getApellidop() %></td>
                     <td><%=objvar.getArea() %></td>
                     <td><%String fecha =objvar.getEdad();
                       int año = Integer.parseInt(fecha.substring(0, 4)
                );
                         
                int mesi = Integer.parseInt(fecha.substring(5, 7));
                int dias = Integer.parseInt(fecha.substring(8, 10));
                         
                         as = new Fecha(dias,mesi,año); %>
                         
                         
                         <%=as.CalcularEdad() %></td>
                                 
                     <%String sexo="";
              sexo = objvar.getSexo()+ "";
              if(sexo.equals("x")){
                  sexo = "Hombre";
              }
                     else{
                  sexo = "Mujer";
                     }
%>
                     <td><%=sexo %></td>
                     <td>
                        <form action="citas.jsp">
                           <input type="text" name="id" style="visibility:hidden; position: absolute;"  value="<%=j.encriptar(objvar.getClvpac()+ "") %>" >
                       
                           <div class="modal-footer">
                              <input type="submit" class="btn" value="Crear">
                           </div>
                        </form>
                     </td>
                    
                     <td>
                        <form method="post" action="Historial.jsp?id=<%=j.encriptar(objvar.getClvpac()+"")%>">
                           <div class="modal-footer">
                              <input type="submit" class="btn" value="Ver">
                           </div>
                        </form>
                     </td>
                     <td> <form action="EliminarC" ><input type="hidden" name="clvpac"  value ="<%=j.encriptar(objvar.getClvpac()+ "")%>" > <input class="btn" type ="submit" value="Eliminar" > </form>  </td>
                  </tr>
                  <%
                     }
                            }
                     objConn.close();
                     %>
               </tbody>
            </table>
         </div>
      </div>
      <br>  <br>
      
       <div id="contenedor">
         <div class="grid__item color-9">
            <center><a class="link B" style="font-size: 3em; color:#d8e8e3;" href="#"><span>DOCE</span><span>NTES</span></a></center>
         </div>
         <span class="input input--nao">
            <input class="input__field input__field--nao" type="text" id="myInputto" onkeyup="Doc()" /><!--en scroll-table-->
            <label class="input__label input__label--nao" for="myInputt">
            <span class="input__label-content input__label-content--nao">Nombre</span>
            </label>
            <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
               <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
            </svg>
         </span>
         <div  class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
               <thead>
                  <tr>
                    
                     <th>Nombre</th>
                     <th>Area</th>
                     <th>Edad</th>
                     <th>Sexo</th>
                     <th>Generar Cita</th>
                    
                     <th>Historial</th>
                     <th> Eliminar </th>
                  </tr>
               </thead>
            </table>
         </div>
         <div  class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0"  id="myTableee">
               <tbody>
                  <%
                     if( listDoc != null )
                     {
                     for(var objvar : listDoc )
                     {
                     %>
                  <tr>
                    
                     <td><%=objvar.getNombre() %> <%=objvar.getApellidom() %> <%=objvar.getApellidop() %></td>
                     <td><%=objvar.getArea() %></td>
                     <td><%String fecha =objvar.getEdad();
                    int año = Integer.parseInt(fecha.substring(0, 4)
                );
                         
                int mesi = Integer.parseInt(fecha.substring(5, 7));
                int dias = Integer.parseInt(fecha.substring(8, 10));
                         
                         as = new Fecha(dias,mesi,año); %>
                         
                         
                         <%=as.CalcularEdad() %></td>
                                 
                     <%String sexo="";
              sexo = objvar.getSexo()+ "";
              if(sexo.equals("x")){
                  sexo = "Hombre";
              }
                     else{
                  sexo = "Mujer";
                     }
%>
                     <td><%=sexo %></td>
                     <td>
                        <form action="citas.jsp">
                           <input type="text" name="id" style="visibility:hidden; position: absolute;"  value="<%=j.encriptar(objvar.getClvpac()+ "") %>" >
                       
                           <div class="modal-footer">
                              <input type="submit" class="btn" value="Crear">
                           </div>
                        </form>
                     </td>
                    
                     <td>
                        <form method="post" action="Historial.jsp?id=<%=j.encriptar(objvar.getClvpac()+"")%>">
                           <div class="modal-footer">
                              <input type="submit" class="btn" value="Ver">
                           </div>
                        </form>
                     </td>
                        <td> <form action="EliminarC" ><input type="hidden" name="clvpac" value ="<%=j.encriptar(objvar.getClvpac()+ "") %>" > <input  class="btn" type ="submit" value="Eliminar" > </form>    </td>
                
                  </tr>
                  <%
                     }
                            }
                     objConn.close();
                     %>
               </tbody>
            </table>
         </div>
      </div>
      <br>  <br>
      
      
      <div id="contenedor">
         <div class="grid__item color-9">
            <center><a class="link B" style="font-size: 3em; color:#d8e8e3;" href="#"><span>EXTE</span><span>RNOS</span></a></center>
         </div>
         <span class="input input--nao">
            <input class="input__field input__field--nao" type="text" id="myInpu" onkeyup="Ext()" /><!--en scroll-table-->
            <label class="input__label input__label--nao" for="myInpu">
            <span class="input__label-content input__label-content--nao">Nombre</span>
            </label>
            <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
               <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
            </svg>
         </span>
         <div  class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
               <thead>
                  <tr>
                   
                     <th>Nombre</th>
                     <th>Edad</th>
                     <th>Sexo</th>
                     <th>Generar Cita</th>
                     <th>Historial</th>
                  </tr>
               </thead>
            </table>
         </div>
         <div  class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0"  id="myTabl">
               <tbody>
                  <%
                     if( listExt != null )
                     {
                     for(var objvar : listExt )
                     {
                     %>
                  <tr>
                    
                     <td><%=objvar.getNombre() %> <%=objvar.getApellidom() %> <%=objvar.getApellidop() %></td>
                     <td><%String fecha =objvar.getEdad();
                        int año = Integer.parseInt(fecha.substring(0, 4)
                );
                         
                int mesi = Integer.parseInt(fecha.substring(5, 7));
                int dias = Integer.parseInt(fecha.substring(8, 10));
                         
                         as = new Fecha(dias,mesi,año); %>
                         
                         
                         <%=as.CalcularEdad() %></td>
                                 
                     <%String sexo="";
              sexo = objvar.getSexo()+ "";
              if(sexo.equals("x")){
                  sexo = "Hombre";
              }
                     else{
                  sexo = "Mujer";
                     }
%>
                     <td><%=sexo %></td>
                     <td>
                        <form action="citas.jsp">
                           <input type="text" name="id" style="visibility:hidden; position: absolute;"  value="<%=j.encriptar(objvar.getClvpac()+ "") %>" >  
                           
                           <div class="modal-footer">
                              <input type="submit" class="btn" value="Crear">
                           </div>
                        </form>
                     </td>
                    
                     <td>
                        <form method="post" action="Historial.jsp?id=<%=j.encriptar(objvar.getClvpac()+ "")%>">
                           <div class="modal-footer">
                              <input type="submit" class="btn" value="Ver">
                           </div>
                        </form>
                     </td>
                        <td> <form action="EliminarC" ><input type="hidden" name="clvpac" value ="<%=j.encriptar(objvar.getClvpac()+ "") %>" > <input  class="btn" type ="submit" value="Eliminar" > </form>    </td>
                
                  </tr>
                  <%
                     }
                            }
                     objConn.close();
                     %>
               </tbody>
            </table>
         </div>
      </div>
      <br><br>
     <!-- <center><a href="#modal-two" class="btn btn-big">Borrar Usuarios</a></center>-->
      <br><br>
      <!-- <center><a href="#modal-three" class="btn btn-big">Modificar</a></center>-->
      <a href="#" class="modal" id="modal-two" aria-hidden="true">
      </a>
      
      <br>
      <br><br>
      <br><br>
      <br><br><br><br>
      </div>
      </div>
      <script src="js/Letras.js"></script>
      <script src="js/Scroll.js"></script>
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