<%@ include file="secure.jsp" %>
<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDCertificados" %>
<%@ page import="configuracion.configECI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <%response.setHeader("Cache-Control","no-cache");
String carnet = session.getAttribute("idest").toString();
//String carnet = request.getParameter("idest");
BDCertificados est = new BDCertificados();
Vector inf = new Vector() ;
Vector estud = new Vector() ;
Vector pa= new Vector() ;
String doc = "", ident = "", senor = "", cadena = "", sol, otro, solic = "", elab = "", credvis = "", credtot = "", CambioPl ="";
String text = "", sem, valor, matric="", estu= "", pacad = "";
//sol = session.getAttribute("sol").toString();
sol = request.getParameter("sol");
//otro = session.getAttribute("otro").toString();
otro = request.getParameter("otro");
//elab = session.getAttribute("elabora").toString();
elab = request.getParameter("elab");
//sem = session.getAttribute("sem").toString();
sem = request.getParameter("sem");
if (sem == null)
    sem = "0" ;
String Inicio = "Inicio", acred = "", periodo = "", per = "";
String anterior = "PortalCertific", a = "", res = "";
String mess[] = new String[12], dia = "", annio = "", tsem = "", cadena1 = "";
String sec = new String(""), nper= "", nval = "", cp = "", cval = "", vcp = "", vcval = "", cod_progam = "";
int longdoc, mod, div, n, i, x = 0, nsem = 0, cv = 0 , ct = 0, porcent = 0, reg = 0, ban = 0, mes = 0, pp = 0;
int nf = Integer.parseInt(request.getParameter("nfilas")) ;
double  porc = 0;
String arreglo[] = new String[3], cadt = "", vp = "",vv = "", vvp = "", vvv= "";
int longi, mod1, div1, n1, i1;

//Variables de las ordenes
int contp = 0, difp = 0, difv = 0, contv = 0, cper= 0, cvalr = 0 ;
//==verificar cuantos periodos se seleccionaron
      for (pp = 0; pp < nf; pp++) {
            cp = "per" + String.valueOf(pp) ;
            cval = "val" + String.valueOf(pp) ;
            vcp = request.getParameter(cp);
            vcval = request.getParameter(cval) ;
            if (vcp != null)
                contp++;
            if (vcval != null)
                contv++;
            }
            cp = ""; cval = ""; vcp = ""; vcval = "" ;

      for (pp = 0; pp < nf; pp++) {
            //dif = nf - cont ;
            cp = "per" + String.valueOf(pp) ;
            cval = "val" + String.valueOf(pp) ;
            vcp = request.getParameter(cp);
            vcval = request.getParameter(cval) ;
            if (vcp == null)
                vcp = "0";
            if (vcval == null)
                vcval = "0";
           if (vcp.equals("1") ) {
                cper++;
                difp = contp - cper ;
                vp = "vper" + String.valueOf(pp) ;
                //vv = "vpag" + String.valueOf(pp) ;
                vvp = request.getParameter(vp) ;
               // vvv = request.getParameter(vv) ;
                if (contp == 1 && contv == 0)
                    cadt = cadt + "período académico " + vvp + ".";
                else if (contp == 1)
                   if(contp ==1 && contv == 1)
                        cadt = cadt + "período académico " + vvp + ",";
                   else
                        cadt = cadt + "período " + vvp + ",";
                else if (difp == 0 && contv == 0) 
                    cadt = cadt + " y período " + vvp + ".";
                else if(difp == 0)
                    cadt = cadt + " y período " + vvp + ",";
                else
                    cadt = cadt + " período " + vvp + ",";

            }
            cadena1 = "" ;
           if (vcval.equals("1") ) {
                cvalr++;
                difv = contv - cvalr ;
                vv = "vpag" + String.valueOf(pp) ;
                vvv = request.getParameter(vv) ;
                //Coloco los puntos al valor pagado
                    String str1= vvv;
                    longi = str1.length();
                    mod1 = longi%3;
                    div1 = longi/3;                    
                    String subStr1=str1.substring(0,mod1);
                    if (!subStr1.equals(""))
                        cadena1 = subStr1 + ".";
                    n1 = mod1;
                    //i1 = 4 ;
                    i1 = n1 + 3 ;
                    for(int jj = 1; jj <= div1; jj++) {
                        subStr1=str1.substring(n1,i1);
                        if(jj == div1){
                            cadena1 = cadena1 + subStr1 ;}
                        else{
                            cadena1 = cadena1 + subStr1 + ".";
                            }
                       n1 = n1 + 3 ;
                       i1 = i1 + 3;
                        }
                        cadena1 = cadena1 + ".oo" ;
                        vvv = cadena1 ; //hasta aca coloca puntos
                if(difv == 0)
                    cadt = cadt + " valor $" + vvv + ".";
                else if(difv == 1)
                    cadt = cadt + " valor $" + vvv ;
                else
                  cadt = cadt + " valor $" + vvv + ", ";
            }
            //cadt = "Período " + vcp + vcval;
        }

