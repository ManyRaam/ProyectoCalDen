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
 * @author PC
 */
public class ParteF extends HttpServlet {

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
        response.setContentType("text/html;charset=ISO-8859-1");
        String diente;
            Data objConn = new Data( );
      AES o = new AES();
      String pac1= request.getParameter("clvpac");
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
       var con = new var();
       
         
       objConn.setDbname( "dentista" );
            objConn.setDriver( "com.mysql.jdbc.Driver" );
            objConn.setUser( "root" );
            objConn.setPassword(con.getContraseña());
            objConn.setUrl( "jdbc:mysql://localhost/dentista" );
            objConn.open();
       
       
          Object [] array1 = new Object[3];
           String valores ="(clvpac,dientecondicion,tipo)";
         int z=1;
         for(int d=11; d<19;d++){
                
                diente=request.getParameter("d"+d);
           //    array1 [z++]=request.getParameter("d"+d);
              array1 [0]=pac;
              array1 [1]=request.getParameter("d"+d);
              array1 [2]=d;
              
                objConn.insertardatos(array1,6);
        }
         
          Object [] array2 = new Object[3];
        for(int d=21; d<29;d++){
                //SE guarda el diente el valor del diente 
               array2 [0]=pac;
              array2 [1]=request.getParameter("d"+d);
              array2 [2]=d;
              
                objConn.insertardatos(array2,6);
                
        }
         Object [] array3 = new Object[3];
        for(int d=31; d<39;d++){
                //SE guarda el diente el valor del diente 
              array3 [0]=pac;
              array3 [1]=request.getParameter("d"+d);
              array3 [2]=d;
                 objConn.insertardatos(array3,6);
        }
        Object [] array4 = new Object[3];
        for(int d=41; d<49;d++){
                //SE guarda el diente el valor del diente 
                array4 [0]=pac;
              array4 [1]=request.getParameter("d"+d);
              array4 [2]=d;
                 objConn.insertardatos(array4,6);
                
        }
        
        
            response.sendRedirect("Historial.jsp?id="+pac1);
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
            Logger.getLogger(ParteF.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ParteF.class.getName()).log(Level.SEVERE, null, ex);
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
