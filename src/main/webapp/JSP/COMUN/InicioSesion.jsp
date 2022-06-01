<%-- 
    Document   : RegistroEmpresa
    Created on : 26-ago-2019, 16:06:48
    Author     : andres.rojas
--%>

<%@page import="edu.escuelaing.acero.domainClasses.Parametro"%>
<%@page import="java.util.List"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametrosJDBC"%>
<%@page import="edu.escuelaing.acero.servicesFacade.ServiciosParametros"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%
    String respuesta = request.getParameter("respuesta");
    if(respuesta==null){
        respuesta="";
    }
%>
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
<script lang="javascript">
    
    <%
        if(respuesta.equals("0")){
            %>
                alert("El usuario no se pudo registrar");
            <%
        }else if(respuesta.equals("1")){
            %>
                alert("El usuario se registró satisfactoriamente");
            <%
        }else if(respuesta.equals("2")){
            %>
                alert("El correo eletrónico y/o la contraseña son incorrectos");
            <%
        }else if(respuesta.equals("3")){
            %>
                alert("Ha ocurrido un error al iniciar sesión, comuniquese con el administrador del sitio");
            <%
        }else if(respuesta.equals("4")){
            %>
                alert("Su sesión se ha cerrado correctamente");
            <%
        }else if(respuesta.equals("5")){
            %>
                alert("El usuario ingresado no respresenta ninguna empresa");
            <%
        }else if(respuesta.equals("6")){
            %>
                alert("No tiene los privilegios para ingresar a esta página");
            <%
        }
    %>

</script>
</head>
<%
    ServiciosParametros param_servicios=new ServiciosParametrosJDBC();
    List<Parametro> tipos_id=param_servicios.getParametrosTipo("TIID");
    List<Parametro> roles=param_servicios.getParametrosTipo("ROLE");
    
%>
<body>
    <header>
        <div class="container">
            <div class="brand">
              <!--<h1 class="brand_name"><a href="./"><img src="images/logo-escuela.png" style='height:30%;width:30%' alt="6° encuentro de ingeniería">6° encuentro de ingeniería</a></h1>-->
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
        <div class="container fondo-background">
            <form accept-charset="ISO-8859-1" action="LogIn" method="post" class="espaciado" name="formInicioSesion">
                <div class="col-sm-12 col-md-12 col-lg-12"><h3>Inicio de Sesión<hr></h3></div>
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="email">Correo Electrónico:</label>
                            <input type="email" class="form-control" placeholder="Correo Electrónico" name="email" id="email" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="password">Contraseña:</label>
                            <input type="password" class="form-control" name="password" placeholder="Contraseña" id="password" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="">Rol de Usuario:</label>
                            <select class="form-control" id="rol" name="rol" required="">
                                <option value="">Seleccione</option>
                                <%
                                    for (Parametro rol : roles) {
                                        %>
                                        <option value="<%=rol.getValor_parametro()%>"><%=rol.getDes_valor_parametro()%></option>
                                        <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary center-block" style="width: 200px;" class="form-control" value="Iniciar Sesión"/>
                    </div>
                </div>
            </form>    
            <div class="col-sm-6 col-md-6">
                <a href="PantallaRegistroEmpresa">
                    <button style="width: 300px;" class="btn btn-primary center-block" type="button">Registrar Nueva Empresa</button>
                </a>
            </div>
            <%if(true){%>
            <div class="col-sm-6 col-md-6">
                <a href="PantallaRegistroEstudiante">
                    <button style="width: 300px;" class="btn btn-primary center-block" type="button">Registro Estudiante</button>
                </a>
            </div>
            <%}%>
            <div class="col-sm-6 col-md-6">
                <a href="PantallaRegistroTutores">
                    <button style="width: 300px;" class="btn btn-primary center-block" type="button">Registro Tutores universitarios</button>
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