<%-- 
    Document   : PantallaDetalleRetoAdministrador
    Created on : 19-dic-2019, 11:19:57
    Author     : andres.rojas
--%>

<%@page import="java.lang.Integer"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEntregableASociadosJDBC"%>
<%@page import="edu.escuelaing.acero.domainClasses.EntregableAsociados"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEquiposJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEquipos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.escuelaing.acero.domainClasses.Equipo"%>
<%@page import="edu.escuelaing.acero.domainClasses.Evento"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventos"%>
<%@page import="edu.escuelaing.acero.domainClasses.Reto"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosRetosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosRetos"%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="/Acero/js/FuncionesEquipos.js"></script>
    <script src="/Acero/js/FuncionesAdministrador.js"></script>

</head>
<%    String id_reto = request.getParameter("id_reto");
    List<EntregableAsociados> entregables = new ArrayList<EntregableAsociados>();
    ServiciosEntregableASociadosJDBC serviciosentregables = new ServiciosEntregableASociadosJDBC();
    entregables = serviciosentregables.ConsultarEntregablesASociados(Long.parseLong(id_reto));
    ServiciosRetos servRetos = new ServiciosRetosJDBC();
    ServiciosEventos servEventos = new ServiciosEventosJDBC();
    Reto reto_actual = servRetos.consultaRetoId(Long.parseLong(id_reto));
    Evento evento_actual = servEventos.consultaEventoId(reto_actual.getId_evento());
    ServiciosParametros param_servicios = new ServiciosParametrosJDBC();
    ServiciosEquipos servEquipos = new ServiciosEquiposJDBC();
    List<Parametro> tipos_id = param_servicios.getParametrosTipo("TIID");
    List<Parametro> roles = param_servicios.getParametrosTipo("ROLE");
    List<Parametro> estados_reto = param_servicios.getParametrosTipo("ESRE");
    List<Parametro> lista_entregables = param_servicios.getParametrosTipo("ENTR");
    List<Equipo> equipos_desarrollan_reto = new ArrayList<Equipo>();
    List<Equipo> todos_equipos = servEquipos.consultarEquipos();
    for (Equipo eq : todos_equipos) {
        List<Reto> retos_desarrolla = eq.getRetos_desarrolla();
        for (Reto ret : retos_desarrolla) {
            if (ret.getId_reto().equals(reto_actual.getId_reto())) {
                equipos_desarrollan_reto.add(eq);
            }
        }
    }
    String nombres_equipos_desarrollan = "Nungún equipo registrado a este reto";

    if (equipos_desarrollan_reto.size() > 0) {
        nombres_equipos_desarrollan = equipos_desarrollan_reto.get(0).getNombre_equipo();
        for (int i = 1; i < equipos_desarrollan_reto.size(); i++) {
            nombres_equipos_desarrollan = nombres_equipos_desarrollan + ", " + equipos_desarrollan_reto.get(i).getNombre_equipo();
        }
    }
    String estado_reto = "";
    for (Parametro est : estados_reto) {
        if (est.getValor_parametro().equals(reto_actual.getEstado())) {
            estado_reto = est.getDes_valor_parametro();
        }
    }
    ServiciosParametros servParametros = new ServiciosParametrosJDBC();

    List<Parametro> estados_retos = servParametros.getParametrosTipo("ESRE");
    List<Parametro> lista_tutores = servParametros.getParametrosTipo("TUT");
%>

