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
      String servname=request.getParameter("servname");
      String servpass=request.getParameter("servpass");
      
      if(servname.equals("cloud") && servpass.equals("cloud")){
          JOptionPane.showMessageDialog(null,"Welcome To Storage Server");
          response.sendRedirect("serverpage.html");
          
      }else{
          JOptionPane.showMessageDialog(null,"server name and password mistach");
          response.sendRedirect("server.html");
      }
      %>
    </body>
</html>
