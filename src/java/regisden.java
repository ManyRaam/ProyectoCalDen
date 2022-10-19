/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import proceso.Data;
import proceso.Fecha;
import proceso.var;

/**
 *
 * @author CECyT9
 */
public class regisden extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession ok = request.getSession();
        try {
            boolean valido = true;
            String nombre = request.getParameter("nombre");
            String apellidopa = request.getParameter("ap");
            String apellidoma = request.getParameter("am");
            String fecha = request.getParameter("edad");
            String usuario = request.getParameter("usua");
            String contra = request.getParameter("contra");
            String sexo = request.getParameter("sex");
            String correo = "a";
      
            String todo = "";

          
           
            int edad = 0;
            todo += nombre + apellidopa + apellidoma;
            char[] a = todo.toCharArray();

            for (int d = 0; d < a.length; d++) {
                int este = a[d];
                if ((este >= 97 && este <= 122) || (este >= 48 && este <= 57) || (este >= 65 && este <= 90)) {

                } else {
                    valido = false;
                    ok.setAttribute("Error", "El nombre que pusiste no es valido ");
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

            if (!(valido)) {
                response.sendRedirect("error.jsp");

            }
            var con = new var();
            Data objConn = new Data();
            objConn.setDbname("dentista");
            objConn.setDriver("com.mysql.jdbc.Driver");
            objConn.setUser("root");
            objConn.setPassword(con.getContraseña());
            objConn.setUrl("jdbc:mysql://localhost/dentista");
            objConn.open();
            objConn.InsertDent(nombre, apellidopa, apellidoma, edad, correo, usuario, contra, sexo);
            objConn.close();
            response.sendRedirect("inicio.html");
        } catch (Exception e) {
            ok.setAttribute("Error", "ese usuario ya existe");
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
