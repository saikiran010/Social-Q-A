<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<html><title>Structured Learning: user status changing</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
  		String rto =request.getParameter("rname");
		String rfrom=session.getAttribute("username").toString();
   		try {
	   				SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
					Date now = new Date();
										
					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;
							
				
                            String sql="SELECT * FROM request where requestto='"+rto+"' and requestfrom='"+rfrom+"'";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);        
                                if(rs.next()){
                                
                                response.sendRedirect("uia.jsp?m2=Already Request Sent");  
                                }        
                                        
                                else {        
                                        
       				Statement st1 = connection.createStatement();
       				String query1 ="insert into request (requestfrom,requestto,dt,status) values ('"+rfrom+"','"+rto+"','"+dt+"','waiting')";
	   				st1.executeUpdate (query1);
				Statement st11 = connection.createStatement();
       				String query11 ="insert into request (requestfrom,requestto,dt,status) values ('"+rto+"','"+rfrom+"','"+dt+"','waiting')";
	   				st11.executeUpdate (query11);			
				 response.sendRedirect("uia.jsp?m1= Request Sent");  				
                                }
	   		connection.close();
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
		
   		
	
	%>
</body>
</html>