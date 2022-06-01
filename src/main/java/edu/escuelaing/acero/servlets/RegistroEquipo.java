/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servlets;

import edu.escuelaing.acero.domainClasses.Equipo;
import edu.escuelaing.acero.domainClasses.Reto;
import edu.escuelaing.acero.domainClasses.Usuario;
import edu.escuelaing.acero.servicesFacade.ServiciosEquipos;
import edu.escuelaing.acero.servicesFacade.ServiciosEquiposJDBC;
import edu.escuelaing.acero.servicesFacade.ServiciosUsuarios;
import edu.escuelaing.acero.servicesFacade.ServiciosUsuariosJDBC;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andres.rojas
 */
public class RegistroEquipo extends HttpServlet {

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
            out.println("<title>Servlet RegistroEquipo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroEquipo at " + request.getContextPath() + "</h1>");
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
        String nombre_equipo = request.getParameter("nombre_equipo").trim();
        Integer max_integrantes = Integer.parseInt(request.getParameter("max_integrantes").trim());
        
        Equipo nuevo_equipo = new Equipo(null, nombre_equipo, max_integrantes,"" ,new ArrayList<Reto>());
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        ServiciosEquipos servEquipos = new ServiciosEquiposJDBC();
        ServiciosUsuarios servUsuarios = new ServiciosUsuariosJDBC();
        Long id_equipo = new Long(0);
        try {
            id_equipo = servEquipos.registroEquipo(nuevo_equipo);
            nuevo_equipo.setId_equipo(id_equipo);
            usuario.setId_equipo(id_equipo);
            servUsuarios.agregarAEquipo(usuario, nuevo_equipo);
        } catch (Exception ex) {
            Logger.getLogger(RegistroEquipo.class.getName()).log(Level.SEVERE, null, ex);
        }
        String destino = "";
        if(id_equipo>0){
            destino="PantallaConsultaEquiposEstudiante?respuesta=1";
        }else{
            destino="PantallaConsultaEquiposEstudiante?respuesta=0";
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
