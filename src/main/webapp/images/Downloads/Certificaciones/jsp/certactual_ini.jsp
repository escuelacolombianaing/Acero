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
//Vector pa= new Vector() ;
Vector infper= new Vector() ;
Vector valorp = new Vector() ;
Vector ConcERP = new Vector();
Vector NrOrdenes = new Vector();
Vector NuOrden = new Vector() ;
String doc = "", ident = "", senor = "", cadena = "", sol, otro, solic = "", elab = "", valpagpa = "";
String text = "", sem, valor, matric="", estu= "", pacad = "", sem1, mat = "", beca, ben = "", credvis = "", credtot = "",CambioPl="";
//sol = request.getParameter("sol");
sol = session.getAttribute("sol").toString();
//otro = request.getParameter("otro");
otro = session.getAttribute("otro").toString();
//elab = request.getParameter("elabora");
elab = session.getAttribute("elabora").toString();
sem = session.getAttribute("sem").toString();
sem1 = session.getAttribute("sem1").toString();
valor = session.getAttribute("valor").toString();
beca = session.getAttribute("beca").toString();
String Inicio = "Inicio", acred = "", periodo = "", cod_progam = "";
String anterior = "PortalCertific", a = "", res = "", cred = "0", nasig = "0", hor = "0";
String mess[] = new String[12], dia = "", annio = "", tsem = "", cadena1 = "", pacadb = "", pacad1 = "", cad = "";
int lon = 0, indp = 0  ;
long valf = 0, valm = 0;
String sec = new String("");
int longdoc, mod, div, n, i, x = 0, nsem = 0, cv = 0 , ct = 0, porcent = 0, reg = 0, ban = 0, mes = 0, ban1 = 0, valpag = 0, lseg = 0;
double  porc = 0;
String arreglo[] = new String[3];
//========================================================================
//Se verifica si el periodo actual es intermedio y esta haciendo el curso
//========================================================================
configECI cfgEci = new configECI();
String pers = cfgEci.getPeriodoSig();
pacad = cfgEci.getPeriodoActual();
//Vector ord = est.getInfOrdP(carnet, pers); //revisar porque getPeriodoSig();

Vector asigreg = est.getInfAsigReg(carnet, pacad);
if(asigreg.size() > 0){
   cred = asigreg.elementAt(0).toString();
    if (cred.equals("No disponible"))
        cred = "0";
    nasig = asigreg.elementAt(1).toString();
    hor = asigreg.elementAt(2).toString();
    if (hor.equals("No disponible"))
        hor = "0";
    }



Vector peracad = est.getInfPer();
if(peracad.size() > 0){
     pacad1 = (peracad.elementAt(0).toString());
     reg = Integer.parseInt((String) peracad.elementAt(1));
     cad = pacad.substring(5,6);
  }

Vector ord = est.getInfOrdP(carnet, pacad);
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

if(ord.size() > 0){     
     valpag = Integer.parseInt((String) ord.elementAt(0));
     valpagpa = (String) ord.elementAt(0) ;
    }

 if(reg > 0 && cad.equals("I")){
    estud = est.getInfCertifestudp(carnet);
     if ((estud.size() == 0) && (valpag > 0)){ ban1 = 1 ;
       estud = est.getInfEstudO(carnet, pacad);
     }
    }
 else {    
    estud = est.getInfCertifestud(carnet, pacad);
 }
//Verificar si el etsudiante se encuentra en el plan activo
Vector Cplan = est.getCmabioPlan(carnet);
if (Cplan.size() > 0){
    CambioPl = (String) Cplan.elementAt(0) ;
   }
//Creditos vistos y aprobados
Vector credv = est.getInfCredvis(carnet,CambioPl);
if (credv.size() > 0){
   //credvis = (Vector)credv.elementAt(0);
    credvis = (String) credv.elementAt(0) ;
   if(!credvis.equals("No disponible")) {
     cv = Integer.parseInt((String) credvis);
   }}
//==========================

//BDCertificados bdCert = new BDCertificados();
//BdCertificados bdCert = new BdCertificados();
//est.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
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

/*var result=Math.round(original*100)/100 ;

double valor = 1254.625;
  String val = valor+"";
  BigDecimal big = new BigDecimal(val);
 big = big.setScale(2, RoundingMode.HALF_UP);  */


        // nomest = estud.elementAt(0).toString();
         //doc =  estud.elementAt(1).toString();
         //dpto = estud.elementAt(2).toString();
         // String prog = estud.elementAt(1).toString();

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
if (inf.elementAt(19).equals("268")){
    cod_progam = ", ofrecido conjuntamente por la UNIVERSIDAD DEL ROSARIO y";}
else {cod_progam = " de";}

           
//Texto de semestre

if (inf.elementAt(15).equals("1")){
    tsem = "primer";}
else if (inf.elementAt(15).equals("2"))   {
    tsem = "segundo";
    }
else if (inf.elementAt(15).equals("3"))   {
    tsem = "tercer";
    }
else if (inf.elementAt(15).equals("4"))   {
    tsem = "cuarto";
    }
else if (inf.elementAt(15).equals("5"))   {
    tsem = "quinto";
    }
