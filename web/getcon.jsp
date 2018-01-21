<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con=null;
            Statement st=null;
            
            Class.forName("com.mysql.jdbc.Driver");
            String URL="jdbc:mysql://localhost/securedatasharing";
            String USR="root";
            String PASS="";
            con=DriverManager.getConnection(URL,USR,PASS);
            st=con.createStatement();
            
        %>
    </body>
</html>
