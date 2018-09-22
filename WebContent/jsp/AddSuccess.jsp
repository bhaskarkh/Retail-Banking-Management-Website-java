<%@ page import="com.bean.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Added Successfully</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/AddCustomerStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">
</head>
<%String str=(String)session.getAttribute("AccType");
if(str==null){
	
	response.sendRedirect("Loginpage.jsp");
	}
else{
	
	if(str.equalsIgnoreCase("CAE"))
	{}
	else{
		response.sendRedirect("Loginpage.jsp");
	}
}


%>
<body>
<%@include file="Header.jsp"%>
<form>
<%AddCustomer customer = (AddCustomer)request.getAttribute("customer"); %>
<center>
<font color="black" size="10px"><b><h>ADDED SUCCESSFULLY</h> </b></font><br><br>
<div class="AddCustomerBox">
<table align="center" class="AddCustomerClass">
	<tr>
		<td><b style="font-family:Arial;">Customer ID</b></td>
		<td><input type="text" name="customerid" value="<%=customer.getCustomerId()%>"></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">SSNID</b></td>
		<td><input type="text" name="SSNID" value="<%=customer.getSsnid()%>"></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">Name</b></td>
		<td><input  type="text" name="Name" value="<%=customer.getCustomerName()%>"></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">Age</b></td>
		<td><input type="text" name="Age" value="<%=customer.getCustomerAge() %>"></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">Address Line1</b>
		<td><input  type="text" name="AddressLine1" value="<%=customer.getAddressLine1()%>"></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">Address Line2</b>
		<td><input  type="text" name="AddressLine2" value="<%=customer.getAddressLine2()%>"></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">City</b>
		<td><input  type="text" name="City" value="<%=customer.getCity()%>"></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">State</b>
		<td><input type="text" name="State" value="<%=customer.getState() %>"></td>
	</tr>

</table>
<br>
</div>
</center>
</form>
</body>
</html>