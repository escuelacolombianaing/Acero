<%-- 
    Document   : reservas
    Created on : 29/02/2012, 03:21:44 PM
    Author     : palvarad
--%>
<%@ include file="secure.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        response.setHeader("Cache-Control", "no-cache");
        HttpSession sesion;
        sesion = request.getSession(true);
//Fecha actual
        
        String fecuso = new String(""), dia = new String(""), capac = new String(""),
                descr = new String(""), msj = new String(""), ndia = new String("");
  
   
%>

<html>
    <head>
        <title>Solicitud de Salones</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            <!--
            #fecha {
                font-family: Verdana, Arial, Helvetica, sans-serif;
                font-size: 12px;
                color: #990000;
                font-weight: bold;
            }

            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
            .texto {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

            -->
        </style>
        <script language="JavaScript" src="jscript/solsalones.js"></script>
        <script language="JavaScript" src="jscript/calendario.js"></script>
        <script language="JavaScript" src="jscript/overlib_mini.js"></script>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>

        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondo.gif" onLoad="preloadImg()">

 
<table width="690" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
  <tr>
                <td align="center" valign="top">
                    <form name="form1" method="post" action="reservasPoli" onSubmit="return comprueba();" >                     

        <table width="100%" border="1" cellspacing="0" cellpadding="0" class="textocom">
          <tr> 
            <td width="23%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha 
              Utilizaci&oacute;n:</b> </font></td>
            <td width="33%"> 
              <input type="text" name="fecha" size="14" maxlength="10" onfocus="this.blur()" class="campotext" value="<%=fecuso%>">
              <a href="javascript:show_calendar('form1.fecha'); document.form1.fecha.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha de solicitud de reserva.'); return true;" onMouseOut="window.status=''; nd();  return true;"> 
              <img src="img/calendar.gif" width=16 height=16 border=0></a></td>
            <td width="44%">&nbsp; </td>
          </tr>
          <tr> 
            <td colspan="2">&nbsp;</td>
            <td width="44%" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              </font></td>
          </tr>
          <tr> 
            <td colspan="3"> 
              <div align="center"> 
                <input type="submit" name="Submit" value="Solicitar Reserva" class="boton">
              </div>
            </td>
          </tr>
        </table>
      </form>
     </td>
     </tr>
      <tr>
        <td>
          <div align="right">            
          </div>
          </td>
         </tr>
        </table>
        <div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
    <p>&nbsp;</p></body>
</html>