<%@ include file="secure.jsp" %>
<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDCertificados" %>
<%@ page import="configuracion.configECI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <%response.setHeader("Cache-Control","no-cache");
 HttpSession sesion;
 sesion = request.getSession(true);
 String usu = session.getAttribute("nomusr").toString();
 String idusu = session.getAttribute("idusr").toString();
 String sesid = session.getAttribute("sesid").toString();
 //String idest = session.getAttribute("idest").toString();
 String param = request.getParameter("param");
 String idest;
 if (param. equals("0"))
    idest = request.getParameter("idest");
 else
    idest = session.getAttribute("idest").toString();
  BDCertificados est = new BDCertificados();

 Vector inf = new Vector() ;
 Vector ord = new Vector();

 String Inicio = "Inicio";
 int par = -1, l = 0 ;
//Vector orden = est.getInfOrd(idest);

Vector estud = est.getInfCertestud(idest);
 

 if(estud.size() > 0){
    par = 1 ;
    for ( int k = 0 ; k < estud.size() ; k++ ){
       //inf = (Vector)estud.elementAt(k) ;
        inf = estud ;
    }
    } else {par = 0 ;}

//String text = 'null';
  if (idest == null || idest.equals("-1")){
    par = -1;
    response.sendRedirect("PortalCertific");
    }
     else   //==Validar si es posgrado
     if (inf.elementAt(7).equals("P")) {
         par = 2 ;
     }
 sesion.setAttribute("idest", idest);
 /*if (par.equals("1")){
  men = "Correcto";
 }*/
   %>
<html>
    <head>
      
   
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>CERTIFICACIONES</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
		
       <script language="JavaScript" type="text/JavaScript">
            <!--
           function cambiarDisplay(id) {
  if (!document.getElementById) return false;
  fila = document.getElementById(id);
  if (fila.style.display != "none") {
    fila.style.display = "none"; //ocultar fila 
  } else {
    fila.style.display = ""; //mostrar fila 
  }
}
 //-->
 </script>
 <script type="text/javascript">
     function MostrarFilas(Fila) {
         if(document.form1.tipoc.value=="02"){
         var elementos = document.getElementsByName(Fila);
         for (i = 0; i< elementos.length; i++) {
             //var visible = 'block'
               var visible = 'table-row';
             /*if(navigator.appName.indexOf("Microsoft") > -1){
                 var visible = 'block'        }
             else {               var visible = 'table-row';
             }*/	elementos[i].style.display = visible;
         }
         }//if
     else{ 
         var elementos = document.getElementsByName(Fila);
         for (k = 0; k< elementos.length; k++) {
             elementos[k].style.display = "none";
         }
     }
     }

     function OcultarFilas(Fila) {
         var elementos = document.getElementsByName(Fila);
         for (k = 0; k< elementos.length; k++) {
             elementos[k].style.display = "none";
         }
     }
