<%@page import="java.io.FileOutputStream"%>
<%@page language="java"%>
<%@page import="IBEencryption.IBE"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="getcon.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Check Page</title>
    </head>
    <body>
       <%
       String text=request.getParameter("text");
       String filename=request.getParameter("filename");
       String username=session.getAttribute("provnames").toString();
       
       
       String path = new java.io.File(application.getRealPath(request.getRequestURI())).getParent().replace("\\build\\web", "\\Files");
       String txtFilePath=path+"\\"+username+"\\"+filename;
         
       
        String ownername="OwnersSecretkeys"; 
           IBE.encrypt(text,ownername);
           String nametext=IBE.encrypt(text,ownername);
           
           FileOutputStream writer=new FileOutputStream(txtFilePath);
		byte[] b=nametext.getBytes();
               int aaa=b.length;
		writer.write(b);
               
              
                 String query1="select * from uploadfiles where filename=? and ownername=?";
                PreparedStatement check=con.prepareStatement(query1);
                check.setString(1,filename);
                check.setString(2,username);
                ResultSet rs=check.executeQuery();
                
                int bytesencrypted=0;
                if(rs.next()){
                bytesencrypted=rs.getInt("bytesencrypted");
                }
          String query=("UPDATE  uploadfiles SET bytesencrypted = REPLACE(bytesencrypted, '"+ bytesencrypted  +"', '"+ aaa +"') WHERE filename='"+filename+"' and ownername='" + username +"'");
          st.executeUpdate(query);
                    
          JOptionPane.showMessageDialog(null,"File Updated successfully");
          response.sendRedirect("updatefiles.jsp");
         
       %>
    </body>
</html>
