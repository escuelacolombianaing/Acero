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
 String param = request.getParameter("param");
 long valp = 0, valf = 0, valm = 0 ;
 int estad = 0;
 int par = -1 ;
 String idest = "", pacad = "", men = "", tipe = "", upc = "", dd = "", ap = "", pcon = "", cad = "", pp = "", aa = "", ppa = "", perp = "";
 
 BDCertificados est = new BDCertificados();

if (param.equals("0")){
  idest = request.getParameter("idest");
  sesion = request.getSession(false);

  } else if (param.equals("1")){
   idest = session.getAttribute("idest").toString();
   }

 //===================
  if (idest == null || idest.equals("-1")){
    response.sendRedirect("PortalCertific");
    par = -1 ; }


 configECI cfgEci = new configECI();
 pacad = cfgEci.getPeriodoActual();

 Vector an = new Vector();
 Vector obs = new Vector();
 Vector ord = new Vector();
 Vector certg = new Vector();
 String acta = "", nrsec = ""; 
 Vector ordERP = new Vector();
 Vector ConcERP = new Vector();
 Vector NrOrdenes = new Vector();
 Vector NuOrden = new Vector() ;
 Vector estud = est.getInfCertestud(idest);         
 Vector anot = est.getInfAnot(idest);
 Vector observ = est.getInfObs(idest);
 Vector orden = est.getInfOrd(idest);
 Vector cert = est.getInfCert(idest);
 Vector estEstud = est.getInfEstE(idest, pacad);
 //===Datos ERP
 Vector Dorden = est.getInfPagERP(idest);

 sesion.setAttribute("idest", idest);

  if(estEstud.size() > 0){ 
     nrsec =  (String) estEstud.elementAt(0);
     acta = (String) estEstud.elementAt(3);
     estad = Integer.parseInt((String) estEstud.elementAt(1));
     tipe = (String) estEstud.elementAt(4);
     if (estEstud.elementAt(2).equals("No disponible"))
         valp = 0 ;
     else
         valp = Long.parseLong((String) estEstud.elementAt(2));
    }
//======validar tipo estudiante
  if (estad < 0 && tipe.equals("P")){
    response.sendRedirect("PortCertificPosg?param=1");
    //par = -1 ;
  }
//======

//======
//Sacar último periodo cursado
Vector percur = est.getInfPerCur(idest); 
if(percur.size() > 0){ 
    upc = percur.elementAt(0).toString();
    ap = upc.substring(0, 4); //******
    dd = upc.substring(5, 6);
    if (dd.equals("I")) {
        pcon = ap+"-"+"2";
        //Busco si hay registros para este periodo
        Vector pcurs = est.getInfUPerC(idest, pcon) ;      
        if (pcurs.size() > 0 ) {
            upc = pcon ;
            }
    }
}
//======

 if (estad == 0)
     men = "";
  else if(estad < 0 && tipe.equals("P") )
     men = "ESTUDIANTE DE POSGRADO.";
 else if(nrsec.equals("No disponible") && estad < 0 )
     men = "ESTUDIANTE NUEVO NO HA FIRMADO ACTA, Y ESTADO NO VALIDO EN REGISTRO.";
 else if(nrsec.equals("No disponible"))
      men = "ESTUDIANTE NO TIENE GENERADO NUMERO DE ACTA." ;
 else if(estad < 0)
      men = "ESTADO DEL ESTUDIANTE NO VALIDO EN REGISTRO O NO HAY PAGO REGISTRADO." ;
 else if (valp <= 0)
      men = "NO SE ENCUENTRA PAGO REGISTRADO PARA EL PERIODO ACTUAL." ;
 else if(acta.equals("No disponible"))
      men = "ESTA PENDIENTE LA RENOVACION DE MATRICULA PARA EL PERIODO ACTUAL." ;
 
 if(estud.size() > 0){
    par = 1 ; 
    } else {par = 0 ;}

 if (idest==null)
  par = -1;
 
   %>
