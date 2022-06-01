<%@ page import = "javax.servlet.http.HttpSession" %>
<%
String idusr = (String)session.getAttribute("idusr");

    //if(!session.getId().equals(session.getAttribute("sesid"))){
    if (!(idusr != null && !idusr.equals(""))) {
%>
		<jsp:forward page="inicio?id=4"/>
<%
    }else {
        if(session.getAttribute("idusr") == null || session.getAttribute("idusr").equals("")){
        %>
		<jsp:forward page="inicio?id=4"/>
<%
        }
    }
%>
