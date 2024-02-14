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
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li><a href="index.html"><span>Home </span></a></li>
          <li><a href="user.jsp"><span>User</span></a></li>
          <li class="active"><a href="admin.jsp"><span>Admin</span></a></li>
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
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Welcome Admin</h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div id="templatemo_right_section">
        <table width="664" border="1" align="center"  cellpadding="0" cellspacing="0"  ">
          <tr>
            <td  width="39"  valign="bottom" height="34" style="color: #2c83b0;"><div align="center" class="style15 style21 style7 style6 style5">ID</div></td>
            <td  width="118" valign="bottom" height="34" style="color: #2c83b0;"><div align="center" class="style15 style21 style7 style6 style5">User Image</div></td>
            <td  width="112" valign="bottom" height="34" style="color: #2c83b0;"><div align="center" class="style15 style21 style7 style6 style5">User Name</div></td>
            <td  width="100" valign="bottom" height="34" style="color: #2c83b0;"><div align="center" class="style15 style21 style7 style6 style5">Email</div></td>
            <td  width="108" valign="bottom" height="34" style="color: #2c83b0;"><div align="center" class="style15 style21 style7 style6 style5">Date Of Birth</div></td>
             </tr>
          <%@ include file="connect.jsp" %>
          <%
					  
						String s1,s2,s3,s4,s5,s6;
						int i=0;
						try 
						{
						   	String query="select * from user"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		while ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(4);
								s3=rs.getString(7);
								s4=rs.getString(5);
								s5=rs.getString(6);
								s6=rs.getString(10);
							
								
								
								
								
							
						
					%>
          <tr>
            <td  valign="baseline" height="0"><p class="style22 style4 style5">&nbsp;</p>
                <div align="center" class="style22 style4 style5">
                  <%out.println(i);%>
                  <p>&nbsp; </p>
                </div></td>
            <td width="118" rowspan="1" ><div class="style22 style4 style5" style="margin:10px 13px 10px 13px;" > <a class="#" id="img1" href="#" >
                <input  name="image" type="image" src="user_Pic.jsp?id=<%=i%>" style="width:90px; height:90px;">
            </a> </div></td>
            <td  valign="baseline" height="0"><p class="style22 style4 style5">&nbsp;</p>
                <div align="center" class="style22 style4 style5">
                  <%out.println(s1);%>
                  <p>&nbsp; </p>
                </div></td>
            <td  valign="baseline" height="0"><p class="style22 style4 style5">&nbsp;</p>
                <div align="center" class="style22 style4 style5">
                  <%out.println(s2);%>
                  <p>&nbsp; </p>
                </div></td>
            <td  valign="baseline" height="0"><p class="style22 style4 style5">&nbsp;</p>
                <div align="center" class="style22 style4 style5">
                  <%out.println(s3);%>
                  <p>&nbsp; </p>
                </div></td>
    
          </tr>
          <%
						}
						
					
				
						connection.close();
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
                                        
                                        
                                        
                                        <%--        <tr>
            <td  valign="baseline" height="0">&nbsp;</td>
            <td  valign="baseline" height="0">&nbsp;</td>
            <td  valign="baseline" height="0">&nbsp;</td>
            <td  valign="baseline" height="0">&nbsp;</td>
            <td  valign="baseline" height="0">&nbsp;</td>
            <td  valign="baseline" height="0">&nbsp;</td>
</tr>--%>
        </table>
       </div>
          
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
              <p><a href="adminhome.jsp">Home</a></p>
            <p><a href="activateusers.jsp">Activate Users</a></p>
            <p><a href="viewusers.jsp"> View Users </a></p>
            <p><a href="topusers.jsp"> Top Users </a></p>
            <p><a href="graph.jsp"> Graph </a></p>
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
