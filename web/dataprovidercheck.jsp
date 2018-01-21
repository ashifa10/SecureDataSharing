<%@include file="getcon.jsp"%>
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
       String provname=request.getParameter("provname");
       session.setAttribute("provnames",provname);
       String provpass=request.getParameter("provpass");
       
       if(provname!=null && provpass!=null){
           try{
               String query="select name,password from dataprovider where name=? and password=?";
               PreparedStatement check=con.prepareStatement(query);
               check.setString(1, provname);
               check.setString(2, provpass);
               ResultSet rs=check.executeQuery();
               
               if(rs.next()){
                    JOptionPane.showMessageDialog(null,"Welcome  "+provname);
           response.sendRedirect("dataproviderpage.html");
               }else{
                    JOptionPane.showMessageDialog(null,"username password mismatch");
           response.sendRedirect("dataprovider.html");
               }
               
           }catch(Exception e){
               e.printStackTrace();
           }
           
       }else{
           JOptionPane.showMessageDialog(null,"enter required details");
           response.sendRedirect("dataprovider.html");
       }
       
       %>
    </body>
</html>
