<%@page import="java.sql.*"%>
<%
  
    ResultSet rs=null;
try{
response.setContentType("text/xml");
response.setHeader("Cache-Control", "no-cache");

Class.forName("com.mysql.jdbc.Driver");
Connection co=DriverManager.getConnection("jdbc:mysql://localhost:3306/qa", "root", "root");
String productname = request.getParameter("category");
System.out.println("ddsfjd"+productname);
String query1 = "select question from questions where category ='"+productname+"'";
Statement st1 = co.createStatement();
    rs=st1.executeQuery(query1); 

String cnm="";
while(rs.next())
{
  cnm=cnm+rs.getString("question")+":";
  
 }
out.write(cnm);
 }catch(Exception e)
  { out.write(e.toString()); }
%>