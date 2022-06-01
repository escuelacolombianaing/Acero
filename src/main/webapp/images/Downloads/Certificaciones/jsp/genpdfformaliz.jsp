<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.util.Date" %>
<%@ page import="com.itextpdf.text.Document,com.itextpdf.text.Paragraph,com.itextpdf.text.pdf.PdfWriter,com.itextpdf.text.PageSize,com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.Element,com.itextpdf.text.Chunk,com.itextpdf.text.Font,com.itextpdf.text.FontFactory,com.itextpdf.text.BaseColor"%>
<%@ page import="BDatos.BDCertificados" %>
<%@ page import="configuracion.configECI" %>

<%
response.setHeader("Cache-Control","no-cache");
String carnet = session.getAttribute("idest").toString();
BDCertificados est = new BDCertificados();
Vector inf = new Vector() ;
String doc = "", ident = "", senor = "", cadena = "", secu, otro, solic = "", elab = "", sol= "", opcion ="", text5 = "" ;
String text = "", fecha = "", texto1 = "", texto2 = "", texto3 = "", texto4 = "", texto5 = "", texto6 = "", valor = "", tpdoc="", sem = "", tipcer = "";
secu = request.getParameter("sec");
otro = request.getParameter("otro");
elab = request.getParameter("elab");
String tipoc = request.getParameter("tipoc");
sem = request.getParameter("sem");
fecha = request.getParameter("fecha");
texto1 = request.getParameter("texto1");
texto2 = request.getParameter("texto2");
String beca = request.getParameter("beca");
String iprom = request.getParameter("iprom");
if (beca == null)
    beca = "";
//if(tipcer.equals("2"))
   // texto5 = request.getParameter("texto5");
opcion = request.getParameter("opcion");
//if (sem.equals("1")){
texto3 = request.getParameter("texto3");
//}
//if (valor.equals("1")){
texto5 = request.getParameter("texto4");
//}
if (beca.equals("1")){
text5 = request.getParameter("texto5");
}

if (iprom.equals("1")){
texto6 = request.getParameter("texto6");
}
//Actualiza Secuencia
String sec = new String("");
//BdCertificados bdCert = new BdCertificados();
configECI cfgEci = new configECI();
//bdCert.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());

//Definición tipo de certificados
/*if (tipoc.equals("1")){
    tpdoc = "Cert. Grado Pregrado" ;
    }else if (tipoc.equals("2")){
    tpdoc = "Cert. Estudios" ;
    }else if (tipoc.equals("3")){
    tpdoc = "Cert. Grado Posgrado" ;
}*/

if (tipoc.equals("3"))
    tpdoc = "Cert. Formalizacion Matric" ;
else
    if(tipoc.equals("4")){
    tpdoc = "Cert. Term. Estudios" ; }
else
    if(tipoc.equals("5")){
    tpdoc = "Cert. Grado. Pregrado." ; }

if (opcion.equals("1")){
//Se actualiza secuencia
   // sec = est.sigSecuencia("SEC_CERTIFIC");
    //bdCert.desconectar();

    //==Se guarda la informacion
    String secuencia = "SGSG - " + secu + "" ;
    int estud = est.setInfCertestud(carnet, secuencia, tpdoc);
}

String Inicio = "Inicio";
String anterior = "GenCertEstud";
      %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Certificaciones y Constancias</title>
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<link href="css/comun.css" rel="stylesheet" type="text/css">
<link href="css/menu1.css" rel="stylesheet" type="text/css">

<script language="JavaScript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
//-->
</script>

    </head>

          <!--<body onLoad="MM_goToURL('parent','http://10.1.20.240:8081/Certificados/Constancia.pdf');return document.MM_returnValue">-->
   <!-- <body onLoad="MM_goToURL('parent','http://localhost:8080/Certificaciones/Constancia.pdf'), target = '_blank';return document.MM_returnValue">-->
            <!--<body onLoad="MM_goToURL('parent','http://tycho.escuelaing.edu.co:8080/Certificaciones/Constancia.pdf'), target = '_blank';return document.MM_returnValue">-->
           <body onLoad="MM_goToURL('parent','http://tycho.escuelaing.edu.co/Certificaciones/Constancia.pdf'), target = '_blank';return document.MM_returnValue"> 
 <!-- <body onLoad="MM_goToURL('parent','http://weezer.escuelaing.edu.co/Certificaciones/Constancia.pdf'), target = '_blank';return document.MM_returnValue"> VIRTUAL -->
