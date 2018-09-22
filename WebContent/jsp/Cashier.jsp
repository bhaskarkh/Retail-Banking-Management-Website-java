<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/CustomerAccountStyle.css">
<title>Cashier Detail</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Login.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">
<%String str=(String)session.getAttribute("AccType");
if(str==null){
	
	response.sendRedirect("Loginpage.jsp");
	}
else{
	
	if(str.equalsIgnoreCase("CT"))
	{}
	else{
		response.sendRedirect("Loginpage.jsp");
	}
}


%>
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
<%session.setAttribute("currPage","Cashier"); %>
<%@include file="Header.jsp"%>
<form>
<center><h1><font color="blue">CASHIER</font></h1></center>
<div style="float:left;">
<table class="custEx">
	<tr>
		<th>CUSTOMER</th>
		
	</tr>
	<tr>
		<td><a href="Servlet?action=Deposit"> DEPOSIT</a></td>
		
	</tr>
	<tr>
		<td><a href="Servlet?action=Withdraw">WITHDRAW</a></td>
		
	</tr>
	<tr>
		<td><a href="ServletAccount?action=Transfer">TRANSFER</a></td>
		
	</tr>

</table>
</div>
<div style="float:right;">
<table class="custEx">
<tr><th>ACCOUNT</th></tr>
<tr>
<td><a href="ServletAccount?action=viewTransaction">View Transactions</a></td>
</tr>
<tr>
<td><a href="Servlet?action=Withdraw">WITHDRAW</a></td></tr>
<tr>
<td><a href="ServletAccount?action=Transfer">TRANSFER</a></td></tr>
</table>
</div>
</form>
</body>
</html>