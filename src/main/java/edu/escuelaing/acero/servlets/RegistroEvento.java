/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servlets;

import edu.escuelaing.acero.domainClasses.Evento;
import edu.escuelaing.acero.domainClasses.Fecha;
import edu.escuelaing.acero.servicesFacade.ServiciosEventos;
import edu.escuelaing.acero.servicesFacade.ServiciosEventosJDBC;
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
public class RegistroEvento extends HttpServlet {

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
            out.println("<title>Servlet RegistroEvento</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroEvento at " + request.getContextPath() + "</h1>");
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
        
        ServiciosEventos servEventos = new ServiciosEventosJDBC();
        
        String descripcion = request.getParameter("descripcion").trim();
        String year = request.getParameter("year").trim();
        String periodo = request.getParameter("periodo").trim();
        String tipo_evento = request.getParameter("tipo_evento").trim();
        String estado_evento = request.getParameter("estado_evento").trim();
        String fecha_apertura = request.getParameter("fecha_apertura").trim();
        String fecha_inicio_clases = request.getParameter("fecha_inicio_clases").trim();
        String fecha_fin_clases = request.getParameter("fecha_fin_clases").trim();
        String id_evento = request.getParameter("id_evento");
        String fecha_ini_entregables = request.getParameter("fecha_ini_entregables");
        String fecha_fin_entregables = request.getParameter("fecha_fin_entregables");
        
        String destino = "";
        
        
        Fecha fecha_ap = new Fecha(null, 1, 4, fecha_apertura, fecha_inicio_clases, "ACTV");
        Fecha fecha_in = new Fecha(null, 5, 22, fecha_inicio_clases, fecha_fin_clases, "ACTV");
        Fecha fecha_fi = new Fecha(null, 22, 22, fecha_fin_clases, fecha_fin_clases, "ACTV");
        
        
        
        Evento nuevo_evento = new Evento(periodo, descripcion, Integer.parseInt(year), tipo_evento, estado_evento, fecha_ap, fecha_in, fecha_fi,fecha_ini_entregables,fecha_fin_entregables);
        Long id_nuevo_evento = new Long(0);
        if(id_evento!=null){
            id_evento=id_evento.trim();
            nuevo_evento.setId_evento(Long.parseLong(id_evento));
            id_nuevo_evento=Long.parseLong(id_evento);
        }else{
            id_evento="0";
        }
        try {
            //Se verifica que no haya mas eventos activos
            List<Evento> todosEventos = servEventos.consultarEventos();
            Boolean existe_evento_activo = false;
            for (Evento todosEvento : todosEventos) {
                if(!todosEvento.getId_evento().equals(Long.parseLong(id_evento))){
                    if(todosEvento.getTipo_evento().equals(tipo_evento)&&todosEvento.getEstado_evento().equals("ABRT")&&nuevo_evento.getEstado_evento().equals("ABRT")){
                        existe_evento_activo=true;
                        destino="PantallaConsultaEventosAdministrador?respuesta=2";
                    }
                }
            }
            if(!existe_evento_activo){
                id_nuevo_evento = servEventos.registroEvento(nuevo_evento);
            }
        } catch (Exception ex) {
            Logger.getLogger(RegistroEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(destino.equals("")){
            if(id_nuevo_evento>0){
                destino="PantallaConsultaEventosAdministrador?respuesta=1";
            }else{
                destino="PantallaConsultaEventosAdministrador?respuesta=0";
            }
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
