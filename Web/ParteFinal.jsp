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
   
   
   
   
   System.out.println("clave doctor:::::::::"+request.getParameter("clvdoc"));
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
      <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
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
        background: url(img/D/4.png);
                background-position-x: 450px;
    background-position-y: 0px;
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

 .menu--ceres .menu__link:focus {
         color: #cbf3fb;
         }
         .menu--ceres .menu__item--current .menu__link {
         color:  #e91e63;
         }
         .menu--ceres .menu__item::before,
         .menu--ceres .menu__item::after,
         .menu--ceres .menu__link::after {
         content: '';
         position: absolute;
         bottom: 0;
         background: #e91e63;
         }
     
         td{
         padding: 1px;
         text-align: center;
         vertical-align: middle;
         font-weight: 300;
         font-size: 14px;
         
         border-bottom: solid 1px rgba(255,255,255,0.1);
         color: rgba(203, 243, 251, 0.55);
         }
         textArea{
         background:  hsl(0, 0%, 79%);
         }
         table{
             
             width: 750px;
         }
         
          body{
         background: #1B1A1C;
         }
         #contenedor{
              color: #000000;
         padding: 1em;
         cursor: default;
         width:  52em;
         background: #000000;
         padding-top: 8px;
        margin-top: 100px;
         border-radius: 4px;
         box-shadow: 0 5px 20px rgba(0,0,0,0.05), 0 15px 30px -10px rgba(0,0,0,0.3);
        
         -webkit-transition: background 0.4s;
         transition: background  4.4s;
         
         }
         #contenedor:hover {
             
      
        
         }
         
          #contenedor:focus {
         background:  #fafeff;
        
         }
         
         h1{
              color:#dbdbdb;
               text-align: center;
                
         }
         h4{ 
             text-align: center;
             color:rgba(203, 243, 251, 0.55);
             margin-bottom: 10px;
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
         box-shadow: 0 6px #cbf3fb;
         background: #000000;
         }
        
        select{
             font-size: 2em;
             color:#e91e63;
             text-align: center;
                outline:0px;    
                  border:none;
                
         }
         
         
      </style>
   </head>
   <body>
      <header>
         <div style="background: #1B1A1C;" class="menus" >
          
            
            <nav class="menu menu--ceres">
               <ul class="menu__list">
                  <li class="menu__item" ><a href="menu.jsp" class="menu__link" style=" color:#cbf3fb;" >Calendario</a></li>
                  <li class="menu__item"><a href="alum.jsp" class="menu__link" style=" color:#cbf3fb;" >Pacientes</a></li>
                  <li class="menu__item menu__item--current"><a href="" class="menu__link" style=" color:#cbf3fb;" >Historial</a></li>
                  <li class="menu__item"><a href="reportes.jsp" class="menu__link" style=" color:#cbf3fb;" >Reportes</a></li>
                  <li class="menu__item"><a href="Sesion.jsp" class="menu__link" style=" color:#cbf3fb;" >Cuenta</a></li>
                  <li class="menu__item"><a href="cerrars.jsp" class="menu__link" style=" color:#cbf3fb;" >Salir</a></li>
               </ul>
            </nav>
         </div>
      </header>
      <br>
      <br> 
       <body>
      <section class="R bg-1">
         <div id="contenedor">
            <h1>Dantadura</h1>
            
            <h4>N: Ninguno, C: Careado, P: Perdido, O: Obturado</h4>
           
                
               
               <form action="ParteF" method="post">
                 
                  <input name="clvpac" id="clvpac" value="<%=request.getParameter("clvpac")%>" type="hidden">
                  <table>
                      <tr>
                      <td>28</td><td>27</td><td>26</td><td>25</td><td>24</td><td>23</td><td>22</td><td>21</td>
                      <td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td>
                      </tr>
                     <tr>
                         
                        <td>
                            
                            <select name="d28" class="select28">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td>
                            <select name="d27" class="select27">
                                <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        
                        <td >
                            <select name="d26" class="select26">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td>
                            <select name="d25" class="select25">
                             <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d24" class="select24">
                              <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d23" class="select23">
                             <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d22" class="select22">
                             <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d21" class="select21">
                             <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        
                        
                        
                         
                        <td >
                            <select name="d11" class="select11">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d12" class="select12">
                             <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d13" class="select13">
                              <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d14" class="select14">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d15" class="select15">
                              <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d16" class="select16">
                              <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d17" class="select17">
                              <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d18" class="select18">
                              <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        
                        <tr>
                            
                            
                            <td>
                            <select name="d38" class="select38">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td>
                            <select name="d37" class="select37">
                              <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d36" class="select36">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td>
                            <select name="d35" class="select35">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d34" class="select34">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d33" class="select33">
                              <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d32" class="select32">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d31" class="select31">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        
                        
                        
                         
                        <td >
                            <select name="d41" class="select41">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d42" class="select42">
                             <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d43" class="select43">
                                 <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d44" class="select44">
                             <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d45" class="select45">
                           <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d46" class="select46">
                          <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d47" class="select47">
                               <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                        <td >
                            <select name="d48" class="select48">
                              <option value=" "></option>
                               
                              <option value="Cariado">C</option>
                              <option value="Perdido">P</option>
                              <option value="Obturado">O</option>
                           </select>
                        </td>
                            
                            
                        </tr>
                        
                        <tr>
                      <td>38</td><td>37</td><td>36</td><td>35</td><td>34</td><td>33</td><td>32</td><td>31</td>
                      <td>41</td><td>42</td><td>43</td><td>44</td><td>45</td><td>46</td><td>47</td><td>48</td>
                      </tr>
                        
                        
                        
                        
                       
                            
                     
                  </table>
                  <input class="button1" type="submit" value="Finalizar">
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
      <center><h4>INSTITUTO POLITÉCNICO NACIONAL</h4>
      D.R. Instituto Politécnico Nacional (IPN), Av. Luis Enrique Erro S/N, Unidad Profesional Adolfo López Mateos, Zacatenco, Delegación Gustavo A. Madero, C.P. 07738, Ciudad de México; México 2009-2013.
      <p>  Este sitio es una obra intelectual protegida por la Ley Federal del Derecho de Autor, puede ser reproducida con fines no lucrativos, siempre y cuando no se mutile, se cite la fuente completa y su dirección electrónica; su uso para otros fines, requiere autorización previa y por escrito del Director General del Instituto.
      </center>
      </div>
   </body>
</html>