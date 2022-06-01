/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servlets;

import edu.escuelaing.acero.domainClasses.Entregable;
import edu.escuelaing.acero.domainClasses.Equipo;
import edu.escuelaing.acero.domainClasses.Evento;
import edu.escuelaing.acero.domainClasses.Fecha;
import edu.escuelaing.acero.domainClasses.Parametro;
import edu.escuelaing.acero.domainClasses.Reto;
import edu.escuelaing.acero.domainClasses.Usuario;
import edu.escuelaing.acero.servicesFacade.ServiciosEntregables;
import edu.escuelaing.acero.servicesFacade.ServiciosEntregablesJDBC;
import edu.escuelaing.acero.servicesFacade.ServiciosEquipos;
import edu.escuelaing.acero.servicesFacade.ServiciosEquiposJDBC;
import edu.escuelaing.acero.servicesFacade.ServiciosEventos;
import edu.escuelaing.acero.servicesFacade.ServiciosEventosJDBC;
import edu.escuelaing.acero.servicesFacade.ServiciosParametros;
import edu.escuelaing.acero.servicesFacade.ServiciosParametrosJDBC;
import edu.escuelaing.acero.servicesFacade.ServiciosRetos;
import edu.escuelaing.acero.servicesFacade.ServiciosRetosJDBC;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
public class PostulaEquipoReto extends HttpServlet {

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
            out.println("<title>Servlet PostulaEquipoReto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostulaEquipoReto at " + request.getContextPath() + "</h1>");
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
        Long id_reto = Long.parseLong(request.getParameter("id_reto"));
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        Long id_equipo = usuario.getId_equipo();
        ServiciosEquipos servEquipos = new ServiciosEquiposJDBC();
        ServiciosEventos servEventos = new ServiciosEventosJDBC();
        ServiciosRetos servRetos = new ServiciosRetosJDBC();
        ServiciosEntregables servEntregables = new ServiciosEntregablesJDBC();
        ServiciosParametros servParametros = new ServiciosParametrosJDBC();
        List<Parametro> lisEntregables;
        Equipo equipo= new Equipo();
        Reto reto = new Reto();
        Evento evento=new Evento();
        Long id_equipo_act = new Long(0);
        try {
            equipo = servEquipos.consultarEquipoId(id_equipo);
            reto = servRetos.consultaRetoId(id_reto);
            evento=servEventos.consultaEventoId(reto.getId_evento());
            List<Reto> retos_desarrolla = new ArrayList<Reto>();
            retos_desarrolla.add(reto);
            equipo.setRetos_desarrolla(retos_desarrolla);
            id_equipo_act = servEquipos.ActualizarEquipo(equipo);
        } catch (Exception ex) {
            Logger.getLogger(PostulaEquipoReto.class.getName()).log(Level.SEVERE, null, ex);
            id_equipo_act=new Long(0);
        }
        response.sendRedirect("PantallaConsultaEquiposEstudiante");
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
