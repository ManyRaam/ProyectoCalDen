/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proceso;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;

/**
 *
 * @author Carlos vera
 */

public class ElimCit extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             response.setContentType("text/html;charset=ISO-8859-1");
        PrintWriter out = response.getWriter();
        var con = new var();
        var objvar = new var( );
        Data objConn = new Data( );
       
       
        try 
        {
            
           String fecha = request.getParameter("fecha");
           System.out.println(";;,;;;,"+fecha);
            System.out.println(";;,;;;,"+fecha.substring(0,19));
             String newfecha = fecha.substring(0,19);
             objvar.setFecha(newfecha);
         
            objConn.setDbname("dentista");
            objConn.setDriver("com.mysql.jdbc.Driver");
            objConn.setUser("root");
            objConn.setPassword(con.getContraseña());
            objConn.setUrl("jdbc:mysql://localhost/dentista");
            objConn.open();
            
            objConn.EliminarCit(objvar);
            
           response.sendRedirect("Historial.jsp?id="+request.getParameter("clvpac"));
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Insertar Servlet</title>");  
            out.println("  "+
                     ""+
             "<meta http-equiv='refresh'"+"content='1;"+
		  "url=Mensaje.jsp'>"+
                          
"  </head>\n" +
"\n" +
"  <style> body {\n" +
"  overflow: hidden;\n" +
"  background: #111;\n" +
"}\n" +
"\n" +
".spinner {\n" +
"  position: absolute;\n" +
"  top: 50%;\n" +
"  left: 50%;\n" +
"  z-index: 2;\n" +
"  perspective: 900px;\n" +
"}\n" +
"\n" +
"i {\n" +
"  display: block;\n" +
"  position: absolute;\n" +
"  opacity: 1;\n" +
"}\n" +
"i b {\n" +
"  display: block;\n" +
"  width: 6px;\n" +
"  height: 6px;\n" +
"  border-radius: 6px;\n" +
"  background: white;\n" +
"  box-shadow: 0px 0px 14px white;\n" +
"  animation-name: spin;\n" +
"  animation-duration: 3s;\n" +
"  animation-iteration-count: infinite;\n" +
"  animation-timing-function: ease-in-out;\n" +
"}\n" +
"\n" +
"i:nth-child(1) {\n" +
"  transform: rotate(3.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(1) b {\n" +
"  animation-delay: 0.03061s;\n" +
"}\n" +
"\n" +
"i:nth-child(2) {\n" +
"  transform: rotate(7.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(2) b {\n" +
"  animation-delay: 0.06122s;\n" +
"}\n" +
"\n" +
"i:nth-child(3) {\n" +
"  transform: rotate(10.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(3) b {\n" +
"  animation-delay: 0.09184s;\n" +
"}\n" +
"\n" +
"i:nth-child(4) {\n" +
"  transform: rotate(14.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(4) b {\n" +
"  animation-delay: 0.12245s;\n" +
"}\n" +
"\n" +
"i:nth-child(5) {\n" +
"  transform: rotate(18deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(5) b {\n" +
"  animation-delay: 0.15306s;\n" +
"}\n" +
"\n" +
"i:nth-child(6) {\n" +
"  transform: rotate(21.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(6) b {\n" +
"  animation-delay: 0.18367s;\n" +
"}\n" +
"\n" +
"i:nth-child(7) {\n" +
"  transform: rotate(25.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(7) b {\n" +
"  animation-delay: 0.21429s;\n" +
"}\n" +
"\n" +
"i:nth-child(8) {\n" +
"  transform: rotate(28.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(8) b {\n" +
"  animation-delay: 0.2449s;\n" +
"}\n" +
"\n" +
"i:nth-child(9) {\n" +
"  transform: rotate(32.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(9) b {\n" +
"  animation-delay: 0.27551s;\n" +
"}\n" +
"\n" +
"i:nth-child(10) {\n" +
"  transform: rotate(36deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(10) b {\n" +
"  animation-delay: 0.30612s;\n" +
"}\n" +
"\n" +
"i:nth-child(11) {\n" +
"  transform: rotate(39.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(11) b {\n" +
"  animation-delay: 0.33673s;\n" +
"}\n" +
"\n" +
"i:nth-child(12) {\n" +
"  transform: rotate(43.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(12) b {\n" +
"  animation-delay: 0.36735s;\n" +
"}\n" +
"\n" +
"i:nth-child(13) {\n" +
"  transform: rotate(46.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(13) b {\n" +
"  animation-delay: 0.39796s;\n" +
"}\n" +
"\n" +
"i:nth-child(14) {\n" +
"  transform: rotate(50.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(14) b {\n" +
"  animation-delay: 0.42857s;\n" +
"}\n" +
"\n" +
"i:nth-child(15) {\n" +
"  transform: rotate(54deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(15) b {\n" +
"  animation-delay: 0.45918s;\n" +
"}\n" +
"\n" +
"i:nth-child(16) {\n" +
"  transform: rotate(57.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(16) b {\n" +
"  animation-delay: 0.4898s;\n" +
"}\n" +
"\n" +
"i:nth-child(17) {\n" +
"  transform: rotate(61.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(17) b {\n" +
"  animation-delay: 0.52041s;\n" +
"}\n" +
"\n" +
"i:nth-child(18) {\n" +
"  transform: rotate(64.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(18) b {\n" +
"  animation-delay: 0.55102s;\n" +
"}\n" +
"\n" +
"i:nth-child(19) {\n" +
"  transform: rotate(68.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(19) b {\n" +
"  animation-delay: 0.58163s;\n" +
"}\n" +
"\n" +
"i:nth-child(20) {\n" +
"  transform: rotate(72deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(20) b {\n" +
"  animation-delay: 0.61224s;\n" +
"}\n" +
"\n" +
"i:nth-child(21) {\n" +
"  transform: rotate(75.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(21) b {\n" +
"  animation-delay: 0.64286s;\n" +
"}\n" +
"\n" +
"i:nth-child(22) {\n" +
"  transform: rotate(79.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(22) b {\n" +
"  animation-delay: 0.67347s;\n" +
"}\n" +
"\n" +
"i:nth-child(23) {\n" +
"  transform: rotate(82.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(23) b {\n" +
"  animation-delay: 0.70408s;\n" +
"}\n" +
"\n" +
"i:nth-child(24) {\n" +
"  transform: rotate(86.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(24) b {\n" +
"  animation-delay: 0.73469s;\n" +
"}\n" +
"\n" +
"i:nth-child(25) {\n" +
"  transform: rotate(90deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(25) b {\n" +
"  animation-delay: 0.76531s;\n" +
"}\n" +
"\n" +
"i:nth-child(26) {\n" +
"  transform: rotate(93.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(26) b {\n" +
"  animation-delay: 0.79592s;\n" +
"}\n" +
"\n" +
"i:nth-child(27) {\n" +
"  transform: rotate(97.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(27) b {\n" +
"  animation-delay: 0.82653s;\n" +
"}\n" +
"\n" +
"i:nth-child(28) {\n" +
"  transform: rotate(100.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(28) b {\n" +
"  animation-delay: 0.85714s;\n" +
"}\n" +
"\n" +
"i:nth-child(29) {\n" +
"  transform: rotate(104.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(29) b {\n" +
"  animation-delay: 0.88776s;\n" +
"}\n" +
"\n" +
"i:nth-child(30) {\n" +
"  transform: rotate(108deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(30) b {\n" +
"  animation-delay: 0.91837s;\n" +
"}\n" +
"\n" +
"i:nth-child(31) {\n" +
"  transform: rotate(111.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(31) b {\n" +
"  animation-delay: 0.94898s;\n" +
"}\n" +
"\n" +
"i:nth-child(32) {\n" +
"  transform: rotate(115.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(32) b {\n" +
"  animation-delay: 0.97959s;\n" +
"}\n" +
"\n" +
"i:nth-child(33) {\n" +
"  transform: rotate(118.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(33) b {\n" +
"  animation-delay: 1.0102s;\n" +
"}\n" +
"\n" +
"i:nth-child(34) {\n" +
"  transform: rotate(122.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(34) b {\n" +
"  animation-delay: 1.04082s;\n" +
"}\n" +
"\n" +
"i:nth-child(35) {\n" +
"  transform: rotate(126deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(35) b {\n" +
"  animation-delay: 1.07143s;\n" +
"}\n" +
"\n" +
"i:nth-child(36) {\n" +
"  transform: rotate(129.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(36) b {\n" +
"  animation-delay: 1.10204s;\n" +
"}\n" +
"\n" +
"i:nth-child(37) {\n" +
"  transform: rotate(133.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(37) b {\n" +
"  animation-delay: 1.13265s;\n" +
"}\n" +
"\n" +
"i:nth-child(38) {\n" +
"  transform: rotate(136.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(38) b {\n" +
"  animation-delay: 1.16327s;\n" +
"}\n" +
"\n" +
"i:nth-child(39) {\n" +
"  transform: rotate(140.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(39) b {\n" +
"  animation-delay: 1.19388s;\n" +
"}\n" +
"\n" +
"i:nth-child(40) {\n" +
"  transform: rotate(144deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(40) b {\n" +
"  animation-delay: 1.22449s;\n" +
"}\n" +
"\n" +
"i:nth-child(41) {\n" +
"  transform: rotate(147.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(41) b {\n" +
"  animation-delay: 1.2551s;\n" +
"}\n" +
"\n" +
"i:nth-child(42) {\n" +
"  transform: rotate(151.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(42) b {\n" +
"  animation-delay: 1.28571s;\n" +
"}\n" +
"\n" +
"i:nth-child(43) {\n" +
"  transform: rotate(154.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(43) b {\n" +
"  animation-delay: 1.31633s;\n" +
"}\n" +
"\n" +
"i:nth-child(44) {\n" +
"  transform: rotate(158.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(44) b {\n" +
"  animation-delay: 1.34694s;\n" +
"}\n" +
"\n" +
"i:nth-child(45) {\n" +
"  transform: rotate(162deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(45) b {\n" +
"  animation-delay: 1.37755s;\n" +
"}\n" +
"\n" +
"i:nth-child(46) {\n" +
"  transform: rotate(165.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(46) b {\n" +
"  animation-delay: 1.40816s;\n" +
"}\n" +
"\n" +
"i:nth-child(47) {\n" +
"  transform: rotate(169.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(47) b {\n" +
"  animation-delay: 1.43878s;\n" +
"}\n" +
"\n" +
"i:nth-child(48) {\n" +
"  transform: rotate(172.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(48) b {\n" +
"  animation-delay: 1.46939s;\n" +
"}\n" +
"\n" +
"i:nth-child(49) {\n" +
"  transform: rotate(176.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(49) b {\n" +
"  animation-delay: 1.5s;\n" +
"}\n" +
"\n" +
"i:nth-child(50) {\n" +
"  transform: rotate(180deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(50) b {\n" +
"  animation-delay: 1.53061s;\n" +
"}\n" +
"\n" +
"i:nth-child(51) {\n" +
"  transform: rotate(183.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(51) b {\n" +
"  animation-delay: 1.56122s;\n" +
"}\n" +
"\n" +
"i:nth-child(52) {\n" +
"  transform: rotate(187.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(52) b {\n" +
"  animation-delay: 1.59184s;\n" +
"}\n" +
"\n" +
"i:nth-child(53) {\n" +
"  transform: rotate(190.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(53) b {\n" +
"  animation-delay: 1.62245s;\n" +
"}\n" +
"\n" +
"i:nth-child(54) {\n" +
"  transform: rotate(194.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(54) b {\n" +
"  animation-delay: 1.65306s;\n" +
"}\n" +
"\n" +
"i:nth-child(55) {\n" +
"  transform: rotate(198deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(55) b {\n" +
"  animation-delay: 1.68367s;\n" +
"}\n" +
"\n" +
"i:nth-child(56) {\n" +
"  transform: rotate(201.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(56) b {\n" +
"  animation-delay: 1.71429s;\n" +
"}\n" +
"\n" +
"i:nth-child(57) {\n" +
"  transform: rotate(205.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(57) b {\n" +
"  animation-delay: 1.7449s;\n" +
"}\n" +
"\n" +
"i:nth-child(58) {\n" +
"  transform: rotate(208.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(58) b {\n" +
"  animation-delay: 1.77551s;\n" +
"}\n" +
"\n" +
"i:nth-child(59) {\n" +
"  transform: rotate(212.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(59) b {\n" +
"  animation-delay: 1.80612s;\n" +
"}\n" +
"\n" +
"i:nth-child(60) {\n" +
"  transform: rotate(216deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(60) b {\n" +
"  animation-delay: 1.83673s;\n" +
"}\n" +
"\n" +
"i:nth-child(61) {\n" +
"  transform: rotate(219.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(61) b {\n" +
"  animation-delay: 1.86735s;\n" +
"}\n" +
"\n" +
"i:nth-child(62) {\n" +
"  transform: rotate(223.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(62) b {\n" +
"  animation-delay: 1.89796s;\n" +
"}\n" +
"\n" +
"i:nth-child(63) {\n" +
"  transform: rotate(226.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(63) b {\n" +
"  animation-delay: 1.92857s;\n" +
"}\n" +
"\n" +
"i:nth-child(64) {\n" +
"  transform: rotate(230.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(64) b {\n" +
"  animation-delay: 1.95918s;\n" +
"}\n" +
"\n" +
"i:nth-child(65) {\n" +
"  transform: rotate(234deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(65) b {\n" +
"  animation-delay: 1.9898s;\n" +
"}\n" +
"\n" +
"i:nth-child(66) {\n" +
"  transform: rotate(237.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(66) b {\n" +
"  animation-delay: 2.02041s;\n" +
"}\n" +
"\n" +
"i:nth-child(67) {\n" +
"  transform: rotate(241.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(67) b {\n" +
"  animation-delay: 2.05102s;\n" +
"}\n" +
"\n" +
"i:nth-child(68) {\n" +
"  transform: rotate(244.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(68) b {\n" +
"  animation-delay: 2.08163s;\n" +
"}\n" +
"\n" +
"i:nth-child(69) {\n" +
"  transform: rotate(248.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(69) b {\n" +
"  animation-delay: 2.11224s;\n" +
"}\n" +
"\n" +
"i:nth-child(70) {\n" +
"  transform: rotate(252deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(70) b {\n" +
"  animation-delay: 2.14286s;\n" +
"}\n" +
"\n" +
"i:nth-child(71) {\n" +
"  transform: rotate(255.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(71) b {\n" +
"  animation-delay: 2.17347s;\n" +
"}\n" +
"\n" +
"i:nth-child(72) {\n" +
"  transform: rotate(259.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(72) b {\n" +
"  animation-delay: 2.20408s;\n" +
"}\n" +
"\n" +
"i:nth-child(73) {\n" +
"  transform: rotate(262.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(73) b {\n" +
"  animation-delay: 2.23469s;\n" +
"}\n" +
"\n" +
"i:nth-child(74) {\n" +
"  transform: rotate(266.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(74) b {\n" +
"  animation-delay: 2.26531s;\n" +
"}\n" +
"\n" +
"i:nth-child(75) {\n" +
"  transform: rotate(270deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(75) b {\n" +
"  animation-delay: 2.29592s;\n" +
"}\n" +
"\n" +
"i:nth-child(76) {\n" +
"  transform: rotate(273.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(76) b {\n" +
"  animation-delay: 2.32653s;\n" +
"}\n" +
"\n" +
"i:nth-child(77) {\n" +
"  transform: rotate(277.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(77) b {\n" +
"  animation-delay: 2.35714s;\n" +
"}\n" +
"\n" +
"i:nth-child(78) {\n" +
"  transform: rotate(280.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(78) b {\n" +
"  animation-delay: 2.38776s;\n" +
"}\n" +
"\n" +
"i:nth-child(79) {\n" +
"  transform: rotate(284.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(79) b {\n" +
"  animation-delay: 2.41837s;\n" +
"}\n" +
"\n" +
"i:nth-child(80) {\n" +
"  transform: rotate(288deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(80) b {\n" +
"  animation-delay: 2.44898s;\n" +
"}\n" +
"\n" +
"i:nth-child(81) {\n" +
"  transform: rotate(291.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(81) b {\n" +
"  animation-delay: 2.47959s;\n" +
"}\n" +
"\n" +
"i:nth-child(82) {\n" +
"  transform: rotate(295.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(82) b {\n" +
"  animation-delay: 2.5102s;\n" +
"}\n" +
"\n" +
"i:nth-child(83) {\n" +
"  transform: rotate(298.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(83) b {\n" +
"  animation-delay: 2.54082s;\n" +
"}\n" +
"\n" +
"i:nth-child(84) {\n" +
"  transform: rotate(302.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(84) b {\n" +
"  animation-delay: 2.57143s;\n" +
"}\n" +
"\n" +
"i:nth-child(85) {\n" +
"  transform: rotate(306deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(85) b {\n" +
"  animation-delay: 2.60204s;\n" +
"}\n" +
"\n" +
"i:nth-child(86) {\n" +
"  transform: rotate(309.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(86) b {\n" +
"  animation-delay: 2.63265s;\n" +
"}\n" +
"\n" +
"i:nth-child(87) {\n" +
"  transform: rotate(313.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(87) b {\n" +
"  animation-delay: 2.66327s;\n" +
"}\n" +
"\n" +
"i:nth-child(88) {\n" +
"  transform: rotate(316.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(88) b {\n" +
"  animation-delay: 2.69388s;\n" +
"}\n" +
"\n" +
"i:nth-child(89) {\n" +
"  transform: rotate(320.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(89) b {\n" +
"  animation-delay: 2.72449s;\n" +
"}\n" +
"\n" +
"i:nth-child(90) {\n" +
"  transform: rotate(324deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(90) b {\n" +
"  animation-delay: 2.7551s;\n" +
"}\n" +
"\n" +
"i:nth-child(91) {\n" +
"  transform: rotate(327.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(91) b {\n" +
"  animation-delay: 2.78571s;\n" +
"}\n" +
"\n" +
"i:nth-child(92) {\n" +
"  transform: rotate(331.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(92) b {\n" +
"  animation-delay: 2.81633s;\n" +
"}\n" +
"\n" +
"i:nth-child(93) {\n" +
"  transform: rotate(334.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(93) b {\n" +
"  animation-delay: 2.84694s;\n" +
"}\n" +
"\n" +
"i:nth-child(94) {\n" +
"  transform: rotate(338.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(94) b {\n" +
"  animation-delay: 2.87755s;\n" +
"}\n" +
"\n" +
"i:nth-child(95) {\n" +
"  transform: rotate(342deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(95) b {\n" +
"  animation-delay: 2.90816s;\n" +
"}\n" +
"\n" +
"i:nth-child(96) {\n" +
"  transform: rotate(345.6deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(96) b {\n" +
"  animation-delay: 2.93878s;\n" +
"}\n" +
"\n" +
"i:nth-child(97) {\n" +
"  transform: rotate(349.2deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(97) b {\n" +
"  animation-delay: 2.96939s;\n" +
"}\n" +
"\n" +
"i:nth-child(98) {\n" +
"  transform: rotate(352.8deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(98) b {\n" +
"  animation-delay: 3s;\n" +
"}\n" +
"\n" +
"i:nth-child(99) {\n" +
"  transform: rotate(356.4deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(99) b {\n" +
"  animation-delay: 3.03061s;\n" +
"}\n" +
"\n" +
"i:nth-child(100) {\n" +
"  transform: rotate(360deg) translate3d(100px, 0, 0);\n" +
"}\n" +
"i:nth-child(100) b {\n" +
"  animation-delay: 3.06122s;\n" +
"}\n" +
"\n" +
"@keyframes spin {\n" +
"  0% {\n" +
"    transform: scale(1);\n" +
"  }\n" +
"  15% {\n" +
"    transform: translate(-3px, -3px) scale(3);\n" +
"  }\n" +
"  50% {\n" +
"    transform: scale(1);\n" +
"  }\n" +
"}\n" +
"\n" +
"    </style>\n" +
"\n" +
"    \n" +
"   \n" +
"\n" +
"    \n" +
"  </head>\n" +
"\n" +
"  <body>\n" +
"\n" +
"    <div class='spinner'>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"  <i>\n" +
"    <b></b>\n" +
"  </i>\n" +
"</div>\n" +
"    \n" +
"       \n" +
"\n" +
"    \n" +
"    \n" +
"    \n" +
"  </body>\n" +
"</html>");
            
        } finally { 
            out.close();
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
