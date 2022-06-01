<%-- 
    Document   : PantallaEdicionFechasEntregablesAdministrador
    Created on : 26-ago-2019, 16:06:48
    Author     : andres.rojas
--%>

<%@page import="edu.escuelaing.acero.domainClasses.Evento"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventos"%>
<%@page import="edu.escuelaing.acero.domainClasses.Parametro"%>
<%@page import="java.util.List"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametrosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametros"%>
<%@ include file="VerificadorSesionAdmin.jsp" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<head>
<meta charset="UTF-8">
<title>RETOS DEL ACERO</title>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="ES" />
<meta name="language" content="spanish" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
<meta name="copyright" content="Copyright (c) 2017" />
<meta name="description" content="Es el evento científico que se realiza semestralmente en la Escuela Colombiana de Ingeniería Julio Garavito, en el cuál se reúnen estudiantes, profesores, investigadores y empresarios con el fin de divulgar los avances y necesidades en los diferentes  ámbitos de integración de la academia, la industria y la sociedad en el horizonte de la Ingeniería Mecánica..." />
<meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito"/>
<link rel="stylesheet" href="css/formularios.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/grid.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
</head>
<%
    
    
    ServiciosParametros param_servicios=new ServiciosParametrosJDBC();
    List<Parametro> tipo_entregables = param_servicios.getParametrosTipo("ENTR");
    List<Parametro> estados_fecha = param_servicios.getParametrosTipo("ESFE");
    
    
