package proceso;

import java.io.IOException;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class verificarusuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //var con = new var();

//        con.setCve_usuario(Integer.parseInt(request.getParameter("cve_usuario")));
        try {
            String user = request.getParameter("usuario");
            char[] a = user.toCharArray();
            boolean valido = true;
            usuario u = null;
            for (int d = 0; d < a.length; d++) {
                int este = a[d];
                if ((este >= 97 && este <= 122) || (este >= 48 && este <= 57) || (este >= 65 && este <= 90)) {

                } else {
                    valido = false;

                }
            }
            String clave = request.getParameter("password");
            char[] b = clave.toCharArray();
            for (int d = 0; d < b.length; d++) {
                int este = b[d];
                if ((este >= 97 && este <= 122) || (este >= 48 && este <= 57) || (este >= 65 && este <= 90)) {

                } else {
                    valido = false;

                }
            }

            if (valido) {

                u = new usuario();
                try {
                    u.pad();
                } catch (Exception e) {
                    System.out.println("Paddin");
                    System.err.println(e.getClass());
                    System.err.println(e.getLocalizedMessage());
                    System.err.println(e.getCause());
                }

                try {

                    u = u.verificarUsuario(user, clave);
                    AES j = new AES();

                } catch (Exception e) {
                    System.out.println(e.getCause());
                    System.out.println(e.getMessage());
                    response.sendRedirect("error.jsp");
                }
            }

            if (u != null) {

                System.out.println("el privilegio es" + u.getClvdoc());
                //El usuario existe en la base de datos y clave correcta
                //Creamos la sesion

                HttpSession sesionOk = request.getSession(true);
                sesionOk.setAttribute("usuario", user);
                sesionOk.setAttribute("algo", u);

                //  byte[]   bytesEncoded = Base64.encodeBase64(doc.getBytes());
                //encoding part
                //String encoded_id=new String(bytesEncoded);
                //    if(u.getUser().equals("simi")){
                //El usuario tiene el privilegio de cliente
                response.sendRedirect("menu.jsp");

                //El usuario tiene el privilegio de empleado de la empresa
                //  response.sendRedirect("index.html");
            } else {

                //El usuario no existe o clave incorrecta
                response.sendRedirect("error.jsp");

            }
        } catch (Exception e) {
            response.sendRedirect("error.jsp");

            System.out.println(e.getLocalizedMessage());
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
