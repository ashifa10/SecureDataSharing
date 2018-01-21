<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@include file="getcon.jsp"%>

<head>
  <title>SECURE DATA SHARING IN CLOUD COMPUTING</title>
  <meta name="description" content="free website template" />
  <meta name="keywords" content="enter your keywords here" />
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=9" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
</head>

<body>
  <div id="main">
    <div id="header">
	  <div id="banner">
	    <div id="welcome">
	      <h1>Secure Data Sharing in Cloud Computing Using Revocable Storage Identity Based Encryption</h1>
	    </div>
	    <div id="welcome_slogan">
	      <h1></h1>
	    </div>
	  </div>
    </div>

	<div id="menubar">
      <ul id="menu">
        <li><a href="index.html">Home</a></li>
        <li><a href="dataprovider.html">Data Provider</a></li>
        <li><a href="server.html">Storage Server</a></li>
        <li><a href="keyauthority.html">Key Authority</a></li>
        <li class="current"><a href="users.html">User</a></li>
      </ul>
    </div>	
    
	<div id="site_content">		

	  <div class="sidebar_container">       
		<div class="sidebar">
          <div class="sidebar_item">
            <h2>User Menu</h2>
            <p>
                <li ><a href="userpage.html">User Home</a></li><br><br>
        <li class="current"><a href="userrequest.html">Request Secret Key</a></li><br><br>
        <li><a href="userfindkey.html">Find Secret Key</a></li><br><br>
        <li><a href="userdownload.html">Download</a></li><br><br>
        <li><a href="users.html">Logout</a></li> <br><br>
                
            </p>
          </div> 
        </div>   		
		<div class="sidebar">
          <div class="sidebar_item">
            <h2>Concepts</h2>
            <h3></h3>
            <p>
                cloud computing, <br>
                data sharing, <br>
                revocation, <br>
                identity based encryption, <br><br><br>

                encrytion, <br>
                decryption, <br>
                key exposure, <br>

            </p>         
		  </div> 
        </div>
				
        <div class="sidebar">
          <div class="sidebar_item">
            <h2>Contact</h2>
            <p>Aswin T N</p>
            <p>Email: <a href="mailto:info@youremail.co.uk">aswint.n2016@vitstudent.ac.in</a></p>
          </div>
        </div>
       </div>	
	
	  <div class="slideshow">
	    <ul class="slideshow">
          <li class="show"><img width="680" height="250" src="images/home_1.jpg" alt="&quot;cloud&quot;" /></li>
          <li><img width="680" height="250" src="images/home_2.jpg" alt="&quot;cloud&quot;" /></li>
        </ul>
      </div>	  	 
	 
	  <div id="content">
        <div class="content_item">
            <h1>Data User</h1> 
            <p><br><br> </p><br><br>
                        
                                <font size="4" color="white">  <center>   Your Secret Key for the file	</center>  
            <div class="form_settings">
          <%
          String username=session.getAttribute("username").toString();
          String filename=request.getParameter("filename");
          
          if(username!=null && filename!=null){
               try{
               String query="select filename,ownername,username,keygen from keyrequest where filename=? and username=?";
               PreparedStatement check=con.prepareStatement(query);
               check.setString(1, filename);
               check.setString(2, username);
               ResultSet rs=check.executeQuery();
               
               if(rs.next()){
                   String file=rs.getString("filename");
                   String user=rs.getString("username");
                   String owner=rs.getString("ownername");
                   String key=rs.getString("keygen");
                   
                   if(key.equals("Generate key")){
                        JOptionPane.showMessageDialog(null,"key doesnot Generated");
           response.sendRedirect("userfindkey.html");
               
                   }else{
                       out.println("FileName:" + file );out.print("<br/><br/>"); 
                       out.println("Secret key:" + key + System.lineSeparator());
                       
                       
                   }
               
                 
                     
               }else{
                    JOptionPane.showMessageDialog(null,"please send request for this file");
           response.sendRedirect("userfindkey.html");
               }
               
           }catch(Exception e){
               e.printStackTrace();
           }
              
          }else{
               JOptionPane.showMessageDialog(null,"enter the valid details");
           response.sendRedirect("userfindkey.html");
            
          }
          %>
		
		  <br style="clear:both"/>
		  
            </div>
             </font>	
              
              
		</div>
      </div>   
	</div>
    
	   
 
  </div>
  
  
  
</body>
</html>
