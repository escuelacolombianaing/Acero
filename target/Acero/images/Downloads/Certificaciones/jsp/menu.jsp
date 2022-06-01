<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%
String contex = "Biomedica";
// Certificado est = new Certificado();
//Vector menu = est.getMenu(contex), tmpm;
 String doc = session.getAttribute("nomusr").toString(); 
 //out.println("doc:" + doc);
%>
<div id="menu8">
<ul>
<!-- CSS Tabs -->
    <li><a href="GenDatos?param=1"><b>Inf. General</b></a></li>
    <li><a href="GeneraCertificado?param=1"><b>Preg. Const. Matric. Int Horaria</b></a></li>
    <li><a href="CertificFormaliz?param=1"><b>Preg. Const. Formalización Matric.</b></a></li>
    <li><a href="TermEstudios?param=1"><b>Preg. Const. Terminación Estudios.</b></a></li>
    <li><a href="GradoPreg?param=1"><b>Preg. Const. Grado Pregrado.</b></a></li>
    <!--<li><a href="Beneficio?param=1&tc=4"><b>Beca Julio Garavito.</b></a></li>-->
    <li><a href="EstudPosg?param=1&tc=1"><b>Posg. Const. Estudios.</b></a></li>
    <li><a href="EstudPosg?param=1&tc=2"><b>Posg. Grado. Posgrado.</b></a></li>
      <!--<li><a href="ContProg?param=1&tc=2"><b>CONTENIDOS PROGRAMATICOS.</b></a></li>-->
    <!--<li><a href="EstudPosg?param=1&tc=3"><b>Posg. Formalización.</b></a></li>-->
    <li><a href="PortalCertific"><b>Buscar Datos</b></a></li>
    <li><a href="LogOut"><b>Salir</b>
    </a></li>
</ul>
</div>