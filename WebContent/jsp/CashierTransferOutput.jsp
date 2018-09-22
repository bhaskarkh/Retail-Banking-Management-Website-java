<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bean.Account" %>
     <% 
    String role=(String)session.getAttribute("AccType");
    
    
    if(role==null){response.sendRedirect("Loginpage.jsp");}
    else
    {if(role.equalsIgnoreCase("CT")){}else{response.sendRedirect("Loginpage.jsp");}}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/AddCustomerStyle.css">
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
</head>

<body>
<%@include file="Header.jsp"%>
<%double tamount=(double)request.getAttribute("tamount"); %>
<%Account as=(Account)request.getAttribute("sourceacc");%>
<% Account at=(Account)request.getAttribute("targetacc");%>
<% double sbal=(double)request.getAttribute("sourcebal") ; %>
<% double tbal=(double)request.getAttribute("targetbal") ; %>
<%String sourcename=(String)request.getAttribute("sourcename"); %>
<%String targetname=(String)request.getAttribute("targetname"); %>



<form action="<%=request.getContextPath()%>/ServletAccount?action=transferComplete" method="post">
<center><table></center>
<h2><font color="blue">DETAILS</font></h2>
<tr>
	<td><b>Source CustomerID</b></td>
	<td><input type="text" name="SourceCustomerID" value="<%=as.getCustomerId() %>" readonly></td>
</tr>
<tr>
	<td><b>Source Customer Name</b></td>
	<td><input type="text" name="SourceCustomerName" value="<%=sourcename%>"readonly></td>
</tr>
<tr>
	<td><b>Source AccountID</b></td>
	<td><input type="text" name="SourceAccountID" value="<%=as.getAccountId()%>" readonly></td>
</tr>
<tr>
	<td><b>Source Account Type</b></td>
	<td><input type="text" name="SourceAccountType" value=" <%=as.getAccountType()%>" readonly></td>
</tr>
<tr>
	<td><b>Target CustomerID</b></td>
	<td><input type="text" name="TargetCustomerID" value=" <%=at.getCustomerId() %>" readonly></td>
</tr>
<tr>
	<td><b>Target Customer Name</b></td>
	<td><input type="text" name="TargetCustomerName" value="<%=targetname%>" readonly> </td>
</tr>
<tr>
	<td><b>Target AccountID</b></td>
	<td><input type="text" name="TargetAccountID" value="<%=at.getAccountId()%>" readonly></td>
</tr>
<tr>
	<td><b>Target Account Type</b></td>
	<td><input type="text" name="TargetAccountType" value=" <%=at.getAccountType()%>" readonly></td>
</tr>
<tr>
	<td><b>Source Balance Amount Before Transfer</b></td>
	<td><input type="text" name="SourceBalanceAmountBeforeTransfer" value="<%=as.getDepositAmount()%> " readonly></td>
</tr>
<tr>
	<td><b>Target Balance Amount Before Transfer</b></td>
	<td><input type="text" name="TargetBalanceAmountBeforeTransfer" value="<%=at.getDepositAmount()%> " readonly></td>
</tr>
<tr>
	<td><b>Source Latest Balance</b> </td>
	<td><input type="text" name="SourceLatestBalance" value="<%=sbal%> " readonly></td>
</tr>
<tr>
	<td><b>Target Latest Balance </b></td>
	<td><input type="text" name="TargetLatestBalance" value="<%=tbal%> " readonly></td>
</tr>


</table>
<div><input type="submit"  value="Confirm" class="transferOutputSubmitButton">
<input type="hidden" name="tamount" value=<%=tamount %>></div>
</form>
</body>
</html>