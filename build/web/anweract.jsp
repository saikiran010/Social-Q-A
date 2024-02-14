            <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
            <%@page import="java.text.SimpleDateFormat"%>
            <%@page import="java.sql.Statement"%>

            <%@page import="network.DbConnection"%>
           
            
            <%
            
                String answerby = session.getAttribute("username").toString();
                String sender =request.getParameter("sender");
		String category=request.getParameter("category");
                String question=request.getParameter("question");
                 
                  String answer=request.getParameter("answer");
                 
                Connection con = null;
                 Statement st = null;
                    ResultSet rs = null;
                
   		try {
	   				
							
				 con = DbConnection.getConnection();
                                st = con.createStatement();	
                                
                                PreparedStatement ps = con.prepareStatement("insert into answers values(?,?,?,?,?)");
                                
                                ps.setString(1,answerby);
                                ps.setString(2,sender);
                                ps.setString(3,category);
                                ps.setString(4,question);
                                ps.setString(5,answer);
       				
       				int i = ps.executeUpdate();
	   			if (i != 0) {	
					response.sendRedirect("viewquestion.jsp?m1=success");
                    } else {
                        response.sendRedirect("viewquestion.jsp?m2=failed");
                    }	
								
	   		
	   		con.close();
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
		
   		
	
	%>
            
            