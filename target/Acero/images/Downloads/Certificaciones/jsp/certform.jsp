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
 String idest, cad = "", pp = "", aa = "", ppa = "", perp = "";
 long valf = 0, valm = 0;

 if (param. equals("0"))
    idest = request.getParameter("idest");
 else
    idest = session.getAttribute("idest").toString();
 BDCertificados est = new BDCertificados();
 Vector inf = new Vector() ;
 Vector ord = new Vector();
 Vector ordERP = new Vector();
 Vector ConcERP = new Vector();
 Vector NrOrdenes = new Vector();
 Vector NuOrden = new Vector() ;
 Vector orden = new Vector() ;
Vector Dorden = new Vector() ;
 String Inicio = "Inicio";
 int par = -1, l = 0 ;
 

      orden = est.getInfOrd(idest);
 
 inf = est.getInfCertestud(idest);

 //===Datos ERP
  

  if (idest.equals("2086541")){// borrar cuando lo solicite carlos, se tiene la ocndicion por que el estudiante no ha pagado matricula 2018-2, pero igua puede generar certofocardo menores a 2018-2
      Dorden = est.getInfPagERP_quitar(idest);
 }else{
    Dorden = est.getInfPagERP(idest);
 }
     if (inf.size() > 0)
    par = 1 ;
 else
    par = 0 ;
//String text = 'null';
  
//String text = 'null';
  if (idest == null || idest.equals("-1")){
    par = -1;
    response.sendRedirect("PortalCertific");
    }
 else   //==Validar si es posgrado
 if (inf.elementAt(7).equals("P")) {
     par = 2 ;
 }
 //else
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
          <form name="form1" id="form1" method="post" action="CertFormaliza">      
              <div align="center"></div>
              <table width="69%" border="1" bordercolor="#336699" align="center">
                <tr bgcolor="#336699"> 
                  <td colspan="2" height="24"> 
                    <div align="center"><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">CONSTANCIA 
                      PARA FORMALIZACION DE MATRICULA</font></b></div>
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
                  <td colspan="2" height="14"> <font face="Arial, Helvetica, sans-serif"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Con 
                    semestre y Cred.: 
                    <input type="checkbox" name="sem" value="1">
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;</font></b></font> </td>
                </tr>
                <tr bgcolor="#CCCCCC"> 
                  <td colspan="2" height="14"> 
                    <table width="53%" border="1" align="center">
                      <tr bgcolor="#336699"> 
                        <td colspan="4"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF"><b>Ordenes 
                            de Matr&iacute;cula</b></font></div>
                        </td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="35%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Periodo</b></font></td>
                        <td width="17%">&nbsp;</td>
                        <td width="36%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Val. 
                          Pagado</b></font></td>
                        <td width="12%">&nbsp;</td>
                      </tr>
                      <% for ( l = 0 ; l < orden.size() ; l++ ){
                        ord = (Vector)orden.elementAt(l) ;
               %>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="35%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                          <input type="text" name="vper<%=l%>" maxlength="10" size="10" value = "<%=ord.elementAt(0)%>" readonly="readonly">
                          </font></td>
                        <td width="17%"> 
                          <input type="checkbox" name="per<%=l%>" value="1">
                        </td>
                        <td width="36%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                          <input type="text" name="vpag<%=l%>" maxlength="15" size="15" value = "<%=ord.elementAt(3)%>" readonly="readonly">
                          </font></td>
                        <td width="12%"> 
                          <input type="checkbox" name="val<%=l%>" value="1">
                        </td>
                      </tr>
                      <%}%>
                  <% if (Dorden.size() > 0) { //Imprimir pagos que tenga en el ERP
                      ppa = "";
                    for ( int r = 0 ; r < Dorden.size() ; r++ ){
                      ordERP = (Vector)Dorden.elementAt(r) ;
                      pp = ordERP.elementAt(0).toString();
                      perp = pp ;
                      cad = pp.substring(5,6);
                      aa = pp.substring(0, 4);
                      if (cad.equals("0"))
                          pp = aa + "-I" ;
                      //==Verificar si se tiene mas de una orden para el mismo periodo
                     if (!pp.equals(ppa)) {
                      NrOrdenes = est.getInfNroOrdenes(idest, perp);
                      if (NrOrdenes.size()>0){
                          for ( int or = 0 ;or < NrOrdenes.size() ; or++ ){
                            NuOrden = (Vector)NrOrdenes.elementAt(or) ;
                              if(NuOrden.elementAt(3).equals("1")){
                                 valm = valm + Long.parseLong((String) NuOrden.elementAt(2));
                                 valf = valf + Long.parseLong((String) NuOrden.elementAt(1));
                                if (valf < valm){ //==Busco conceptos
                                     Vector ConOrd = est.getInfConcERP(NuOrden.elementAt(0).toString());
                                     if(ConOrd.size() > 0){
                                       for ( int p = 0 ; p < ConOrd.size() ; p++ ){
                                            ConcERP = (Vector)ConOrd.elementAt(p) ;
                                            if (ConcERP.elementAt(2).equals("1"))
                                                if(!ConcERP.elementAt(0).equals("No disponible")){
                                                    valf = valf + Long.parseLong((String) ConcERP.elementAt(0)) ;
                                                    }
                                            }
                                         }

                                    }
                                } //if ind_pago = 1
                            }//for NrOrdenes
                          } //if NrOrdenes.size
                         
                        %>
                      <tr bgcolor="#FFFFFF">
                        <td width="35%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                          <input type="text" name="vper<%=l%>" maxlength="10" size="10" value = "<%=pp%>" readonly="readonly">
                          </font></td>
                        <td width="17%">
                          <input type="checkbox" name="per<%=l%>" value="1">
                        </td>
                        <td width="36%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                           <input type="text" name="vpag<%=l%>" maxlength="15" size="15" value = "<%=valf%>" readonly="readonly">
                          </font></td>
                        <td width="12%">
                          <input type="checkbox" name="val<%=l%>" value="1">
                        </td>
                      </tr>
                       <%//}if ind_pago = 1%>
                 <%  l = l + 1 ;
                 valm = 0; valf = 0;
                   ppa = pp ;
                          } //if comparacion periodos
                 }
                    }
                      %>
                    </table>
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
            <p align="center"><font color="#990000"><b>No existe informaci&oacute;n para este estudiante.</b></font></p>
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
