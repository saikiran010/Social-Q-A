
<%@page import="java.sql.Statement"%>
<%@ include file="connect.jsp" %>

<%


String email=request.getParameter("email");      
   	        String Password=request.getParameter("password");
			
			application.setAttribute("email",email);
			
			String sql="SELECT * FROM user where email='"+email+"' and password='"+Password+"'";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			
			
			if(rs.next())
			{
                        session.setAttribute("email", rs.getString("email"));
                        session.setAttribute("username", rs.getString("username"));
                        session.setAttribute("category", rs.getString("category"));
			String sql1="SELECT * FROM user where email='"+email+"' and status='Waiting'";
			Statement stmt1 = connection.createStatement();
			ResultSet rs1 =stmt1.executeQuery(sql1);
			
			if(rs1.next())
			    {
				%>
									<p>Yor are not Authorized by Admin,wait!! </p><br/><br/><a href="UserLogin.jsp">Back</a>
									<%
				}
				else
				{
				response.sendRedirect("userhome.jsp?m1=successs");
			    }
			}
			else
			{
				out.print("Invalid Login Details");
				 %><br/><br/><a href="UserLogin.jsp">Back</a><%
			}



%>