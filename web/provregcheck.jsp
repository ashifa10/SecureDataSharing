
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
        String provregname=request.getParameter("provregname");
        String provregpass=request.getParameter("provregpass");
        String provregmail=request.getParameter("provregmail");
        String provregphone=request.getParameter("provregphone");
        String provregaddr=request.getParameter("provregaddr");
        String provregdob=request.getParameter("provregdob");
        String provreggend=request.getParameter("provreggend");
        String provregcnt=request.getParameter("provregcnt");
        
        
        if(provregname!=null && provregpass!=null){
            try{
                String query="select name,password from dataprovider where name=? and password=?";
                PreparedStatement check=con.prepareStatement(query);
                check.setString(1,provregname);
                check.setString(2,provregpass);
                ResultSet rs=check.executeQuery();
                
                if(rs.next()){
                    JOptionPane.showMessageDialog(null,"Dataprovider already exists");
                        response.sendRedirect("provreg.html");
                }
                 int x=JOptionPane.showConfirmDialog(null,"Want to Register?");
                     if(x==0)
                      {
                     st.executeUpdate("insert into dataprovider(name,password,email,phone,address,DOB,gender,country) values( '" + provregname +  "', '" + provregpass + "','" +provregmail +"', '" + provregphone + "','" + provregaddr + "','" + provregdob + "','" + provreggend + "','" + provregcnt + "')");
                    JOptionPane.showMessageDialog(null,"Register Successfully");
                    response.sendRedirect("dataprovider.html");
                        }
                        else
                        {
                         response.sendRedirect("provreg.html");
                         }
            }catch(Exception e){
                e.printStackTrace();
            }
        }else{
            JOptionPane.showMessageDialog(null, "enter valid details");
            response.sendRedirect("provreg.html");
        }
        
        
        %>
    </body>
</html>
