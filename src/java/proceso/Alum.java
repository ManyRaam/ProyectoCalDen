/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proceso;

import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
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
import java.sql.DriverManager;
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
import javax.servlet.ServletConfig;
import proceso.var;

/**
 *
 * @author Carlos vera
 */
public class Alum extends HttpServlet {

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
        try {
            HttpSession sesion = request.getSession();
            usuario u = (usuario) sesion.getAttribute("algo");

            AES x = new AES();

            String clv = x.decencriptar(u.getClvdoc());
            objConn.setDbname("dentista");
            objConn.setDriver("com.mysql.jdbc.Driver");
            objConn.setUser("root");
            objConn.setPassword(con.getContraseña());
            objConn.setUrl("jdbc:mysql://localhost/dentista");
            objConn.open();

            Object[] datosalumno = new Object[9];
            boolean valido = true;
            datosalumno[0] = request.getParameter("nombre");
            String usuario = request.getParameter("usua");
            datosalumno[2] = request.getParameter("edad");
            String contra = request.getParameter("contra");
            datosalumno[7] = usuario;
            datosalumno[8] = contra;
            
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
            
            String a = (String) datosalumno[0];
            if (a.length() > 30) {
                valido = false;
            }

            char[] b = a.toCharArray();
            for (int d = 0; d < b.length; d++) {
                int este = b[d];
                if ((este >= 97 && este <= 122) || (este >= 48 && este <= 57) || (este >= 65 && este <= 90) || este == 32) {

                } else {
                    valido = false;
                    ok.setAttribute("Error", "El nombre contiene caracteres invalidos");

                }
            }
            String s = request.getParameter("sexo");
            char c = s.charAt(0);
            datosalumno[1] = c;
            
            try {
                Calendar o = Calendar.getInstance();
                int anioactual = o.get(Calendar.YEAR);
                int año = Integer.parseInt(request.getParameter("edad").substring(0, 4)
                );
                int mesi = Integer.parseInt(request.getParameter("edad").substring(5, 7));
                int dias = Integer.parseInt(request.getParameter("edad").substring(8, 10));
                System.out.println(dias + mesi + año);
                if (mesi < 0 || mesi > 12) {

                    valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                }
                switch (mesi) {
                    case 1:
                        if (dias < 0 || dias > 31) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");

                        }
                        break;
                    case 2:
                        if (dias < 0 || dias > 28) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");

                        }
                        break;
                    case 3:
                        if (dias < 0 || dias > 31) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                        }
                        break;
                    case 4:
                        if (dias < 0 || dias > 30) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                        }
                        break;
                    case 5:
                        if (dias < 0 || dias > 31) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                        }
                        break;
                    case 6:
                        if (dias < 0 || dias > 30) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                        }
                        break;
                    case 7:
                        if (dias < 0 || dias > 31) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                        }
                        break;
                    case 8:
                        if (dias < 0 || dias > 31) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                        }
                        break;
                    case 9:
                        if (dias < 0 || dias > 30) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                        }
                        break;
                    case 10:
                        if (dias < 0 || dias > 31) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                        }
                        break;
                    case 11:
                        if (dias < 0 || dias > 30) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                        }
                        break;
                    case 12:
                        if (dias < 0 || dias > 31) {
                            valido = false;ok.setAttribute("Error", "La fecha que pusiste no es valida ");
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
            
            datosalumno[3] = clv;
            datosalumno[4] = 1;
            datosalumno[5] = request.getParameter("apellidom");
            a = (String) datosalumno[5];
            if (a.length() > 30) {
                valido = false;
                ok.setAttribute("Error", "El apellido materno contiene caracteres invalidos ");
            }
            b = a.toCharArray();
            for (int d = 0; d < b.length; d++) {
                int este = b[d];
                if ((este >= 97 && este <= 122) || (este >= 48 && este <= 57) || (este >= 65 && este <= 90) || este == 32) {
                } else {
                    valido = false;
                    ok.setAttribute("Error", "El apellido materno contiene caracteres invalidos ");
                }
            }
            datosalumno[6] = request.getParameter("apellidop");
            if (a.length() > 30) {
                valido = false;
                ok.setAttribute("Error", "El apellido paterno contiene caracteres invalidos ");
            }
            a = (String) datosalumno[6];
            b = a.toCharArray();
            for (int d = 0; d < b.length; d++) {
                int este = b[d];
                if ((este >= 97 && este <= 122) || (este >= 48 && este <= 57) || (este >= 65 && este <= 90) || este == 32) {

                } else {
                    valido = false;
                    ok.setAttribute("Error", "El apellido paterno contiene caracteres invalidos ");

                }
            }
            String valores = "(nombre,sexo,edad,clvdoc,tipo,apellidom,apellidop)";
            System.out.println(valido + "   -   "+ valido2);
            if (valido && valido2) {
                if (objConn.verificar(usuario)) {

                    objConn.insertardatos(datosalumno, 1);

                } else {
                    valido = false;
                    ok.setAttribute("Error", "El usuario ya existe ");
                }
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

            Object[] datosalumno1 = new Object[3];

            try {
                datosalumno1[0] = request.getParameter("boleta");
                a = (String) datosalumno1[0];
                b = a.toCharArray();
                for (int d = 0; d < b.length; d++) {
                    int este = b[d];
                    if ((este >= 48 && este <= 57)) {

                    } else {
                        valido = false;
                        ok.setAttribute("Error", "La boleta contiene caracteres invalidos ");

                    }
                }
            } catch (Exception e) {
                valido = false;
                ok.setAttribute("Error", "La boleta contiene caracteres invalidos ");
            }

            String s2 = request.getParameter("sem");
            char c2 = s2.charAt(0);
            datosalumno1[1] = c2;
            datosalumno1[2] = g;
            //System.out.println("calveeeeee:::::::::"+g);

            String valores2 = "(boleta,semestre,clvpac)";
            objConn.open();
            if (valido && valido2) {

                System.out.println("pliiiiiis");
                objConn.insertardatos(datosalumno1, 2);

                objConn.close();

                response.sendRedirect("Registrar.jsp");

            } else {
                ok.setAttribute("Error", "Error al registrar el paciente");
                response.sendRedirect("error.jsp");
            }
            // response.sendRedirect("Mensaje.jsp?id="+id+"#");

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
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchPaddingException ex) {
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Alum.class.getName()).log(Level.SEVERE, null, ex);
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