else if (inf.elementAt(15).equals("6"))   {
    tsem = "sexto";
    }
else if (inf.elementAt(15).equals("7"))   {
    tsem = "séptimo";
    }
else if (inf.elementAt(15).equals("8"))   {
    tsem = "octavo";
    }
else if (inf.elementAt(15).equals("9"))   {
    tsem = "noveno";
    }
else if (inf.elementAt(15).equals("10"))   {
    tsem = "décimo";
    }

if (inf.elementAt(4).equals("M")){
    senor = "el estudiante";
   // senor = "el señor";
    ident = "identificado";
    matric = "matriculado";
    estu = "el mencionado señor";
    mat = "matriculado";
    ben = "beneficiario";}
 else if(inf.elementAt(4).equals("F") && inf.elementAt(5).equals("S")){
    senor ="la estudiante";
    //senor ="la señorita";
    ident = "identificada";
    matric = "matriculada";
    estu = "la mencionada señorita";
    mat = "matriculada";
    ben = "beneficiaria";}
 else if(inf.elementAt(4).equals("F") && inf.elementAt(5).equals("C")){
    senor ="la estudiante";
    // senor ="la señora";
    ident = "identificada";
    matric = "matriculada";
    estu = "la mencionada señora";
    mat = "matriculada";
    ben = "beneficiaria";
 }
 else if(inf.elementAt(4).equals("F")){
    senor ="la estudiante";
    //senor ="la señorita";
    ident = "identificada";
    matric = "matriculada";
    estu = "la mencionada señorita";
    mat = "matriculada";
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
  }else if (inf.elementAt(9).toString().equals("P")) {
  doc = "Pasaporte No.";
  cadena = inf.elementAt(1).toString();
  }else if (inf.elementAt(9).toString().equals("E")) {
  doc = "C.E. No.";
  cadena = inf.elementAt(1).toString();
  }
    nsem = Integer.parseInt((String) inf.elementAt(15));
    otros.n2t numero = new otros.n2t();
    // val4 = Long.parseLong((String) lisord.elementAt(16));
    int num = Integer.parseInt((String) inf.elementAt(14));
    indp = Integer.parseInt((String) inf.elementAt(16));
    //long num1 = Long.parseLong((String) inf.elementAt(14));
    //int num = Integer.parseInt(inf.elementAt(14).toString());
    //long val = Long.parseLong((String) inf.elementAt(14));
   // String cadena1 = inf.elementAt(14).toString();
    /*int num = Integer.parseInt((Long) (num1)); */

    numero = new otros.n2t(num);
    res = numero.convertirLetras(num);

    //String per = inf.elementAt(13).toString();
    //a = per.substring(0, 4);
    a = pacad.substring(0, 4);
    //String p = per.substring(5, 6); //el inicial
    String p = pacad.substring(5, 6);


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

//==Verificar si se tiene mas de una orden para el mismo periodo
NrOrdenes = est.getInfNroOrdenes(carnet, pacad);
if (NrOrdenes.size()>0){
  for ( int or = 0 ;or < NrOrdenes.size() ; or++ ){
    NuOrden = (Vector)NrOrdenes.elementAt(or) ;
//==Verificar valor pagado con los conceptos que suman
       if(NuOrden.elementAt(3).equals("1"))   {
          valm = valm + Long.parseLong((String) NuOrden.elementAt(2));
          valf = valf + Long.parseLong((String) NuOrden.elementAt(1));
                                if (valf < valm){ //==Busco conceptos
                                     Vector ConOrd = est.getInfConcERP(NuOrden.elementAt(0).toString());
                                     if(ConOrd.size() > 0){
                                       for ( int pp = 0 ; pp < ConOrd.size() ; pp++ ){
                                             ConcERP = (Vector)ConOrd.elementAt(pp) ;
                                            if (ConcERP.elementAt(2).equals("1")) //==Se verifica que el concepto sume
                                                if(!ConcERP.elementAt(0).equals("No disponible")){
                                                    valf = valf + Long.parseLong((String) ConcERP.elementAt(0)) ;
                                                }
                                            }
                                         }

                                    }
            }
        }//for
}//if NrOrdenes.size()>0
num = (int)valf;
numero = new otros.n2t(num);
res = numero.convertirLetras(num);



//Coloco los puntos al valor pagado
int longi, mod1, div1, n1, i1;
//String str1= inf.elementAt(14).toString();
String vpagerp= String.valueOf(valf);
//String str1 = valpagpa ;
String str1 = vpagerp ;
longi = str1.length();
mod1 = longi%3;
div1 = longi/3;
String subStr1=str1.substring(0,mod1);
if (!subStr1.equals(""))
    cadena1 = subStr1 + ".";
n1 = mod1;
if (longi == 6)
    i1 = 3 ;
