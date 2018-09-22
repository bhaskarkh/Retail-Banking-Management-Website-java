<%@ page import="com.bean.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <% 
    String role=(String)session.getAttribute("AccType");
    
    
    if(role==null){response.sendRedirect("Loginpage.jsp");}
    else
    {if(role.equalsIgnoreCase("CT")){}else{response.sendRedirect("Loginpage.jsp");}}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transactions Details</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/CashierStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">

</head>
<body>
<%@include file="Header.jsp"%>
<%ArrayList<TransactionDetails> list = (ArrayList<TransactionDetails>)request.getAttribute("list"); %>
<center>
<div style="background-color:#d3d3d3">

<table>
	<tr>
		<th>Description</th>
		<th>Date</th>
		<th>Balance</th>
	</tr>
	<%for(TransactionDetails t:list){ %>
	<tr>
		<td><%=t.getDescription()%></td>
		<td><%=t.getDate() %></td>
		<td><%=t.getBalance() %></td>
	</tr>
	
	<%} %>
	<tr><td></td><td>Total Balance</td><td><%=(double)request.getAttribute("TotBalance")%></td></tr>
</table>
</div>
</center>
</body>
</html>