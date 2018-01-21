
<%@page import="javax.swing.JOptionPane"%>
<%@include file="getcon.jsp"%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>key generation Page</title>
    </head>
    <body>
        <%
        String filename=request.getParameter("filename");
        
         Random random = new Random();
		   String r = "";
		   for (int j = 0; j < 1; j++) {
			   long randkey = random.nextLong();
			   long a = randkey % 10;
			   if (a == 0) {
				   r = Long.toString(randkey);
			   }else {
				   randkey = randkey + a;
				   r = Long.toString(randkey);
			   }
			  
		   }
                   String keygen = r.substring(3, 12);
                 
                  try{
                String query="select id,filename from keyrequest where filename=?";
                PreparedStatement check=con.prepareStatement(query);
                check.setString(1,filename); 
                ResultSet rs=check.executeQuery();
                
                if(rs.next()){
                   String id=rs.getString("id"); 
                   st.executeUpdate("UPDATE  keyrequest SET keygen = REPLACE(keygen, 'Generate key','" + keygen + "'" + ")WHERE id =" + id );
                    JOptionPane.showMessageDialog(null,"Secret key Generated");
                    response.sendRedirect("viewrequest.jsp");
                       
                        }
            }catch(Exception e){
                e.printStackTrace();
            }
		
        %>
    </body>
</html>



