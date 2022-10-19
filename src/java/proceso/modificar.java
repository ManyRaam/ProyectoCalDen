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
import javax.servlet.http.HttpSession;
import proceso.AES;
import proceso.Data;
import proceso.var;

/**
 *
 * @author Alejandro el guapo :v
 */
public class modificar extends HttpServlet {

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
            throws ServletException, IOException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
      String nombre = request.getParameter("nombre");
      String ap = request.getParameter("ap") ; 
      String am = request.getParameter("am") ; 
      String contra = request.getParameter("contra");
      
      AES j = new AES ();
      HttpSession ok = request.getSession();
      usuario u = (usuario) ok.getAttribute("algo");
       int clvdoc= Integer.parseInt(j.decencriptar(u.getClvdoc())) ;
        var con = new var();
        Data objConn = new Data( );
       objConn.setDbname( "dentista" );
            objConn.setDriver( "com.mysql.jdbc.Driver" );
            objConn.setUser( "root" );
            objConn.setPassword(con.getContraseña());
            objConn.setUrl( "jdbc:mysql://localhost/dentista" );
            objConn.open();
            String todo = nombre + ap + am ;
      boolean      validado =  true ;
               char[] a = todo.toCharArray();
                for (int d=0;d<a.length;d++){
           int este = a[d];
            if((este>=97 && este<=122)||(este>=48 && este<=57)||(este>=65 && este<=90)){
                
            }
            else{
                validado = false;
                ok.setAttribute("Error", "El nombre o los apellidos contiene caracteres invalidos");
            }
       }
            boolean validado2 = true;
            
            String perm = "qwertyuioplkjhgfdsazxcvbnm1234567890QWERTYUIOPASDFGHJKLZXCVBNM";
            int l1 = contra.length();
            int l2 = 0;
            for(int i=0; i<contra.length(); i++){
                for(int k=0; k<perm.length(); k++){
                    if(contra.charAt(i)==perm.charAt(k)){
                        l2++;
                    }
                }
            }
            if(l1!=l2){
                validado2=false;
                ok.setAttribute("Error", "La contraseña contiene caracteres invalidos");
            }
                
                
                if(validado && validado2) {
                  objConn.modificar(contra, nombre, ap, am, clvdoc);
                  response.sendRedirect("Sesion.jsp");
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
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(modificar.class.getName()).log(Level.SEVERE, null, ex);
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
