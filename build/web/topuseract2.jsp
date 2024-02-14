<%@page import="network.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
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
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span>Home </span></a></li>
          <li><a href="user.jsp"><span>User</span></a></li>
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
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Select Category</h2>
          
          <p class="infopost">&nbsp;</p>
          
               <%
                                PreparedStatement pstm1 = null;
                                String query7="delete from counte ";
                                pstm1=connection.prepareStatement(query7);
                            
				pstm1.executeUpdate();
               
                            
               
                        String question = request.getParameter("question");
                        String category = request.getParameter("category");
                   try{
                       
                    int i = 0;          		
			String sql="SELECT  distinct  answerby FROM answers where category = '"+category+"' and question = '"+question+"' ";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			
                         while (rs.next()) {
                 
                     
                        String sql1="SELECT * FROM answers where category = '"+category+"' and question = '"+question+"' and answerby='"+rs.getString("answerby")+"' ";
                        Statement stmt1 = connection.createStatement();
			ResultSet rs1 =stmt1.executeQuery(sql1);
                        
                        
                        while(rs1.next()){
                        
                            i=i+1;
                        
                        }
                        
                        
                         PreparedStatement ps1=connection.prepareStatement("insert into counte (username,category,question,count) values ('"+rs.getString("answerby")+"','"+category+"','"+question+"',"+i+")");
                     int j=ps1.executeUpdate();
                          i=0;   
                         }
                        
			%>
          
                        
                        
                        <table width="664" border="1" align="center"  cellpadding="0" cellspacing="0"  >
          <tr>
            <td  width="112" valign="bottom" height="14" style="color: #2c83b0;"><div align="center" class="style15 style21 style7 style6 style5">User Name</div></td>
            <td  width="100" valign="bottom" height="14" style="color: #2c83b0;"><div align="center" class="style15 style21 style7 style6 style5">Category</div></td>
            <td  width="108" valign="bottom" height="14" style="color: #2c83b0;"><div align="center" class="style15 style21 style7 style6 style5">Question</div></td>
            <td  width="108" valign="bottom" height="14" style="color: #2c83b0;"><div align="center" class="style15 style21 style7 style6 style5">Count</div></td>
            
          </tr>
      
          <%
					  
						String s1,s2,s4,s5,s6;
						int s3 = 0;
						   	String query11="select * from counte"; 
						   	Statement st11=connection.createStatement();
						   	ResultSet rs11=st11.executeQuery(query11);
					   		while ( rs11.next() )
					   		{
								
								s1=rs11.getString(1);
								s2=rs11.getString(2);
								s4=rs11.getString(3);
								s3=rs11.getInt(4);
								
							
								
								
								
								
							
						
					%>
        
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
                  <%out.println(s4);%>
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
           
              
              
          
          <div class="clr"></div>
         
          
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
        <h2>Cluster </h2>
        <p align="justify">          A cluster is a collection of data objects that are similar to one 
          another within the same cluster and are dissimilar to the 
          objects in other clusters. Thus, in essence, the task of clustering 
          approach in clustering CF is to discover domains. 
          Recently, with the development of internet, various contextual 
          information as well as the rating matrix are integrated 
          to discover some meaningful domains, where the typical contexts include item attributes, 
        user trust, social network, and so on.</p>
      </div>
      <div class="col c3">
        <h2>Project Topics </h2>
        <p>Recommender System.</p>
        <p>Matrix Factorization.</p>
        <p> User-Item Subgroup.</p>
        <p>Collaborative Filtering.</p>
        <p>Clustering Collaborative Filtering.</p>
        <p>        Domain Detection Model.</p>
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
<%
                                          }           
                     
                     catch(Exception e)
        
        {
        
        }
                
        
                   
        %>