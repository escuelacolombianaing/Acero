/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servlets;

import edu.escuelaing.acero.domainClasses.Usuario;
import edu.escuelaing.acero.servicesFacade.ServiciosUsuarios;
import edu.escuelaing.acero.servicesFacade.ServiciosUsuariosJDBC;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author andres.rojas
 */
public class LogIn extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LogIn</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LogIn at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServiciosUsuarios servUsuarios = new ServiciosUsuariosJDBC();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        String rol = request.getParameter("rol");
        HttpSession sesion;
        Boolean usuario_existe = false;
        try {
            List<Usuario> usuarios = servUsuarios.consultarUsuarios();
            String destino = "";
            for (Usuario usuario : usuarios) {
                if (!usuario_existe && email.equals(usuario.getCorreo_electronico()) && password.equals(usuario.getPassword())) {
                    usuario_existe = true;
                    sesion = request.getSession(true);
                    sesion.setAttribute("usuario", usuario);
                    if (usuario.getTipo_usuario().equals(rol)) {
                        switch (usuario.getTipo_usuario()) {
                            case "ADGE":
                                destino = "PantallaPanelControlAdministrador";
                                break;
                            case "TUEM":
                                destino = "PantallaPanelControlEmpresa";
                                break;
                            case "ESIN":
                                destino = "PantallaPanelControlEstudiante";
                                break;
                            case "TUUN":
                                destino = "PantallaPanelControlTutor";
                                break;
                            default:
                                break;
                        }
                    } else {
                        destino = "PantallaInicioSesion?respuesta=6";
                    }

                }
            }
            if (!usuario_existe) {
                destino = "PantallaInicioSesion?respuesta=2";
            }
            response.sendRedirect(destino);

        } catch (Exception ex) {
            Logger.getLogger(LogIn.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("PantallaInicioSesion?respuesta=3");
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
