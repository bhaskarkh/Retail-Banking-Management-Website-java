<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <% 
    String role=(String)session.getAttribute("AccType");
    
    
    if(role==null){response.sendRedirect("Loginpage.jsp");}
    else
    {if(role.equalsIgnoreCase("CAE")){}else{response.sendRedirect("Loginpage.jsp");}}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/CustomerAccountStyle.css">

<style type="text/css">
a{
color:#ffee58;
 text-decoration:none;
 padding:10px;
 }
 a:hover{
 color:red;
 }
 
 td:hover{background-color:red;}
.custEx td{
background-color:rgba(200,200,200,0.1);
text-align:center;
border:0px solid black;
border-radius:15px;


}
.custEx th{
background-color:#f57c00;
text-align:center;

}
.custEx
{
width:300px;
background-color:rgba(200,200,200,0);
}


</style>
</head>
<body>
<%session.setAttribute("currPage","CustomerAccountExecutive"); %>
<%@include file="Header.jsp" %>
<center><h2><font color="blue">Customer-Account Executive</font></h2></center>
<div style="float:left;">
<table  class="custEx">
<tr>
	<th>Customer</th>
	
</tr>
<tr>
<td><a href="ServletCustomer?action=createCustomer">CREATE</a></td>

</tr>
<tr>
<td><a href="<%=request.getContextPath()%>/ServletCustomer?action=createCustomer&buttonType=UPDATE">UPDATE</a></td>

</tr>
<tr>
<td><a href="<%=request.getContextPath()%>/ServletCustomer?action=createCustomer&buttonType=DELETE">DELETE</a></td>

</tr>
<tr>
<td><a href="<%=request.getContextPath()%>/ServletCustomer?action=viewCustomer">VIEW</a></td>
</tr>
</table>
</div>
<div style="float:right;">
<table  class="custEx">
<tr><th>Account</th></tr>
<tr><td><a href="ServletAccount?action=addaccount">CREATE</a></td></tr>
<tr><td><a href="#">DELETE</a></td></tr>
<tr><td><a href="#">VIEW ACCOUNT STATUS</a></td></tr>
</table>

</div>

</body>
</html>