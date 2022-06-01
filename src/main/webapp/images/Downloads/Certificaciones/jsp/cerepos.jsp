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
String doc = "", ident = "", senor = "", cadena = "", sol, otro, solic = "", elab = "";
String matric="", estu= "", pacad = "", mat = "", men = "";
sol = request.getParameter("sol");
//sol = session.getAttribute("sol").toString();
otro = request.getParameter("otro");
//otro = session.getAttribute("otro").toString();
elab = request.getParameter("elabora");
//elab = session.getAttribute("elabora").toString();
String Inicio = "Inicio", acred = "", periodo = "";
String anterior = "PortalCertific", a = "";
String mess[] = new String[12], dia = "", annio = "", tsem = "", cadena1 = "", prog = "", tp = "", tprog = "";
long estado ;

//String remplazado=aRemplazar.replace("a", "");
//otro = otro.replace("Ã¡", "á");

String sec = new String("");
int longdoc, mod, div, n, i, ban = 0, mes = 0, ban1 = 0, lseg = 0, idprog = 0;
String arreglo[] = new String[3];
//========================================================================
//Se verifica si el periodo actual es intermedio y esta haciendo el curso
//========================================================================
Vector peracad = est.getInfPerPos(carnet);

Vector Dorden = est.getInfPagERP(carnet);

if (Dorden.size() > 0) {
    men = "Conecto ERP";
}
if(peracad.size() > 0){
    pacad = (peracad.elementAt(0).toString());
    }
 
 //reg = Integer.parseInt((String) pa.elementAt(1));
 String cad = pacad.substring(5,6);

configECI cfgEci = new configECI();

//==Informacion de programa y estudiante
 estud = est.getInfCertifestudPos(carnet);

//==========================
//BdCertificados bdCert = new BdCertificados();
//bdCert.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
//sec = bdCert.sigSecuencia("SEC_CERTIFIC");
sec = est.Secuencia("SEC_CERTIFIC");
//bdCert.desconectar();
lseg = sec.length();
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
       inf = estud ;
      }

//==Se revisa si es estudiante graduado
estado = Long.parseLong((String) inf.elementAt(11));
if (estado == -100 || inf.elementAt(11).equals("G"))
    ban = 2 ;
else if(estado == -96 || estado == -95 || estado == -94 || estado == -93 || estado == -92 || estado == -91){
    ban = 1; ban1 = 1;}
else { ban = 0; ban1 = 0;}


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


if (inf.elementAt(4).equals("M")){
    //senor = "el estudiante";
    senor = "el señor";
    ident = "identificado";
    matric = "matriculado";
    estu = "el mencionado señor";
    mat = "matriculado";}
 else if(inf.elementAt(4).equals("F") && inf.elementAt(5).equals("S")){
    //senor ="la estudiante";
    senor ="la señorita";
    ident = "identificada";
    matric = "matriculada";
    estu = "la mencionada señorita";
    mat = "matriculada";}
 else if(inf.elementAt(4).equals("F") && (inf.elementAt(5).equals("C") || inf.elementAt(5).equals("U")) ){
    //senor ="la estudiante";
    senor ="la señora";
    ident = "identificada";
    matric = "matriculada";
    estu = "la mencionada señora";
    mat = "matriculada";
 }

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

//Se verifica si es maestria o especializacion
idprog = Integer.parseInt((String) inf.elementAt(14));
prog = inf.elementAt(2).toString();
tprog = prog.substring(0,5);
if(!tprog.equals("MAEST") &&!tprog.equals("DOCTO"))
    tp = "ESPECIALIZACIÓN EN ";

//Claculo longitud de documento y coloco los puntos
String str= inf.elementAt(1).toString();
longdoc = str.length();
mod = longdoc%3;
div = longdoc/3;
//String str="El lenguaje Java";
String subStr=str.substring(0,mod);
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
  doc = "Pasaporte. No.";
  cadena = inf.elementAt(1).toString();}

    String per = pacad;
    a = per.substring(0, 4);
    String p = per.substring(5, 6);

//Valido programas para imprimire el periodo académico
    if(p.equals("1"))
        periodo = "primer período académico";
    else if(p.equals("2"))
        periodo = "segundo período académico";
    else if(p.equals("I"))
        periodo = "período intersemestral";
/*if (idprog == 260 || idprog == 254  || idprog == 109){ //qhse y economia
     if(p.equals("1") || p.equals("2"))
        periodo = "primer período académico";
     else if(p.equals("3") || p.equals("4"))
        periodo = "segundo período académico";
}
else{
    if(p.equals("1"))
        periodo = "primer período académico";
    else if(p.equals("2"))
        periodo = "período intersemestral";
    else if(p.equals("3"))
        periodo = "segundo período académico";
}*/
   // int topag = return oNumero(12345);

//Se verifica si el progrma tiene acreditación de alta calidad
   String regcal=inf.elementAt(8).toString().substring(0,9); // se cambio a 9 por el doctorado
    if (inf.elementAt(8).toString().equals("No disponible") || inf.elementAt(8).toString().equals("No aplica")){
        acred= "";
    } else if(regcal.equals("En proceso")){
       acred = ". " + inf.elementAt(8).toString() ;
    } else
       acred = " y Acreditación de Alta Calidad según " + inf.elementAt(8).toString() +" emanada del Ministerio de Educación Nacional" ;

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
              <%if (ban == 1 || ban1 == 1) {%>
              <!--<form name="form1" id="form1" method="post" action="">-->
			  <form name="formulario" method="POST" action="GenPdfPos" target="_blank">
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
                        <textarea name="texto1" cols="110" rows="5">Que el programa de <%=tp%><%=inf.elementAt(2)%> de la Escuela Colombiana de Ingeniería - Julio Garavito, con Registro Calificado según <%=inf.elementAt(7)%><%=acred%> emanada del Ministerio de Educación Nacional, está registrado ante el Sistema Nacional de Información de la Educación Superior - SNIES - con el código No. <%=inf.elementAt(6)%>, tiene una duración nominal de <%=inf.elementAt(13)%>.
                         </textarea>
                      </center>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td>
				
                    <p>
                      <center>
                        <textarea name="texto2" cols="110" rows="5">Que <%=senor%> <%=inf.elementAt(0)%>, <%=ident%> con <%=doc%> <%=cadena%>, estudiante del programa de <%=tp%><%=inf.elementAt(2)%>, se encuentra <%=matric%> para el <%=periodo%> de <%=a%>.
           				</textarea>
                      </center>
                    </p>
					
                  </td>
                </tr>
   
             
                <tr>
                  <td>         <p>
            <center>
                        <textarea name="texto3" cols="110" rows="3">Que la presente constancia se expide a solicitud <%=solic%>.
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
                <input type="hidden" name="tipoc" value="10">
                <input name="submit" type="submit" value="Generar PDF">
                <!--<input type="submit" name="Submit" value="Enviar Datos" onclick="javascript: return enviar()">-->
              </center>
            </form>
         <p>&nbsp;</p>
             <%} else if (ban == 2){%>
             <center>
              <p><b><font color="#990000">El estudiante ya esta graduado, se debe generar un Certificado de Grado Posgrado.</font></b></p>
            </center>
            <%} else {%>
             <center><p><b><font color="#990000">No existe Información para este estudiante.</font></b></p></center>
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
