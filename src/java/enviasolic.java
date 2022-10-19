/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
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
import proceso.AES;
import proceso.Data;
import proceso.usuario;
import proceso.var;

/**
 *
 * @author CECyT9
 */
public class enviasolic extends HttpServlet {

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
            throws ServletException, IOException, NoSuchAlgorithmException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, NoSuchPaddingException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
 HttpSession ok  = request.getSession();
       usuario u = (usuario)ok.getAttribute("paciente");
    int dia = Integer.parseInt(request.getParameter("dia")); 
    int mes =Integer.parseInt(request.getParameter("mes")) ; 
    String razon = request.getParameter("comentario");
    String anio = request.getParameter("anio") ; 
    String hora = request.getParameter("hora");
    int ano = Integer.parseInt(anio);
    char[ ]  b  = razon.toCharArray();
    boolean validacion = true ;
    String algo = " " ;
    char[] c = algo.toCharArray();
    int e =c[0];
    for (int d=0;d<b.length;d++){
                 int este = b[d];
                 if((este>=97 && este<=122)||(este>=48 && este<=57)||(este>=65 && este<=90) || (e==este)){

                 }
                 else{
                     validacion = false;

                 }
            }
    
    
    if ( validacion) {
        var con = new var();
        var objvar = new var( );
        Data objConn = new Data( );

         objConn.setDbname( "dentista" );
            objConn.setDriver( "com.mysql.jdbc.Driver" );
            objConn.setUser( "root" );
            objConn.setPassword(con.getContraseña());
            objConn.setUrl( "jdbc:mysql://localhost/dentista" );
            objConn.open();
        switch(mes){
                case 1: 
                    if(dia<1 || dia>31){
                        validacion = false;
                    }
                    break;
                case 2: 
                     if(dia<1 || dia>=29){
                         if(dia == 29){
                             validacion = ((ano % 4 == 0 && ano % 100 != 0) || ano % 400 == 0);
                         }
                         else{
                        validacion = false;}
                    }
                    break;
                case 3 :
                     if(dia<1 || dia>31){
                        validacion = false;
                    }
                    break;
                case 4:
                     if(dia<1 || dia>30){
                        validacion = false;
                    }
                    break;
                case 5:
                     if(dia<1 || dia>31){
                        validacion = false;
                    }
                    break;
                case 6: 
                     if(dia<1 || dia>30){
                        validacion = false;
                    }
                    break;
                case 7 : 
                     if(dia<1 || dia>31){
                        validacion = false;
                    }
                    break;
                case 8: 
                     if(dia<1 || dia>31){
                        validacion = false;
                    }
                    break;
                case 9 : 
                     if(dia<1 || dia>30){
                        validacion = false;
                    }
                    break; 
                case 10: 
                     if(dia<1 || dia>31){
                        validacion = false;
                    }
                    break;
                case 11:
                     if(dia<1 || dia>30){
                        validacion = false;
                    }
                     break;
                case 12 :
                     if(dia<1 || dia>31){
                        validacion = false;
                    }
                     break;
                        
                   
            }
        if(validacion ){ 
            AES j = new AES();
            Object[] cita = new Object[4];
            cita[0] =razon ;
            cita[1] = j.decencriptar(u.getclvpac());
            cita[2] = j.decencriptar(u.getClvdoc());
            cita[3] = ano+ "-" +mes+"-"+dia+" "+hora;
                   
                    
             objConn.insertarsolicitud(cita);
             response.sendRedirect("paginaalumno.jsp");
        }
        else{
            response.sendRedirect("error.jsp");
        }
        
        
        
    }
    else{
        response.sendRedirect("error.jsp");
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(enviasolic.class.getName()).log(Level.SEVERE, null, ex);
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
