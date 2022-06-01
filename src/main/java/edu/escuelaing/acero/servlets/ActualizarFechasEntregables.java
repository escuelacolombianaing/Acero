/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servlets;

import edu.escuelaing.acero.domainClasses.Fecha;
import edu.escuelaing.acero.domainClasses.Parametro;
import edu.escuelaing.acero.servicesFacade.ServiciosParametros;
import edu.escuelaing.acero.servicesFacade.ServiciosParametrosJDBC;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ActualizarFechasEntregables extends HttpServlet {

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
            out.println("<title>Servlet ActualizarFechasEntregables</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActualizarFechasEntregables at " + request.getContextPath() + "</h1>");
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
        Integer respuesta = 0;
        ServiciosParametros param_servicios = new ServiciosParametrosJDBC();
        try {
            List<Parametro> tipo_entregables = param_servicios.getParametrosTipo("ENTR");
            for (Parametro tipo_entregable : tipo_entregables) {
                Integer numero_semana_inicio = Integer.parseInt((String) request.getParameter("numero_semana_inicio_"+tipo_entregable.getId_parametro()));
                Integer numero_semana_fin = Integer.parseInt((String) request.getParameter("numero_semana_fin_"+tipo_entregable.getId_parametro()));
                String fecha_inicio = request.getParameter("fecha_inicio_"+tipo_entregable.getId_parametro());
                String fecha_limite = request.getParameter("fecha_limite_"+tipo_entregable.getId_parametro());
                String estado = request.getParameter("estado_"+tipo_entregable.getId_parametro());
                Parametro act_param = new Parametro(tipo_entregable.getId_parametro(), tipo_entregable.getTipo_parametro(), tipo_entregable.getDesc_tipo_parametro(), tipo_entregable.getValor_parametro(), tipo_entregable.getDes_valor_parametro(), tipo_entregable.getActivo(), new Fecha(tipo_entregable.getFecha_control().getId_fecha(), numero_semana_inicio, numero_semana_fin, fecha_inicio, fecha_limite, estado));
                
            }
        } catch (Exception ex) {
            Logger.getLogger(ActualizarFechasEntregables.class.getName()).log(Level.SEVERE, null, ex);
            respuesta = 0;
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
