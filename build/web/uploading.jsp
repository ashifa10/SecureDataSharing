<%@page language="java"%>
<%@page import="IBEencryption.IBE"%>
<%@page import="IBEencryption.IBE"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@include file="getcon.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Upload Page</title>
    </head>
    <body>
        <%
        String catg=request.getParameter("catg");
        String upfile=request.getParameter("upfile");
        String username=session.getAttribute("provnames").toString();
        
         String path = new java.io.File(application.getRealPath(request.getRequestURI())).getParent().replace("\\build\\web", "\\Files");
         File filess= new File(path+"\\"+username);
         filess.mkdirs();
       
        String date=(new java.util.Date()).toString();
         out.println(catg + date);
       
         File file ;
         int maxFileSize = 5000 * 1024;
         int maxMemSize = 5000 * 1024;
         String filePath = path+"\\"+username+"\\";

         String contentType = request.getContentType();
         if ((contentType.indexOf("multipart/form-data") >= 0)) {

              DiskFileItemFactory factory = new DiskFileItemFactory();
              factory.setSizeThreshold(maxMemSize);
              factory.setRepository(new File(path));
              ServletFileUpload upload = new ServletFileUpload(factory);
              upload.setSizeMax( maxFileSize );
           try{ 
           List fileItems = upload.parseRequest(request);
           Iterator i = fileItems.iterator();
          
          
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )  {
                String fieldName = fi.getFieldName();
                String fileName = fi.getName();
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();
                ////////////////////////checking exist file ///////////////////////////////////////
               String query1="select * from uploadfiles where filename=? and ownername=?";
                PreparedStatement check=con.prepareStatement(query1);
                check.setString(1,fileName);
                check.setString(2,username);
                ResultSet rs=check.executeQuery();
                
                if(rs.next()){
                    JOptionPane.showMessageDialog(null,"File already exists");
                        response.sendRedirect("uploadfiles.html"); 
                } else{        
               
                file = new File( filePath + fileName) ; out.println(filePath);
                fi.write( file ) ;
                out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                
                
           
               
                  String ownername="OwnersSecretkeys";
                  String  ownerkey="thisisasecretkey";
                  
                /*FileInputStream reader=new FileInputStream(filePath + fileName);
		byte f1[]=new byte[10000];
		reader.read(f1); */
                  
                 File fileencr=new File(filePath + fileName);
            boolean exists=file.exists();
            if(exists){
           
            BufferedReader reader = new BufferedReader(new FileReader(filePath + fileName));
            //BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
            StringBuilder sb = new StringBuilder();
            String line;

            while((line = reader.readLine())!= null){
                sb.append(line+"\n"); 
            }
           
                  String path1 = new java.io.File(application.getRealPath(request.getRequestURI())).getParent().replace("\\build\\web", "\\web\\libfiles");
                  String decfilePath=path1+"/SDSUIBE/";
        
                String content = new String(sb); 
                IBE.encrypt(content,ownername); 
                  
                String nametext=IBE.encrypt(content,ownername);
                out.println(nametext);
                
                 
		FileOutputStream writer=new FileOutputStream(filePath + fileName);
		byte[] b=nametext.getBytes();
                int aaa=b.length;
		writer.write(b);
               
                String query=("insert into uploadfiles (filename,category,ownername,date,bytesencrypted) values( '" + fileName +  "', '" + catg + "','" + session.getAttribute("provnames") + "', '" + date +  "', '" + aaa +"')");
                    st.executeUpdate(query);
                    
                    String dates=(new java.util.Date()).toString();
                  st.executeUpdate("insert into results(filename,result,date) values( '" + fileName +  "', 'uploaded', '" +  dates + "');");
                 
                
             
                    JOptionPane.showMessageDialog(null," File Uploaded Successfully");
                    response.sendRedirect("uploadfiles.html"); 
            }
                }
            }
            }
         
        
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
     JOptionPane.showMessageDialog(null,"NO File Uploaded");
     response.sendRedirect("uploadfiles.html");
   }
        
        
      
        %>
    </body>
</html>
