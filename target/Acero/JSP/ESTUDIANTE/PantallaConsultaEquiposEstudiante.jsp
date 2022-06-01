<%-- 
    Document   : PantallaConsultaEquiposEstudiante
    Created on : 16-dic-2019, 10:59:56
    Author     : andres.rojas
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="edu.escuelaing.acero.daoAPI.EntregableDao"%>
<%@page import="edu.escuelaing.acero.domainClasses.Entregable"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEntregableASociadosJDBC"%>
<%@page import="edu.escuelaing.acero.domainClasses.EntregableAsociados"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametrosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametros"%>
<%@page import="edu.escuelaing.acero.domainClasses.Parametro"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventos"%>
<%@page import="edu.escuelaing.acero.domainClasses.Evento"%>
<%@page import="edu.escuelaing.acero.domainClasses.Reto"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosRetosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosRetos"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.escuelaing.acero.domainClasses.Equipo"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEquiposJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEquipos"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosUsuariosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosUsuarios"%>
<%@ include file="VerificadorSesionEstudiante.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<head>
    <%        String respuesta = request.getParameter("respuesta");
        List<EntregableAsociados> entregables = new ArrayList<EntregableAsociados>();
        ServiciosEntregableASociadosJDBC serviciosentregables = new ServiciosEntregableASociadosJDBC();
        ServiciosUsuarios servUsuarios = new ServiciosUsuariosJDBC();
        ServiciosEquipos servEquipos = new ServiciosEquiposJDBC();
        ServiciosParametros servParametros = new ServiciosParametrosJDBC();
        List<Parametro> estados_reto = servParametros.getParametrosTipo("ESRE");
        List<Parametro> lista_entregables = servParametros.getParametrosTipo("ENTR");
        List<Usuario> miembros_equipo = new ArrayList<Usuario>();
        Usuario estudiante = servUsuarios.consultaUsuarioId(usuario.getId_nacional());
        Long id_equipo = estudiante.getId_equipo();
        List<Usuario> usuarios = servUsuarios.consultarUsuarios();
        List<Equipo> equipos = servEquipos.consultarEquipos();
        Equipo equipo = null;
        if (!id_equipo.equals(new Long(-1))) {
            equipo = servEquipos.consultarEquipoId(id_equipo);
        }
        if (respuesta == null) {
            respuesta = "";
        }
        for (Usuario usu : usuarios) {
            if (usu.getId_equipo().equals(id_equipo)) {
                miembros_equipo.add(usu);
            }
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
            for (Reto reto : todos_retos) {
                if ((reto.getEstado().equals("PAEL")||reto.getEstado().equals("REEL")) && reto.getId_evento().equals(evento_retos_activo.getId_evento())) {
                    retos_del_evento.add(reto);
                }
            }
        }

        if (respuesta == null) {
            respuesta = "";
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
    <script lang="javascript">

        <%
            if (respuesta.equals("1")) {
        %>
        alert("El evento ha sido registrado satisfactoriamente");
        <%
        } else if (respuesta.equals("2")) {
        %>
        alert("No se pudo registrar el evento");
        <%
        } else if (respuesta.equals("3")) {
        %>
        alert("No selecciono un archivo");
        <%
            }
        %>

    </script>
</head>
<%

%>
<body>
    <%        List<Entregable> entregablesEquipo = new ArrayList<Entregable>();
        EntregableDao equipoEntregables = new EntregableDao();
        for (int i = 0; i < retos_del_evento.size(); i++) {

            entregablesEquipo = equipoEntregables.obtenerPorEquipo(id_equipo.intValue(), retos_del_evento.get(i).getId_reto().intValue());

    %>
    <!-- Modal -->
    <div class="modal fade" id="myModal<%=retos_del_evento.get(i).getId_reto()%>" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Carga de entregables</h4>
                </div>
                <div class="modal-body" style="overflow-x: scroll">
                    <div style="display: none" id="alertCorrect" class="alert alert-success">
                        <strong>¡Carga correcta!</strong> Se cargo el entregable correctamente.
                    </div>
                    <div style="display: none" id="alerIncorrect" class="alert alert-danger">
                        <strong>¡Error!</strong> Ocurrio un error al cargar el entregable.
                    </div>
                    <table class="table fondoColorTotal">
                        <thead class="thead-color">
                            <tr>
                                <th class="capital">ENTREGABLE</th>
                                <th class="capital">DESCRIPCIÓN</th>
                                <th class="capital">ARCHIVO</th>
                                <th class="capital">RETROALIMENTACIÓN</th>
                                <th class="capital">CARGAR</th>
                            </tr>
                        </thead>

                        <tbody id="tablaEntregables">
                            <%
                                entregables = serviciosentregables.ConsultarEntregablesASociados(retos_del_evento.get(i).getId_evento());

                                for (int j = 0; j < entregables.size(); j++) {

                                    if (entregables.get(j).getEstado() == 1) {
                                        for (int k = 0; k < lista_entregables.size(); k++) {
                                            int id_entregable = 0;
                                            String retroalimentacion = "";
                                            String descripcionEquipo = "";
                                            String nota = "0";
                                            if (lista_entregables.get(k).getId_parametro().equals(entregables.get(j).getId_parametro())) {
                                                for (int ent = 0; ent < entregablesEquipo.size(); ent++) {
                                                    String[] parts = entregablesEquipo.get(ent).getNombre().toString().split("\\.");
                                                    String nomArchivo = parts[0];
                                                    if (lista_entregables.get(k).getId_parametro().toString().trim().equals(entregablesEquipo.get(ent).getTipo_entregable().trim())) {
                                                        id_entregable = entregablesEquipo.get(ent).getId_entregable().intValue();
                                                        retroalimentacion = entregablesEquipo.get(ent).getRetroalimentacion();
                                                        descripcionEquipo = entregablesEquipo.get(ent).getDescripcion();
                                                        nota = entregablesEquipo.get(ent).getNota();
                                                    }
                                                }
                            %>
                        <form accept-charset="ISO-8859-1" enctype="multipart/form-data" action="CargarEntregable" method="post" id="formLogOut" name="formCargarEntregable">

                            <input type="hidden" name="codigoEntre" value="<%=evento_retos_activo.getYear()%><%=evento_retos_activo.getPeriodo()%>"/>
                            <input type="hidden" name="id_parametro" value="<%=lista_entregables.get(k).getId_parametro()%>"/>
                            <input type="hidden" name="id_equipo" value="<%=id_equipo%>"/>
                            <input type="hidden" name="id_entregable" value="<%=id_entregable%>"/>
                            <input type="hidden" name="id_reto" value="<%=retos_del_evento.get(i).getId_reto()%>"/>
                            <input type="hidden" name="nombre_entr" value="<%=lista_entregables.get(k).getDes_valor_parametro()%>" />
                            <input type="hidden" name="retroalimentacion" value="<%=retroalimentacion%>" />
                            <tr>
                                <td><%=lista_entregables.get(k).getDes_valor_parametro()%></td>
                                <td> <textarea name="descripcion"><%=descripcionEquipo%></textarea></td>
                                <td> <input required="" type='file' name="archivo<%=retos_del_evento.get(i).getId_reto()%>"></td>
                                <td><%=retroalimentacion%></td>
                                <%if (nota.trim().equals("0.0")||nota.trim().equals("0")) {

                                %>
                                <td><button class="btn btn-primary btn-danger pull-right">Cargar archivo</button> </td>
                                <%} else {%>
                                <td>Ya fue calificado su entregable</td>
                                <%}%>
                            </tr>
                        </form>

                        <%
                                        }
                                    }
                                }

                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <div id="btnCargarArchivos" class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
                </div>
            </div>

        </div>
    </div>
    <!--Final Modal -->
    <%
        }
    %>

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
            <%if (id_equipo.equals(new Long(-1))) {%>
            <form accept-charset="ISO-8859-1" action="InscripcionParticipanteEquipo" method="post" class="espaciado">
                <div class="col-sm-12 col-md-12 col-lg-12"><h3>Registrarse en un equipo<hr></h3></div>
                <div class="col-sm-6 col-md-6">
                    <div class="form-group">
                        <label for="equipo">Seleccione el Equipo al que desea registrarse:</label>
                        <select class="form-control" id="equipo" name="equipo" required="">
                            <option value="">Seleccione</option>
                            <%
                                for (Equipo eq : equipos) {
                                    Integer cant_inscritos = 0;
                                    for (Usuario usu : usuarios) {
                                        if (usu.getId_equipo().equals(eq.getId_equipo())) {
                                            cant_inscritos++;
                                        }
                                    }
                                    //Cantidad de retos en los que participa el equipo
                                    Integer cant_retos = eq.getRetos_desarrolla().size();

                                    if (cant_inscritos < eq.getMax_participantes()) {
                            %>
                            <option value="<%=eq.getId_equipo()%>"><%=eq.getNombre_equipo()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                </div>
                <input class="form-control" type="submit" value="Inscribirse">
            </form>
            <form accept-charset="ISO-8859-1" id="crear_equipo" name="crear_equipo" action="RegistroEquipo" method="post">
                <div class="col-sm-12 col-md-12 col-lg-12"><h3>Crear un Equipo:<hr></h3></div>
                <div class="col-sm-6 col-md-6">
                    <div class="form-group">
                        <label for="nombre_equipo">Nombre del Equipo:</label>
                        <input class="form-control" id="nombre_equipo" name="nombre_equipo" type="text" placeholder="Escriba el nombre del Equipo" required="">
                    </div>
                    <div class="form-group">
                        <label for="max_integrantes">Cantidad máxima de Integrantes:</label>
                        <input class="form-control" id="max_integrantes" name="max_integrantes" type="number" min="2" required="">
                    </div>
                </div>
                <input class="form-control" type="submit" value="Guardar Equipo">
            </form>
            <%} else {

            %>
            <div class="col-sm-12 col-md-12 col-lg-12"><h3>Usted está inscrito al Equipo: <%=equipo.getNombre_equipo()%><hr></h3></div>
            <br>
            <br>
            <div class="col-sm-12 col-md-12 col-lg-12"><h3>Miembros actuales de su equipo:<hr></h3></div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-sm-12 col-md-10">
                    <table class="table fondoColorTotal">
                        <thead class="thead-color">
                            <tr>
                                <th class="capital">NOMBRE</th>
                                <th class="capital">CORREO</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Usuario usu : miembros_equipo) {
                            %>
                            <tr>
                                <td scope="row"><b><%=usu.getNombre() + " " + usu.getApellido()%></b></td>
                                <td scope="row"><b><%=usu.getCorreo_electronico()%></b></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-1"></div>
            </div>
            <br>
            <br>
            <%
                if (evento_retos_activo != null) {
            %>
            <div class="col-sm-12 col-md-12 col-lg-12"><h3>Retos a los que se ha postulado:<hr></h3></div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-sm-12 col-md-10">
                    <table class="table fondoColorTotal">
                        <thead class="thead-color">
                            <tr>
                                <th class="capital">ID RETO</th>
                                <th class="capital">NOMBRE</th>
                                <th class="capital">ESTADO</th>
                                <th class="capital">EVENTO AL QUE PERTENECE</th>
                                <th class="capital">CARGAR ENTREGABLES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Reto reto : retos_del_evento) {
                                    String estado_reto = "";
                                    for (Parametro estado : estados_reto) {
                                        if (reto.getEstado().equals(estado.getValor_parametro())) {
                                            estado_reto = estado.getDes_valor_parametro();
                                        }
                                    }
                                    String evento_reto = "";
                                    for (Evento evento : todos_eventos) {
                                        if (evento.getId_evento().equals(reto.getId_evento())) {
                                            evento_reto = evento.getYear() + "-" + evento.getPeriodo();
                                        }
                                    }
                                    Boolean ya_postulado = false;
                                    if (equipo.getRetos_desarrolla() != null) {
                                        for (Reto ret_pos : equipo.getRetos_desarrolla()) {
                                            if (ret_pos.getId_reto().equals(reto.getId_reto())) {
                                                ya_postulado = true;
                                            }
                                        }
                                    }
                                    if (ya_postulado) {
                                        Evento nuevoEvento = servEventos.consultaEventoId(reto.getId_evento());
                                        Calendar calendario = GregorianCalendar.getInstance();
                                        Date fechaActual = calendario.getTime();
                                        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
                                        Date fecha_ini_entregables = formatoDelTexto.parse(nuevoEvento.getFecha_ini_entregables());
                                        Date fecha_fin_entregables = formatoDelTexto.parse(nuevoEvento.getFecha_fin_entregables());
                                      
                            %>
                            <tr>
                                <td scope="row"><b><%=reto.getId_reto()%></b></td>
                                <td scope="row"><b><%=reto.getNombre()%></b></td>
                                <td scope="row"><b><%=estado_reto%></b></td>
                                <td scope="row"><b><%=evento_reto%></b></td>
                                <%if (fechaActual.getTime() >= fecha_ini_entregables.getTime() && fechaActual.getTime() <= fecha_fin_entregables.getTime()) {%>
                                <td><a data-toggle="modal" data-target="#myModal<%=reto.getId_reto()%>" style="cursor: pointer">Cargar Entregables</a></td>
                                <%}else{%>
                                <td>NO DISPONIBLE</td>
                                <%}%>
                            </tr>
                            <%
                                    }

                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-1"></div>
            </div>
            <br>
            <br>
            <br>
            <div class="col-sm-12 col-md-12 col-lg-12"><h3>Postule su equipo a retos:<hr></h3></div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-sm-12 col-md-10">
                    <table class="table fondoColorTotal">
                        <thead class="thead-color">
                            <tr>
                                <th class="capital">ID RETO</th>
                                <th class="capital">NOMBRE</th>
                                <th class="capital">ESTADO</th>
                                <th class="capital">EVENTO AL QUE PERTENECE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Reto reto : retos_del_evento) {
                                    String estado_reto = "";
                                    for (Parametro estado : estados_reto) {
                                        if (reto.getEstado().equals(estado.getValor_parametro())) {
                                            estado_reto = estado.getDes_valor_parametro();
                                        }
                                    }
                                    String evento_reto = "";
                                    for (Evento evento : todos_eventos) {
                                        if (evento.getId_evento().equals(reto.getId_evento())) {
                                            evento_reto = evento.getYear() + "-" + evento.getPeriodo();
                                        }
                                    }

                                    Boolean ya_postulado = false;
                                    if (equipo.getRetos_desarrolla().equals(null)) {
                                    } else {
                                        for (Reto ret_pos : equipo.getRetos_desarrolla()) {
                                            if (ret_pos.getId_reto().equals(reto.getId_reto())) {
                                                ya_postulado = true;
                                            }
                                        }
                                    }
                                    if (!ya_postulado) {
                            %>
                            <tr>
                                <td scope="row"><b><a href="PantallaPostulaEquipoRetoEstudiante?id_reto=<%=reto.getId_reto()%>"><%=reto.getId_reto()%></a></b></td>
                                <td scope="row"><b><%=reto.getNombre()%></b></td>
                                <td scope="row"><b><%=estado_reto%></b></td>
                                <td scope="row"><b><%=evento_reto%></b></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-1"></div>
            </div>
            <%  }
                }
            %>
        </div>
        <a href="PantallaPanelControlEstudiante">
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