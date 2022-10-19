<%-- 
    Document   : paginaalumno
    Created on : 4/05/2017, 11:44:36 AM
    Author     : alegp
--%>

<%@page import="proceso.usuario"%>
<%@page import="java.util.List"%>
<%@page import="proceso.Data"%>
<%@page import="proceso.var"%>
<%@page import="proceso.var"%>
<%@page import="proceso.AES"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
usuario u = (usuario) ok.getAttribute("paciente");
 AES j = new AES();
System.out.println("id paciente:" + j.decencriptar(u.getclvpac()));
   List<var>listCitas = null;
   List<var> listsoli = null ;
   var con = new var();
   Data objConn = null;
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
  

   objConn.setId(j.decencriptar(u.getclvpac()));
   
   objConn.open();
   listCitas = objConn.SelectCitaUsuario();
   listsoli = objConn.SelectSoli() ; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
      <link rel="stylesheet" href="css/Menu.css">
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <link rel="stylesheet" type="text/css" href="css/buttons.css" />
      <link rel="stylesheet" href="css/ot/stylePOP.css">
      <link rel="stylesheet" href="css/ajsutestabla.css">
      <link rel="stylesheet" href="css/style-Tabla.css">
      <script src="js/Scroll-table.js"></script>
      <link rel="stylesheet" type="text/css" href="css/set3.css" />
      <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
      <link rel="stylesheet" type="text/css" href="css/letras.css" />
      <link rel="stylesheet" type="text/css" href="css/ComponenteRegistro.css" />
        <title>Bienvenido alumno</title>
    </head>
     <header>
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
         <div style="background: none;" class="menus" >
         
            <nav class="menu menu--ceres">
               <ul class="menu__list">
                    <li class="menu__item menu__item--current " ><a href="#" class="menu__link">Citas</a></li>
                    
                  <li class="menu__item" ><a href="solicita.jsp" class="menu__link">Solicita una cita</a></li>
                 
                  <li class="menu__item"><a href="cerrars.jsp" class="menu__link">Salir</a></li>
               </ul>
            </nav>
         </div>
      </header>
    <body style="background: #252a34;">
      
        
        
        
        <br> 
        
           <%
         if( listCitas != null )
         { %>
       


         <br>
         <div id="contenedor">
             <div  class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
               <thead>
                  <tr>
                    
                     <th>Procedimiento</th>
                     <th>Fecha</th>
                 
                  </tr>
               </thead>
            </table>
         </div>
             
         
         <div  class="tbl-content">
            <table  cellpadding="0" cellspacing="0" border="0"  id="myTable">
               <tbody>
                  <%   for(var objvar : listCitas )
                     {%>
                  <br><tr>
                     <td><%=objvar.getNombreProcM()%></td>
                     <td><%=objvar.getFecha()%></td>
                
                    
                     <%}%>
               </tbody>
            </table>
    
      <%
         } else{%>
    
         <h1>no hay citas</h1>

 
     
      <% }

         %>
        
        
     
       </div></div>
    </body>
</html>
