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
import java.util.Calendar;
import java.util.List;
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
 * @author CECyT9
 */
public class regisalumn extends HttpServlet {

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
        
        HttpSession ok = request.getSession();
        
        try {
            String nombre = request.getParameter("nombre");
            String apellidopa = request.getParameter("ap");
            String apellidoma = request.getParameter("am");
            String fecha = request.getParameter("edad");
            String usuario = request.getParameter("usua");
            String contra = request.getParameter("contra");
            String tipo = request.getParameter("tipo");
            String todo = "";
            String boleta = "";
            String area = "";
            String semestre = " ";
            int edad = 0;
            int clvdoc = 0;
            
            boolean valido1 = true;
            
            if (tipo.equals("al")) {
                boleta = request.getParameter("boleta");
                semestre = request.getParameter("semestre");
                
                String o = boleta;
                if(boleta.length()!=10){
                    valido1 = false;
                    System.out.println(boleta.length());
                    ok.setAttribute("Error", "la boleta es invalida");
                }
                try{ 
                    int i = Integer.parseInt(boleta);
                }catch(Exception e){
                    System.out.println("La boleta insertada no es un numero");
                    valido1 = false;
                    ok.setAttribute("Error", "la boleta es invalida");
                }
                
                
                
            } else if (tipo.equals("do") || tipo.equals("ad")) {
                area = request.getParameter("area");
                String perm= "qwertyuiopasdfghjklmnbvcxzQWERTYUIOPLKJHGFDSAZXCVBNM";
                int l1 = area.length();
                int l2 = 0;
                for(int i=0;i<area.length();i++){
                    for(int k=0; k<perm.length();k++){
                        if(area.charAt(i)==perm.charAt(k)){
                            l2++;
                        }
                    }
                }
                if(l1!=l2){
                    valido1 = false;
                    System.out.println("El area contiene caracteres invalidos");
                }
            }
            todo += nombre + apellidopa + apellidoma;
            char[] a = todo.toCharArray();
            boolean valido = true;
            for (int d = 0; d < a.length; d++) {
                int este = a[d];
                if ((este >= 97 && este <= 122) || (este >= 48 && este <= 57) || (este >= 65 && este <= 90)) {

                } else {
                    valido = false;
                    ok.setAttribute("Error", "El nombre o apellidos contiene caracteres invalidos");

                }
            }
            try {
                Calendar o = Calendar.getInstance();
                int diaactual = o.get(Calendar.DATE);
                int anioactual = o.get(Calendar.YEAR);
                int mesactual = o.get(Calendar.MONTH);
                int año = Integer.parseInt(request.getParameter("edad").substring(0, 4)
                );
                int mesi = Integer.parseInt(request.getParameter("edad").substring(5, 7));
                int dias = Integer.parseInt(request.getParameter("edad").substring(8, 10));
                if (mesi < 0 || mesi > 12) {

                    valido = false;
                        ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                }
                switch (mesi) {
                    case 1:
                        if (dias < 0 || dias > 31) {
                            valido = false;
                            ok.setAttribute("Error", "La fecha que pusiste no es valida ");
                        }
                        break;
                    case 2:
                        if (dias < 0 || dias > 28) {
                            valido = false;
                            ok.setAttribute("Error", "La fecha que pusiste no es valida ");
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
                
            }
            System.out.println(valido);

            AES j = new AES();
            try {
                clvdoc = Integer.parseInt(j.decencriptar(request.getParameter("doctor").replace(' ', '+')));
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(regisalumn.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NoSuchPaddingException ex) {
                Logger.getLogger(regisalumn.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvalidKeyException ex) {
                Logger.getLogger(regisalumn.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalBlockSizeException ex) {
                Logger.getLogger(regisalumn.class.getName()).log(Level.SEVERE, null, ex);
            } catch (BadPaddingException ex) {
                Logger.getLogger(regisalumn.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (!(valido) || !(valido1)) {
                response.sendRedirect("error.jsp");
            } else {
                usuario u = new usuario();
                try {
                    u.pad();
                } catch (Exception e) {

                }

                String s = request.getParameter("sex");
                char c = s.charAt(0);
                Data objConn = new Data();
                var con = new var();
                objConn.setDbname("dentista");
                objConn.setDriver("com.mysql.jdbc.Driver");
                objConn.setUser("root");
                objConn.setPassword(con.getContraseña());
                objConn.setUrl("jdbc:mysql://localhost/dentista");
                objConn.open();
                if (objConn.verificar(usuario)) {;
                    if (tipo.equals("al")) {
                        Object[] datosalumno = new Object[9];

                        datosalumno[1] = c;
                        datosalumno[2] = fecha;
                        datosalumno[3] = clvdoc;
                        datosalumno[0] = nombre;
                        datosalumno[5] = apellidopa;
                        datosalumno[6] = apellidoma;
                        datosalumno[4] = 1;
                        datosalumno[7] = usuario;
                        datosalumno[8] = contra;
                        objConn.insertardatos(datosalumno, 1);
                        Object[] datosalumno1 = new Object[3];
                        datosalumno1[0] = boleta;
                        datosalumno1[1] = Integer.parseInt(semestre);
                        List<var> ultimo = null;
                        ultimo = objConn.last();
                        if (ultimo != null) {
                            for (var objvarr : ultimo) {
                                int C = objvarr.getEndclvpac();

                                con.setEC(C);

                            }
                        }

                        int g = con.getEC();
                        datosalumno1[2] = g;
                        objConn.insertardatos(datosalumno1, 2);

                    }
                    if (tipo.equals("ex")) {
                        Object[] datosalumno = new Object[9];
                        datosalumno[0] = nombre;
                        datosalumno[1] = fecha;
                        datosalumno[2] = c;
                        datosalumno[3] = clvdoc;
                        datosalumno[4] = 2;
                        datosalumno[5] = apellidoma;
                        datosalumno[6] = apellidopa;
                        datosalumno[7] = usuario;
                        datosalumno[8] = contra;
                        objConn.insertardatos(datosalumno, 13);

                    }
                    if (tipo.equals("ad")) {
                        Object[] datosalumno = new Object[8];
                        datosalumno[0] = nombre;
                        datosalumno[1] = fecha;
                        datosalumno[2] = c;
                        datosalumno[3] = clvdoc;
                        datosalumno[4] = apellidoma;
                        datosalumno[5] = apellidopa;
                        datosalumno[6] = usuario;
                        datosalumno[7] = contra;
                        objConn.insertardatos(datosalumno, 12);
                        List<var> ultimo = objConn.last();
                        if (ultimo != null) {
                            for (var objvarr : ultimo) {
                                int C = objvarr.getEndclvpac();

                                con.setEC(C);

                            }
                        }

                        int g = con.getEC();

                        Object[] datosalumno1 = new Object[2];

                        datosalumno1[0] = area;
                        datosalumno1[1] = g;
                        objConn.insertardatos(datosalumno1, 3);
                    }
                    if (tipo.equals("do")) {
                        Object[] datosalumno = new Object[8];
                        datosalumno[0] = nombre;
                        datosalumno[1] = fecha;
                        datosalumno[2] = c;
                        datosalumno[3] = clvdoc;
                        datosalumno[4] = apellidoma;
                        datosalumno[5] = apellidopa;
                        datosalumno[6] = usuario;
                        datosalumno[7] = contra;
                        objConn.insertardatos(datosalumno, 12);
                        List<var> ultimo = objConn.last();
                        if (ultimo != null) {
                            for (var objvarr : ultimo) {
                                int C = objvarr.getEndclvpac();

                                con.setEC(C);

                            }
                        }

                        int g = con.getEC();

                        Object[] datosalumno1 = new Object[2];

                        datosalumno1[0] = area;
                        datosalumno1[1] = g;
                        objConn.insertardatos(datosalumno1, 20);

                    }

                    objConn.close();
                    response.sendRedirect("loginnuevo.jsp");

                } else {
                    ok.setAttribute("Error", "El usuario ya existe");
                    response.sendRedirect("error.jsp");
                }
            }
        } catch (Exception e) {
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
