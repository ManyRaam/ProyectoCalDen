<%-- 
    Document   : cerrars
    Created on : 25/04/2016, 02:48:39 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<% HttpSession sesionOk = request.getSession();
sesionOk.invalidate();


%>
<jsp:forward page="index.html"></jsp:forward>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1">
        <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
        <title>Cerrar sesión</title>
    </head>
    <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
    <body>
    </body>
</html>
