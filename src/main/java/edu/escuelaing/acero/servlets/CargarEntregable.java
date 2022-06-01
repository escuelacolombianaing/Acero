/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.escuelaing.acero.servlets;

import edu.escuelaing.acero.daoAPI.EntregableDao;
import edu.escuelaing.acero.domainClasses.Entregable;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author javier.tambo
 */
public class CargarEntregable extends HttpServlet {

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
            out.println("<title>Servlet CargarEntregable</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CargarEntregable at " + request.getContextPath() + "</h1>");
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
        String linea = "0";
        try {
            String codigoEntre = request.getParameter("codigoEntre");
            String id_parametro = request.getParameter("id_parametro");
            String id_equipo = request.getParameter("id_equipo");
            String id_reto = request.getParameter("id_reto");
            String nombre_entr = request.getParameter("nombre_entr").replace(".", "").replace("á", "a").replace("é", "e").replace("í", "i").replace("ó", "o").replace("ú", "u").replace("Á", "A").replace("É", "E").replace("Í", "I").replace("Ó", "O").replace("Ú", "U").replace("ñ", "n").replace("Ñ", "N");
            nombre_entr=nombre_entr+codigoEntre+id_reto+id_equipo;
            String descripcion = request.getParameter("descripcion");
            String retroalimentacion = request.getParameter("retroalimentacion");
            int id_entregable = Integer.parseInt(request.getParameter("id_entregable"));
            Part filePart = request.getPart("archivo" + id_reto); // Obtiene el archivo
            if (filePart == null) {
                response.sendRedirect("PantallaConsultaEquiposEstudiante?respuesta=3");
            }
            String fileName = getSubmittedFileName(filePart);

            String[] parts = fileName.split("\\.");
            String ext = "";
            ext = parts[parts.length - 1];
            //String path = "C:/Sun/AppServer/config/Acero/Entregables/";
            String path = "/usr/local/SUN/2/glassfish/domains/domain1/docroot/Acero/Entregables/" ;
            path = path + id_reto + "/" + id_equipo;
            File uploads = new File(path); //Carpeta donde se guardan los archivos
            /*if(!uploads.exists()){
              path = "C:/Sun/AppServer/config/Acero/Entregables/";
            }*/
            uploads.mkdirs(); //Crea los directorios necesarios
            File file = new File(uploads, nombre_entr + "." + ext); //Evita que hayan dos archivos con el mismo nombre
            file.deleteOnExit();
            EntregableDao entregableDao = new EntregableDao();
            Entregable entregable = new Entregable();
            entregable.setDescripcion(descripcion);
            entregable.setNombre(nombre_entr + "." + ext);
            entregable.setId_equipo(Long.parseLong(id_equipo));
            entregable.setId_reto(Long.parseLong(id_reto));
            entregable.setTipo_entregable(id_parametro);
            entregable.setRetroalimentacion(retroalimentacion);
            int respuesta = 0;
            if (id_entregable == 0) {
                respuesta = entregableDao.guardar(entregable).intValue();
            } else {
                entregable.setId_entregable(Long.parseLong(request.getParameter("id_entregable")));
                entregableDao.actualizar(entregable);
                respuesta = 1;
            }
            if (respuesta == 0) {
                response.sendRedirect("PantallaConsultaEquiposEstudiante?respuesta=2");
            }
            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                response.sendRedirect("PantallaConsultaEquiposEstudiante?respuesta=1");
            }
        } catch (Exception e) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CargarEntregable</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CargarEntregable at " + e.getMessage() + "----------" + e.getLocalizedMessage() + "----------" + e.getCause() + "----------" + linea + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

    private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }

}