%>
<body>
    <header>
        <div class="container">
            <div class="brand">
              <img src="images/retosdelacero.jpg" />
            </div><a href="./" class="fa-phone"></a>
            
        </div>
        <div id="stuck_container" class="stuck_container">
            <div class="container">
                <nav class="nav">
                    <ul data-type="navbar" class="sf-menu">
                      <li><a href="https://www.escuelaing.edu.co/escuela/encuentro-mecanica/index.html">VOLVER AL ENCUENTRO</a>
                      </li>
                      <li><a href="https://www.escuelaing.edu.co/escuela/encuentro-mecanica/retosdel-acero.html#1">¿QUÉ ES?</a>
                      </li>
                      <li><a href="https://www.escuelaing.edu.co/escuela/encuentro-mecanica/retosdel-acero.html#2">PARTICIPAR</a>
                      </li>
                      <li><a href="https://www.escuelaing.edu.co/escuela/encuentro-mecanica/retosdel-acero.html#3">RETOS ANTERIORES</a>
                      </li>
                      <li class="active"><a href="https://tycho.escuelaing.edu.co/Acero-1.0/PantallaInicioSesion">INICIAR SESIÓN</a>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    <section class="registro">
        <form accept-charset="ISO-8859-1" action="LogOut" method="post" id="formLogOut" name="formLogOut">
            <a href="#" onclick="this.parentNode.submit()">
                <button class="btn btn-primary btn-danger pull-right">CERRAR SESION</button>
            </a>
        </form>
        <div class="container fondo-background">
            <div class="col-sm-12 col-md-12 col-lg-12"><h3>Parametrización de Fechas de Entregables<hr></h3></div>
            <div class="row">
                <form accept-charset="ISO-8859-1" action="ActualizarFechasEntregables" method="post" class="espaciado">
                <br>
                <div class="col-sm-12 col-md-10">
                    <table class="table fondoColorTotal">
                        <tbody>
                            <tr>
                                <th scope="row">Nombre del entregable</th>
                                <th scope="row">Número de Semana Inicio</th>
                                <th scope="row">Número de Semana Límite</th>
                                <th scope="row">Fecha Inicio</th>
                                <th scope="row">Fecha Límite</th>
                                <th scope="row">Habilitado</th>
                            </tr>
                            <%
                                for (Parametro tip : tipo_entregables) {
                                    String nombre_entregable= "";
                                    String numero_semana_inicio = "";
                                    String numero_semana_fin = "";
                                    String fecha_inicio="";
                                    String fecha_limite="";
                                    String id_entregable=tip.getId_parametro().toString();
                                    String estado="";
                                    if(tip.getFecha_control()!=null){
                                        nombre_entregable=tip.getDes_valor_parametro();
                                        numero_semana_inicio= tip.getFecha_control().getNumero_semana_inicio().toString();
                                        numero_semana_fin=tip.getFecha_control().getNumero_semana_fin().toString();
                                        fecha_inicio=tip.getFecha_control().getFecha_inicio();
                                        fecha_limite=tip.getFecha_control().getFecha_fin();
                                        estado=tip.getFecha_control().getEstado_fecha();
                                    }
                            %>
                                <tr>
                                    <td scope="row"><%=nombre_entregable%></td>
                                    <td scope="row"><input required="" type="number" min="1" max="22" name="numero_semana_inicio_<%=id_entregable%>" id="numero_semana_inicio_<%=id_entregable%>" value="<%=numero_semana_inicio%>"></td>
                                    <td scope="row"><input required="" type="number" min="1" max="22" name="numero_semana_fin_<%=id_entregable%>" id="numero_semana_fin_<%=id_entregable%>" value="<%=numero_semana_fin%>"></td>
                                    <td scope="row"><input required="" type="date" name="fecha_inicio_<%=id_entregable%>" id="fecha_inicio_<%=id_entregable%>" value="<%=fecha_inicio%>"></td>
                                    <td scope="row"><input required="" type="date" name="fecha_limite_<%=id_entregable%>" id="fecha_limite_<%=id_entregable%>" value="<%=fecha_limite%>"></td>
                                    <td scope="row">
                                        <select class="form-control" id="estado_<%=id_entregable%>" name="estado_<%=id_entregable%>" required="">
                                            <option value="">Seleccione</option>
                                            <%
                                                for (Parametro est_fec : estados_fecha) {
                                                    String valor = est_fec.getValor_parametro();
                                                    String descripcion = est_fec.getDes_valor_parametro();
                                                    if(est_fec.getValor_parametro().equals(estado)){
                                                        %>
                                                        <option value="<%=valor%>" selected=""><%=descripcion%></option>
                                                        <%
                                                    }else{
                                                        %>
                                                        <option value="<%=valor%>"><%=descripcion%></option>
                                                        <%
                                                    }
                                                }
                                            %>
                                        </select>
                                    </td>
                                </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-6 col-md-6">
                    <input  style="width: 300px;" type="submit" class="btn btn-primary center-block" role="button" value="Guardar Cambios">
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                </form>
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <a href="PantallaPanelControlAdministrador">
                <button style="width: 200px;" class="btn btn-primary center-block" type="button">Volver</button>
            </a>
        </div>
    </section>
    <footer>
        <section class="well3"></section>
        <section>
            <div class="container">
                <div class="brand">
                <a rel="nofollow" href="http://www.escuelaing.edu.co" target="_blank"><strong>Escuela Colombiana de Ingeniería Julio Garavito</strong></a><br>
                <br>
                AK.45 No.205-59 (Autopista Norte)<br>
                Contact center: +57(1) 668 3622 Exts: 120, 312<br>
                Línea Nacional Gratuita: 01800 011 2668<br>
                <a rel="nofollow" href="mailto://encuentro.mecanica@escuelaing.edu.co">encuentro.mecanica@escuelaing.edu.co</a><br>
                Bogotá - Colombia<br>
                <br>
                </div>
                <p><a href="https://www.google.com/maps/place/Escuela+Colombiana+de+Ingenier%C3%ADa+Julio+Garavito/@4.782676,-74.042594,15z/data=!4m5!3m4!1s0x0:0x5edd4c74e8f7220c!8m2!3d4.7826755!4d-74.0425941?hl=es-419" target="_blank"><img src="images/mapa.png" alt="Escuela Colombiana de Ingeniería"></a></p>
            </div>
            <div class="resolucion" align="center"><strong>© Dirección de Tecnología OSIRIS</strong><br>
            <span>Personería Jurídica 086 de enero 19 de 1973. Acreditación institucional de alta calidad. Resolución 002710 del 18 de marzo de 2019. (Vigencia 6 años). Vigilada Mineducación.</span><br>
            <br>
            </div>
        </section>
    </footer>
</body>