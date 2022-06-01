<%-- 
    Document   : PantallaConsultaRetoAdministrador
    Created on : 19-dic-2019, 11:06:09
    Author     : andres.rojas
--%>

<%@page import="edu.escuelaing.acero.domainClasses.Evento"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEventos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.escuelaing.acero.domainClasses.Reto"%>
<%@page import="edu.escuelaing.acero.domainClasses.Empresa"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEmpresasJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosEmpresas"%>
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
<%
    String respuesta = request.getParameter("respuesta");
    
    if(respuesta==null){
        respuesta="";
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
<script>
    <%
        if(respuesta.equals("0")){
            %>
                alert("El reto no se pudo guardar");
            <%
        }else if(respuesta.equals("1")){
            %>
                alert("El reto se guardó correctamente");
            <%
        }
    %>
</script>
</head>
<%
    ServiciosRetos servRetos = new ServiciosRetosJDBC();
    ServiciosParametros servParametros = new ServiciosParametrosJDBC();
    ServiciosEventos servEventos = new ServiciosEventosJDBC();
    
    List<Evento> todos_eventos = servEventos.consultarEventos();
    
    
    List<Parametro> estados_reto = servParametros.getParametrosTipo("ESRE");
    List<Reto> todos_retos = servRetos.consultarRetos();

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
                <div class="col-sm-12 col-md-12 col-lg-12"><h3>Listado de Retos Registrados<hr></h3></div>
                <div class="container fondo-background table-responsive">
	            <div class="row">
	            	<div class="col-md-1"></div>
	            	<div class="col-sm-12 col-md-10">
	            	<form accept-charset="ISO-8859-1" action="">
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
                                                        for (Reto reto : todos_retos) {
                                                            if(!reto.getEstado().equals("CREN")){
                                                                String estado_reto = "";
                                                                for (Parametro estado : estados_reto) {
                                                                    if(reto.getEstado().equals(estado.getValor_parametro())){
                                                                        estado_reto=estado.getDes_valor_parametro();
                                                                    }
                                                                }
                                                                String evento_reto = "";
                                                                for (Evento evento : todos_eventos) {
                                                                    if(evento.getId_evento().equals(reto.getId_evento())){
                                                                        evento_reto=evento.getYear()+"-"+evento.getPeriodo();
                                                                    }
                                                                }



                                                                %>
                                                                <tr>
                                                                    <td scope="row"><b><a href="PantallaDetalleRetoAdministrador?id_reto=<%=reto.getId_reto()%>"><%=reto.getId_reto()%></a></b></td>
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
	            	</form>
	            	</div>
	            	<div class="col-md-1"></div>
	            </div>
	        </div>
            </form>
        </div>
        <a href="PantallaPanelControlAdministrador">
            <button style="width: 200px;" class="btn btn-primary center-block" type="button">Volver</button>
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