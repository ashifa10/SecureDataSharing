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
        String userregname=request.getParameter("userregname");
        String userregpass=request.getParameter("userregpass");
        String userregmail=request.getParameter("userregmail");
        String userregphone=request.getParameter("userregphone");
        String userregaddr=request.getParameter("userregaddr");
        String userregdob=request.getParameter("userregdob");
        String userreggend=request.getParameter("userreggend");
        String userregcnt=request.getParameter("userregcnt");
        
        String status="active";
        
        
        if(userregname!=null && userregpass!=null){
            try{
                String query="select name,password from datauser where name=? and password=?";
                PreparedStatement check=con.prepareStatement(query);
                check.setString(1,userregname);
                check.setString(2,userregpass);
                ResultSet rs=check.executeQuery();
                
                if(rs.next()){
                    JOptionPane.showMessageDialog(null,"user already exists");
                        response.sendRedirect("userreg.html");
                }
                 int x=JOptionPane.showConfirmDialog(null,"Want to Register?");
                     if(x==0)
                      {
                     st.executeUpdate("insert into datauser(name,password,email,phone,address,DOB,gender,country,status) values( '" + userregname +  "', '" + userregpass + "','" + userregmail +"', '" + userregphone + "','" + userregaddr + "','" + userregdob + "','" + userreggend + "','" + userregcnt +  "','" + status +"')");
                    JOptionPane.showMessageDialog(null,"Register Successfully");
                    response.sendRedirect("users.html");
                        }
                        else
                        {
                         response.sendRedirect("userreg.html");
                         }
            }catch(Exception e){
                e.printStackTrace();
            }
        }else{
            JOptionPane.showMessageDialog(null, "enter valid details");
            response.sendRedirect("userreg.html");
        }
        
        
        %>
    </body>
</html>
