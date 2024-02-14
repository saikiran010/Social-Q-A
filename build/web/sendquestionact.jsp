<%@page import="network.DbConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.io.*,javax.servlet.*, javax.servlet.http.*" %>


<%
                String sender =request.getParameter("sender");
		String category=request.getParameter("category");
                String question=request.getParameter("question");
                Connection con = null;
                 Statement st = null;
                    ResultSet rs = null;
                
   		try {
	   				SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
					Date now = new Date();
										
					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;
							
				 con = DbConnection.getConnection();
                                st = con.createStatement();	
       				
       				int i = st.executeUpdate("insert into questions (sender,category,question,dt) values ('"+sender+"','"+category+"','"+question+"','"+dt+"')");
	   			if (i != 0) {	
					response.sendRedirect("sendquestion.jsp?m1=success");
                    } else {
                        response.sendRedirect("sendquestion.jsp?m2=failed");
                    }	
								
	   		
	   		connection.close();
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
		
   		
	
	%>