<body>
    <!-- Modal tutor-->
    <div class="modal fade" id="myModaltutor" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Asignación de tutores</h4>
                </div>
                <div class="modal-body">
                    <div style="display: none" id="alertCorrect" class="alert alert-success">
                        <strong>¡Asignación correcta!</strong> El tutor se asigno correctamente a este equipo.
                    </div>
                    <div style="display: none" id="alerIncorrect" class="alert alert-danger">
                        <strong>¡Error!</strong> Ocurrio un error al asignar el tutor a este equipo.
                    </div>
                    <table class="table fondoColorTotal">
                        <thead class="thead-color">
                            <tr>
                                <th class="capital">EQUIPO</th>
                                <th class="capital">TUTORES</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                for (int i = 0; i < equipos_desarrollan_reto.size(); i++) {
                            %><tr><%
                                String nomEquipo = equipos_desarrollan_reto.get(i).getNombre_equipo();
                                %>
                                <td><%=nomEquipo%></td>
                                <td><select onchange="AsignarTutor(<%=equipos_desarrollan_reto.get(i).getId_equipo()%>,<%=id_reto%>, this.value);"  class="form-control" id="nuevo_estado" name="nuevo_estado" required="">
                                        <option value="">Seleccione</option>
                                        <%
                                            for (Parametro tutores : lista_tutores) {
                                        %>
                                        <option <%=(tutores.getId_parametro().toString().trim().equals(equipos_desarrollan_reto.get(i).getTutor().toString().trim())) ? "selected" : ""%> value="<%=tutores.getId_parametro()%>"><%=tutores.getDes_valor_parametro()%></option>
                                        <%
                                            }
                                        %>
                                    </select>   </td>
                            </tr>  <%}
                            %>


                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
                </div>
            </div>

        </div>
    </div>
    <!--Final Modal tutor-->


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
            <div class="col-sm-12 col-md-12 col-lg-12"><h3>Reto <%=reto_actual.getId_reto() + "-" + evento_actual.getYear() + "-" + evento_actual.getPeriodo()%><hr></h3></div>
            <div class="container fondo-background table-responsive">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-sm-12 col-md-10">
                        <form accept-charset="ISO-8859-1" action="ActualizarEstadoReto" method="post">
                            <table class="table fondoColorTotal">
                                <thead class="thead-color">
                                    <tr>
                                        <th class="capital">NOMBRE</th>
                                        <th class="capital">DOCUMENTACIÓN DEL RETO</th>
                                        <th class="capital">EQUIPO DE ESTUDIANTES</th>
                                        <th class="capital">ESTADO DEL RETO</th>
                                        <!--th class="capital">CALIFICACIÓN</th-->
                                        <th class="capital">DESCRIPCIÓN</th>
                                        <th class="capital">PROBLEMA ESPECÍFICO</th>
                                        <th class="capital">ATRIBUTOS DE LA SOLUCIÓN</th>
                                        <th class="capital">MODO DE EVALUACIÓN</th>
                                        <th class="capital">POSIBLE SOLUCIÓN</th>
                                        <th class="capital">ASIGNAR TUTOR</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <%


                                        %>
                                        <td scope="row"><b><%=reto_actual.getNombre()%></b></td>
                                        <td scope="row"><b>Enviar documentación al correo retos@escuelaing.edu.co</b></td>
                                        <td scope="row"><b><%=nombres_equipos_desarrollan%></b></td>
                                        <td scope="row"><b><%=estado_reto%></b></td>
                                        <!--td scope="row"><b>Matriz de Calificaciones?</b></td-->
                                        <td scope="row"><b><%=reto_actual.getDescripcion()%></b></td>
                                        <td scope="row"><b><%=reto_actual.getProblema_especifico()%></b></td>
                                        <td scope="row"><b><%=reto_actual.getAtributos_solucion()%></b></td>
                                        <td scope="row"><b><%=reto_actual.getModo_evaluacion()%></b></td>
                                        <td scope="row"><b><%=reto_actual.getPosible_solucion()%></b></td>
                                        <td><a data-toggle="modal" data-target="#myModaltutor" style="cursor: pointer">Asignar tutor</a></td>
                                        
                                    </tr>
                                </tbody>
                            </table>
                            <label for="nuevo_estado">
                                Cambiar estado del reto:
                            </label>
                            <select  class="form-control" id="nuevo_estado" name="nuevo_estado" required="">
                                <option value="">Seleccione</option>
                                <%
                                    for (Parametro estado : estados_retos) {
                                %>
                                <option <%=(estado.getValor_parametro().equals(reto_actual.getEstado())) ? "selected" : ""%> value="<%=estado.getValor_parametro()%>"><%=estado.getDes_valor_parametro()%></option>
                                <%
                                    }
                                %>
                            </select>       
                            <input name="id_reto" id="id_reto" type="hidden" value="<%=reto_actual.getId_reto()%>">
                            <div class="col-sm-6 col-md-6">
                                <input style="width: 200px;" class="btn btn-primary center-block" type="submit" value="Guardar Cambios">
                            </div>
                        </form>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <br>
            <div class="col-sm-6 col-md-6">
                <a href="PantallaConsultaRetoAdministrador">
                    <button style="width: 200px;" class="btn btn-primary center-block" type="button">Volver</button>
                </a>
            </div>
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
