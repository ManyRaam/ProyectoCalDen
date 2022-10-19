package proceso;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
/**
 *
 * @author PC
 */
public class Parte1 extends HttpServlet {

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
        String come= request.getParameter("COtra");
       System.out.println(come);
        Data objConn = new Data( );
 
      String pac= request.getParameter("clvpac");
       var con = new var();
       
       objConn.setDbname( "dentista" );
            objConn.setDriver( "com.mysql.jdbc.Driver" );
            objConn.setUser( "root" );
            objConn.setPassword(con.getContraseña());
            objConn.setUrl( "jdbc:mysql://localhost/dentista" );
            objConn.open();
   AES j = new AES();
      
        
         
        String [] array = new String[23];
        String [] array2= {"HPTA" , "Alergias(Estacionales)","Anemia","Asma","Sangrado o transtorno de la sangre","Cancer","Paralisis Cerebral","Sinusities Cronica","Diabetes","Dolores de Oido","Epilepsia","Desmayo","Problemas de crecimiento","Audicion","Corazon","Soplo Cardiaco","Alergia al Latex","Embarazo(adolescentes)","Convulsiones","Tiroides","Tabaco/Uso de drogas"
            
        };
        
        array [0]=request.getParameter("e1");
         array [1]=request.getParameter("e2");
          array [2]=request.getParameter("e3");
           array [3]=request.getParameter("e4");
            array [4]=request.getParameter("e5");
             array [5]=request.getParameter("e6");
              array [6]=request.getParameter("e7");
               array [7]=request.getParameter("e8");
                array [8]=request.getParameter("e9");
                 array [9]=request.getParameter("e10");
                  array [10]=request.getParameter("e11");
                   array [11]=request.getParameter("e12");
                    array [12]=request.getParameter("e13");
                     array [13]=request.getParameter("e14");
                      array [14]=request.getParameter("e15");
                       array [15]=request.getParameter("e16");
                        array [16]=request.getParameter("e17");
                         array [17]=request.getParameter("e18");
                          array [18]=request.getParameter("e19");
                           array [19]=request.getParameter("e20");
                            array [20]=request.getParameter("e21");
                                array [21]=request.getParameter("e22");
                                      String enfermedades=""; 
                                      int x=0;
                   for(int n=0; n<22; n++){
                        
                    if(array [n]==null){
                     //System.out.println("Nº datos basios-"+n+":"+array [n]);
                       
                    
                    } else{
                        if(x>0){
                            enfermedades +=", ";
                        }
                     enfermedades +=array2[n];
                     x++;
                    }
                    
                    }   
               
                           String SiMedica = request.getParameter("SiMedica");
           String Otra = request.getParameter("Otra");
           if(!(Otra.equals("Ninguna"))){
               enfermedades+=", "+Otra ;} 
           String SiToma = request.getParameter("SiToma");
           String Anestecia = request.getParameter("SiAnestecia");
            Object [] datosalumno = new Object[6];
            
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
              if (enfermedades.equals("") && Otra.equals("Ninguna")){
              enfermedades= "ninguno";}
              datosalumno[5] = enfermedades; 
          
                             objConn.insertardatos(datosalumno,4);
                          System.out.println("e22::"+request.getParameter("e22"));
    
    
    response.sendRedirect("Historial.jsp?id="+pac);
    
      
           
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
           Logger.getLogger(Parte1.class.getName()).log(Level.SEVERE, null, ex);
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
           Logger.getLogger(Parte1.class.getName()).log(Level.SEVERE, null, ex);
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
