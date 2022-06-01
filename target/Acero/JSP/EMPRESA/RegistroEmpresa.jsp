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
<meta name="description" content="Es el evento cient�fico que se realiza semestralmente en la Escuela Colombiana de Ingenier�a Julio Garavito, en el cu�l se re�nen estudiantes, profesores, investigadores y empresarios con el fin de divulgar los avances y necesidades en los diferentes  �mbitos de integraci�n de la academia, la industria y la sociedad en el horizonte de la Ingenier�a Mec�nica..." />
<meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito"/>
<link rel="stylesheet" href="css/formularios.css">
 <link rel="stylesheet" href="css/style.css">
 <link rel="stylesheet" href="css/grid.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
<script lang="javascript">
    function validarCamposFormulario(){
        
        //Verificaciones de nit
        var nit = document.getElementById("nit").value;
        var conf_nit = document.getElementById("conf_nit").value;
        if(nit.localeCompare(conf_nit)!==0){
            alert("El campo nit no concuerda con el campo de confirmaci�n del nit.");
            return false;
        }
        //Verificaciones de correo
        var email_contacto = document.getElementById("email_contacto").value;
        var conf_email_contacto = document.getElementById("conf_email_contacto").value;
        if(email_contacto.localeCompare(conf_email_contacto)!==0){
            alert("El campo email no concuerda con el campo de confirmaci�n del email.")
            return false;
        }
        
        //Verificaciones de password
        var password = document.getElementById("password").value;
        var conf_password = document.getElementById("conf_password").value;
        if(password.localeCompare(conf_password)!==0){
            alert("El campo contrase�a no concuerda con el campo de confirmaci�n del contrase�a.")
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
                      <li><a href="https://www.escuelaing.edu.co/escuela/encuentro-mecanica/retosdel-acero.html#1">�QU� ES?</a>
                      </li>
                      <li><a href="https://www.escuelaing.edu.co/escuela/encuentro-mecanica/retosdel-acero.html#2">PARTICIPAR</a>
                      </li>
                      <li><a href="https://www.escuelaing.edu.co/escuela/encuentro-mecanica/retosdel-acero.html#3">RETOS ANTERIORES</a>
                      </li>
                      <li class="active"><a href="https://tycho.escuelaing.edu.co/Acero-1.0/PantallaInicioSesion">INICIAR SESI�N</a>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    <section class="registro">
        <div class="container fondo-background">
            <form accept-charset="ISO-8859-1" action="Empresa" method="post" onsubmit="return validarCamposFormulario()" class="espaciado">
                <div class="col-sm-12 col-md-12 col-lg-12"><h3>Registro Empresa<hr></h3></div>
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="nit">Nit (XXXXXXXXXXXX):</label>
                            <input type="number" class="form-control" name="nit" placeholder="Solamente n�meros, con d�gito de verificaci�n y sin (-)" id="nit" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="conf_nit">Confirmaci�n de Nit (XXXXXXXXXXXX):</label>
                            <input type="number" class="form-control" name="conf_nit" placeholder="Solamente n�meros, con d�gito de verificaci�n y sin (-)" id="conf_nit" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="razon_social">Raz�n Social:</label>
                            <input type="text" class="form-control" name="razon_social" placeholder="Nombre de la Empresa" id="razon_social" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="direccion_empresa">Direcci�n de la Empresa:</label>
                            <input type="text" class="form-control" name="direccion_empresa" placeholder="Direcci�n de la Empresa" id="direccion_empresa" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="pagina_web">P�gina Web de la Empresa:</label>
                            <input type="url" class="form-control" name="pagina_web" placeholder="P�gina Web de la Empresa" id="pagina_web" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="telefono_empresa">Tel�fono:</label>
                            <input type="tel" minlength="7" class="form-control" name="telefono_empresa" placeholder="Tel�fono" id="telefono_empresa" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="descripcion_empresa">Actividad Econ�mica:</label>
                            <textarea type="text" class="form-control" name="descripcion_empresa" placeholder="Descripci�n de la Empresa" id="descripcion_empresa" required=""></textarea>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-12"><h3>Contacto<hr></h3></div>
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre del Contacto" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="apellido">Apellido:</label>
                            <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Apellido del Contacto" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="tipo_id">Tipo de Documento de Identificaci�n:</label>
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
                            <label for="id_contacto">N�mero de Identificaci�n:</label>
                            <input type="number" class="form-control" name="id_contacto" placeholder="Identificaci�n del Contacto" id="id_contacto" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="">Tel�fono de Contacto:</label>
                            <input type="tel" minlength="7" class="form-control" name="tel_contacto" placeholder="Tel�fono de Contacto" id="tel_contacto" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="email_contacto">Correo Electr�nico de Contacto:</label>
                            <input type="email" class="form-control" name="email_contacto" placeholder="Correo de Contacto" id="email_contacto" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="conf_email_contacto">Confirmar Correo Electr�nico de Contacto:</label>
                            <input type="email" class="form-control" name="conf_email_contacto" placeholder="Confirme Correo de Contacto" id="conf_email_contacto" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="password">Contrase�a:</label>
                            <input type="password" class="form-control" name="password" placeholder="Contrase�a" id="password" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <div class="form-group">
                            <label for="conf_password">Confirmar Contrase�a:</label>
                            <input type="password" class="form-control" name="conf_password" placeholder="Confirmar Contrase�a" id="conf_password" required="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <p align="center"><font color="black" size="1.5">Al registrarse usted est� aceptando todos los t�rminos relacionados en la secci�n inferior de esta p�gina.</font></p>
                        <input  style="width: 200px;" type="submit" class="btn btn-primary center-block" value="Registrar Empresa">
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
                                La Escuela recolectar� los datos suministrados por los participantes con el fin de llevar a cabo el Concurso y comunicarse con ellos de conformidad con el presente reglamento. Igualmente, podr� efectuar actividades publicitarias y de promoci�n relacionadas con el evento al que se inscribe con base en la informaci�n recolectada, lo cual se denomina el tratamiento. La informaci�n recopilada estar� sujeta a la pol�tica para el tratamiento de datos personales de la Escuela disponible en: <a href="http://www.escuelaing.edu.co/uploads/descargables/2810_politica_para_el_tratamiento_de_datos_personales.pdf" target="_blank">http://www.escuelaing.edu.co/uploads/descargables/2810_politica_para_el_tratamiento_de_datos_personales.pdf</a>

                                Mediante la inscripci�n en el evento, los participantes autorizan a la Escuela para efectuar el tratamiento de la informaci�n suministrada, la cual ser� almacenada en una base de datos (fichero automatizado de datos personales) propiedad de la Escuela. La informaci�n del proyecto, los videos y las presentaciones son datos de car�cter p�blico.
                                <br><br>
                                2. Propiedad Intelectual y Confidencialidad.
                                <br>
                                La totalidad de los derechos de autor y de propiedad industrial, que puedan originarse en el desarrollo del proyecto, ser�n de propiedad exclusiva del participante, de conformidad con la legislaci�n colombiana, sin perjuicio de los acuerdos que puedan surgir entre la Escuela y los participantes para desarrollar alg�n proyecto, los cuales deber�n ser formalizados por escrito. Los participantes mediante su inscripci�n reconocen que los proyectos no son objeto de secreto profesional, por lo que la Escuela est� autorizada para publicar en internet (todo tipo de p�ginas web y redes sociales,) o en publicaciones de car�cter acad�mico, informativo e institucional la informaci�n sobre los proyectos, haciendo el reconocimiento a la autor�a de los participantes. Las publicaciones efectuadas por la Escuela, o los terceros autorizados por �sta �ltima, son de car�cter gratuito, por lo que no dar�n ninguna compensaci�n econ�mica a los participantes. En caso de que el proyecto sea presentado por un grupo de personas de manera conjunta, se deber� reconocer la propiedad intelectual de cada una de las personas que participaron en el proyecto.

                                En caso de utilizar para la construcci�n del proyecto conceptos e ideas, que no sean propias, se deber� citar la fuente de informaci�n, los participantes se obligan reconocer la propiedad intelectual de terceros en los diferentes art�culos, poster, videos, avisos y titulos.

                                La Escuela no ser� responsable por cualquier violaci�n al r�gimen de propiedad intelectual en que puedan incurrir los participantes del Concurso, quienes deber�n responder ante las personas afectadas de conformidad con la legislaci�n colombiana. Los jurados se obligan a respetar la propiedad intelectual de los participantes, quienes deber�n suscribir un acuerdo de confidencialidad sobre la informaci�n suministrada en virtud del Concurso. En caso de que alguno de los jurados manifieste inter�s en alg�n proyecto, deber� contactarse con el participante para su desarrollo.
                                <br><br>
                                3. Responsabilidad
                                <br>
                                Durante su participaci�n en el evento, el participante responder� por cualquier da�o o perjuicio que cause a los miembros de su equipo, a la Escuela, a sus instituciones o a

                                terceras personas, con o sin intenci�n, por lo que la Escuela no es responsable de las actuaciones de los participantes</p>
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
                <a rel="nofollow" href="http://www.escuelaing.edu.co" target="_blank"><strong>Escuela Colombiana de Ingenier�a Julio Garavito</strong></a><br>
                <br>
                AK.45 No.205-59 (Autopista Norte)<br>
                Contact center: +57(1) 668 3622 Exts: 120, 312<br>
                L�nea Nacional Gratuita: 01800 011 2668<br>
                <a rel="nofollow" href="mailto://encuentro.mecanica@escuelaing.edu.co">encuentro.mecanica@escuelaing.edu.co</a><br>
                Bogot� - Colombia<br>
                <br>
                </div>
                <p><a href="https://www.google.com/maps/place/Escuela+Colombiana+de+Ingenier%C3%ADa+Julio+Garavito/@4.782676,-74.042594,15z/data=!4m5!3m4!1s0x0:0x5edd4c74e8f7220c!8m2!3d4.7826755!4d-74.0425941?hl=es-419" target="_blank"><img src="images/mapa.png" alt="Escuela Colombiana de Ingenier�a"></a></p>
            </div>
            <div class="resolucion" align="center"><strong>� Direcci�n de Tecnolog�a OSIRIS</strong><br>
            <span>Personer�a Jur�dica 086 de enero 19 de 1973. Acreditaci�n institucional de alta calidad. Resoluci�n 002710 del 18 de marzo de 2019. (Vigencia 6 a�os). Vigilada Mineducaci�n.</span><br>
            <br>
            </div>
        </section>
    </footer>
</body>