<%@ include file="secure.jsp" %>
<%@ page import="javax.naming.*,javax.rmi.PortableRemoteObject"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%@ page contentType="text/html"%>
<%@ page import="BDatos.BDreservasp"%>
<%@ page import="BDatos.BaseDatos" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
        response.setHeader("Cache-Control", "no-cache");
        HttpSession sesion;
        sesion = request.getSession(true);
//Fecha actual
         BDreservasp bd = new BDreservasp();
   String fecuso = new String(""), dia = new String(""), capac = new String(""),
             descr = new String(""), msj = new String(""), ndia = new String("");
   String  hora = "", req = "", drec = "" ;
   Vector result = new Vector();
 fecuso = request.getParameter("fecha");
 hora =  request.getParameter("hora");
 req = request.getParameter("req");
if (req.equals("L")){
    drec = "Baloncesto";
   } else if(req.equals("S")){
     drec = "Squash";
    } else if(req.equals("V")){
     drec = "Voleibol";
    } else if(req.equals("U")){
     drec = "Futsal";
    } else if(req.equals("I")){
     drec = "Gimnasio";
    } else if(req.equals("O")){
     drec = "Salón de Arte";
    } else if(req.equals("J")){
     drec = "Salón de espejos";
    } else if(req.equals("M")){
     drec = "Sala Múltiple";
    } else if(req.equals("N")){
     drec = "Tenis de mesa";
    }
 Vector reserva = bd.InfReserva(fecuso, hora, req);

%>
<html>
    <head>
        <title>Reservas</title>
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
          <td width="30" valign="top" height="10">
           <jsp:include page="menu">
            <jsp:param name="" value="" />
            </jsp:include>
          </td>
          <td width="1059" valign="top" height="10">
            <table width="855" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
              <tr>
                <td align="center" valign="top">
                    <form name="form1" method="post" action="" onSubmit="return comprueba();" >

                    <table width="97%" border="1" cellspacing="0" cellpadding="0" class="textocom">
                      <tr bgcolor="#990000"> 
                        <td colspan="6">
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">POLIDEPORTIVO</font></b> 
                            </font></div>
                        </td>
                      </tr>
                      <tr> 
                        <td colspan="6">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td colspan="6" height="32">
                          <table width="100%" border="0">
                            <tr>
                              <td width="45%">
                                <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha 
                                  Uso: <%=fecuso%></b></font></div>
                              </td>
                              <td width="55%">
                                <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Recurso 
                                  solicitado: <%=drec%></b></font> </div>
                              </td>
                            </tr>
                          </table>
                          
                        </td>
                      </tr>
                      <tr> 
                        <td width="8%" height="24"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>NumSol</b></font></td>
                        <td width="11%" height="24"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Cod_req</b></font></div>
                        </td>                     
                        <td width="10%" height="24"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Hora 
                          - Sol </b></font></td>
                        <td width="47%" height="24"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Quien 
                            Solicita </b></font></div>
                        </td>                   
                        <td width="24%" height="24"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha_sol</b></font></td>
                      </tr>
                      <%if (reserva.size() > 0 ) {%>
                      <% for ( int m = 0 ; m < reserva.size() ; m++ ){
                         result = (Vector)reserva.elementAt(m) ;

                    %>
                      <tr> 
                        <td width="8%"><%=result.elementAt(0)%></td>
                        <td width="11%"><%=result.elementAt(1)%></td>                       
                        <td width="10%"><%=result.elementAt(3)%> - <%=result.elementAt(6)%></td>
                        <td width="47%"><%=result.elementAt(7)%> </td>                      
                        <td width="24%"><%=result.elementAt(5)%></td>
                      </tr>
                      <%}
                      }%>
                      <tr> 
                        <td width="8%">&nbsp;</td>
                        <td width="11%">&nbsp;</td>
                        <td width="10%" valign="bottom">&nbsp;</td>
                        <td width="47%" valign="bottom">&nbsp;</td>
                        <td width="24%" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp; 
                          </font></td>
                        
                      </tr>
                      <tr> 
                        <td colspan="8"> 
                          <div align="center"> <br>
                            <!--<input type="submit" name="Submit" value="Consultartar Reserva" onClick="javascript: return validar();"> <br>-->
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
