<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@ include file="connect.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <%
if(request.getParameter("m1")!=null){%>
    
    <script>alert('Request Success..!')</script>
}  

<%}
if(request.getParameter("m2")!=null){%>

 <script>alert('Already Friends..!')</script>
 <%
}
%>
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
                String usernamea = ses.getAttribute("username").toString();
    %>  
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
<%
	  			
						String s1=null,s2=null,s3=null,s4=null,s5=null,s6=null,s7=null,s8=null,s9=null,s10=null,s11=null,s12=null,s13=null;
						String uname = session.getAttribute("username").toString();
						String username = session.getAttribute("category").toString();
						int i=0;
						try 
						{
						
							SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
							SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
							Date now = new Date();
										
							String strDate = sdfDate.format(now);
							String strTime = sdfTime.format(now);
							String dt = strDate + "   " + strTime;
						
						
						if(username!=null){
						   	
							%>
            <h2><span>Interest  <span class="style19">Analyzer </span></span></h2>
            <%
							if(!username.equalsIgnoreCase(""))
								{
									Statement st3 = connection.createStatement();
									String query3 ="insert into friendsearch(username,keyword,dt) values('"+uname+"','"+username+"','"+dt+"')";
									st3.executeUpdate (query3); 	   
								}
							
							
							
							String query="select * from user where  username!='"+uname+"' and category  = 'Android' "; 
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
								s7=rs.getString(9);
								s8=rs.getString(10);
	  							
								
	  %>
            <table border="3" width="518" style="margin:2px 8px 8px 2px;">
              <tr>
                <td rowspan="8" width="148" ><input  name="image" type="image" src="userimages.jsp?imgid=<%=i%>" style="width:150px; height:200px;" class="image_wrapper" />                </td>
                <td width="118"><span style="margin-left:20px; color:#006633;"><strong>User Name:</strong></span></td>
                <td width="249" style="margin-left:20px; color:#000000;"><%=s1%></td>
              </tr>
              <tr>
                <td><span style="margin-left:20px; color:#006633;"><strong>E-Mail:</strong></span></td>
                <td style="margin-left:20px; color:#000000;"><%=s2%></td>
              </tr>
              <tr>
                <td><span style="margin-left:20px; color:#006633;"><strong>Mobile:</strong></span></td>
                <td style="margin-left:20px; color:#000000;"><%=s3%></td>
              </tr>
              <tr>
                <td><span style="margin-left:20px; color:#006633;"><strong>Address:</strong></span></td>
                <td style="margin-left:20px; color:#000000;"><%=s4%></td>
              </tr>
              <tr>
                <td><span style="margin-left:20px; color:#006633;"><strong>D.O.B:</strong></span></td>
                <td style="margin-left:20px; color:#000000;"><%=s5%></td>
              </tr>
              <tr>
                <td><span style="margin-left:20px; color:#006633;"><strong>Gender:</strong></span></td>
                <td style="margin-left:20px; color:#000000;"><%=s6%></td>
              </tr>
              <tr>
                <td><span style="margin-left:20px; color:#006633;"><strong>category:</strong></span></td>
                <td style="margin-left:20px; color:#000000;"><%=s7%></td>
              </tr>
              <tr>
                <td><span style="margin-left:20px; color:#006633;"><strong>Status:</strong></span></td>
                <td style="margin-left:20px; color:#000000;"><%=s8%><span style="float:right"><a href="updaterequest.jsp?rname=<%=s1%>">
                  <input class="art-button" name="button" type="button" value="Request" />
                </a></span></td>
              </tr>
            </table>
            <%
				  			}
				  
	  						}
							}catch(Exception e){
								e.getMessage();
							}
	  
				  
				  %>
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
