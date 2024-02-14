<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Social Q&A</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style8 {font-size: 20px}
.style17 {font-size: 32px; color: #FF6600; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li><a href="index.html"><span>Home </span></a></li>
          <li class="active"><a href="user.jsp"><span>User</span></a></li>
          <li><a href="admin.jsp"><span>Admin</span></a></li>
        </ul>
      </div>
        
      <div class="logo style8">
        <p class="style17">Social Q&A: An Online Social Network Based</p>
        <p class="style17"> Question and Answer System</p>
      </div>
      <div class="clr"></div>
      <div class="slider">
       <div id="coin-slider"> <a href="#"><img src="ima/1.jpg" width="940" height="271" alt="" /> </a> <a href="#"><img src="ima/2.jpg" width="940" height="271" alt="" /> </a> <a href="#"><img src="ima/3.jpg" width="940" height="271" alt="" /> </a> </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
    <%
                HttpSession ses = request.getSession(true);
                String uname = ses.getAttribute("username").toString();
    %>  
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
           
          <h2> Friend Requests </h2>
            <p class="infopost">&nbsp;</p>
      
              <table width="581" border="3"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse; margin:10px 0px 0px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
                <tr>
                  <td  width="119" height="30" align="center" valign="bottom" style="color: #2c83b0;"><div align="center"><b>Request From</b></div></td>
                  <td  width="116" height="30" align="center" valign="bottom" style="color: #2c83b0;"><div align="center"><strong>Request To</strong></div></td>
                  <td  width="133" height="30" align="center" valign="bottom" style="color: #2c83b0;"><div align="center"><b>Address</b></div></td>
                  <td  width="101" height="30" align="center" valign="bottom" style="color: #2c83b0;"><div align="center"><b>Gender</b></div></td>
                  <td  width="138" height="30" align="center" valign="bottom" style="color: #2c83b0;"><div align="center"><b>Status</b></div></td>
                </tr>
                <%
					  	
						String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,h5,h6;
						int i=0;
						try 
						{
						   	String query="select * from user where username!='"+uname+"'"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		while ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(4);
								s3=rs.getString(5);
								s4=rs.getString(6);
								s5=rs.getString(7);
								s6=rs.getString(8);
								//s7=rs.getString(9);
								s8=rs.getString(10);
								
								String status="";
								String query1="select * from request where (requestfrom='"+uname+"' && requestto='"+s1+"') "; 
								Statement st1=connection.createStatement();
								ResultSet rs1=st1.executeQuery(query1);
								while(rs1.next())
								{
									int j = rs1.getInt(1);
                                                                        h5=rs1.getString(2);
                                                                        h6=rs1.getString(3);
									status = rs1.getString(5);
						
					%>
                <tr>
                  <td  width="119" height="46" align="center" valign="middle" style="color:#000000;">&nbsp;&nbsp;
                      <%out.println(h5);%></td>
                  <td  width="116" height="46" align="center" valign="middle">&nbsp;&nbsp;
                  <%out.println(h6);%></td>
                  <td height="46" align="center"  valign="middle">&nbsp;&nbsp;
                      <%out.println(s4);%></td>
                  <td height="46" align="center"  valign="middle">&nbsp;&nbsp;
                      <%out.println(s6);%></td>
                  <%
						if(status.equalsIgnoreCase("waiting"))
						{
						
						%>
                  <td  width="138" valign="middle" height="46" style="color:#000000;"align="center"><a href="updaterequest1.jsp?rid=<%=j%>" class="style14">waiting</a></td>
                  <%
						}
						else
						{
						%>
                  <td  width="17" valign="middle" height="46" style="color:#000000;"align="center"><%out.println(status);%>
                  &nbsp;</td>
                  <%
						}
						%>
                </tr>
                <%
						}
						}
						connection.close();
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
                <tr>
                  <td  valign="baseline" height="0">&nbsp;</td>
                  <td  valign="baseline" height="0">&nbsp;</td>
                  <td  valign="baseline" height="0">&nbsp;</td>
                  <td  valign="baseline" height="0">&nbsp;</td>
                  <td  valign="baseline" height="0">&nbsp;</td>
                </tr>
              </table>
          
          <div class="clr"></div>
          <%--   <div class="img"><img src="ima/arch.png" width="630" height="221" alt="" class="fl" /></div>--%>
          
          <div class="clr"></div>
        </div>
        <div class="article">
          
          <div class="clr"></div>
          
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
       
        <div class="gadget">
          <h2 class="star"><span>Side Menu</span></h2>
          <div class="clr"></div>
          <ul class="ex_menu"><li>
              <p><a href="userhome.jsp">Home</a></p>           
            <p><a href="viewprofile.jsp"> View Profile </a></p>
            <p><a href="uia.jsp">User Interest Analyzer</a></p>
             <p><a href="viewrequests.jsp">View Requests</a></p>
             <p><a href="sendquestion.jsp">Send Question</a></p>
             <p><a href="viewquestion.jsp">View Question</a></p>
             <p><a href="viewanswers.jsp">View Answers</a></p>
            <p><a href="logout.jsp"> Logout </a></p>
            <br />
          </li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image</span> Gallery</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
       <h2>Social Q&A Design </h2>
        <p align="justify">          A real-life social network is formed by regarding each person
as a node and linking two nodes with a social relationship.
This network is featured by social communities such as the
football club and ECE department at a university. In real life,
the people we rely on for answers to questions such as ?how is
the computer organization class at our university?? are usually
those in our social communities.</p>
      </div>
      <div class="col c3">
        <h2>Project Topics </h2>
        <p>Analysis of Questions.</p>
        <p>Quality of Answers.</p>
        
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
