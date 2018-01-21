<%@include file="getcon.jsp"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <%
        String username=request.getParameter("username");
        String userpass=request.getParameter("userpass");
        session.setAttribute("username", username);
        
        if(username!=null && userpass!=null){
            try{
                String query="select id,name,password,status from datauser where name=? and password=?";
                PreparedStatement check=con.prepareStatement(query);
                check.setString(1,username);
                check.setString(2,userpass);
                ResultSet rs=check.executeQuery();
                
               if(rs.next()){
                   String name=rs.getString("name");
                   String status=rs.getString("status");
                   String id=rs.getString("id");
                   
                  
                   if(status.equals("active")){
                        JOptionPane.showMessageDialog(null, "Welcome  " + name );
            response.sendRedirect("userpage.html?userid="+id);
                   }else{
                       JOptionPane.showMessageDialog(null, "You are Revoked User");
            response.sendRedirect("users.html");
                   }
               }else{
                   JOptionPane.showMessageDialog(null, "UserName Password Mismatch");
            response.sendRedirect("users.html");
               }
              
            }catch(Exception e){
                e.printStackTrace();
            }
            
        }else{
             JOptionPane.showMessageDialog(null, "enter valid details");
            response.sendRedirect("users.html");
        }
        %>
    </body>
</html>
