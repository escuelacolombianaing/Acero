/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servlets;

import edu.escuelaing.acero.domainClasses.Empresa;
import edu.escuelaing.acero.domainClasses.Evento;
import edu.escuelaing.acero.domainClasses.Reto;
import edu.escuelaing.acero.domainClasses.Usuario;
import edu.escuelaing.acero.servicesFacade.ServiciosEmpresas;
import edu.escuelaing.acero.servicesFacade.ServiciosEmpresasJDBC;
import edu.escuelaing.acero.servicesFacade.ServiciosEventos;
import edu.escuelaing.acero.servicesFacade.ServiciosEventosJDBC;
import edu.escuelaing.acero.servicesFacade.ServiciosRetos;
import edu.escuelaing.acero.servicesFacade.ServiciosRetosJDBC;
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
public class RegistroReto extends HttpServlet {

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
            out.println("<title>Servlet RegistroReto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroReto at " + request.getContextPath() + "</h1>");
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
        String id_evento = request.getParameter("evento").trim();
        String nombre = request.getParameter("nombre").trim();
        String fecha = request.getParameter("fecha").trim();
        String nombre_contacto = request.getParameter("nombre_contacto").trim();
        String correo_contacto = request.getParameter("correo_contacto").trim();
        String nombre_aprobador = request.getParameter("nombre_aprobador").trim();
        String correo_aprobador = request.getParameter("correo_aprobador").trim();
        String telefono_contacto = request.getParameter("telefono_contacto").trim();
        String horario_disponible = request.getParameter("horario_disponible").trim();
        String problema_especifico = request.getParameter("problema_especifico").trim();
        String descripcion = request.getParameter("descripcion").trim();
        String atributos_solucion = request.getParameter("atributos_solucion").trim();
        String modo_evaluacion = request.getParameter("modo_evaluacion").trim();
        String posible_solucion = request.getParameter("posible_solucion").trim();
        String estado = request.getParameter("estado").trim();
        String id_reto = request.getParameter("id_reto");
        
        
        String destino="";
        ServiciosEventos servEventos = new ServiciosEventosJDBC();
        ServiciosEmpresas servEmpresas = new ServiciosEmpresasJDBC();
        ServiciosRetos servRetos = new ServiciosRetosJDBC();
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        Evento evento_actual = new Evento();
        Empresa empresa_actual = new Empresa();
        try {
           /* List<Evento> eventos = servEventos.consultarEventos();
            for (Evento evento : eventos) {
                if(evento.getEstado_evento().equals("ABRT")&&evento.getTipo_evento().equals("EVRE")){
                    evento_actual=evento;
                }
            }*/
            evento_actual=servEventos.consultaEventoId(Long.parseLong(id_evento));
            List<Empresa> empresas = servEmpresas.consultarEmpresas();
            for (Empresa empresa : empresas) {
                if(usuario.getId_usuario().equals(empresa.getId_representante())){
                    empresa_actual=empresa;
                }
            }
            if(evento_actual.getId_evento()==null&& destino.equals("")){
                destino="PantallaConsultaRetosEmpresa?respuesta=2";
            }else{
                Reto nuevo_reto = new Reto(null, nombre, descripcion, estado, evento_actual.getId_evento(), empresa_actual.getId_empresa(), fecha, nombre_contacto, correo_contacto, nombre_aprobador, correo_aprobador, telefono_contacto, horario_disponible, problema_especifico, atributos_solucion, modo_evaluacion, posible_solucion);
                if(id_reto==null){
                    id_reto="";
                }else{
                    id_reto=id_reto.trim();
                    nuevo_reto.setId_reto(Long.parseLong(id_reto));
                    
                }
                servRetos.registroReto(nuevo_reto);
                destino="PantallaConsultaRetosEmpresa?respuesta=1";
            }
        } catch (Exception ex) {
            Logger.getLogger(RegistroReto.class.getName()).log(Level.SEVERE, null, ex);
            destino="PantallaConsultaRetosEmpresa?respuesta=0";
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