</script>
<script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {           
                if (!document.form1.cred[0].checked && !document.form1.cred[1].checked &&!document.form1.cred[2].checked ){
                    alert("Debe seleccionar periodo para la Constancia.");
                    return false;
                }             

                //if (!document.form1.sol[0].checked && !document.form1.sol[1].checked){
                   // alert("Debe seleccionar quien hace la solicitud.");
                    //return false;
               // }

            }

            function convertTildes(str) {
                var out = "", flag = 0;
                for (i = 0; i < str.length; i++) {
                    if ((str.charAt(i)!="í") && (str.charAt(i)!="á") && (str.charAt(i)!="é") && (str.charAt(i)!="ó") && (str.charAt(i)!="ú")
                        && (str.charAt(i)!="Á") && (str.charAt(i)!="É") && (str.charAt(i)!="Í") && (str.charAt(i)!="Ó") && (str.charAt(i)!="Ú")){
                        out += str.charAt(i);
                        flag = 0;
                    }

                    else {
                        if((flag == 0) && (str.charAt(i)=="í")){
                            out += "í";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="á")){
                            out += "á";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="é")){
                            out += "é";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="ó")){
                            out += "ó";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="ú")){
                            out += "ú";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Á")){
                            out += "Á";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="É")){
                            out += "É";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Í")){
                            out += "Í";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Ó")){
                            out += "Ó";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Ú")){
                            out += "Ú";
                            flag = 1;
                        }
                    }
                }
                return out;
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
      <div align="center"> <strong><font color="#990000" size="4" face="Times New Roman, Times, serif">OFICINA 
        DE REGISTRO - CERTIFICACIONES</font></strong> </div>
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
          <td width="10" valign="top" height="10"> 
            <jsp:include page="menu"> 
            <jsp:param name="" value="" />
            </jsp:include>
          </td>
          <td width="1059" valign="top" height="10">
      <%if (par == 1){%>
          <form name="form1" id="form1" method="post" action="CertGradoPreg">
              <div align="center"></div>
              <table width="69%" border="1" bordercolor="#336699" align="center">
                <tr bgcolor="#336699"> 
                  <td colspan="2" height="24"> 
                    <div align="center"><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">CONSTANCIA 
                      DE GRADO PREGRADO</font></b></div>
                  </td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td width="18%" height="14"> 
                    <div align="right"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Nombre: 
                      </font></b></div>
                  </td>
                  <td width="82%" height="14" bgcolor="#FFFFFF"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=inf.elementAt(2)%> 
                    </font></b> </td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td width="18%" height="14"> 
                    <div align="right"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Programa: 
                      </font></b></div>
                  </td>
                  <td width="82%" height="14" bgcolor="#FFFFFF"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=inf.elementAt(6)%> 
                    </font></b></td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td width="18%" height="14"> 
                    <div align="right"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Documento: 
                      </font></b></div>
                  </td>
                  <td width="82%" height="14" bgcolor="#FFFFFF"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=inf.elementAt(1)%> 
                    </font></b></td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td width="18%" height="14"> 
                    <div align="right"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Carn�: 
                      </font></b></div>
                  </td>
                  <td width="82%" height="14" bgcolor="#FFFFFF"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=inf.elementAt(0)%> 
                    </font></b></td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td width="18%" height="14"> 
                    <div align="right"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Estado: 
                      </font></b></div>
                  </td>
                  <td width="82%" height="14" bgcolor="#FFFFFF"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=inf.elementAt(3)%> 
                    </font></b></td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td width="18%" height="14">&nbsp;</td>
                  <td width="82%" height="14">&nbsp;</td>
                </tr>
                <tr bgcolor="#CCCCCC">
                  <td colspan="2" height="14"> <font face="Arial, Helvetica, sans-serif"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Beca J.G.
                                  <input type="checkbox" name="beca" value="1"> &nbsp;&nbsp;&nbsp;Prom Grado Hist  <input type="checkbox" name="prom" value="1">
                    </font></b></font>
                     </td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td height="14" rowspan="2" valign="top" width="18%"> 
                    <div align="right"><font face="Arial, Helvetica, sans-serif"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Solicitud: 
                      </font></b></font></div>
                  </td>
                  <td height="14" width="82%"> <font face="Verdana, Arial, Helvetica, sans-serif"> 
                    <font size="1"> 
                    <input type="radio" name="sol" value="1" checked>
                    Interesado(a) </font></font> </td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td height="14" width="82%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <input type="radio" name="sol" value="2">
                    otro &nbsp;&nbsp;&nbsp;Cual? 
                    <input type="text" name="otro" maxlength="150" size="50" >
                    </font> </td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td colspan="2" height="14"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Quien 
                    elabora: 
                    <input type="text" name="elab" maxlength="20" value="dmq">
                    </font></b></td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td colspan="2" height="14">&nbsp;</td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td colspan="2" height="14"> 
                    <center>
                      <input type="hidden" name="idest" value="<%=idest%>">
                      <input type="hidden" name="nfilas" value="<%=l%>" />
                      <input type="submit" name="Submit" value="Generar Certificado" onClick="javascript: return validar();">
                    </center>
                  </td>
                </tr>
              </table>
          </form>
         <p>&nbsp;</p>
             <%} else if (par == 2){%>
             <center>
              <p><b><font color="#990000">Este tipo de Certificado
                es para PREGADO y no para POSGRADO</font></b></p>
            </center>
       <%} else if (par == 0){%>
            <p align="center"><b><font color="#990000">No existe informaci&oacute;n para este estudiante.</font></b></p>
        <%}%>
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
