package proceso;

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

/**
 *
 * @author Alumno
 */
public class Otra extends HttpServlet {
    public boolean isAlphaNumeric(String s){
    String p = "^[a-zA-Z0-9_\\s\\.,]*";
    return s.matches(p);
}
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
          Data objConn = new Data( );
            var con = new var();
     AES j = new AES();
      String pac= request.getParameter("clvpac");
        
        String com=request.getParameter("Otra");
        response.setContentType("text/html;charset=ISO-8859-1");
        if(request.getParameter("Otra").equals("")){
            response.sendRedirect("Otra.jsp?clvpac="+pac);
        }else{
           
                 objConn.setDbname( "dentista" );
            objConn.setDriver( "com.mysql.jdbc.Driver" );
            objConn.setUser( "root" );
            objConn.setPassword(con.getContraseña());
            objConn.setUrl( "jdbc:mysql://localhost/dentista" );
            objConn.open();
             Object [] datosalumno = new Object[5];
            String SiMedica = request.getParameter("SiMedica");
           String Otra = request.getParameter("Otra");
           String SiToma = request.getParameter("SiToma");
           String Anestecia = request.getParameter("SiAnestecia");
             
           
           if(isAlphaNumeric(SiMedica)&&isAlphaNumeric(Otra)&& isAlphaNumeric(SiToma)&& isAlphaNumeric(Anestecia)){
           datosalumno [0] = SiMedica;
              datosalumno [1] = Otra;
              datosalumno [2] = SiToma;
              datosalumno [3] =Anestecia;
              try {
                  datosalumno [4] = j.decencriptar(pac);
              } catch (NoSuchAlgorithmException ex) {
                  Logger.getLogger(Otra.class.getName()).log(Level.SEVERE, null, ex);
              } catch (NoSuchPaddingException ex) {
                  Logger.getLogger(Otra.class.getName()).log(Level.SEVERE, null, ex);
              } catch (InvalidKeyException ex) {
                  Logger.getLogger(Otra.class.getName()).log(Level.SEVERE, null, ex);
              } catch (IllegalBlockSizeException ex) {
                  Logger.getLogger(Otra.class.getName()).log(Level.SEVERE, null, ex);
              } catch (BadPaddingException ex) {
                  Logger.getLogger(Otra.class.getName()).log(Level.SEVERE, null, ex);
              }
            
 String valores ="(alergias,descenfer,anestesia,comanes,clvpac)";
 
 
 
             objConn.insertardatos(datosalumno,4);
            response.sendRedirect("Historial.jsp?id="+pac);
        }
           else{
               response.sendRedirect("error.jsp");
           }
    }}

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
            Logger.getLogger(Otra.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Otra.class.getName()).log(Level.SEVERE, null, ex);
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
