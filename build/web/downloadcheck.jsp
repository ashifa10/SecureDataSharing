<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@include file="getcon.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String filename=request.getParameter("filename");
            String downpath=request.getParameter("downpath");
            
           
                    response.setContentType("APPLICATION/OCTET-STREAM");   
                    response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
                   java.io.FileInputStream fileInputStream=new java.io.FileInputStream(downpath);  
                   OutputStream output =  response.getOutputStream();
           
                int i;   
                while ((i=fileInputStream.read()) != -1) {   
                   
                output.write(i);
               
            }  
                
                output.close();
                fileInputStream.close();
                  
                 
                 String date=(new java.util.Date()).toString();
                  st.executeUpdate("insert into results(filename,result,date) values( '" + filename +  "', 'downloaded', '" +  date + "');");
                   
                File tempfile1=new File(downpath);
		tempfile1.delete();
                
               
        
        %>
    </body>
</html>
