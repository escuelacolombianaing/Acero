/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servlets;

import edu.escuelaing.acero.domainClasses.Equipo;
import edu.escuelaing.acero.domainClasses.Reto;
import edu.escuelaing.acero.servicesFacade.ServiciosEquiposJDBC;
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
 * @author javier.tambo
 */
public class AsignarTutor extends HttpServlet {

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
            out.println("<title>Servlet AsignarTutor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AsignarTutor at " + request.getContextPath() + "</h1>");
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
        
         Long id_equipo = Long.parseLong(request.getParameter("id_equipo"));
         Long id_reto = Long.parseLong(request.getParameter("id_reto"));
          String id_nacional_tutor = request.getParameter("id_nacional_tutor");
          List<Reto> reto = new ArrayList<Reto>();
          reto.add(new Reto(id_reto, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_reto, id_reto, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor));
          Reto infReto=new Reto(id_reto, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_reto, id_reto, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor, id_nacional_tutor);
        ServiciosEquiposJDBC servEquipo= new ServiciosEquiposJDBC();
        Equipo infEquipo= new Equipo();
          infEquipo= new Equipo(id_equipo, id_nacional_tutor, Integer.MAX_VALUE, id_nacional_tutor, reto);
        try {
            boolean respuesta=servEquipo.AsignarTutor(infEquipo);
            response.getWriter().write(""+respuesta);
        } catch (Exception ex) {
            response.getWriter().write("false");
            Logger.getLogger(AsignarTutor.class.getName()).log(Level.SEVERE, null, ex);
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
