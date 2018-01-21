<%@page import="javax.swing.JOptionPane"%>
<%@include file="getcon.jsp"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unrevoke Page</title>
    </head>
    <body>
       <%
       String name=request.getParameter("name");
       
       try{
            
                    
                String statusquery="UPDATE datauser SET status = REPLACE(status, 'revoked', 'active') WHERE name = '"+ name +"';";
                 st.executeUpdate(statusquery);
                
                 
                  JOptionPane.showMessageDialog(null,"User Unrevoked");
                        response.sendRedirect("unrevoke.jsp");
                        
                  
            }catch(Exception e){
                e.printStackTrace();
            }
           
       
       %>
    </body>
</html>
