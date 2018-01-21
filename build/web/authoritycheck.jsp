<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String authname=request.getParameter("authname");
        String authpass=request.getParameter("authpass");
        
        if(authname.equals("ka") && authpass.equals("ka")){
            JOptionPane.showMessageDialog(null,"WelCome to Authority Page");
            response.sendRedirect("authority.html");
        }else{
            JOptionPane.showMessageDialog(null,"Authority name and password mismatch");
            response.sendRedirect("keyauthority.html");
        }
        
        %>
    </body>
</html>
