<%-- 
    Document   : PantallaConsultaEventosAdministrador
    Created on : 26-ago-2019, 16:06:48
    Author     : andres.rojas
--%>

<%@page import="edu.escuelaing.acero.daoAPI.ReporteCierreDao"%>
<%@page import="edu.escuelaing.acero.domainClasses.ReporteCierre"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEntregableASociadosJDBC"%>
<%@page import="edu.escuelaing.acero.domainClasses.EntregableAsociados"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.escuelaing.acero.domainClasses.Evento"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventos"%>
<%@page import="edu.escuelaing.acero.domainClasses.Parametro"%>
<%@page import="java.util.List"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametrosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametros"%>
<%@ include file="VerificadorSesionAdmin.jsp" %>
<%
    String respuesta = request.getParameter("respuesta");
    
    if(respuesta==null){
        respuesta="";
    }
%>
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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="/Acero/js/FuncionesEquipos.js"></script>
    <script src="/Acero/js/FuncionesAdministrador.js"></script>
<script lang="javascript">
    
    <%
        if(respuesta.equals("1")){
            %>
                alert("El evento ha sido registrado satisfactoriamente");
            <%
        }else if(respuesta.equals("0")){
            %>
                alert("No se pudo registrar el evento");
            <%
        }else if(respuesta.equals("2")){
            %>
                alert("No puede crear un evento cuando existe otro evento activo del mismo tipo");
            <%
        }
    %>
</script>
</head>
<%
    ServiciosEventos servEventos = new ServiciosEventosJDBC();
    List<Evento> eventos = servEventos.consultarEventos();
    ServiciosParametros servParametros = new ServiciosParametrosJDBC();
    List<Parametro> estados_eventos = servParametros.getParametrosTipo("ESEV");
     List<Parametro> lista_entregables = servParametros.getParametrosTipo("ENTR");
     List<EntregableAsociados> entregables = new ArrayList<EntregableAsociados>();
     ServiciosEntregableASociadosJDBC serviciosentregables = new ServiciosEntregableASociadosJDBC();
