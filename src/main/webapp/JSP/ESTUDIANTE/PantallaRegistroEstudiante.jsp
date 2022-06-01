<%-- 
    Document   : PantallaRegistroEstudiante
    Created on : 16-dic-2019, 14:15:15
    Author     : andres.rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    function validarCamposFormulario(){
        
        var email = document.getElementById("email").value;
        var conf_email = document.getElementById("conf_email").value;
        
        var password = document.getElementById("password").value;
        var conf_password = document.getElementById("conf_password").value;
        
        if(email.localeCompare(conf_email)!==0){
            alert("El campo Correo Electrónico y la confirmación de Correo Electrónico no concuerdan");
            return false;
        }else if (password.localeCompare(conf_password)!==0){
            alert("El campo Contraseña y la confirmación de Contraseña no concuerdan");
            return false;
        }else if(!email.includes("@mail.escuelaing.edu.co")){
            alert("El correo debe ser institucional de la Escuela");
            return false;
        }
        return true;
    }
</script>
</head>
<%
    ServiciosParametros param_servicios=new ServiciosParametrosJDBC();
    List<Parametro> tipos_id=param_servicios.getParametrosTipo("TIID");
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
        <div class="container fondo-background">
            <form accept-charset="ISO-8859-1" action="RegistroEstudiante" method="post" onsubmit="return validarCamposFormulario()" class="espaciado">
                <div class="col-sm-12 col-md-12 col-lg-12"><h3>Registro Estudiante<hr></h3></div>
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="documento">Documento Identidad:</label>
                            <input type="number" class="form-control" name="documento" placeholder="Digite su número de identificación." id="documento" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="tipo_id">Tipo de Documento de Identificación:</label>
                            <select class="form-control" id="tipo_id" name="tipo_id" required="">
                                <option value="">Seleccione</option>
                                <%
                                    for (Parametro tipo : tipos_id) {
                                        %>
                                        <option value="<%=tipo.getValor_parametro()%>"><%=tipo.getDes_valor_parametro()%></option>
                                        <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre del Estudiante" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="apellido">Apellido:</label>
                            <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Apellido del Estudiante" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="email">Correo Electrónico de Contacto:</label>
                            <input type="email" class="form-control" name="email" placeholder="Correo" id="email" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="conf_email">Confirmar Correo Electrónico de Contacto:</label>
                            <input type="email" class="form-control" name="conf_email" placeholder="Confirme Correo" id="conf_email" required="">
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
                            <label for="conf_password">Confirmar Contraseña:</label>
                            <input type="password" class="form-control" name="conf_password" placeholder="Confirmar Contraseña" id="conf_password" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="tel">Teléfono de Contacto:</label>
                            <input type="tel" minlength="7" class="form-control" name="tel" placeholder="Teléfono de Contacto" id="tel" required="">
                        </div>
                    </div>
                    
                    <div class="col-sm-6 col-md-6">
                        <p align="center"><font color="black" size="1.5">Al registrarse usted está aceptando todos los términos relacionados en la sección inferior de esta página.</font></p>
                        <input  style="width: 200px;" type="submit" class="btn btn-primary center-block" value="Registrarse">
                    </div>
                    <div class="col-sm-6 col-md-12">
                        <div class="form-group">
                            <br>
                            <br>
                            <font family="sans-serif" size="1">
                                <center><b>AVISO DE PRIVACIDAD</b></center>
                                <p align="justify">
                                <br>
                                1. Datos Personales.
                                <br>
                                La Escuela recolectará los datos suministrados por los participantes con el fin de llevar a cabo el Concurso y comunicarse con ellos de conformidad con el presente reglamento. Igualmente, podrá efectuar actividades publicitarias y de promoción relacionadas con el evento al que se inscribe con base en la información recolectada, lo cual se denomina el tratamiento. La información recopilada estará sujeta a la política para el tratamiento de datos personales de la Escuela disponible en: <a href="http://www.escuelaing.edu.co/uploads/descargables/2810_politica_para_el_tratamiento_de_datos_personales.pdf" target="_blank">http://www.escuelaing.edu.co/uploads/descargables/2810_politica_para_el_tratamiento_de_datos_personales.pdf</a>

                                Mediante la inscripción en el evento, los participantes autorizan a la Escuela para efectuar el tratamiento de la información suministrada, la cual será almacenada en una base de datos (fichero automatizado de datos personales) propiedad de la Escuela. La información del proyecto, los videos y las presentaciones son datos de carácter público.
                                <br><br>
                                2. Propiedad Intelectual y Confidencialidad.
                                <br>
                                La totalidad de los derechos de autor y de propiedad industrial, que puedan originarse en el desarrollo del proyecto, serán de propiedad exclusiva del participante, de conformidad con la legislación colombiana, sin perjuicio de los acuerdos que puedan surgir entre la Escuela y los participantes para desarrollar algún proyecto, los cuales deberán ser formalizados por escrito. Los participantes mediante su inscripción reconocen que los proyectos no son objeto de secreto profesional, por lo que la Escuela está autorizada para publicar en internet (todo tipo de páginas web y redes sociales,) o en publicaciones de carácter académico, informativo e institucional la información sobre los proyectos, haciendo el reconocimiento a la autoría de los participantes. Las publicaciones efectuadas por la Escuela, o los terceros autorizados por ésta última, son de carácter gratuito, por lo que no darán ninguna compensación económica a los participantes. En caso de que el proyecto sea presentado por un grupo de personas de manera conjunta, se deberá reconocer la propiedad intelectual de cada una de las personas que participaron en el proyecto.

                                En caso de utilizar para la construcción del proyecto conceptos e ideas, que no sean propias, se deberá citar la fuente de información, los participantes se obligan reconocer la propiedad intelectual de terceros en los diferentes artículos, poster, videos, avisos y titulos.

                                La Escuela no será responsable por cualquier violación al régimen de propiedad intelectual en que puedan incurrir los participantes del Concurso, quienes deberán responder ante las personas afectadas de conformidad con la legislación colombiana. Los jurados se obligan a respetar la propiedad intelectual de los participantes, quienes deberán suscribir un acuerdo de confidencialidad sobre la información suministrada en virtud del Concurso. En caso de que alguno de los jurados manifieste interés en algún proyecto, deberá contactarse con el participante para su desarrollo.
                                <br><br>
                                3. Responsabilidad
                                <br>
                                Durante su participación en el evento, el participante responderá por cualquier daño o perjuicio que cause a los miembros de su equipo, a la Escuela, a sus instituciones o a

                                terceras personas, con o sin intención, por lo que la Escuela no es responsable de las actuaciones de los participantes</p>
                            </font>                                                                
                        </div>
                    </div>
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