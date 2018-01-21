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
        <li ><a href="index.html">Home</a></li>
        <li class="current"><a href="dataprovider.html">Data Provider</a></li>
        <li ><a href="server.html">Storage Server</a></li>
        <li><a href="keyauthority.html">Key Authority</a></li>
        <li><a href="users.html">User</a></li>
      </ul>
    </div>	
    
	<div id="site_content">		

	  <div class="sidebar_container">       
		<div class="sidebar">
          <div class="sidebar_item">
            <h2>DataProvider Menu</h2>
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
                        
             <font size="4" color="white">   List Of Upload Files with Secret Keys
            <div class="form_settings">
           
		
		  <br style="clear:both"/>
		  
            </div>
             </font>	
           <table border=1; width=700px; cellpadding=2; cellspacing=2;>
               <font color="blue"> 
                   <tr>
                   <th style="background-color:background">File Name</th>
                    <th style="background-color:background">Owner Name</th>
                      <th style="background-color:background">Secret Key</th>
                    </font>
                   </tr>   
                   <%
                    String query="select* from keyrequest where ownername='"+session.getAttribute("provnames")+"'";
                PreparedStatement check=con.prepareStatement(query);
                ResultSet rs=check.executeQuery();
                
              while(rs.next()){
                  %>
                    <tr>
                   <th style="background-color:whitesmoke"><%=rs.getString("filename")%></th>
                    <th style="background-color:whitesmoke"><%=rs.getString("ownername")%></th>
                    <%
                    if((rs.getString("keygen")).equals("Generate key")){
                    %>
                    <th style="background-color:activecaption"><font colour="red">Key not Generated</font></th>
                    <%
                    }else{
                    %>
                    <th style="background-color:whitesmoke"><%=rs.getString("keygen")%></th>
                    <%
                            }
                    %>
                   
                   </tr>
                      <%
                    
                }
                  %>         
            </table>
           	</div>
      </div>  
	</div>
    
	   
 
  </div>
  
 
</body>
</html>