%>
<body>
    <%
                                    for (Evento evento : eventos) {
                                    entregables = serviciosentregables.ConsultarEntregablesASociados(Long.parseLong(evento.getId_evento().toString()));
                                  %> 
        <!-- Modal entregables-->
    <div class="modal fade" id="myModalentregable<%=evento.getId_evento()%>" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Asignación de entregables</h4>
                </div>
                <div class="modal-body">
                    <div style="display: none" id="alertCorrectEntr<%=evento.getId_evento()%>" class="alert alert-success">
                        <strong>¡Asignación correcta!</strong><div id='mencorrecto<%=evento.getId_evento()%>'></div>
                    </div>
                    <div style="display: none" id="alerIncorrectEntr<%=evento.getId_evento()%>" class="alert alert-danger">
                        <strong>¡Error!</strong> <div id='menerror<%=evento.getId_evento()%>'></div>
                    </div>
                    <table class="table fondoColorTotal">
                        <thead class="thead-color">
                            <tr>
                                <th class="capital">NUEVO ENTREGABLE</th>
                                <th class="capital">CREAR</th>
                            </tr>
                        </thead>
                        <tbody>
                        <td><input class="form-control" id="entregableNuevo" type="text" /></td>
                        <td><button class="btn btn-default" type="button" onclick="CrearEntregable();">Crear</button></td>
                        </tbody>
                    </table>
                    <br>
                    <table class="table fondoColorTotal">
                        <thead class="thead-color">
                            <tr>
                                <th class="capital">ENTREGABLE</th>
                                <th class="capital">PORCENTAJE</th>
                                <th class="capital">AGREGAR/QUITAR</th>
                                <th class="capital">ACTUALIZAR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Long> miLista = new ArrayList<Long>();
                                for (int i = 0; i < lista_entregables.size(); i++) {
                                    miLista.add(lista_entregables.get(i).getId_parametro());
                                }
                                for (int i = 0; i < lista_entregables.size(); i++) {
                                    for (int j = 0; j < entregables.size(); j++) {
                                        if (lista_entregables.get(i).getId_parametro().equals(entregables.get(j).getId_parametro())) {
                                            String idinput = "textporcentaje" + lista_entregables.get(i).getId_parametro()+evento.getId_evento();
                                            String idcheck = "check" + lista_entregables.get(i).getId_parametro()+evento.getId_evento();
                                            String valuehiddenestado = "" + entregables.get(j).getEstado();
                                            String idhiddenestado = "idhidden" + lista_entregables.get(i).getId_parametro()+evento.getId_evento();
                                            
                            %><tr>
                        <input type='hidden' id='<%=idhiddenestado%>' value='<%=valuehiddenestado%>'/>
                        <td><%=lista_entregables.get(i).getDes_valor_parametro()%></td>
                        <td><input min="0" max="100" type="number" id="<%=idinput%>" class="form-control" type="text" value="<%=entregables.get(j).getPorcentaje()%>" /></td>
                            <%if (entregables.get(j).getEstado() == 1) {%>
                        <td><input type="checkbox" id="<%=idcheck%>" checked=""/></td>
                            <%} else {%>
                        <td><input type="checkbox" id="<%=idcheck%>"/></td>
                            <%}%>
                        <td><button onclick="EntregableASociado(<%=evento.getId_evento()%>,<%=lista_entregables.get(i).getId_parametro()%>,<%=entregables.get(j).getEstado()%>,<%=entregables.get(j).getId()%>,<%=miLista%>);" type="button" class="btn btn-default"><span class="glyphicon glyphicon-refresh"></span></button></td>
                        </tr>  <%}
                                }
                            }
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
     <%}
                                    %>
    <!--Final Modal entregables-->
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
            <div class="col-sm-12 col-md-12 col-lg-12"><h3>Listado de Eventos<hr></h3></div>
            <div class="container fondo-background table-responsive">
                    <div class="col-sm-12 col-md-12">
                    <a href="PantallaNuevoEventoAdministrador" class="btn btn-warning btn-xs pull-right" role="button">Nuevo Evento</a>
                    <!--a href="update?source=board_est" class="btn btn-primary btn-xs pull-right" role="button">Actualizar Mis Datos</a--><br><br><br><br>

                    </div>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-sm-12 col-md-10">
                    <form accept-charset="ISO-8859-1" action="">
                            <table class="table fondoColorTotal">
                                <thead class="thead-color">
                                    <tr>
                                        <th class="capital">ID EVENTO</th>
                                        <th class="capital">AÑO</th>
                                        <th class="capital">PERIODO</th>
                                        <th class="capital">ESTADO</th>
                                        <th class="capital">ENTREGABLES</th>
                                        <th class="capital">CERRAR EVENTO</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    for (Evento evento : eventos) {
                                        String estado_evento = "";
                                        for (Parametro estado : estados_eventos) {
                                            if(evento.getEstado_evento().equals(estado.getValor_parametro())){
                                                estado_evento=estado.getDes_valor_parametro();
                                            }
                                        }
                                    %>
                                    <tr>
                                        <td scope="row"><b><a href="PantallaEdicionEventoAdministrador?id_evento=<%=evento.getId_evento()%>"><%=evento.getId_evento()%></a></b></td>
                                        <td scope="row"><b><%=evento.getYear()%></b></td>
                                        <td scope="row"><b><%=evento.getPeriodo()%></b></td>
                                        <td scope="row"><b><%=estado_evento%></b></td>
                                        
                                        <%if(estado_evento.equals("Cerrado")){%>
                                        <td scope="row">Asignar entregables(Evento cerrado)</td>
                                        <td scope="row"><a href="PantallaConsultarReporteCierre?id_eventoCerrado=<%=evento.getId_evento()%>" style="cursor: pointer">Reporte</a></td>
                                        <%}else{%>
                                        <td scope="row"><a data-toggle="modal" data-target="#myModalentregable<%=evento.getId_evento()%>" style="cursor: pointer">Asignar entregables</a></td>
                                        <td scope="row"><a onclick="CerrarEvento(<%=evento.getId_evento()%>)" style="cursor: pointer">Cerrar</a></td>
                                        <%}%>
                                    </tr>
                                    <%
                                    }
                                    %>
                                </tbody>
                            </table>
                    </form>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <div class="col-sm-6 col-md-6">
                <a href="PantallaPanelControlAdministrador">
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