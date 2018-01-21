<%@include file="getcon.jsp"%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>request checking Page</title>
    </head>
    <body>
       <%
       String ownername=request.getParameter("ownername");
      // String username=request.getParameter("username");
       //final String username=session.getAttribute("username").toString();
       String username=String.valueOf(session.getAttribute("username"));
       String filename=request.getParameter("filename");
      
       String keygen="Generate key";
       
       if(ownername!=null && filename!=null){
            try{
            String query="select name from dataprovider where name=?";
                PreparedStatement check=con.prepareStatement(query);
                check.setString(1,ownername);
                ResultSet rs=check.executeQuery(); 
                
                  if(rs.next()){
                String filequery="select filename from uploadfiles where filename=?";
                 PreparedStatement filecheck=con.prepareStatement(filequery);
                 filecheck.setString(1,filename); 
                 ResultSet filers=filecheck.executeQuery(); 
                
                 if(filers.next())
                 {
                
              
                    String keyquery="select* from keyrequest where filename=? and username=?";
                PreparedStatement keycheck=con.prepareStatement(keyquery);
                keycheck.setString(1,filename);
                 keycheck.setString(2,username);
                 ResultSet keyrs=keycheck.executeQuery(); 
                
                if(keyrs.next()){
                    JOptionPane.showMessageDialog(null,"Key Request already sent");
                        response.sendRedirect("userrequest.html");
                        
                }else{
                 
                   
                 int x=JOptionPane.showConfirmDialog(null,"send key request?");
                     if(x==0)
                      { 
                     st.executeUpdate("insert into keyrequest(filename,ownername,username,keygen) values( '" + filename +  "', '" + ownername + "','" +session.getAttribute("username") + "','" +keygen + "');");  out.println("hai...");
                    JOptionPane.showMessageDialog(null,"Request sent Successfully");
                    response.sendRedirect("userpage.html");
                        }
                        else
                        {
                         response.sendRedirect("userrequest.html");
                         }
                }
                
                
                 }
                else{
             JOptionPane.showMessageDialog(null, "File Doesnot Exists");
            response.sendRedirect("userrequest.html");
       } 
                
                }else{
             JOptionPane.showMessageDialog(null, "owner doesnot exists");
            response.sendRedirect("userrequest.html");
       }  
                  
            }catch(Exception e){
                e.printStackTrace();
            }
           
       }else{
             JOptionPane.showMessageDialog(null, "enter valid details");
            response.sendRedirect("userrequest.html");
       }           
       %>
    </body>
</html>