else
    i1 = 4 ;
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
			  <form name="formulario" method="POST" action="GeneraPdf" target="_blank">
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
				  <%if (cad.equals("I") && ban1 == 0) {%>
                    <p>
                      <center>
                        <textarea name="texto2" cols="110" rows="5">Que <%=senor%> <%=inf.elementAt(0)%>, <%=ident%> con <%=doc%> <%=cadena%>, estudiante del programa de <%=inf.elementAt(2)%>, se encuentra <%=matric%> para el <%=periodo%> de <%=a%>. Jornada Diurna de 7:00 a.m. a 7:00 p.m.
           				</textarea>
                      </center>
                    </p>
					<%} else if (cad.equals("I") && ban1 == 1) {%>
                    <p>
                      <center>
             				<textarea name="texto2" cols="110" rows="5">Que <%=senor%> <%=inf.elementAt(0)%>, <%=ident%> con <%=doc%> <%=cadena%>, estudiante del programa de <%=inf.elementAt(2)%>, se encuentra <%=mat%> para el <%=periodo%> de <%=a%>. Jornada Diurna de 7:00 a.m. a 7:00 p.m.
          				 </textarea>
                      </center>
                    </p>
				  <%}else{ %>
                    <p>
                      <center>
                        <textarea name="texto2" cols="110" rows="5">Que <%=senor%> <%=inf.elementAt(0)%>, <%=ident%> con <%=doc%> <%=cadena%>, estudiante del programa de <%=inf.elementAt(2)%>, se encuentra <%=matric%> para el <%=periodo%> de <%=a%> y tiene inscritas <%=nasig%> asignaturas equivalentes a <%=cred%> créditos académicos correspondientes a <%=hor%> horas de actividad académica por semana. Jornada Diurna de 7:00 a.m. a 7:00 p.m.
          				 </textarea>
                      </center>
                    </p>
					<% }%>
                  </td>
                </tr>
                <%//Validar para periodo diferente al intermediio
                if(!cad.equals("I")) {%>
                <%if (sem.equals("1") || sem1.equals("1")){ //sem1 = "1";%>
                <tr>
                  <td>
                    <p>
                      <center>
                        <%if ((nsem == 1) && (credvis.equals("No disponible"))) { %>
                        <textarea name="texto3" cols="110" rows="3">Que <%=senor%> cursa según el Reglamento Estudiantil de la Institución el primer semestre académico.
                </textarea>
                        <%}else{ if (sem1.equals("1")){%>
                        <textarea name="texto3" cols="110" rows="5">Que <%=senor%> ha aprobado <%=credvis%> créditos académicos de un total de <%=credtot%> créditos académicos de su plan de estudios, equivalentes al <%=porcent%> por ciento del programa de <%=inf.elementAt(2)%> y cursa según el Reglamento Estudiantil de la Institución el <%=tsem%> semestre académico.
                </textarea>
                        <%}
                        }%>
                      </center>
                    </p>
                  </td>
                </tr>
                <%}%>

                <%if (valor.equals("1")){ %>
                <tr>
                  <td>
                    <p>
                      <center>
                           <%if (indp == 1){ %>
                        <textarea name="texto4" cols="110" rows="3">Que <%=estu%> canceló por concepto de derechos de matrícula para el <%=periodo%> de <%=a%> la suma de: <%=res%> PESOS M/CT($<%=cadena1%>).
                </textarea><%}else{%>
                <textarea name="texto4" cols="110" rows="3" style="background-color:#FFFFFF;color:#990000;">No tiene pago registrado para el <%=periodo%> de <%=a%>.
                </textarea>
                <%}%>
                      </center>
                    </p>
                  </td>
                </tr>
                <%}%>
                <%}%><!--//if de per dif a intermedio-->
             <%if (ban1 == 1){ %>
              <tr>
                  <td>
                <%if (nsem == 1){ %>
                        <textarea name="texto3" cols="110" rows="3">Que <%=senor%> cursará según el Reglamento Estudiantil de la Institución el primer semestre académico.
                </textarea>
                        <%}else{%>
                        <textarea name="texto3" cols="110" rows="5">Que <%=senor%> cursará según el Reglamento Estudiantil de la Institución el <%=tsem%> semestre académico.
                </textarea>
                        <%}%>
                  </td>
                </tr>
            <%}%>
              <tr>
                  <td>
                <%if (beca.equals("1") && becajg.size() > 0){ %>
                    <textarea name="texto6" cols="110" rows="4">Que <%=senor%> es <%=ben%> de la beca Julio Garavito Armero, la cual se le otorga a bachilleres destacados en el examen de Estado, para <%=pacadb%>.
                </textarea>
                        <%}%>
                  </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>         <p>
            <center>
                        <textarea name="texto5" cols="110" rows="3">Que la presente constancia se expide a solicitud <%=solic%>.
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
                <input type="hidden" name="sem1" value="<%=sem1%>">
                <input type="hidden" name="beca" value="<%=beca%>">
                 <input type="hidden" name="iprom" value="0">
                <input type="hidden" name="tipoc" value="1">
                <input name="submit" type="submit" value="Generar PDF">
                <!--<input type="submit" name="Submit" value="Enviar Datos" onclick="javascript: return enviar()">-->
              </center>
            </form>
                           <p>&nbsp;</p>
             <%} else {%>
             <center><p>No existe Información para este estudiante en el período: <%=pacad%></p></center>
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
