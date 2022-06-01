<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="secure.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

  <%
  HttpSession sesion;
  response.setHeader("Cache-Control", "no-cache");
  String              cert = "", sol, otro, elab, idest, sem, valor, sem1, beca, asig = "", icetex = "" ;
  idest = request.getParameter("idest");
  cert = request.getParameter("cred");
  sol = request.getParameter("sol");
  otro = request.getParameter("otro");
  elab = request.getParameter("elabora");
  sem = request.getParameter("sem");
  valor = request.getParameter("valor");
  sem1 =  request.getParameter("sem1");
  beca =  request.getParameter("beca");
  asig =  request.getParameter("asig");
  icetex =  request.getParameter("icetex");


 if (sem == null)
     sem = "";
 if (sem1 == null)
     sem1 = "";
 if (valor == null)
     valor = "";
 if (beca == null)
     beca = "";
 if (asig == null)
     asig = "";
  if (icetex == null)
     icetex = "0";

    //Enviar variables
       sesion = request.getSession(true);
       sesion.setAttribute("idest", idest);
       sesion.setAttribute("sol", sol);
       sesion.setAttribute("otro", otro);
       sesion.setAttribute("elabora", elab);
       sesion.setAttribute("sem", sem);
       sesion.setAttribute("valor", valor);
       sesion.setAttribute("tipocert", cert);
       sesion.setAttribute("sem1", sem1);
       sesion.setAttribute("beca", beca);
       sesion.setAttribute("asig", asig);
       sesion.setAttribute("icetex", icetex);

    if(cert.equals("0") || cert.equals("1")){
        response.sendRedirect("GenCertEstudAnt");
    }else if(cert.equals("2")){
        response.sendRedirect("GenCertEstudAct");
      }

  %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SISTEMA DE REGISTRO - CERTIFICACIONES</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
   
    </head>
    <body>
  
</body>
</html>