<html>
    <head>
        
   
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>CERTIFICACIONES</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
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
            <fieldset><legend class="textocom"><strong>Resultados:&nbsp;&nbsp;<font color="#FF3366">
            <%=men%></font></strong><font color="#FF3366"></font></legend> 
            <form name="form1" method="post" action="">		  
		  <table width="100%" border="1">
                    <tr> 
                      <td width="7%" bgcolor="#336699"> 
                        <div align="right"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">C&oacute;digo:</font></b></div>
                      </td>
                      <td width="9%" bgcolor="#FFFFFF"> 
                        <div align="left"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=estud.elementAt(0)%></font></b></div>
                      </td>
                      <td width="11%" bgcolor="#336699"> 
                        <div align="right"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Cedula:</font></b></div>
                      </td>
                      <td width="15%" bgcolor="#FFFFFF"> 
                        <div align="left"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=estud.elementAt(1)%></font></b></div>
                      </td>
                      <td width="6%" bgcolor="#336699"> 
                        <div align="right"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Nombre:</font></b></div>
                      </td>
                      <td colspan="3" bgcolor="#FFFFFF"> 
                        <div align="left"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=estud.elementAt(2)%></font></b></div>
                      </td>
                    </tr>
                    <tr> 
                      <td width="7%" bgcolor="#336699"> 
                        <div align="right"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Ponderado:</font></b></div>
                      </td>
                      <td width="9%" bgcolor="#FFFFFF"> 
                        <div align="left"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=estud.elementAt(4)%></font></b></div>
                      </td>
                      <td width="11%" bgcolor="#336699"> 
                        <div align="right"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Ult. 
                          Per&iacute;odo:</font></b></div>
                      </td>
                      <td width="15%" bgcolor="#FFFFFF"> 
                        <div align="left"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=upc%></font></b></div>
                      </td>
                      <td width="6%" bgcolor="#336699"> 
                        <div align="right"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Programa:</font></b></div>
                      </td>
                      <td width="33%" bgcolor="#FFFFFF"> 
                        <div align="left"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=estud.elementAt(6)%></font></b></div>
                      </td>
                      <td width="5%" bgcolor="#336699"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Estado:</font></b></td>
                      <td width="14%" bgcolor="#FFFFFF"> 
                        <div align="left"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=estud.elementAt(3)%></font></b></div>
                      </td>
                    </tr>
                  </table>
				  <br>
                <table width="100%" border="1">
                  <tr bgcolor="#336699"> 
                    <td colspan="3"> 
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF"><b>Anotaciones</b></font></div>
                    </td>
                  </tr>
                  <tr> 
                    <td width="12%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Per_Acad</b></font></td>
                    <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Anotaci&oacute;n</b></font></td>
                    <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Descripci&oacute;n</b></font></td>
                  </tr>
                  <% for ( int m = 0 ; m < anot.size() ; m++ ){
                        an = (Vector)anot.elementAt(m) ;
               %>
                  <tr valign="top" bgcolor="#FFFFFF"> 
                    <td width="12%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=an.elementAt(0)%></font></td>
                    <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=an.elementAt(1)%></font></td>
                    <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=an.elementAt(2)%></font></td>
                  </tr>
                  <%}%>
                </table>
				<br>
				<table width="100%" border="1">
                  <tr bgcolor="#336699"> 
                    <td colspan="3"> 
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF"><b>Observaciones</b></font></div>
                    </td>
                  </tr>
                  <tr> 
                    <td width="12%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Per_Acad</b></font></td>
                    <td width="42%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">T&iacute;tulo</font></b></td>
                    <td width="46%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Observaci&oacute;n</font></b></td>
                  </tr>
                  <% for ( int n = 0 ; n < observ.size() ; n++ ){
                        obs = (Vector)observ.elementAt(n) ;
               %>
                  <tr valign="top" bgcolor="#FFFFFF"> 
                    <td width="12%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=obs.elementAt(0)%></font></td>
                    <td width="42%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=obs.elementAt(1)%></font></td>
                    <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=obs.elementAt(2)%></font></td>
                  </tr>
                  <%}%>
                </table>
				<br>
				<table width="70%" border="1" align="center">
                  <tr bgcolor="#336699"> 
                    <td colspan="4"> 
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF"><b>Ordenes 
                        de Matr&iacute;cula</b></font></div>
                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Periodo</font></td>
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Orden</font></td>
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Val. Matrícula</font></td>
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Val. 
                      Pagado</font></td>
                  </tr>
                  <% for ( int l = 0 ; l < orden.size() ; l++ ){
                        ord = (Vector)orden.elementAt(l) ;
               %>
                  <tr bgcolor="#FFFFFF"> 
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=ord.elementAt(0)%></font></td>
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=ord.elementAt(1)%></font></td>
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=ord.elementAt(2)%></font></td>
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=ord.elementAt(3)%></font></td>
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
                      //Verifico que este pagada y si el valor pagado es menor al vor de la matricula, busco conceptos que se deban sumar
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
                                            if (ConcERP.elementAt(2).equals("1")) //==Se verifica que el concepto sume
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
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=pp%></font></td>
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=ordERP.elementAt(1)%></font></td>
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=ordERP.elementAt(5)%></font></td>
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=valf%></font></td>

                  </tr>
                  <%valm = 0; valf = 0;
                  ppa = pp ;
                          } //if comparacion periodos
                       } //for
                    }

                    %>
                </table>
				<br>
				
              <table width="70%" border="1" align="center">
                <tr bgcolor="#336699"> 
                  <td colspan="3"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF"><b>Certificados 
                      Generados</b></font></div>
                  </td>
                </tr>
                <tr bgcolor="#FFFFFF"> 
                  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Nro. Certificado</font></td>
                  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tipo. Certificado</font></td>
                  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Fecha</font></td>
                </tr>
                <% for ( int r = 0 ; r < cert.size() ; r++ ){
                        certg = (Vector)cert.elementAt(r) ;
               %>
                <tr bgcolor="#FFFFFF"> 
                  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=certg.elementAt(0)%></font></td>
                  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=certg.elementAt(1)%></font></td>
                  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=certg.elementAt(2)%></font></td>
                </tr>
                <%}%>
              </table>				  
				  </form>
		        </fieldset>
        <%} else if (par == 0){%>
            <p align="center"><b>No existe informaci&oacute;n para este estudiante.</b></p>
        <%}%>
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
