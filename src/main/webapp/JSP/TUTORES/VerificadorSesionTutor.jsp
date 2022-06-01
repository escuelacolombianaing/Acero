<%-- 
    Document   : VerificadorSesion
    Created on : 11-dic-2019, 8:42:57
    Author     : andres.rojas
--%>

<%@page import="edu.escuelaing.acero.domainClasses.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario =(Usuario) session.getAttribute("usuario");
    if(usuario==null||usuario.getId_nacional()==null||usuario.getId_nacional().equals("")){
        %>
        <jsp:forward page="PantallaInicioSesion?respuesta=4"/>
        <%
    }else if(!usuario.getTipo_usuario().equals("TUUN")){
        %>
        <jsp:forward page="PantallaInicioSesion?respuesta=6"/>
        <%
    }
%>