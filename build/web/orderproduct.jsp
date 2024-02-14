<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
   

    <title>Order Processing System</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/component.css">
    <link rel="stylesheet" href="css/custom-styles.css">
    <link rel="stylesheet" href="css/font-awesome.css">
	
     
	 <link rel="stylesheet" href="css/demo.css">
    <link rel="stylesheet" href="css/font-awesome-ie7.css">

      
     
  </head>
<script>
    
    var uc=0,q=0;
    
  function getcomp()
{
var product = document.getElementById("product");
     var url = "getprice.jsp?product="+product.value;
   if (window.XMLHttpRequest) 
       req = new XMLHttpRequest();
   else if (window.ActiveXObject) 
       req = new ActiveXObject("Microsoft.XMLHTTP");
   req.open("GET", url, true);
   req.onreadystatechange=compcallback;
   req.send(null);
}
  
  function compcallback() 
{
     if (req.readyState == 4) 
   {
        if (req.status == 200) 
       {
         frm.company.remove(0);
         frm.company.remove(1);
         frm.company[0]=new Option("Company"); 
         var message = req.responseText;
         var f1=message.indexOf(":");
         var fitem=message.substring(0,f1);
        
         var sitem=message.substring(f1+1,message.length-1);
         frm.company[1]=new Option(fitem.substring(2),fitem.substring(2));
         frm.company[2]=new Option(sitem,sitem);
         if(sitem!=":")
          frm.company[3]=new Option(sitem,sitem);
         
        }
    }
}
function getprice()
{
  var product=document.getElementById("product");
  var company=document.getElementById("company");
       var url = "getprice1.jsp?product="+product.value+"&company="+company.value;
   if (window.XMLHttpRequest) 
       req = new XMLHttpRequest();
   else if (window.ActiveXObject) 
       req = new ActiveXObject("Microsoft.XMLHTTP");
   req.open("GET", url, true);
   req.onreadystatechange=pricecallback;
   req.send(null);
}

function pricecallback() 
{
     if (req.readyState == 4) 
   {
        if (req.status == 200) 
       {
             var message = req.responseText;
             frm.uc.value=message;
             costcal();
             frm.q.focus();
             frm.q.select();
        }
   }
}

function costcal()
{
  uc=eval(frm.uc.value);
  q=eval(frm.q.value);
  var cs=q*uc;
  frm.total.value=cs; 
}
  </script>
  
  <body>
    <div class="header-wrapper">
      <div class="site-name">
        <h1>Order Processing System</h1>
        
      </div>
    </div>
    <div class="menu">
      <div class="navbar">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <i class="fw-icon-th-list"></i>
            </button>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="userhome.jsp">Home</a></li>
              <li><a href="orderproduct.jsp">Order Product</a></li>
              <li><a href="adminlogin.jsp">Logout</a></li>
            </ul>
          </div><!--/.navbar-collapse -->
        </div>
      </div>
      

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="banner">
      <div id="carousel-example-generic" class="carousel slide">
  
  <!-- Wrapper for slides -->
        <div class="carousel-inner">
          <div class="item active">
            <img src="img/banner-image.jpg" alt="">
            <div class="carousel-caption">
              <h1>Order Processing System</h1>
              
            </div>
          </div>
            
            <%
ResultSet rst=null;
ResultSet rst1=null;
//int ordid1=0;
try{
Class.forName("com.mysql.jdbc.Driver");
Connection co=DriverManager.getConnection("jdbc:mysql://localhost:3306/orderprocessing", "root", "root");
String product=request.getParameter("product");
//int ordid=0;
PreparedStatement ps=co.prepareStatement("select productname from productadd");
rst=ps.executeQuery();

 
 }catch(Exception e)
  { out.write(e.toString()); }
%>
            
         <div id="content">
			
            <form name="frm" action="orderproductadd.jsp" >
                
            <br><br>
              <td>Select Product : </td>
<td>
<select name="product" id="product" onChange="getcomp()">
<option>Product</option>

<%while(rst.next())
{
String f1=rst.getString(1);
%>
<option value="<%=f1%>"><%=f1%></option>
<%
 }
%>
</select>
</td>
<br><br>
              <td>Select Company : </td>
<td>
<select name="company" id="company" style="width:190" onChange="getprice()">
</select>
</td>
<td>Unit Cost : </td>
<td><input type="text" size="10" name="uc" id="uc" readonly  style="text-align:right"><td></tr>
<tr>
<td>Quantity : </td>
<td><input type="text" size="10" name="q" id="q" onKeyUp="costcal()" value="0" style="text-align:right">
<td>Cost : </td>
<td><input type="text" size="10" name="total" id="total" readonly  value="0" style="text-align:right"></td>
</tr>
<tr><td><br></td></tr>
<tr>

           
              <br>
              <input type="hidden" value="reg" name="saction" />
              <input type="submit" value="Submit" class="button" style="margin-left: 80px"/>
                            <input type="reset" value="Reset" class="button"/>
      </form>  
                    </center><br />
                </div>
            </div>
      
              
      <div class="clr"></div>
    </div>
  </div>
  
  <div class="footer style2">
    <div class="footer_resize">
     
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style2"></div>
  </body>
</html>