//Verificar si el etsudiante se encuentra en el plan activo
Vector Cplan = est.getCmabioPlan(carnet);
if (Cplan.size() > 0){
    CambioPl = (String) Cplan.elementAt(0) ;
   }
//Vector estud = est.getInfCertestud(carnet);
estud = est.getInfCertifestudA(carnet);
//Creditos vistos y aprobados
Vector credv = est.getInfCredvis(carnet,CambioPl);
if (credv.size() > 0){
   //credvis = (Vector)credv.elementAt(0);
    credvis = (String) credv.elementAt(0) ;
   if(!credvis.equals("No disponible")) {
     cv = Integer.parseInt((String) credvis);
   }}
//==========================
//BdCertificados bdCert = new BdCertificados();
configECI cfgEci = new configECI();
//bdCert.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
//sec = bdCert.sigSecuencia("SEC_CERTIFIC");
sec = est.Secuencia("SEC_CERTIFIC");
//sec = bdCert.Secuencia("SEC_CERTIFIC");
//bdCert.desconectar();
int lseg = sec.length();
if (lseg == 1)
    sec = "0000" + sec ;
else if (lseg == 2)
    sec = "000" + sec ;
else if (lseg == 3)
    sec = "00" + sec ;
else if (lseg == 4)
    sec = "0" + sec ;

