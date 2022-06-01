<%@ include file="secure.jsp" %>
<%@ page import="javax.naming.*,javax.rmi.PortableRemoteObject"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%@ page contentType="text/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
        response.setHeader("Cache-Control","no-cache");
        HttpSession sesion;
        sesion = request.getSession(true);
//Fecha actual

        String fecuso = new String(""), dia = new String(""), capac = new String(""),
                descr = new String(""), msj = new String(""), ndia = new String("");


%>
<html>
    <head>
        <title>Reservas</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
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
       <!-- <script language="JavaScript" src="jscript/solsalones.js"></script>-->
        <script language="JavaScript" src="jscript/calendario.js"></script>
        <script language="JavaScript" src="jscript/overlib_mini.js"></script>
        <!--<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>-->

        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/forms.css" rel="stylesheet" type="text/css">

<script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {

                if(document.form1.fecha.value == ""){
                    alert("Por favor seleccione la fecha a consultar");
                    return false;
                }

               if(document.form1.hora.value == ""){
                    alert("Por favor seleccione la hora a consultar");
                    return false;
                }
              if(document.form1.req.value == ""){
                    alert("Por favor seleccione el recurso a consultar");
                    return false;
                }
            }


            //-->
        </script>

    </head>
    <body>

<table width="1106" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="15"><img name="portal_r1_c1" src="img/portal_r1_c1.jpg" width="15" height="100" border="0" id="portal_r1_c1" alt="" /></td>
    <td width="200" background="img/portal_r1_c2.jpg"><img src="img/Logo.gif" width="148" height="54"></td>
    <td width="575" valign="middle" background="img/portal_r1_c2.jpg">
      <div align="center"> <strong><font color="#990000" size="4" face="Times New Roman, Times, serif">CONSULTA RESERVAS</font></strong> </div>
    </td>
    <td width="316" valign="middle" background="img/portal_r1_c2.jpg">
      <div align="right"></div>
    </td>
    <td width="10"><img name="portal_r1_c4" src="img/portal_r1_c4.jpg" width="20" height="100" border="0" id="portal_r1_c4" alt="" /></td>
  </tr>
  <tr>
    <td background="img/portal_r2_c1.jpg" style="background-repeat:repeat-y" width="15">&nbsp;</td>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="60" valign="top" height="10">
           <jsp:include page="menu">
            <jsp:param name="" value="" />
            </jsp:include>
          </td>
          <td width="1059" valign="top" height="10">
          <table width="690" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
            <tr>
                <td align="center" valign="top">
                    <form name="form1" method="post" action="reservasPoli" onSubmit="return comprueba();" >

                    <table width="82%" border="1" cellspacing="0" cellpadding="0" class="textocom">
                      <tr bgcolor="#990000"> 
                        <td colspan="3"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">POLIDEPORTIVO</font></b> 
                            </font></div>
                        </td>
                      </tr>
                      <tr> 
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td width="29%" height="25"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha 
                            Utilizaci&oacute;n</b></font></div>
                        </td>
                        <td width="33%" height="25"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Hora</b></font></div>
                        </td>
                        <td width="38%" height="25"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Recurso 
                            Solicitado</b></font></div>
                        </td>
                      </tr>
                      <tr> 
                        <td width="29%"> 
                          <input type="text" name="fecha" size="14" maxlength="10" onfocus="this.blur()" class="campotext" value="<%=fecuso%>">
                          <a href="javascript:show_calendar('form1.fecha'); document.form1.fecha.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha de solicitud de reserva.'); return true;" onMouseOut="window.status=''; nd();  return true;"> 
                          <img src="img/calendar.gif" width=16 height=16 border=0></a></td>
                        <td width="33%">
                          <select name="hora">
                            <option value="" selected>Seleccione</option>
                            <option value="700">7:00</option>
                            <option value="800">8:00</option>
                            <option value="900">9:00</option>
                            <option value="1000">10:00</option>
                            <option value="1100">11:00</option>
                            <option value="1200">12:00</option>
                            <option value="1300">13:00</option>
                            <option value="1400">14:00</option>
                            <option value="1500">15:00</option>
                            <option value="1600">16:00</option>
                            <option value="1700">17:00</option>
                            <option value="1800">18:00</option>
                          </select>
                        </td>
                        <td width="38%"> 
                          <select name="req">
                            <option value="" selected>Seleccione</option>
                            <option value="L">Baloncesto</option>
                            <option value="U">Futsala</option>
                            <option value="I">Gimnasio</option>
                            <option value="M">Sala M&uacute;ltiple</option>
                            <option value="O">Sal&oacute;n de arte</option>
                            <option value="J">Sal&oacute;n de espejos</option>
                            <option value="S">Squash</option>
                            <option value="N">Tenis de Mesa</option>
                            <option value="V">Voleivol</option>
                          </select>
                        </td>
                      </tr>
                      <tr> 
                        <td width="29%" >&nbsp;</td>
                        <td width="33%" valign="bottom">&nbsp;</td>
                        <td width="38%" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp; 
                          </font></td>
                      </tr>
                      <tr> 
                        <td colspan="3">
                           <br> <p align ="center">
                            <input type="submit" name="Submit" value="Consultartar Reserva" onClick="javascript: return validar();"> </p><br>
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
    <p>&nbsp;</p>
		  <HR>


		  </td>
        </tr>
      </table>
    </td>
    <td background="img/portal_r2_c4.jpg" style="background-repeat:repeat-y" width="10">&nbsp;</td>
  </tr>
  <tr>
    <td width="15"><img name="portal_r3_c1" src="img/portal_r3_c1.jpg" width="15" height="100" border="0" id="portal_r3_c1" alt="" /></td>
    <td colspan="3" background="img/portal_r3_c2.jpg"><img src="img/osiris.gif" width="148" height="54" align="right"></td>
    <td width="10"><img name="portal_r3_c4" src="img/portal_r3_c4.jpg" width="20" height="100" border="0" id="portal_r3_c4" alt="" /></td>
  </tr>
</table>
    <br>
</body>
</html>
