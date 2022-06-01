<%-- 
    Document   : CreacionNuevoRetoEmpresa
    Created on : 26-ago-2019, 16:06:48
    Author     : andres.rojas
--%>

<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventosJDBC"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.escuelaing.acero.domainClasses.Evento"%>
<%@page import="edu.escuelaing.acero.domainClasses.Parametro"%>
<%@page import="java.util.List"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametrosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametros"%>
<%@ include file="VerificadorSesionEmpresa.jsp" %>
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
<%    ServiciosParametros param_servicios = new ServiciosParametrosJDBC();
    ServiciosEventosJDBC servEventos = new ServiciosEventosJDBC();
    List<Evento> listEventos = new ArrayList<Evento>();
    listEventos = servEventos.consultarEventos();
    List<Parametro> tipos_id = param_servicios.getParametrosTipo("TIID");
    List<Parametro> roles = param_servicios.getParametrosTipo("ROLE");
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
            <form accept-charset="ISO-8859-1" action="RegistroReto" method="post" class="espaciado">
                <div class="col-sm-12 col-md-12 col-lg-12"><h3>Registro Reto Nuevo<hr></h3></div>
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="nombre">Nombre Problema:</label>
                            <input maxlength="255" required="" type="text" class="form-control" name="nombre" placeholder="Descripción corta del problema a solucionar" id="nombre">
                        </div>
                    </div>
                    
                         <div class="col-sm-3 col-md-3">
                        <div class="form-group">
                            <label for="fecha">Fecha:</label>
                            <input type="date" class="form-control" name="fecha" id="fecha" required="">
                        </div>
                         </div>
                         <div class="col-sm-3 col-md-3">
                        <div class="form-group">
                            <label for="fecha">Evento:</label>
                            <select class="form-control" name="evento" id="evento" required="">
                                <option value="">Seleccione</option>
                                <%
                                    for (Evento evento : listEventos) {
                                        if (evento.getEstado_evento().equals("ENPR") || evento.getEstado_evento().equals("ABRT")) {
                                %>
                                <option value="<%=evento.getId_evento()%>"><%=evento.getDescripcion()%></option>
                                <%}
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12"><h3>Contacto (En empresa)<hr></h3></div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="nombre_contacto">Nombre Contacto:</label>
                            <input type="text" class="form-control" name="nombre_contacto" placeholder="Nombre de un Contacto de Información de Reto" id="nombre_contacto" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="correo_contacto">Correo Contacto:</label>
                            <input type="email" class="form-control" name="correo_contacto" placeholder="correo@mail.com" id="correo_contacto" >
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12"><h3>Quién aprueba (El problema)<hr></h3></div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="nombre_aprobador">Nombre:</label>
                            <input type="text" class="form-control" name="nombre_aprobador" placeholder="Nombre de quien aprueba el problema" id="nombre_aprobador" required="" >
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="correo_aprobador">Correo:</label>
                            <input type="email" class="form-control" name="correo_aprobador" placeholder="correo@mail.com" id="correo_aprobador" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="telefono_contacto">Teléfono de Contacto:</label>
                            <input type="tel" class="form-control" name="telefono_contacto" placeholder="Teléfono para solicitar información del reto" id="telefono_contacto" required="" >
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="horario_disponible">Horario Disponible:</label>
                            <input type="text" class="form-control" name="horario_disponible" placeholder="Horario de disponibilidad para comunicaciones" id="horario_disponible" required="" >
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-12"><h5>Nota: Puede compartir algún video o fotografias para facilitar el conocimiento por parte del estudiante al correo retos@escuelaing.edu.co enunciando el nombre del reto en el asunto.<hr></h5></div>
                <div class="col-sm-12 col-md-12 col-lg-12"><h3>Datos Adicionales<hr></h3></div>
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="problema_especifico">Problema de Diseño:</label>
                            <textarea class="form-control" name="problema_especifico" id="problema_especifico" placeholder="Ubicación en planta (sede, edificio, piso, proceso, máquina, etc.)" required=""></textarea>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="descripcion">Describa:</label>
                            <textarea class="form-control" name="descripcion" id="descripcion" placeholder="Con sus palabras de forma muy general el problema (¿por qué es importante en el proceso?, ¿cómo afectará a la producción?, ¿cómo se hace actualmente?)." required=""></textarea>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="atributos_solucion">Escriba:</label>
                            <textarea name="atributos_solucion" id="atributos_solucion" class="form-control" placeholder="Cuales son los atributos que debería tener la solución para que sea óptima, ¿Qué debe hacer específicamente? (intente no sesgarse por posibles soluciones que imagine) Comparta al correo retos@escuelaing.edu.co fotos o video si es necesario agregando el nombre del reto al asunto del correo. No se limite en escribir, sea lo más detallado posible." required=""></textarea>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="modo_evaluacion">Modo de evaluación:</label>
                            <textarea name="modo_evaluacion" id="modo_evaluacion" class="form-control" placeholder="Describa y/o defina los parámetros de evaluación que validarán en funcionamiento de la solución. En lo posible defina cosas medibles. Si no tiene valor, escriba 'por definir'. Por ejemplo; eleve los resortes 115mm, se mueva a máximo 15 m/s, mueva una cantidad por definir de resortes por minuto, etc." required=""></textarea>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="posible_solucion">¿Tiene una posible solución?:</label>
                            <textarea name="posible_solucion" id="posible_solucion" class="form-control" placeholder="Describa como piensa que podría ser una solución. Comparta al correo retos@escuelaing.edu.co fotos, dibujos o video si es necesario agregando el nombre del reto al asunto del correo." required=""></textarea>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="estado" name="estado">
                <div class="col-sm-6 col-md-6">
                    <input  style="width: 300px;" type="submit" onclick="document.getElementById('estado').value = 'ENRE'" class="btn btn-primary center-block" role="button" value="Guardar y Enviar a Revisión">
                </div>
                <div class="col-sm-6 col-md-6">
                    <input  style="width: 200px;" type="submit" onclick="document.getElementById('estado').value = 'CREN'" class="btn btn-primary center-block" role="button" value="Crear y Guardar">
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <div class="col-sm-6 col-md-6">
                    <a href="PantallaConsultaRetosEmpresa">
                        <button style="width: 200px;" class="btn btn-primary center-block" type="button">Cancelar</button>
                    </a>
                </div>
            </form>
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