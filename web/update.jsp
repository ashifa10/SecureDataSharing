<%@page language="java"%>
<%@page import="IBEencryption.IBE"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

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
        <li  class="current"><a href="dataprovider.html">Data Provider</a></li>
        <li><a href="server.html">Storage Server</a></li>
        <li><a href="keyauthority.html">Key Authority</a></li>
        <li><a href="users.html">User</a></li>
      </ul>
    </div>	
    
	<div id="site_content">		

	  <div class="sidebar_container">       
		<div class="sidebar">
          <div class="sidebar_item">
            <h2>Data Provider Menu</h2>
            <p>
                <li ><a href="dataproviderpage.html">Data Provider Home</a></li><br><br>
        <li class="current"><a href="uploadfiles.html">Upload Files</a></li><br><br>
        <li><a href="updatefiles.jsp">Update Files</a></li><br><br>
        <li><a href="provviewfiles.jsp">View Files</a></li><br><br>
        <li><a href="provviewkey.jsp">View Key</a></li><br><br>
        <li><a href="dataprovider.html">Logout</a></li> <br><br>
                
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
            <h1>Data Provider</h1> 
            <p><br><br> </p><br><br>
                        
                                <font size="4" color="white">  <center>   Update Your File.....	</center>  
            <div class="form_settings">
         <%
         String filename=request.getParameter("filename");
         String username=session.getAttribute("provnames").toString();
         
           // String txtFilePath = "C:\\data\\"+filename;
            String path = new java.io.File(application.getRealPath(request.getRequestURI())).getParent().replace("\\build\\web", "\\Files");
            String txtFilePath=path+"\\"+username+"\\"+filename;
             System.out.println(txtFilePath);      
           
            
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
           
            
                //FileInputStream readers=new FileInputStream(filePath + fileName);
                //byte f11[]=new byte[aaa];
		//readers.read(f11);
                String ownername="OwnersSecretkeys";
                String contents = new String(sb);
                String nametexts=IBE.decrypt(contents,ownername);
		out.println(nametexts);
         ///////////////////////////decryption session ends//////////////////////       
            %>
           <form action="updatecheck.jsp" method="post">
              <input name="filename" value="<%=filename%>"><br> 
          <textarea name="text" rows="20" cols="100">
                <%  out.println(nametexts);
                reader.close();
            }else{
                JOptionPane.showMessageDialog(null,"File Not Found");
               response.sendRedirect("updatefiles.jsp");
           }  
                %>
            </textarea>
           <p style="padding-top: 20px" size="5"><span>&nbsp;</span><input class="submit" type="submit"  value="Update" /></p>
            
           </form>
         
         
		
		  <br style="clear:both"/>
		  
            </div>
             </font>	
              
              
		</div>
      </div>  
	</div>
    
	   
 
  </div>
  
 
</body>
</html>
