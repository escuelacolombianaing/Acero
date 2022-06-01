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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author javier.tambo
 */
public class RegistroTutor extends HttpServlet {

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
            out.println("<title>Servlet RegistroTutor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroTutor at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           String id_nacional = request.getParameter("documento").trim();
        String tipo_id = request.getParameter("tipo_id").trim();
        String nombre = request.getParameter("nombre").trim();
        String apellido = request.getParameter("apellido").trim();
        String correo_electronico = request.getParameter("email").trim();
        String password_retos = request.getParameter("password").trim();
        String telefono = request.getParameter("tel").trim();
        String id_usuario = request.getParameter("id_estudiante");
        Long id_usu = null;
        if(id_usuario!=null){
            id_usuario=id_usuario.trim();
            id_usu= Long.parseLong(id_usuario);
        }
        
        ServiciosUsuarios servUsuarios=new ServiciosUsuariosJDBC();
        
        Usuario nuevo_usuario = new Usuario( id_usu, id_nacional, nombre, apellido, correo_electronico, password_retos, "TUUN", new Long(-1), tipo_id, telefono, "APRO");
        String destino = "";
        Long id_definitivo;
        try {
            id_definitivo = servUsuarios.registroUsuario(nuevo_usuario);
        } catch (Exception ex) {
            Logger.getLogger(RegistroTutor.class.getName()).log(Level.SEVERE, null, ex);
            id_definitivo = new Long(0);
        }
        
        
        if(id_definitivo>0){
            destino="PantallaInicioSesion?respuesta=1";
        }else{
            destino="PantallaInicioSesion?respuesta=0";
        }
        response.sendRedirect(destino);
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
