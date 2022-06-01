<%-- 
    Document   : PantallaConsultaRetos
    Created on : 26-ago-2019, 16:06:48
    Author     : andres.rojas
--%>

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
<%
    String id_reto = request.getParameter("id_reto");
    ServiciosRetos servRetos = new ServiciosRetosJDBC();
    ServiciosEventos servEventos = new ServiciosEventosJDBC();
    ServiciosEquipos servEquipos = new ServiciosEquiposJDBC();
    Reto reto_actual = servRetos.consultaRetoId(Long.parseLong(id_reto));
    Evento evento_actual = servEventos.consultaEventoId(reto_actual.getId_evento());
    ServiciosParametros param_servicios=new ServiciosParametrosJDBC();
    List<Parametro> tipos_id=param_servicios.getParametrosTipo("TIID");
    List<Parametro> roles=param_servicios.getParametrosTipo("ROLE");
    List<Parametro> estados_reto = param_servicios.getParametrosTipo("ESRE");
    List<Equipo> equipos_desarrollan_reto = new ArrayList<Equipo>();
    List<Equipo> todos_equipos = servEquipos.consultarEquipos();
    for (Equipo eq : todos_equipos) {
        List<Reto> retos_desarrolla = eq.getRetos_desarrolla();
        for (Reto ret : retos_desarrolla) {
            if(ret.getId_reto().equals(reto_actual.getId_reto())){
                equipos_desarrollan_reto.add(eq);
            }
        }
    }
    String nombres_equipos_desarrollan = "Nungún equipo registrado a este reto";
    
    if(equipos_desarrollan_reto.size()>0){
        nombres_equipos_desarrollan = equipos_desarrollan_reto.get(0).getNombre_equipo();
        for (int i = 1; i < equipos_desarrollan_reto.size(); i++) {
            nombres_equipos_desarrollan = nombres_equipos_desarrollan + ", " + equipos_desarrollan_reto.get(i).getNombre_equipo();
        }
    }
    String estado_reto = "";
    for (Parametro est : estados_reto) {
        if(est.getValor_parametro().equals(reto_actual.getEstado())){
            estado_reto=est.getDes_valor_parametro();
        }
    }
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
            <form accept-charset="ISO-8859-1" action="RegistroEmpresa" method="post" class="espaciado">
                <div class="col-sm-12 col-md-12 col-lg-12"><h3>Reto <%=reto_actual.getId_reto()+"-"+evento_actual.getYear()+"-"+evento_actual.getPeriodo()%><hr></h3></div>
                <div class="container fondo-background table-responsive">
	            <div class="row">
	            	<div class="col-md-1"></div>
	            	<div class="col-sm-12 col-md-10">
	            	<form accept-charset="ISO-8859-1" action="">
		            	<table class="table fondoColorTotal">
						  <thead class="thead-color">
						    <tr>
                                                        <th class="capital">NOMBRE</th>
                                                        <th class="capital">DOCUMENTACIÓN DEL RETO</th>
                                                        <th class="capital">EQUIPO DE ESTUDIANTES</th>
                                                        <th class="capital">ESTADO</th>
                                                        <!--th class="capital">CALIFICACIÓN</th-->
                                                        <th class="capital">DESCRIPCIÓN</th>
                                                        <th class="capital">PROBLEMA ESPECÍFICO</th>
                                                        <th class="capital">ATRIBUTOS DE LA SOLUCIÓN</th>
                                                        <th class="capital">MODO DE EVALUACIÓN</th>
                                                        <th class="capital">POSIBLE SOLUCIÓN</th>
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
						    </tr>
						  </tbody>
		            	</table>
	            	</form>
	            	</div>
	            	<div class="col-md-1"></div>
	            </div>
	        </div>
                <%
                    if(reto_actual.getEstado().equals("CREN")||reto_actual.getEstado().equals("CAMB")){
                        %>
                        <div class="col-sm-6 col-md-6">
                            <a href="EdicionRetoEmpresa?id_reto=<%=reto_actual.getId_reto()%>&evento=<%=reto_actual.getId_evento()%>">
                            <button style="width: 200px;" class="btn btn-primary center-block" type="button">Editar Reto</button>
                            </a>
                        </div>
                        <%
                    }
                %>
                <br>
                <div class="col-sm-6 col-md-6">
                    <a href="PantallaConsultaRetosEmpresa">
                    <button style="width: 200px;" class="btn btn-primary center-block" type="button">Volver</button>
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