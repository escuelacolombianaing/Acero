<%-- 
    Document   : index
    Created on : 30/10/2012, 04:12:24 PM
    Author     : palvarad
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SISTEMA DE REGISTRO - CERTIFICACIONES</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
       <%
       response.setHeader("Cache-Control","no-cache");
       String nMsg = request.getParameter("id");
        String mensaje = new String("Bienvenidos");
if (nMsg != null) {
            /* Si la sesion no existe */
            HttpSession sesion = request.getSession();
            sesion.invalidate();
        if (nMsg != null) {
            if (nMsg.equals("0")) {
                mensaje = "Usuario desconocido";
            } else if (nMsg.equals("1")) {
                mensaje = "Falta alguno de los campos";
            } else if (nMsg.equals("2")) {
                mensaje = "El usuario no esta autorizado";
            } else if (nMsg.equals("3")) {
                    mensaje = "Sesion Cerrada";
                }
            } else if (nMsg.equals("4")) {
                    mensaje = "No ha iniciado Sesion";
                }
        }

 %>
    </head>
    <body>
    <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" background="img/header1.jpg" style="height:400px">
  <tr>
    <td><div style="margin:auto; width:400px">
      <form action="Login" method="post" id="form1">
     <p>&nbsp;</p>
          <fieldset style="margin:auto; width:300px"> <legend>Ingresar al sistema. <br>
    <br>
    </legend>
    <div align="center"><strong><font color="#666666" size="2" face="Times New Roman, Times, serif"><br>
				      <%=mensaje%>
				      <br>
				      <br>
	   </font></strong></div>
    <label>Usuario:</label>
        <input name="usr" type="text" id="usr" size="20"/>
        <br>
        <br>
        <label>
        Password:</label>
        <input name="passwd" type="password" id="passwd" size="20" />
        <br>
        <br>
    <br>
    <br>
        <br>

        <input type="submit" name="button" id="button" value="Enviar">

      </fieldset>
    </form>
    </div></td>
  </tr>
</table>
</body>
</html>
