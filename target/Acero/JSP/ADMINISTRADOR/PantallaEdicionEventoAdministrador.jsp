<%-- 
    Document   : PantallaConsultaEventosAdministrador
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
       <script src="/Acero/js/FuncionesAdministrador.js"></script>
</head>
<%    String id_evento = request.getParameter("id_evento");
    if (id_evento == null || id_evento.trim().equals("")) {
        response.sendRedirect("PantallaConsultaEventosAdministrador");
    } else {
        id_evento = id_evento.trim();
    }
    ServiciosEventos servEventos = new ServiciosEventosJDBC();
    Evento evento = servEventos.consultaEventoId(Long.parseLong(id_evento));

    ServiciosParametros param_servicios = new ServiciosParametrosJDBC();
    List<Parametro> tipos_evento = param_servicios.getParametrosTipo("TIEV");
    List<Parametro> estados_evento = param_servicios.getParametrosTipo("ESEV");

%>
<body onload="BloquearActEvento()">
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
            <div class="col-sm-12 col-md-12 col-lg-12"><h3>Registro Nuevo Evento<hr></h3></div>
            <div class="row">
                <form accept-charset="ISO-8859-1" action="RegistroEvento" method="post" class="espaciado">
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="descripcion">Descripción:</label>
                            <textarea class="form-control" name="descripcion" id="descripcion" required=""><%=evento.getDescripcion()%></textarea>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="year">Año:</label>
                            <select class="form-control" id="year" name="year" required="">
                                <option value="<%=evento.getYear()%>" selected><%=evento.getYear()%></option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="">Periodo:</label>
                            <select class="form-control" id="periodo" name="periodo" required="">
                                <option value="<%=evento.getPeriodo()%>" selected><%=evento.getPeriodo()%></option>
                                <option>1</option>
                                <option>2</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="tipo_evento">Tipo de Evento:</label>
                            <select required="" class="form-control" id="tipo_evento" name="tipo_evento">
                                <option value="">Seleccione</option>
                                <%
                                    for (Parametro tipo_evento : tipos_evento) {
                                %>
                                <option value="<%=tipo_evento.getValor_parametro()%>" <%=(tipo_evento.getValor_parametro().equals(evento.getTipo_evento())) ? "selected" : ""%>><%=tipo_evento.getDes_valor_parametro()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="estado_evento">Estado de Evento:</label>
                            <select required="" class="form-control" id="estado_evento" name="estado_evento">
                                <option value="">Seleccione</option>
                                <%
                                    for (Parametro estado_evento : estados_evento) {
                                %>
                                <option value="<%=estado_evento.getValor_parametro()%>" <%=(estado_evento.getValor_parametro().equals(evento.getEstado_evento())) ? "selected" : ""%>><%=estado_evento.getDes_valor_parametro()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                                <input type="hidden" id="hiddenEstadoEvento" value="<%=evento.getEstado_evento()%>" />
                               
                    <br>
                    <div class="col-sm-12 col-md-10">
                        <table class="table fondoColorTotal">
                            <tbody>
                                <tr>
                                    <td scope="row"><b>SEMANA DE APERTURA AL PÚBLICO DEL EVENTO</b></td>
                                    <td scope="row"><b>Semana 1</b></td>
                                    <td scope="row"><input name="fecha_apertura" id="fecha_apertura" type="date" required="" value="<%=evento.getFecha_apertura().getFecha_inicio()%>"/></td>
                                </tr>
                                <tr>
                                    <td scope="row"><b>SEMANA INICIO DE CLASES</b></td>
                                    <td scope="row"><b>Semana 5</b></td>
                                    <td scope="row"><input name="fecha_inicio_clases" id="fecha_inicio_clases" type="date" required="" value="<%=evento.getFecha_inicio_clases().getFecha_inicio()%>"/></td>
                                </tr>
                                <tr>
                                    <td scope="row"><b>SEMANA FIN DE CLASES</b></td>
                                    <td scope="row"><b>Semana 22</b></td>
                                    <td scope="row"><input name="fecha_fin_clases" id="fecha_fin_clases" type="date" required="" value="<%=evento.getFecha_fin_clases().getFecha_inicio()%>"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <div class="col-sm-12 col-md-10">
                        <table class="table fondoColorTotal">
                            <tbody>
                                <tr>
                                    <td scope="row"><b>FECHA INICIAL DE ENTREGABLES Y CALIFICACIÓN</b></td>
                                    <td scope="row"><input name="fecha_ini_entregables" id="fecha_ini_entregables" type="date" required="" value="<%=evento.getFecha_ini_entregables()%>"/></td>
                                </tr>
                                <tr>
                                    <td scope="row"><b>FECHA FINAL DE ENTREGABLES Y CALIFICACIÓN</b></td>
                                    <td scope="row"><input name="fecha_fin_entregables" id="fecha_fin_entregables" type="date" required="" value="<%=evento.getFecha_fin_entregables()%>"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <input type="hidden" name="id_evento" id="id_evento" value="<%=id_evento%>">
                    <div class="col-sm-6 col-md-6">
                        <input  style="width: 300px;" type="submit" class="btn btn-primary center-block" role="button" id="guardarCambios" value="Guardar Cambios">
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
            <a href="PantallaConsultaEventosAdministrador">
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