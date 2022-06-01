/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servlets;

import edu.escuelaing.acero.domainClasses.Empresa;
import edu.escuelaing.acero.domainClasses.Usuario;
import edu.escuelaing.acero.servicesFacade.ServiciosEmpresas;
import edu.escuelaing.acero.servicesFacade.ServiciosEmpresasJDBC;
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
 * @author andres.rojas
 */
public class RegistroEmpresa extends HttpServlet {

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
            out.println("<title>Servlet Empresa</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Empresa at " + request.getContextPath() + "</h1>");
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
        
        ServiciosEmpresas serviciosEmp = new ServiciosEmpresasJDBC();
        ServiciosUsuarios serviciosUsu = new ServiciosUsuariosJDBC();
        //Registro de representante
        String nombre = request.getParameter("nombre").trim();
        String apellido = request.getParameter("apellido").trim();
        String tipo_id = request.getParameter("tipo_id").trim();
        String id_contacto = request.getParameter("id_contacto").trim();
        String tel_contacto = request.getParameter("tel_contacto").trim();
        String email_contacto = request.getParameter("email_contacto").trim();
        String password = request.getParameter("password").trim();
        
        //Registro de empresa
        String id_nacional = request.getParameter("nit").trim();
        String razon_social = request.getParameter("razon_social").trim();
        String direccion = request.getParameter("direccion_empresa").trim();
        String pagina_web = request.getParameter("pagina_web").trim();
        String telefono_empresa = request.getParameter("telefono_empresa").trim();
        String descripcion = request.getParameter("descripcion_empresa").trim();
        
        Usuario nuevoUsuario = new Usuario(null, id_contacto, nombre, apellido, email_contacto, password, "TUEM", new Long(-1), tipo_id, tel_contacto, "PEND");
        Long id_nueva_empresa=new Long(0);
        try {
            Long id_nuevo_usuario = serviciosUsu.registroUsuario(nuevoUsuario);
            
            Empresa nuevaEmpresa = new Empresa(null, id_nacional, razon_social, direccion, pagina_web, telefono_empresa, descripcion, id_nuevo_usuario);
            
            id_nueva_empresa = serviciosEmp.registroEmpresa(nuevaEmpresa);
        } catch (Exception ex) {
            Logger.getLogger(RegistroEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(id_nueva_empresa>0){
            response.sendRedirect("PantallaInicioSesion?tipo_usu="+nuevoUsuario.getTipo_id()+"&respuesta=1");
        }else{
            response.sendRedirect("PantallaInicioSesion?tipo_usu="+nuevoUsuario.getTipo_id()+"&respuesta=0");
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
