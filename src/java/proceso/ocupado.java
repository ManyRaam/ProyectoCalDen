/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proceso;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alegp
 */
public class ocupado extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
HttpSession ok = request.getSession();
Object [] cita = new Object[3];
int tipo = Integer.parseInt(request.getParameter("tipo"));
AES j = new AES();
usuario u  = (usuario)ok.getAttribute("algo");
String fecha = request.getParameter("fecha");


cita[1] = "11";
String[] horas={"15:00:00","15:30:00","16:00:00","16:30:00","17:00:00","17:30:00","18:00:00","18:30:00","19:00:00","19:30:00","20:00:00","20:30:00"};   
var con = new var();
        Data objConn = new Data( );
        objConn.setDbname( "dentista" );
            objConn.setDriver( "com.mysql.jdbc.Driver" );
            objConn.setUser( "root" );
            objConn.setPassword(con.getContraseña());
            objConn.setUrl( "jdbc:mysql://localhost/dentista" );
            objConn.open();
        try {
            cita[0] = j.decencriptar(u.getClvdoc());
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ocupado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(ocupado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(ocupado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(ocupado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(ocupado.class.getName()).log(Level.SEVERE, null, ex);
        }

        switch(tipo){
            case 1:
                String dia2 =request.getParameter("fechafinal").substring(8,10);;
                    String año = fecha.substring(0, 4);
                String mes = fecha.substring(5,7);
                String dia= request.getParameter("fecha").substring(8,10);;
                   for(int k = Integer.parseInt(dia);k<=Integer.parseInt(dia2);k++){
                       fecha = año+"-"+mes+"-"+k;
                       for(int i = 0; i<horas.length;i++){
                cita[2]= fecha+" "+ horas[i];
                System.out.print(cita[2]);
                objConn.insertardatos(cita,8);
                }}
                
                
                
                break;
                
            case 2 :
                
                for(int i = 0; i<horas.length;i++){
                cita[2]= fecha+" "+ horas[i];
                System.out.print(cita[2]);
                objConn.insertardatos(cita,8);
                }
                
                break; 
            case 0:
                String horain = request.getParameter("horainic");
                String horafin= request.getParameter("horafinal");
               for(int i = Arrays.asList(horas).indexOf(horain); i<=Arrays.asList(horas).indexOf(horafin);i++){
                cita[2]= fecha+" "+ horas[i];
                System.out.print(cita[2]);
                objConn.insertardatos(cita,8);
                }
                
                break;
        }



response.sendRedirect("menu.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ocupado.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ocupado.class.getName()).log(Level.SEVERE, null, ex);
        }
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
