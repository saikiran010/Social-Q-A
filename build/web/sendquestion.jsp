
<%@page import="java.sql.Statement"%>
<%@page import="sun.security.util.Password"%>
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
    
    <script>alert('Questoin Posted Success..!')</script>
}  

<%}
if(request.getParameter("m2")!=null){%>

 <script>alert('Post Failed..!')</script>
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
                String username = ses.getAttribute("username").toString();
    %>  
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Welcome <%=username%></h2>
          
          <div id="contact_form">
          <form method="post" name="contact" action="sendquestionact.jsp">
                                
              <label for="author">Your Name:</label> <input readonly value="<%=username%>"  name="sender" class="required input_field" />
                                <div class="cleaner_h10"></div>
                                <%
                              		
			String sql="SELECT category FROM category  ";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			
			%>
			
                    
                                 <label for="gender">Select Gender </label>
          
            <select id="s1" name="category" required="" class="text">
                
                <option value="" >--Select--</option>
                <% 
                        while(rs.next())
                        {
                        String category = rs.getString("category");
                        
                                 %>
                
           
                                 <option value="<%=category%>" ><%=category%></option>
              <% }%>
            </select>
                                <div class="cleaner_h10"></div>
                                
                                <label for="text">Question:</label> <input type="text" required id="email" placeholder="Type Your Question" name="question" class="validate-email required input_field" />
                                
                                <div class="cleaner_h10"></div>
                                <br>
                                <input type="submit" class="submit_btn" name="submit" id="submit" value="Send" />
                                <input type="reset" class="submit_btn" name="reset" id="reset" value="Reset" />
                            
                            </form>
          </div>
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
