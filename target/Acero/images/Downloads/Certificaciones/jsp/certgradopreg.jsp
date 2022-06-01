<%@ include file="secure.jsp" %>
<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,java.lang.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDCertificados" %>
<%@ page import="configuracion.configECI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <%response.setHeader("Cache-Control","no-cache");
String carnet = session.getAttribute("idest").toString();
//String carnet = request.getParameter("idest");
BDCertificados est = new BDCertificados();
Vector inf = new Vector() ;
Vector infprom = new Vector() ;
Vector credvis = new Vector() ;
Vector credtot = new Vector() ;
Vector estud = new Vector() ;
Vector prom = new Vector();
Vector promacu = new Vector();
//Vector proma = new Vector();
Vector pa= new Vector() ;
Vector infper= new Vector() ;
String doc = "", ident = "", senor = "", cadena = "", sol, otro, solic = "", elab = "", msenor = "", cod_progam = "";
String text = "", sem, valor, matric="", estu= "", pacad = "", dpto = "", cant = "", pro = "", promg = "";
char rt1, rt2 ;
double promh = 0;
//sol = session.getAttribute("sol").toString();
sol = request.getParameter("sol");
//otro = session.getAttribute("otro").toString();
otro = request.getParameter("otro");
//elab = session.getAttribute("elabora").toString();
elab = request.getParameter("elab");
String beca = request.getParameter("beca");
String iprom = request.getParameter("prom");
if (beca == null)
     beca = "";
if (iprom == null)
     iprom = "";
//sem = session.getAttribute("sem").toString();
/*sem = request.getParameter("sem");
if (sem == null)
    sem = "0" ;*/
String Inicio = "Inicio", acred = "", periodo = "", per = "", pacadb = "", ben = "";
String anterior = "PortalCertific", a = "", res = "";
String mess[] = new String[12], dia = "", annio = "", tsem = "", cadena1 = "", tnum[] = new String[11];
String sec = new String(""), nper= "", nval = "", cp = "", cval = "", vcp = "", vcval = "";
int longdoc, mod, div, n, i, x = 0, nsem = 0, cv = 0 , ct = 0, porcent = 0, reg = 0, ban = 0, mes = 0, pp = 0, lon = 0, n1 = 10, n2 = 10, pg1 = 10, pg2 = 10;
//int nf = Integer.parseInt(request.getParameter("nfilas")) ;
double  porc = 0;
String arreglo[] = new String[3], cadt = "", vp = "",vv = "", vvp = "", vvv= "", fgrad = "", dg = "", anio= "";

//Variables de las ordenes
int contp = 0, difp = 0, difv = 0, contv = 0, cper= 0, cvalr = 0, mg = 0, nnum= 0 ;
//==verificar cuantos periodos se seleccionaron   

estud = est.getInfGrado(carnet);

//Consulta de Becas
Vector becajg = est.getInfBecas(carnet);
if(becajg.size()>0){
   lon = becajg.size() - 1 ;
    for ( int xx = 0 ; xx < becajg.size() ; xx++ ){
       infper = (Vector)becajg.elementAt(xx) ;
       if(xx != lon)
           if (xx == 0)
             pacadb = pacadb + infper.elementAt(0).toString() ;
           else
             pacadb = pacadb + ", " + infper.elementAt(0).toString() ;
       else
           if (becajg.size()== 1)
             pacadb = infper.elementAt(0).toString() ;
           else
            pacadb = pacadb + " y " + infper.elementAt(0).toString() ;
      }
     if (becajg.size()== 1)
       pacadb = "el periodo académico " + pacadb ;
     else
      pacadb = "los periodos académicos " + pacadb ;
    }

//==========================
//BdCertificados bdCert = new BdCertificados();
configECI cfgEci = new configECI();
//bdCert.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
//sec = bdCert.sigSecuencia("SEC_CERTIFIC");
sec = est.Secuencia("SEC_CERTIFIC");
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
    //for ( int k = 0 ; k < estud.size() ; k++ ){
       inf = estud ;
      //}
dpto = inf.elementAt(17).toString();

//Validacion para Biomedica           
if (inf.elementAt(19).equals("268")){
    cod_progam = ", ofrecido conjuntamente por la UNIVERSIDAD DEL ROSARIO y";}
else {cod_progam = " de";}

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