if(estud.size() > 0){
    ban = 1 ;
    for ( int k = 0 ; k < estud.size() ; k++ ){
       inf = (Vector)estud.elementAt(k) ;
      }

//Creditos totales del plan individual
Vector credt = est.getInfCredtot(carnet,CambioPl);
if (credt.size() > 0){
   credtot = (String)credt.elementAt(0);
   if (credtot.equals("No disponible"))
       ct = 0 ;
   else
        ct = Integer.parseInt((String) credtot);}
//Calcula porcentaje de creditos vistos
if(cv > 0 && ct > 0){
 //porc = (cv*100)/ct ;
porc =Math.rint(cv*100)/ct ;
porc = Math.round(porc) ;
//String por =  String.valueOf(porc) ;
porcent = (int) Math.floor(porc);


//cv = Integer.parseInt((String) credvis.elementAt(0));
}

//Calculamos la fecha

  mess[0]  = "enero";
  mess[1]  = "febrero";
  mess[2]  = "marzo";
  mess[3]  = "abril";
  mess[4]  = "mayo";
  mess[5]  = "junio";
  mess[6]  = "julio";
  mess[7]  = "agosto";
  mess[8]  = "septiembre";
  mess[9]  = "octubre";
  mess[10] = "noviembre";
  mess[11] = "diciembre";

	   Calendar c = new GregorianCalendar();
	   dia = Integer.toString(c.get(Calendar.DATE));
	   mes = (c.get(Calendar.MONTH));
	   annio = Integer.toString(c.get(Calendar.YEAR));

//Validacion para Biomedica           
if (inf.elementAt(12).equals("268")){
    cod_progam = ", ofrecido conjuntamente por la UNIVERSIDAD DEL ROSARIO y";}
else {cod_progam = " de";}

           
//Texto de semestre

if (inf.elementAt(10).equals("1")){
    tsem = "primer";}
else if (inf.elementAt(10).equals("2"))   {
    tsem = "segundo";
    }
else if (inf.elementAt(10).equals("3"))   {
    tsem = "tercer";
    }
else if (inf.elementAt(10).equals("4"))   {
    tsem = "cuarto";
    }
else if (inf.elementAt(10).equals("5"))   {
    tsem = "quinto";
    }
else if (inf.elementAt(10).equals("6"))   {
    tsem = "sexto";
    }
else if (inf.elementAt(10).equals("7"))   {
    tsem = "séptimo";
    }
else if (inf.elementAt(10).equals("8"))   {
    tsem = "octavo";
    }
else if (inf.elementAt(10).equals("9"))   {
    tsem = "noveno";
    }
else if (inf.elementAt(10).equals("10"))   {
    tsem = "décimo";
    }

if (inf.elementAt(4).equals("M")){
    //senor = "el estudiante";
    senor ="el señor";
    ident = "identificado";
    matric = "matriculado";
    estu = "el mencionado señor";}
 else if(inf.elementAt(4).equals("F") && inf.elementAt(5).equals("S")){
    //senor ="la estudiante";
    senor ="la señorita";
    ident = "identificada";
    matric = "matriculada";
    estu = "la mencionada señorita";}
 else if(inf.elementAt(4).equals("F") && inf.elementAt(5).equals("C")){
    //senor ="la estudiante";
    senor ="la señora";
    ident = "identificada";
    matric = "matriculada";
    estu = "la mencionada señora";
 }
 else if(inf.elementAt(4).equals("F") ){
    //senor ="la estudiante";
    senor ="la señorita";
    ident = "identificada";
    matric = "matriculada";
    estu = "la mencionada señorita";}

if(sol.equals("1")){
    if (inf.elementAt(4).equals("M")){
        solic = "del interesado";
        }
    else if (inf.elementAt(4).equals("F")){
        solic = "de la interesada";
        }
    }
if(sol.equals("2")){
    solic = "de " + otro ;
}

if (inf.elementAt(9).toString().equals("C")){
    doc = "C.C. No.";

//Claculo longitud de documento y coloco los puntos
String str= inf.elementAt(1).toString();
longdoc = str.length();
mod = longdoc%3;
div = longdoc/3;
//String str="El lenguaje Java";
String subStr=str.substring(0,mod);
if (!subStr.equals(""))
    cadena = subStr + ".";
n = mod;
//i = 4 ;
i = n + 3 ;
for(int j = 1; j <= div; j++) {
	subStr=str.substring(n,i);
    if(j == div){
        cadena = cadena + subStr ;}
    else{
        cadena = cadena + subStr + ".";
        }
   n = n + 3 ;
   i = i + 3;
    }
  } else if (inf.elementAt(9).toString().equals("T")) {
  doc = "T.I. No.";
  cadena = inf.elementAt(1).toString();
  }else if (inf.elementAt(9).toString().equals("P")) {
  doc = "Pasaporte No.";
  cadena = inf.elementAt(1).toString();
  }else if (inf.elementAt(9).toString().equals("E")) {
  doc = "C.E. No.";
  cadena = inf.elementAt(1).toString();
  }
    nsem = Integer.parseInt((String) inf.elementAt(10));
    otros.n2t numero = new otros.n2t();

    per = inf.elementAt(11).toString();
    a = per.substring(0, 4);
    String p = per.substring(5, 6);


    if(p.equals("1"))
        periodo = "primer período académico";
    else if(p.equals("2"))
        periodo = "segundo período académico";
    else if(p.equals("I"))
        periodo = "período intersemestral";

   // int topag = return oNumero(12345);

//Colocar los puntos al valor de la matricula

//Se verifica si el progrma tiene acreditación de alta calidad
if (!inf.elementAt(8).toString().equals("")){
   String regcal=inf.elementAt(8).toString().substring(0,10);
    if (inf.elementAt(8).toString().equals("No disponible") || inf.elementAt(8).toString().equals("")){
        acred= "";
    } else if(regcal.equals("En proceso")){
       acred = ". " + inf.elementAt(8).toString() ;
    } else
       acred = " y Acreditación de Alta Calidad según " + inf.elementAt(8).toString() +" emanada del Ministerio de Educación Nacional" ;
}

}
   %>
