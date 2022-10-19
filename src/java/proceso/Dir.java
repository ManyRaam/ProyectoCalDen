/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proceso;

import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

/**
 *
 * @author Carlos vera
 */
public class Dir extends HttpServlet {

    private Connection con;
    private Statement set;
    private ResultSet rs;

    Conexion conecta = new Conexion();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, SQLException {

        response.setContentType("text/html;charset=ISO-8859-1");
        PrintWriter out = response.getWriter();
        var con = new var();
        var objvar = new var();
        Data objConn = new Data();
        HttpSession ok = request.getSession();

        /*
           String nombre = request.getParameter("nombre");
           String boleta = request.getParameter("boleta");
           int     edad  = Integer.parseInt(request.getParameter("edad"));
           String sexo = request.getParameter("sexo");
        System.out.println("edad es:"+request.getParameter("edad"));
          System.out.println(boleta);
            System.out.println(edad);
              System.out.println(sexo);
       
            
            
         
         */
        try {
            HttpSession Sesion = request.getSession();
            usuario u = (usuario) Sesion.getAttribute("algo");
            AES x = new AES();
            String clvdoc = x.decencriptar(u.getClvdoc());
            objConn.setDbname("dentista");
            objConn.setDriver("com.mysql.jdbc.Driver");
            objConn.setUser("root");
            objConn.setPassword(con.getContraseña());
            objConn.setUrl("jdbc:mysql://localhost/dentista");
            objConn.open();

            String s = request.getParameter("sexo");
            char c = s.charAt(0);
            boolean valido = true;
            Object[] datosalumno = new Object[8];
            datosalumno[0] = request.getParameter("nombre");
            datosalumno[1] = request.getParameter("edad");
            String usuario = request.getParameter("usua");
            String contra = request.getParameter("contra");
            datosalumno[6] = usuario;
            datosalumno[7] = contra;
            String algo = (String) datosalumno[0];
            
            boolean valido2 = true;
            String all = usuario+contra;
            int l1 = all.length();
            int l2 = 0;
            String perm = "qwertyuioplkjhgfdsazxcvbnm1234567890QWERTYUIOPASDFGHJKLZXCVBNM";
            for(int i=0; i<all.length(); i++){
                for(int k=0; k<perm.length(); k++){
                    if(all.charAt(i)==perm.charAt(k)){
                        l2++;
                    }
                }
            }
            if(l1!=l2){
                valido2=false;
                ok.setAttribute("Error", "El usuario o contraseña contiene caracteres invalidos");
            }
            
            if(usuario.length()>15 || contra.length()>15){
                valido2 = false;
                ok.setAttribute("Error", "El usuario o contraseña contiene caracteres invalidos");
            }
            
            if (algo.length() > 30) {
                valido = false;
            }

            char[] a = algo.toCharArray();
            for (int d = 0; d < a.length; d++) {
                int este = a[d];
                if ((este >= 97 && este <= 122) || (este >= 48 && este <= 57) || (este >= 65 && este <= 90) || este == 32) {

                } else {
                    valido = false;
                    ok.setAttribute("Error", "El nombre contiene caracteres invalidos");
                }   
            }
                try {
                Calendar o = Calendar.getInstance();
                int anioactual = o.get(Calendar.YEAR);
                int año = Integer.parseInt(request.getParameter("edad").substring(0, 4)
                );
                int mesi = Integer.parseInt(request.getParameter("edad").substring(5, 7));
                int dias = Integer.parseInt(request.getParameter("edad").substring(8, 10));
                System.out.println(dias + mesi + año);
                if (mesi < 0 || mesi > 12) {

                    valido = false;
                }
                switch (mesi) {
                    case 1:
                        if (dias < 0 || dias > 31) {
                            valido = false;

                        }
                        break;
                    case 2:
                        if (dias < 0 || dias > 28) {
                            valido = false;

                        }
                        break;
                    case 3:
                        if (dias < 0 || dias > 31) {
                            valido = false;
                        }
                        break;
                    case 4:
                        if (dias < 0 || dias > 30) {
                            valido = false;
                        }
                        break;
                    case 5:
                        if (dias < 0 || dias > 31) {
                            valido = false;
                        }
                        break;
                    case 6:
                        if (dias < 0 || dias > 30) {
                            valido = false;
                        }
                        break;
                    case 7:
                        if (dias < 0 || dias > 31) {
                            valido = false;
                        }
                        break;
                    case 8:
                        if (dias < 0 || dias > 31) {
                            valido = false;
                        }
                        break;
                    case 9:
                        if (dias < 0 || dias > 30) {
                            valido = false;
                        }
                        break;
                    case 10:
                        if (dias < 0 || dias > 31) {
                            valido = false;
                        }
                        break;
                    case 11:
                        if (dias < 0 || dias > 30) {
                            valido = false;
                        }
                        break;
                    case 12:
                        if (dias < 0 || dias > 31) {
                            valido = false;
                        }
                        break;
                }

                if (año > anioactual || (anioactual - año) >= 100) {
                    valido = false;
                    ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                }   

            } catch (Exception e) {
                valido = false;
                ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                response.sendRedirect("error.jsp");
            }
                        
            datosalumno[2] = c;

            try {
                datosalumno[3] = clvdoc;
                datosalumno[4] = request.getParameter("apellidom");

                algo = (String) datosalumno[4];
            } catch (Exception e) {
                ok.setAttribute("Error", "El apellido paterno contiene caracteres invalidos ");
                response.sendRedirect("error.jsp");
            }
            if (algo.length() > 30) {
                valido = false;
                ok.setAttribute("Error", "El apellido materno contiene caracteres invalidos ");
            }

            a = algo.toCharArray();
            for (int d = 0; d < a.length; d++) {
                int este = a[d];
                if ((este >= 97 && este <= 122) || (este >= 48 && este <= 57) || (este >= 65 && este <= 90) || este == 32) {

                } else {
                    valido = false;
                    ok.setAttribute("Error", "El apellido materno contiene caracteres invalidos ");
                }
            }
            datosalumno[5] = request.getParameter("apellidop");
            algo = (String) datosalumno[5];
            if (algo.length() > 30) {
                valido = false;
                ok.setAttribute("Error", "El apellido paterno contiene caracteres invalidos ");
            }
            a = algo.toCharArray();
            for (int d = 0; d < a.length; d++) {
                int este = a[d];
                if ((este >= 97 && este <= 122) || (este >= 48 && este <= 57) || (este >= 65 && este <= 90) || este == 32) {

                } else {
                    valido = false;
                    ok.setAttribute("Error", "El apellido paterno contiene caracteres invalidos ");

                }
            }
            String valores = "(nombre,edad,sexo,clvdoc,apellidom,apellidop)";

            if (valido && valido2 && objConn.verificar(usuario)) { //Agregué valido2 (pass y usuario)
                objConn.insertardatos(datosalumno, 12);
            } else {
                valido = false;
                ok.setAttribute("Error", "El usuario ya existe");
            }
            ////////////

            List<var> ultimo = null;
            objConn = new Data();
            objConn.setDbname("dentista");
            objConn.setDriver("com.mysql.jdbc.Driver");
            objConn.setPassword(con.getContraseña());
            objConn.setUrl("jdbc:mysql://localhost/dentista");
            objConn.setUser("root");

            objConn.open();
            ultimo = objConn.last();
            if (ultimo != null) {
                for (var objvarr : ultimo) {
                    int C = objvarr.getEndclvpac();

                    con.setEC(C);

                }
            }

            int g = con.getEC();

            Object[] datosalumno1 = new Object[2];

            datosalumno1[0] = request.getParameter("area");
            algo = (String) datosalumno1[0];
            if (algo.length() > 30) {
                valido = false;
                ok.setAttribute("Error", "El Area contiene caracteres invalidos ");
            }
            a = algo.toCharArray();
            for (int d = 0; d < a.length; d++) {
                int este = a[d];
                if ((este >= 97 && este <= 122) || (este >= 48 && este <= 57) || (este >= 65 && este <= 90) || este == 32) {

                } else {
                    valido = false;
                    ok.setAttribute("Error", "El Area contiene caracteres invalidos ");
                }
            }
            datosalumno1[1] = g;
            //System.out.println("calveeeeee:::::::::"+g);
            String valores2 = "(area,clvpac)";
            objConn.open();
            if (valido && valido2) {
                objConn.insertardatos(datosalumno1, 3);

                objConn.close();

                response.sendRedirect("Registrar.jsp");

            } else {
                ok.setAttribute("Error", "Error al registrar el usuario");
                response.sendRedirect("error.jsp");
            }

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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Dir.class.getName()).log(Level.SEVERE, null, ex);
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
