<%-- 
    Document   : PantallaConsultaAsignacionEquipos
    Created on : 22/10/2020, 09:39:41 AM
    Author     : javier.tambo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosRetosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventos"%>
<%@page import="edu.escuelaing.acero.domainClasses.Evento"%>
<%@page import="edu.escuelaing.acero.domainClasses.Reto"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosRetos"%>
<%@page import="edu.escuelaing.acero.domainClasses.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosUsuariosJDBC"%>
<%@page import="edu.escuelaing.acero.domainClasses.Parametro"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametrosJDBC"%>
<%@page import="java.util.List"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametros"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEquiposJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEquipos"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosUsuarios"%>
<%@include file="VerificadorSesionTutor.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%             HttpSession misession = (HttpSession) request.getSession();
            Usuario infoUsuario = (Usuario) misession.getAttribute("usuario");
            String id_nacional_tutor = usuario.getId_nacional();
            String respuesta = request.getParameter("respuesta");
            ServiciosUsuarios servUsuarios = new ServiciosUsuariosJDBC();
            ServiciosEquipos servEquipos = new ServiciosEquiposJDBC();
            ServiciosParametros servParametros = new ServiciosParametrosJDBC();
            List<Parametro> estados_reto = servParametros.getParametrosTipo("ESRE");
            List<Parametro> lista_entregables = servParametros.getParametrosTipo("ENTR");
            List<Usuario> miembros_equipo = new ArrayList<Usuario>();
            List<Equipo> equipos = servEquipos.consultarEquipos();
            List<Equipo> equiposAsignados = new ArrayList<Equipo>();

            if (respuesta == null) {
                respuesta = "";
            }
            ServiciosRetos servRetos = new ServiciosRetosJDBC();
            List<Reto> todos_retos = servRetos.consultarRetos();
            List<Reto> retos_del_evento = new ArrayList<Reto>();
            ServiciosEventos servEventos = new ServiciosEventosJDBC();
            List<Evento> todos_eventos = servEventos.consultarEventos();
            Evento evento_retos_activo = null;
            for (Evento evento : todos_eventos) {
                if (evento.getTipo_evento().equals("EVRE") && evento.getEstado_evento().equals("ABRT")) {
                    evento_retos_activo = evento;
                }
            }
            if (evento_retos_activo != null) {
                for (Equipo equipo : equipos) {
                    for (Reto retoActual : equipo.getRetos_desarrolla()) {
                        if (retoActual.getId_evento().equals(evento_retos_activo.getId_evento())) {
                            if (equipo.getTutor().toString().trim().equals(id_nacional_tutor.toString().trim())) {
                                equiposAsignados.add(equipo);
                            }
                        }
                    }
                }
            }
        %>
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="/Acero/js/FuncionesEquipos.js"></script>
    </head>

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
                <br>
                <div class="col-sm-12 col-md-12 col-lg-12"><h3>Equipos que tiene asignados:<hr></h3></div>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-sm-12 col-md-10">
                        <table class="table fondoColorTotal">
                            <thead class="thead-color">
                                <tr>
                                    <th class="capital">ID RETO</th>
                                    <th class="capital">NOMBRE EQUIPO</th>
                                    <th class="capital">ESTADO</th>
                                    <th class="capital">EVENTO AL QUE PERTENECE</th>
                                    <th class="capital">CALIFICAR ENTREGABLES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Equipo equipo : equiposAsignados) {
                                        for (Reto reto : equipo.getRetos_desarrolla()) {
                                %>
                                <tr>
                                    <td><%=reto.getId_reto() + " - " + reto.getNombre()%></td>
                                    <td><%=equipo.getNombre_equipo()%></td>
                                    <%
                                        for (Parametro pa : estados_reto) {
                                            if (pa.getValor_parametro().equals(reto.getEstado())) {
                                    %>
                                    <td><%=pa.getDes_valor_parametro()%></td>
                                    <%
                                            }
                                        }
                                        Evento nuevoEvento = servEventos.consultaEventoId(reto.getId_evento());
                                        Calendar calendario = GregorianCalendar.getInstance();
                                        Date fechaActual = calendario.getTime();
                                        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
                                        Date fecha_ini_entregables = formatoDelTexto.parse(nuevoEvento.getFecha_ini_entregables());
                                        Date fecha_fin_entregables = formatoDelTexto.parse(nuevoEvento.getFecha_fin_entregables());
                 
                                    %>
                                    <td><%=reto.getId_evento()%></td>
                                    <%if (fechaActual.getTime() >= fecha_ini_entregables.getTime() && fechaActual.getTime() <= fecha_fin_entregables.getTime()) {%>
                                    <td><a style="cursor: pointer" href="PantallaCalificarEntregables?id_reto=<%=reto.getId_reto()%>&id_equipo=<%=equipo.getId_equipo()%>&equipo=<%=equipo.getNombre_equipo()%>">Calificar Entregables</a></td>
                                    <%}else{%>
                                <td>NO DISPONIBLE</td>
                                <%
                                    }
                                            }
                                        }
                                    %>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <a href="PantallaPanelControlTutor">
                <button class="btn btn-primary btn-danger pull-right">Volver</button>
            </a>
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
</html>
