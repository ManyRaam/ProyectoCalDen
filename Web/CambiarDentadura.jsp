<%@page import="javax.crypto.BadPaddingException"%>
<%@page import="javax.crypto.IllegalBlockSizeException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.security.InvalidKeyException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="javax.crypto.NoSuchPaddingException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
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
   
   Data objConn = null;
 
      AES o = new AES();
      String pac1= request.getParameter("id");
      String pac="";
        try {
            pac = o.decencriptar(pac1);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ParteF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(ParteF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(ParteF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(ParteF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(ParteF.class.getName()).log(Level.SEVERE, null, ex);
        } 
   
   
   List<var>listDent1 = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   objConn.setId(pac);
   objConn.open();
   listDent1 = objConn.SelctDentadura1();
   
      List<var>listDent2 = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   objConn.setId(pac);
   objConn.open();
   listDent2 = objConn.SelctDentadura2();
   
      List<var>listDent3 = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   objConn.setId(pac);
   objConn.open();
   listDent3 = objConn.SelctDentadura3();
   
      List<var>listDent4 = null;
   
   
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   objConn.setId(pac);
   objConn.open();
   listDent4 = objConn.SelctDentadura4();
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
      <link rel="stylesheet" href="css/ot/stylePOP.css">
      <link rel="stylesheet" type="text/css" href="css/normalize.css" />
      <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
      <link rel="stylesheet" type="text/css" href="css/demo.css" />
      <link rel="stylesheet" type="text/css" href="css/set2.css" />
      <link rel="stylesheet" href="css/Menu.css">
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <link rel="stylesheet" type="text/css" href="css/ComponenteRegistro.css" />
      <link rel="stylesheet" href="css/ajsutestabla.css">
      <link rel="stylesheet" href="css/style-Tabla.css">
      <script src="js/Scroll-table.js"></script>
      <link rel="stylesheet" type="text/css" href="css/set3.css" />
      <link rel="stylesheet" type="text/css" href="css/letras.css" />
      <style>
          html{
              background: none;
                overflow-x: hidden;
          }
         body{
       background: black;
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
         #contenedor{
         cursor: default;
         width: 65em;
         background: rgba(88, 85, 85, 0.38);
         padding-top: 30px;
             margin-bottom: 150px;
    margin-top: 150px;
         border: 30px solid rgba(82, 18, 98, 0);
         border-radius: 4px;
         box-shadow: 0 5px 20px rgba(0,0,0,0.05), 0 15px 30px -10px rgba(0,0,0,0.3);
         -webkit-transition: background 0.4s;
         transition: background 0.4s;
         }
         #contenedor:hover {
         background: rgba(0, 0, 0, 0.74);
         }
         .input{
         margin:-0.70em;
         }
         footer {
         margin: 0px 0px 0px 0px;
         padding: 10px 20px;
        }
         
         
      </style>
   </head>
   <body >
      <header>
         <div style="background: none;" class="menus" >
            <%String cl=request.getParameter("clvdoc");
               %>
            <nav class="menu menu--ceres">
               <ul class="menu__list">
                  <li class="menu__item" ><a href="menu.jsp?clvdoc=<%=cl%>" class="menu__link">Calendario</a></li>
                  <li class="menu__item"><a href="alum.jsp?clvdoc=<%=cl%>" class="menu__link">Pacientes</a></li>
                  <li class="menu__item menu__item--current "><a href="" class="menu__link">Historial</a></li>
                  <li class="menu__item"><a href="reportes.jsp?clvdoc=<%=cl%>" class="menu__link">Reportes</a></li>
                  <li class="menu__item"><a href="Sesion.jsp?clvdoc=<%=cl%>" class="menu__link">Cuenta</a></li>
                  <li class="menu__item"><a href="cerrars.jsp" class="menu__link">Salir</a></li>
               </ul>
            </nav>
         </div>
      </header>
      <script language="javascript" type="text/javascript" src="validaformulario.js"> </script> 

      <style>
        
         .select11 {
            
        background: url(img/D/4.png);
                background-position-x: 400px;
    background-position-y: 0px;
    height: 120px;
    width: 46px;
    outline:0px;    
    border:none;
   
}
.select11:hover {
         background: url(img/D/5.png);
               background-position-x: 400px;
    background-position-y: 0px;
   
}

.select11:focus {
         background: url(img/D/5.png);
               background-position-x: 400px;
    background-position-y: 0px;
   
}

.select12 {
        background: url(img/D/4.png);
                  background-position-x: 350px;
    background-position-y: 0px;
    height: 120px;
    width: 36px;
    outline:0px;    
    border:none;
}
.select12:hover {
         background: url(img/D/5.png);
            background-position-x: 350px;
    background-position-y: 0px;
    
   
}

.select12:focus {
     background: url(img/D/5.png);
           background-position-x: 350px;
    background-position-y: 0px;
    height: 120px;
    width: 36px;
   
}

.select13 {
        background: url(img/D/4.png);
                background-position-x: 315px;
    background-position-y: 0px;
    height: 120px;
    width: 43px;
    outline:0px;    
    border:none;
}
.select13:hover {
         background: url(img/D/5.png);
               background-position-x: 315px;
    background-position-y: 0px;
    height: 120px;
    width: 43px;
    
   
}

.select13:focus {
     background: url(img/D/5.png);
             background-position-x: 315px;
    background-position-y: 0px;
    height: 120px;
    width: 43px;
   
}

.select14 {
        background: url(img/D/4.png);
                    background-position-x: 270px;
    background-position-y: 0px;
    height: 120px;
    width: 40px;
    outline:0px;    
    border:none;
}
.select14:hover {
         background: url(img/D/5.png);
                 background-position-x: 270px;
    background-position-y: 0px;
    height: 120px;
    width: 40px;
    
   
}

.select14:focus {
     background: url(img/D/5.png);
                 background-position-x: 270px;
    background-position-y: 0px;
    height: 120px;
    width: 40px;
   
}

.select15 {
        background: url(img/D/4.png);
                      background-position-x: 230px;
    background-position-y: 0px;
    height: 120px;
    width: 40px;
    outline:0px;    
    border:none;
}
.select15:hover {
         background: url(img/D/5.png);
                    background-position-x: 230px;
    background-position-y: 0px;
    height: 120px;
    width: 40px;
    
   
}

.select15:focus {
     background: url(img/D/5.png);
                    background-position-x: 230px;
    background-position-y: 0px;
    height: 120px;
    width: 40px;
   
}

.select16 {
        background: url(img/D/4.png);
                    background-position-x: 190px;
    background-position-y: 0px;
    height: 120px;
    width: 59px;
    outline:0px;    
    border:none;
}
.select16:hover {
         background: url(img/D/5.png);
            background-position-x: 190px;
    background-position-y: 0px;
    height: 120px;
    width: 59px;
    
   
}

.select16:focus {
     background: url(img/D/5.png);
                    background-position-x: 190px;
    background-position-y: 0px;
    height: 120px;
    width: 59px;
   
}

.select17 {
        background: url(img/D/4.png);
           background-position-x: 130px;
    background-position-y: 0px;
    height: 120px;
    width: 61px;
    outline:0px;    
    border:none;
}
.select17:hover {
         background: url(img/D/5.png);
                 background-position-x: 130px;
    background-position-y: 0px;
    height: 120px;
    width: 61px;
    
   
}

.select17:focus {
     background: url(img/D/5.png);
                  background-position-x: 130px;
    background-position-y: 0px;
    height: 120px;
    width: 61px;
   
}

.select18 {
        background: url(img/D/4.png);
                  background-position-x: 62px;
    background-position-y: 0px;
    height: 120px;
    width: 65px;
    outline:0px;    
    border:none;
}
.select18:hover {
         background: url(img/D/5.png);
                    background-position-x: 62px;
    background-position-y: 0px;
    height: 120px;
    width: 65px;
    
   
}

.select18:focus {
     background: url(img/D/5.png);
                  background-position-x: 62px;
    background-position-y: 0px;
    height: 120px;
    width: 65px;
   
}

 .select21 {
       background-position-x: 450px;
    background-position-y: 0px;
        background: url(img/D/4.png);
              
    height: 120px;
    width: 48px;
    outline:0px;    
    border:none;
}
.select21:hover {
         background: url(img/D/5.png);
               background-position-x: 450px;
    background-position-y: 0px;
   
}

.select21:focus {
         background: url(img/D/5.png);
               background-position-x: 450px;
    background-position-y: 0px;
   
}

.select22 {
        background: url(img/D/4.png);
                  background-position-x: 482px;
    background-position-y: 0px;
    height: 120px;
    width: 37px;
    outline:0px;    
    border:none;
}
.select22:hover {
         background: url(img/D/5.png);
            background-position-x: 482px;
    background-position-y: 0px;
    
   
}

.select22:focus {
     background: url(img/D/5.png);
           background-position-x: 482px;
    background-position-y: 0px;
    height: 120px;
    width: 37px;
   
}

.select23 {
        background: url(img/D/4.png);
                background-position-x: 525px;
    background-position-y: 0px;
    height: 120px;
    width: 42px;
    outline:0px;    
    border:none;
}
.select23:hover {
         background: url(img/D/5.png);
               background-position-x: 525px;
    background-position-y: 0px;
    height: 120px;
    width: 42px;
    
   
}

.select23:focus {
     background: url(img/D/5.png);
             background-position-x: 525px;
    background-position-y: 0px;
    height: 120px;
    width: 42px;
   
}

.select24 {
        background: url(img/D/4.png);
                    background-position-x: 570px;
    background-position-y: 0px;
    height: 120px;
    width: 44px;
    outline:0px;    
    border:none;
}
.select24:hover {
         background: url(img/D/5.png);
                 background-position-x:570px;
    background-position-y: 0px;
    height: 120px;
    width: 44px;
    
   
}

.select24:focus {
     background: url(img/D/5.png);
                 background-position-x:570px;
    background-position-y: 0px;
    height: 120px;
    width: 44px;
   
}

.select25 {
        background: url(img/D/4.png);
                      background-position-x: 610px;
    background-position-y: 0px;
    height: 120px;
    width: 40px;
    outline:0px;    
    border:none;
}
.select25:hover {
         background: url(img/D/5.png);
                    background-position-x: 610px;
    background-position-y: 0px;
    height: 120px;
    width: 40px;
    
   
}

.select25:focus {
     background: url(img/D/5.png);
                    background-position-x: 610px;
    background-position-y: 0px;
    height: 120px;
    width: 40px;
   
}

.select26 {
        background: url(img/D/4.png);
                    background-position-x: 667px;
    background-position-y: 0px;
    height: 120px;
    width: 55px;
    outline:0px;    
    border:none;
}
.select26:hover {
         background: url(img/D/5.png);
            background-position-x: 667px;
    background-position-y: 0px;
    height: 120px;
    width: 55px;
    
   
}

.select26:focus {
     background: url(img/D/5.png);
                    background-position-x: 667px;
    background-position-y: 0px;
    height: 120px;
    width: 55px;
   
}

.select27 {
        background: url(img/D/4.png);
           background-position-x: 730px;
    background-position-y: 0px;
    height: 120px;
    width: 58px;
    outline:0px;    
    border:none;
}
.select27:hover {
         background: url(img/D/5.png);
                 background-position-x: 730px;
    background-position-y: 0px;
    height: 120px;
    width: 58px;
    
   
}

.select27:focus {
     background: url(img/D/5.png);
                  background-position-x: 730px;
    background-position-y: 0px;
    height: 120px;
    width: 58px;
   
}

.select28 {
        background: url(img/D/4.png);
                  background-position-x: 800px;
    background-position-y: 0px;
    height: 120px;
    width: 65px;
    outline:0px;    
    border:none;
}
.select28:hover {
         background: url(img/D/5.png);
                    background-position-x: 800px;
    background-position-y: 0px;
    height: 120px;
    width: 65px;
    
   
}

.select28:focus {
     background: url(img/D/5.png);
                  background-position-x: 800px;
    background-position-y: 0px;
    height: 120px;
    width: 65px;
   
}


.select41 {
        background: url(img/D/4.png);
                background-position-x: 400px;
    background-position-y: 125px;
    height: 120px;
    width: 45px;
    outline:0px;    
    border:none;
}

.select41:hover {
         background: url(img/D/5.png);
               background-position-x: 400px;
    background-position-y: 125px;
   
}



.select41:focus {
         background: url(img/D/5.png);
               background-position-x: 400px;
    background-position-y: 125px;
   
}

.select42 {
        background: url(img/D/4.png);
                  background-position-x: 350px;
    background-position-y: 125px;
    height: 120px;
    width: 36px;
    outline:0px;    
    border:none;
}
.select42:hover {
         background: url(img/D/5.png);
            background-position-x: 350px;
    background-position-y: 125px;
    
   
}

.select42:focus {
     background: url(img/D/5.png);
           background-position-x: 350px;
    background-position-y: 125px;
    height: 120px;
    width: 36px;
   
}

.select43 {
        background: url(img/D/4.png);
                   background-position-x: 316px;
    background-position-y: 125px;
    height: 120px;
    width: 46px;
    outline:0px;    
    border:none;
}
.select43:hover {
         background: url(img/D/5.png);
                  background-position-x: 316px;
    background-position-y: 125px;
    height: 120px;
    width: 46px;
    
   
}

.select43:focus {
     background: url(img/D/5.png);
          background-position-x: 316px;
    background-position-y: 125px;
    height: 120px;
    width: 46px;
   
}

.select44 {
        background: url(img/D/4.png);
                    background-position-x: 270px;
    background-position-y: 125px;
    height: 120px;
    width: 40px;
    outline:0px;    
    border:none;
}
.select44:hover {
         background: url(img/D/5.png);
                 background-position-x: 270px;
    background-position-y: 125px;
    height: 120px;
    width: 40px;
    
   
}

.select44:focus {
     background: url(img/D/5.png);
                 background-position-x: 270px;
    background-position-y: 125px;
    height: 120px;
    width: 40px;
   
}

.select45 {
        background: url(img/D/4.png);
                      background-position-x: 230px;
    background-position-y: 125px;
    height: 120px;
    width: 36px;
    outline:0px;    
    border:none;
}
.select45:hover {
         background: url(img/D/5.png);
                    background-position-x: 230px;
    background-position-y: 125px;
    height: 120px;
    width: 36px
    
   
}

.select45:focus {
     background: url(img/D/5.png);
                    background-position-x: 230px;
    background-position-y: 125px;
    height: 120px;
    width:36px
   
}

.select46 {
        background: url(img/D/4.png);
                    background-position-x: 191px;
    background-position-y: 125px;
    height: 120px;
    width: 59px;
    outline:0px;    
    border:none;
}
.select46:hover {
         background: url(img/D/5.png);
            background-position-x: 191px;
    background-position-y: 125px;
    height: 120px;
    width: 59x;
    
   
}

.select46:focus {
     background: url(img/D/5.png);
                    background-position-x: 191px;
    background-position-y: 125px;
    height: 120px;
    width: 59px;
   
}

.select47 {
        background: url(img/D/4.png);
           background-position-x: 130px;
    background-position-y: 125px;
    height: 120px;
    width: 63px;
    outline:0px;    
    border:none;
}
.select47:hover {
         background: url(img/D/5.png);
                 background-position-x: 130px;
    background-position-y: 125px;
    height: 120px;
    width: 63px;
    
   
}

.select47:focus {
     background: url(img/D/5.png);
                  background-position-x: 130px;
    background-position-y: 125px;
    height: 120px;
    width: 63px;
   
}

.select48 {
        background: url(img/D/4.png);
                  background-position-x: 67px;
    background-position-y: 125px;
    height: 120px;
    width: 65px;
    outline:0px;    
    border:none;
}
.select48:hover {
         background: url(img/D/5.png);
                    background-position-x: 67px;
    background-position-y: 125px;
    height: 120px;
    width: 65px;
    
   
}

.select48:focus {
     background: url(img/D/5.png);
                  background-position-x: 67px;
    background-position-y: 125px;
    height: 120px;
    width: 65px;
   
}

 .select31 {
        background: url(img/D/4.png);
                background-position-x: 450px;
    background-position-y: 125px;
    height: 120px;
    width: 45px;
    outline:0px;    
    border:none;
}
.select31:hover {
         background: url(img/D/5.png);
               background-position-x: 450px;
    background-position-y: 125px;
   
}

.select31:focus {
         background: url(img/D/5.png);
               background-position-x: 450px;
    background-position-y: 125px;
   
}

.select32 {
        background: url(img/D/4.png);
                  background-position-x: 482px;
    background-position-y: 125px;
    height: 120px;
    width: 32px;
    outline:0px;    
    border:none;
}
.select32:hover {
         background: url(img/D/5.png);
            background-position-x: 482px;
    background-position-y: 125px;
    
   
}

.select32:focus {
     background: url(img/D/5.png);
           background-position-x: 482px;
    background-position-y: 125px;
    height: 120px;
    width: 32px;
   
}

.select33 {
        background: url(img/D/4.png);
                background-position-x: 525px;
    background-position-y: 125px;
    height: 120px;
    width: 40px;
    outline:0px;    
    border:none;
}
.select33:hover {
         background: url(img/D/5.png);
               background-position-x: 525px;
    background-position-y: 125px;
    height: 120px;
    width: 40px;
    
   
}

.select33:focus {
     background: url(img/D/5.png);
             background-position-x: 525px;
    background-position-y: 125px;
    height: 120px;
    width: 40px;
   
}

.select34 {
        background: url(img/D/4.png);
                    background-position-x: 570px;
    background-position-y: 125px;
    height: 120px;
    width: 44px;
    outline:0px;    
    border:none;
}
.select34:hover {
         background: url(img/D/5.png);
                 background-position-x:570px;
    background-position-y: 125px;
    height: 120px;
    width: 44px;
    
   
}

.select34:focus {
     background: url(img/D/5.png);
                 background-position-x:570px;
    background-position-y: 125px;
    height: 120px;
    width: 44px;
   
}

.select35 {
        background: url(img/D/4.png);
                      background-position-x: 611px;
    background-position-y: 125px;
    height: 120px;
    width: 45px;
    outline:0px;    
    border:none;
}
.select35:hover {
         background: url(img/D/5.png);
                    background-position-x: 611px;
    background-position-y: 125px;
    height: 120px;
    width: 45px;
    
   
}

.select35:focus {
     background: url(img/D/5.png);
                    background-position-x: 611px;
    background-position-y: 125px;
    height: 120px;
    width: 45px;
   
}

.select36 {
        background: url(img/D/4.png);
                    background-position-x: 667px;
    background-position-y: 125px;
    height: 120px;
    width: 62px;
    outline:0px;    
    border:none;
}
.select36:hover {
         background: url(img/D/5.png);
            background-position-x: 667px;
    background-position-y: 125px;
    height: 120px;
    width: 62px;
    
   
}

.select36:focus {
     background: url(img/D/5.png);
                    background-position-x: 667px;
    background-position-y: 125px;
    height: 120px;
    width: 62px;
   
}

.select37 {
        background: url(img/D/4.png);
           background-position-x: 730px;
    background-position-y: 125px;
    height: 120px;
    width: 58px;
    outline:0px;    
    border:none;
}
.select37:hover {
         background: url(img/D/5.png);
                 background-position-x: 730px;
    background-position-y: 125px;
    height: 120px;
    width: 58px;
    
   
}

.select37:focus {
     background: url(img/D/5.png);
                  background-position-x: 730px;
    background-position-y: 125px;
    height: 120px;
    width: 58px;
   
}

.select38 {
        background: url(img/D/4.png);
                  background-position-x: 800px;
    background-position-y: 125px;
    height: 120px;
    width: 65px;
    outline:0px;    
    border:none;
}
.select38:hover {
         background: url(img/D/5.png);
                    background-position-x: 800px;
    background-position-y: 125px;
    height: 120px;
    width: 65px;
    
   
}

.select38:focus {
     background: url(img/D/5.png);
                  background-position-x: 800px;
    background-position-y: 125px;
    height: 120px;
    width: 65px;
   
}

 </style>
      
      
      <style>
          .tableD{
             
             width: 100%;
         }
         .table2{
                 width: 34%;
                 margin-bottom: 10px;
         }
         
          h4{ 
             text-align: center;
             color:rgba(203, 243, 251, 0.55);
             margin-bottom: 10px;
         }
          select{
             font-size: 2em;
             color:#e91e63;
             text-align: center;
                outline:0px;    
                  border:none;
                
         }
         td{
         padding: 1px;
         text-align: center;
         vertical-align: middle;
         font-weight: 300;
         font-size: 14px;
              border-bottom:none;
         
         color: rgba(203, 243, 251, 0.55);
         }
     #cuadro {
	width: 10px;
	height: 10px;
	    background:#c93844;
    padding-left: 13px;
   
    padding-bottom: 15px;
}
 #cuadro2 {
	width: 10px;
	height: 10px;
	    background:#3ecac0;
    padding-left: 13px;
   
    padding-bottom: 15px;
}
 #cuadro3 {
	width: 10px;
	height: 10px;
	    background: #555555;
    padding-left: 13px;
   
    padding-bottom: 15px;
}
 #cuadro4 {
	width: 10px;
	height: 10px;
	    background: #f9f9f9;
    padding-left: 13px;
   
    padding-bottom: 15px;
}
      </style>
      
      
      
      <%
         if( listDent1 != null || listDent2 != null ||  listDent3 != null ||  listDent4 != null)
         {%>
      <div id="contenedor">
         <div class="grid__item color-9">
            <center><a class="link B" style="font-size: 3em; color:#d8e8e3;" href="#"><span>Denta</span><span>dura</span></a></center>
         </div> <br>
                <h4>N: Ninguno, C: Cariado, P: Perdido, O: Obturado</h4>
         <br>
         <table align="right" class="table2"><tr><h4><td><div id="cuadro">:Cariado</div></td><td><div id="cuadro2">:Obturado</div></td><td><div id="cuadro3">:Perdido</div></td><td><div id="cuadro4">:Normal</div></td></h4></tr></table>
         
         <br>
         <form method="post" action="UpdateDentadura">
         <table class="tableD">
         <tr>
                      <td>28</td><td>27</td><td>26</td><td>25</td><td>24</td><td>23</td><td>22</td><td>21</td>
                      <td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td>
                      </tr>
        
          
             <tr>
                  <%for(var objvar : listDent2 )
                     {
                         
                         
                     %>
                   <style> 
                       .select<%=objvar.getTipo()%> {
                                background: url(img/D/<%=objvar.getColor()%>.png);
                                background-position-x: <%=objvar.getX()%>px;
                                background-position-y: <%=objvar.getY()%>px;
                                  }
                   </style>
                         
                        <td>
                            <select name="d<%=objvar.getTipo()%>" class="select<%=objvar.getTipo()%>">
                         
                                <option value="<%=objvar.getDc()%>"><%=objvar.getDientecondicion()%></option>
                               <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                               <option value=" ">N</option>
                           </select>
                        </td> 
                        <%}%>
                        
                        <%for(var objvar : listDent1 )
                     { 
                         
                     %>
                      <style> 
                       .select<%=objvar.getTipo()%> {
                                background: url(img/D/<%=objvar.getColor()%>.png);
                                background-position-x: <%=objvar.getX()%>px;
                                background-position-y: <%=objvar.getY()%>px;
                                  }
                   </style>
                     <td>
                            <select name="d<%=objvar.getTipo()%>" class="select<%=objvar.getTipo()%>">
                         
                                <option value="<%=objvar.getDc()%>"><%=objvar.getDientecondicion()%></option>
                               <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                                <option value=" ">N</option>
                           </select>
                        </td> 
                           </select>
                        </td> <%}%>
                        </tr>
                        <tr>
                        <%for(var objvar : listDent3 )
                     {
                         
                         
                     %>
                  
                      <style> 
                       .select<%=objvar.getTipo()%> {
                                background: url(img/D/<%=objvar.getColor()%>.png);
                                background-position-x: <%=objvar.getX()%>px;
                                background-position-y: <%=objvar.getY()%>px;
                                  }
                   </style>
                         
                        <td>
                            <select name="d<%=objvar.getTipo()%>" class="select<%=objvar.getTipo()%>">
                         
                                 <option value="<%=objvar.getDc()%>"><%=objvar.getDientecondicion()%></option>
                               <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                               <option value=" ">N</option>
                           </select>
                        </td>  <%}%>
                        
                        <%for(var objvar : listDent4 )
                     {
                         
                         
                     %>
                  
                          <style> 
                       .select<%=objvar.getTipo()%> {
                                background: url(img/D/<%=objvar.getColor()%>.png);
                                background-position-x: <%=objvar.getX()%>px;
                                background-position-y: <%=objvar.getY()%>px;
                                  }
                   </style>
                       <td>
                            <select name="d<%=objvar.getTipo()%>" class="select<%=objvar.getTipo()%>">
                         
                                <option value="<%=objvar.getDc()%>"><%=objvar.getDientecondicion()%></option>
                               <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                               <option value=" ">N</option>
                           </select>
                        </td>  <%}%>
                      </tr>
                      
                      <tr>
                      <td>38</td><td>37</td><td>36</td><td>35</td><td>34</td><td>33</td><td>32</td><td>31</td>
                      <td>41</td><td>42</td><td>43</td><td>44</td><td>45</td><td>46</td><td>47</td><td>48</td>
                      </tr>
                     
                     
            
            </table>
                     
                           <input type="text" name="clvpac" name="clvpac" style="visibility:hidden; position: absolute;"  value="<%=request.getParameter("id")%>">
                          
                           <input type="text" name="clvdoc" name="clvdoc" style="visibility:hidden; position: absolute;"  value="<%=cl%>"> 
                           <div class="modal-footer">
                              <input type="submit" class="btn" value="Confirmar">
                           </div> 
                           
                           
                        </form>
                          
         </div>
     
      <%
         } else{%>
      <div id="contenedor">
         <h1>no hay Dentadura</h1>
         <form method="post" action="ParteFinal.jsp?clvdoc=<%=cl%>&clvpac=<%=request.getParameter("id")%>">
            <div class="modal-footer">
               <input type="submit" class="btn" value="Crear">
            </div>
         </form>
      </div>
            <br><br><br><br><br><br><br><br><br><br><br><br>
      <% }
         %>
      <script src="js/Scroll.js"></script>
      <script src="js/menu.js"></script>
      <script src="js/jquery-1.9.1.min.js"></script>
      <script src="js/jquery-migrate-1.0.0.min.js"></script>
      <script src="js/jquery-ui-1.10.0.custom.min.js"></script>
      <script src="js/jquery.ui.touch-punch.js"></script>
      <script src="js/modernizr.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/jquery.cookie.js"></script>
      <script src='js/fullcalendar.min.js'></script>
      <script src='js/jquery.dataTables.min.js'></script>
      <script src="js/excanvas.js"></script>
      <script src="js/jquery.flot.js"></script>
      <script src="js/jquery.flot.pie.js"></script>
      <script src="js/jquery.flot.stack.js"></script>
      <script src="js/jquery.flot.resize.min.js"></script>
      <script src="js/jquery.chosen.min.js"></script>
      <script src="js/jquery.uniform.min.js"></script>
      <script src="js/jquery.cleditor.min.js"></script>
      <script src="js/jquery.noty.js"></script>
      <script src="js/jquery.elfinder.min.js"></script>
      <script src="js/jquery.raty.min.js"></script>
      <script src="js/jquery.iphone.toggle.js"></script>
      <script src="js/jquery.uploadify-3.1.min.js"></script>
      <script src="js/jquery.gritter.min.js"></script>
      <script src="js/jquery.imagesloaded.js"></script>
      <script src="js/jquery.masonry.min.js"></script>
      <script src="js/jquery.knob.modified.js"></script>
      <script src="js/jquery.sparkline.min.js"></script>
      <script src="js/counter.js"></script>
      <script src="js/retina.js"></script>
      <script src="js/custom.js"></script>
      <script src="js/menu.js"></script>
      <br><br>
      <br>
      <br>
      <foter>
      <div id="contenedorB">
         <center>
            <h4>INSTITUTO POLITÉCNICO NACIONAL</h4>
            D.R. Instituto Politécnico Nacional (IPN), Av. Luis Enrique Erro S/N, Unidad Profesional Adolfo López Mateos, Zacatenco, Delegación Gustavo A. Madero, C.P. 07738, Ciudad de México; México 2009-2013.
            <p>   Este sitio es una obra intelectual protegida por la Ley Federal del Derecho de Autor, puede ser reproducida con fines no lucrativos, siempre y cuando no se mutile, se cite la fuente completa y su dirección electrónica; su uso para otros fines, requiere autorización previa y por escrito del Director General del Instituto.
         </center>
      </div></foter>
   </body>
</html>