<!--<body onLoad="MM_goToURL('parent','http://www.escuelaing.edu.co:8080/Certificaciones/Constancia.pdf'), target = '_blank';return document.MM_returnValue">-->

         <fieldset style="margin:auto; width:300px" onClick="MM_callJS('prueba')">
             </fieldset>
        <!--   <div id="container">
<table width="767" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
      <tr>
        <td colspan="5" bgcolor="#EEEEEE">
          <//jsp:include page="encabezado">
          <//jsp:param name="" value="" />
          <///jsp:include>
        </td>
      </tr>
       <tr>
        <td>
          <div align="center"><b>CERTIFICACIONES Y CONSTANCIAS</b></div>
        </td>
      </tr>
    </table>-->
    <p>
      <%
//configECI cfgEci = new configECI();
String ruta = cfgEci.getHomePage() + "Constancia.pdf" ;
//nomArch = new String(cfgEci.getRutaDescargas() + "aspirantes.csv"),

int cont = 0 ;
 //File fichero = new File("C:\\Constancia.pdf");
//File fichero = new File("C:/Tomcat 5.5/webapps/ROOT/Certificados/Constancia.pdf");
//File fichero = new File("/usr/local/tomcat5.5/webapps/ROOT/Certificados/Constancia.pdf");
File fichero = new File(cfgEci.getRutaCertificados() + "Constancia.pdf");
 if (fichero.exists()) {
     if (fichero.delete())
         cont = 1 ;
    }
 else {cont = 1 ;}
 if (cont == 1) {
    //OutputStream file = new FileOutputStream(new File("C:\\Constancia.pdf"));
     ///usr/local/tomcat5.5/webapps/ROOT/
   // OutputStream file = new FileOutputStream(new File("/usr/local/tomcat5.5/webapps/ROOT/Certificados/Constancia.pdf"));
    // OutputStream file = new FileOutputStream(new File("C:/Tomcat 5.5/webapps/ROOT/Certificados/Constancia.pdf"));
     OutputStream file = new FileOutputStream(new File(cfgEci.getRutaCertificados() + "Constancia.pdf"));

    //Document doc = new Document(PageSize.A4, izq, der, sup, inf);
    text = "SGSG - " + secu + "" ;
    //Document document = new Document(PageSize.A4, 60, 80, 80, 72);
   // Document document = new Document(PageSize.A4, 35, 35, 120, 72);//impresora oficina
     Document document = new Document(PageSize.A4, 70, 35, 120, 72);//impresora registro
    PdfWriter.getInstance(document, file);
    document.open();
    Font fuente = new Font(Font.getFamily("ARIAL"), 10, Font.NORMAL);
    Paragraph p = new Paragraph(text, fuente);
    p.setAlignment(Element.ALIGN_LEFT);
    document.add(p);
    document.add(new Paragraph("\n"));
    text =  fecha ;
    p = new Paragraph(text, fuente);
    document.add(p);
   // document.add(new Paragraph("\n"+"\n")); //PARA ADICONAR ESPACIO
    document.add(new Paragraph("\n"+"\n"+"\n"));
    text = "NIT 860034811-3" + "\n"+
            "EL SUSCRITO SECRETARIO DE LA ESCUELA COLOMBIANA DE INGENIERÍA" + "\n"+
            "HACE CONSTAR:" ;    
    Font fuenteb = new Font(Font.getFamily("ARIAL"), 10, Font.BOLD);
    p = new Paragraph(text, fuenteb);
    p.setAlignment(Element.ALIGN_CENTER);
    document.add(p);
    document.add(new Paragraph("\n"));  
    text = texto1 ;
    p = new Paragraph(text, fuente);
    p.setAlignment(Element.ALIGN_JUSTIFIED);
    document.add(p);
    //document.add(new Paragraph("\n"));
    text = texto2 ;
    p = new Paragraph(text, fuente);
    p.setAlignment(Element.ALIGN_JUSTIFIED);
    document.add(p);
    //document.add(new Paragraph("\n"));
   // if (sem.equals("1")){
        text = texto3 ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
     //   }
    if (valor.equals("1")){
        text = texto4 ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        }
    text = text5 ;
    p = new Paragraph(text, fuente);
    p.setAlignment(Element.ALIGN_JUSTIFIED);
    document.add(p);
    text = texto6 ; //prom historico
    p = new Paragraph(text, fuente);
    p.setAlignment(Element.ALIGN_JUSTIFIED);
    document.add(p);
    text = texto5 ;
    p = new Paragraph(text, fuente);
    p.setAlignment(Element.ALIGN_JUSTIFIED);
    document.add(p);

    //document.add(new Paragraph("\n")); //PARA ADICONAR ESPACIO
    document.add(new Paragraph("\n"+"\n"+"\n"));
    text = "Ing. RICARDO A. LÓPEZ CUALLA" +
    "\n" +
    "/" + elab + "";
    p = new Paragraph(text, fuente);
    p.setAlignment(Element.ALIGN_JUSTIFIED);
    document.add(p);
    //if(tipoc.equals("02")){ 
        //document.add(new Paragraph("\n"));
    if(sem.equals("1")){
         text = "Nota: En la Escuela Colombiana de Ingeniería Julio Garavito, acorde con el Decreto 1295 de 2010 del Ministerio de Educación, " +
                 "un crédito equivale a 48 horas de trabajo académico del estudiante, que comprende las horas con acompañamiento directo del docente y demás " +
                 "horas que el estudiante deba emplear en actividades independientes de estudio, prácticas u otras que sean necesarias para alcanzar " +
                 "las metas de aprendizaje, sin incluir las destinadas a la presentación de las pruebas finales de evaluación." ;
        Font fuentec = new Font(Font.getFamily("ARIAL"), 7, Font.NORMAL);
        p = new Paragraph(text, fuentec);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
    }
    document.close();
    file.close();

/*Se gurada informacion en la tabla inf_certificados*/

 
/*//ABRE EL ARCHIVO EN PDF
try {
    Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler "+"C:\\Constancia.pdf");
    //System.out.println("Final");
    } catch (IOException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
    }*/
} else System.out.println("El fichero no puede ser borrado");

   %>
    </p> 
    
  <!-- <p>&nbsp; </p>
  
        <div align="center">
            <ul>
                <li><a href="<//%=ruta%>" target="_blank"><img src="img/newspaper.png" width="16" height="16" border="0"> Ver Certificado </a></li>
            </ul>
        </div>                
<br> -->


<!--<table width="767" border="0" align="center">
 <tr >
                <td colspan="3" height="6">
                    <div align="right" class="mattblacktabs">
                                <ul>
                                    <li><a href="LogOut"><img src="img/door_out.png" width="16" height="16" border="0"> Cerrar</a></li>
                                    <li><a href="<//%=anterior%>"><img src="img/arrow_left.png" width="16" height="16" border="0"> Anterior</a></li>
                                    <li><a href="<//%=Inicio%>"><img src="img/house.png" width="16" height="16" border="0"> Inicio</a></li>
                                </ul>
                            </div>
                </td>
              </tr>
 </table>
          <p align="center">Escuela Colombiana de Ingeniería Julio Garavito<br>
            AK. 45 No. 205-59 (Autopista Norte) / PBX: +57(1) 6683600 / Call center: 
            +57(1) 6683622 / A.A. 14520<br>
            Bogotá, D.C. , Colombia<br>
            &nbsp; </p>

                    </div>-->
                    <!--container-->
    </body>

</html>
    
    
    
