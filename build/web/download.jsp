
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page language="java"%>
<%@page import="IBEencryption.IBE"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@include file="getcon.jsp"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Download Page</title>
    </head>
    <body>
        <%
        String filedown=request.getParameter("filedown");
        String downkey=request.getParameter("downkey");
        String username=session.getAttribute("username").toString();
        
        
        
        if(filedown!=null && downkey!=null){
            try{
               String query="select * from keyrequest where filename=? and username=?";
               PreparedStatement check=con.prepareStatement(query);
               check.setString(1, filedown);
               check.setString(2, username);
               ResultSet rs=check.executeQuery();
               
               if(rs.next()){
                   String keygen=rs.getString("keygen");
                   String ownername1=rs.getString("ownername"); 
                   
               if(downkey.equals(keygen)){   
                   
              String path = new java.io.File(application.getRealPath(request.getRequestURI())).getParent().replace("\\build\\web", "\\Files");
              String txtFilePath=path+"\\"+ownername1+"\\"+filedown; 
       
      
                    String filename = filedown;  
                    File file=new File(txtFilePath);  
                    boolean exists=file.exists();
                    if(exists){    
                    BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
                   //BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
                   StringBuilder sb = new StringBuilder();
                   String line;

                   while((line = reader.readLine())!= null){
                   sb.append(line+"\n"); 
                   }
           
                String ownername="OwnersSecretkeys";
                String contents = new String(sb);
                String nametexts=IBE.decrypt(contents,ownername);
		out.println(nametexts);
        
                File tempfile=new File(path+filedown);
		tempfile.getParentFile().mkdirs();
		tempfile.createNewFile();
                FileOutputStream writer=new FileOutputStream(path+filedown);
		byte[] b=nametexts.getBytes();
                int aaa=b.length;
		writer.write(b);     
                writer.close();
        
               response.sendRedirect("downloadcheck.jsp?filename="+filename+"&&downpath="+path+filedown);
        
                    }    
                   
               }else{
                    JOptionPane.showMessageDialog(null,"you are a attacker");
                   
                     String idquery="select* from datauser where name=?";
               PreparedStatement idcheck=con.prepareStatement(idquery);
               idcheck.setString(1, username); 
               ResultSet idrs=idcheck.executeQuery();
                
               if(idrs.next()){
                   String id=idrs.getString("id");
              
                 
                    String revokequery="UPDATE datauser SET status = REPLACE(status, 'active', 'revoked') WHERE id="+ id ;
                    st.executeUpdate(revokequery);
                    JOptionPane.showMessageDialog(null,"user revoked"); 
                    
                    
                   
                    String date=(new java.util.Date()).toString(); out.println(username+filedown+downkey+date);
                    st.executeUpdate("insert into attacker(name,filename,keytried,date) values( '" + username +  "', '" +filedown +"', '" + downkey +  "','" + date + "');");
                    st.executeUpdate("insert into results(filename,result,date) values( '" + filedown +  "', 'safe from attack', '" +  date + "');");
                   
                    
                    response.sendRedirect("users.html");
               }
               }    
                   
               
               }else{
                    JOptionPane.showMessageDialog(null,"file not found");
           response.sendRedirect("userdownload.html");
               }
               
           }catch(Exception e){
               e.printStackTrace();
           }
            
        }else{
            JOptionPane.showMessageDialog(null,"enter required details");
           response.sendRedirect("userdownload.html");
      
        }
            
        %>
    </body>
</html>