//Fecha de grado inf.elementAt(14)
fgrad= inf.elementAt(14).toString();
dg = fgrad.substring(0,2);
mg = Integer.parseInt((String)fgrad.substring(3,5));
mg = mg - 1 ;//el arreglo de meses incia en indice cero
anio = fgrad.substring(6,10);
//mg = Integer.parseInt((String) inf.elementAt(18));
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
    senor = "el señor";
    msenor = "el mencionado señor";
    ident = "identificado";
    matric = "matriculado";
    estu = "el mencionado señor";
    ben = "beneficiario";}
 else if(inf.elementAt(4).equals("F") && inf.elementAt(5).equals("S")){
    //senor ="la estudiante";
    senor ="la señorita";
    msenor = "la mencionada señorita";
    ident = "identificada";
    matric = "matriculada";
    estu = "la mencionada señorita";
    ben = "beneficiaria";}
 else if(inf.elementAt(4).equals("F") && inf.elementAt(5).equals("C")){
    //senor ="la estudiante";
    senor ="la señora";
    ident = "identificada";
    matric = "matriculada";
    estu = "la mencionada señora";
    ben = "beneficiaria";
 }
 else if(inf.elementAt(4).equals("F")){
    //senor ="la estudiante";
    senor ="la señorita";
    ident = "identificada";
    matric = "matriculada";
    estu = "la mencionada señorita";
    ben = "beneficiaria";}

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
  } else if (inf.elementAt(9).toString().equals("E")) {
  doc = "C.E. No.";
  cadena = inf.elementAt(1).toString();
  }else if (inf.elementAt(9).toString().equals("P")) {
  doc = "Pasaporte No.";
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
   String regcal=inf.elementAt(8).toString().substring(0,10);
    if (inf.elementAt(8).toString().equals("No disponible")){
        acred= "";
    } else if(regcal.equals("En proceso")){
       acred = ". " + inf.elementAt(8).toString() ;
    } else
       acred = " y Acreditación de Alta Calidad según " + inf.elementAt(8).toString() +" emanada del Ministerio de Educación Nacional" ;


//== BUSCO PROMEDIO HISTORICO DEL PROGRAMA
/*El Dr. López me confirma que el promedio histórico de los graduados de un programa es el promedio de los promedios de grado de cada uno de los graduados*/

prom = est.getPromHisGrad(dpto);

promacu = est.getPromAcum(carnet);
if(promacu.size() > 0){    
    promg = promacu.elementAt(0).toString();
    promg = promg.substring(0,3);
    }

if (prom.size() > 0){  
     pro = prom.elementAt(0).toString();
     pro = pro.substring(0,3);
     //pro = String.valueOf(pro);
     rt1 = pro.charAt(0);
     rt2 = pro.charAt(2);
     String un = Character.toString(rt1);
     String dos = Character.toString(rt2);
     n1 =  Integer.parseInt(un);
     n2 =  Integer.parseInt(dos);

     //==Busco promedio de grado
     rt1 = promg.charAt(0);
     rt2 = promg.charAt(2);
     un = Character.toString(rt1);
     dos = Character.toString(rt2);
     pg1 =  Integer.parseInt(un);
     pg2 =  Integer.parseInt(dos);   

    cant = prom.elementAt(1).toString();;
}
  tnum[0]  = "cero";
  tnum[1]  = "uno";
  tnum[2]  = "dos";
  tnum[3]  = "tres";
  tnum[4]  = "cuatro";
  tnum[5]  = "cinco";
  tnum[6]  = "seis";
  tnum[7]  = "siete";
  tnum[8]  = "ocho";
  tnum[9]  = "nueve";
  tnum[10] = "diez";
}

/*
  Reducir el número de decimales
var numero = 1234.0987;

numero = numero.toFixed(2); // numero = 1234.09
 */
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
        DE REGISTRO - CERTIFICACIONES<BR>GRADO PREGRADO</font></strong> </div>
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
                        <textarea name="texto2" cols="110" rows="5">Que <%=senor%> <%=inf.elementAt(0)%>, <%=ident%> con <%=doc%> <%=cadena%>, cursó y aprobó las asignaturas correspondientes al plan de estudios de <%=inf.elementAt(2)%>, obteniendo su grado profesional como <%=inf.elementAt(3)%>, según consta en el Acta de Grado Profesional No. <%=inf.elementAt(13)%> de fecha <%=dg%> de <%=mess[mg]%> de <%=anio%>, Folio No. <%=inf.elementAt(15)%> y Registro No. <%=inf.elementAt(16)%>.
          				 </textarea>                  
                      </center>
                    </p>
                  </td>
                </tr> 
              <tr>
                  <td>
                <%if (beca.equals("1") && becajg.size() > 0){ %>
                    <p><center>
                      <textarea name="texto5" cols="110" rows="4">Que <%=senor%> es <%=ben%> de la beca Julio Garavito Armero, la cual se le otorga a bachilleres destacados en el examen de Estado, para <%=pacadb%>.
                </textarea>
                          </center></p>
                        <%}%>
                  </td>
                </tr>
                 <%if (iprom.equals("1")){ %>
                  <tr>
                  <td>     <p>
                <center>
                            <textarea name="texto6" cols="110" rows="3">Que <%=msenor%> obtuvo un promedio acumulado de <%=tnum[pg1]%> coma <%=tnum[pg2]%> (<%=pg1%>,<%=pg2%>) y el promedio histórico de los <%=cant%> graduados del programa de <%=inf.elementAt(2)%> a la fecha es de <%=tnum[n1]%> coma <%=tnum[n2]%> (<%=n1%>,<%=n2%>).
               </textarea>
                </center>
              </p></td>
                    </tr>
                 <%}%>
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
                <input type="hidden" name="tipoc" value="5">
		<input type="hidden" name="sem" value="0">
                <input type="hidden" name="beca" value="<%=beca%>">
                 <input type="hidden" name="iprom" value="<%=iprom%>">
                <input name="submit" type="submit" value="Generar PDF">
                 <!--<input type="submit" name="Submit" value="Enviar Datos" onclick="javascript: return enviar()">-->
              </center>
            </form>
                           <p>&nbsp;</p>
             <%} else {%>
             <center><p>No existe Información para este estudiante, aun no se ha graduado o es estudiante de posgrado.</p></center>
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