<html>
    <head>
        
   
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>CERTIFICACIONES</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {

                if(document.form1.idest.value == ""){
                    alert("Por favor digite el código a consultar");
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
              <%if (ban == 1) {%>
              <!--<form name="form1" id="form1" method="post" action="">-->
			  <form name="formulario" method="POST" action="GenPdfForm" target="_blank">
              <div align="center"></div>
              <table width="80%" border="0" align="center">
                <tr>
                  <td>SGSE -
                    <input type="text" name="sec" value="<%=sec%>">
                  </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>
                    <input type="texto" name="fecha" value="Bogot&aacute;, <%=dia%> de <%=mess[mes]%> de <%=annio%>" size="40">
                  </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>
                    <p>
                      <center>
                        <textarea name="texto1" cols="110" rows="5">Que el programa <%=inf.elementAt(2)%><%=cod_progam%> la ESCUELA COLOMBIANA DE INGENIERÍA - Julio Garavito, con Registro Calificado según <%=inf.elementAt(7)%><%=acred%>, está registrado ante el Sistema Nacional de Información de la Educación Superior - SNIES - bajo el código No. <%=inf.elementAt(6)%>.
           </textarea>
                      </center>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>
                      <center>
                       <% if (contp == 1){%>
                        <textarea name="texto2" cols="110" rows="5">Que <%=senor%> <%=inf.elementAt(0)%>, <%=ident%> con <%=doc%> <%=cadena%>, estudiante del programa de <%=inf.elementAt(2)%>, formalizó su matrícula para el <%=cadt%>
          				 </textarea>
                       <%}else{%>
                        <textarea name="texto2" cols="110" rows="5">Que <%=senor%> <%=inf.elementAt(0)%>, <%=ident%> con <%=doc%> <%=cadena%>, estudiante del programa de <%=inf.elementAt(2)%>, formalizó matrícula durante los siguientes períodos académicos: <%=cadt%>
          				 </textarea>
                       <%}%>
                      </center>
                    </p>
                  </td>
                </tr>

                <tr>
                  <td>
                    <p>
                      <center>
                 <%if (!sem.equals("1")){ %>
                        <textarea name="texto3" cols="110" rows="3">Que <%=senor%> cursó según el Reglamento Estudiantil de la Institución el <%=tsem%> semestre académico.
                </textarea>
                        <%}else{%>
                        <textarea name="texto3" cols="110" rows="5">Que <%=senor%> ha aprobado <%=credvis%> créditos académicos de un total de <%=credtot%> créditos académicos de su plan de estudios, equivalentes al <%=porcent%> por ciento del programa de <%=inf.elementAt(2)%> y cursó según el Reglamento Estudiantil de la Institución el <%=tsem%> semestre académico.
                </textarea>
                        <%}%>
                      </center>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>         <p>
            <center>
                        <textarea name="texto4" cols="110" rows="3">Que la presente constancia se expide a solicitud <%=solic%>.
           </textarea>
            </center>
          </p></td>
                </tr>
              </table>
              <table align="center" width="430">
                <tr>
            <td height="33" width="24">
              <input type="radio" checked name="opcion" value="1">
            </td>
            <td height="33" width="10">&nbsp;</td>
            <td height="33" colspan="4" width="348">
             <div align="left"><b><font color="#990000">Ver Certificado y Grabar Información</font></b>
              </div>
            </td>
          </tr>
          <tr>
            <td height="33" width="24">
              <input type="radio" checked name="opcion" value="2">
            </td>
            <td height="33" width="10">&nbsp;</td>
            <td height="33" colspan="4" width="348"><b><font color="#990000">Solo ver Certificado</font></b>
            </td>
          </tr>
        </table>
		      <center><br>
                <input type="hidden" name="elab" value="<%=elab%>">
                <input type="hidden" name="sem" value="<%=sem%>">
                <input type="hidden" name="tipoc" value="3">
                <input type="hidden" name="iprom" value="0">
                <input name="submit" type="submit" value="Generar PDF">
                 <!--<input type="submit" name="Submit" value="Enviar Datos" onclick="javascript: return enviar()">-->
              </center>
            </form>
                           <p>&nbsp;</p>
             <%} else {%>
             <center><p>No existe Información para este estudiante en el período: <%=per%></p></center>
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
