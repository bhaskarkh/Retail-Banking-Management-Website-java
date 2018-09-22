<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/CustomerAccountStyle.css">

<title>Delete Customer</title>
</head>
<center><h2>Delete Customer Details</h2></center>
<body>
<%@include file="Header.jsp"%>
<center><form>
	<table align="center">
	<tr><td>SSID:</td><td><input type="text" name="ssnid" value="#" readonly></td></tr>
	<tr><td>CUSTOMER ID:</td><td><input type="text" name="cid" value="#" readonly></td></tr>
	<tr><td>NAME:</td><td><input type="text" name="cname" value="#"></td></tr>
	<tr><td>AGE:</td><td><input type="text" name="cage" value="#"></td></tr>
	<tr><td>ADDRESS LINE 1:</td><td><input type="cad1" name="cid" value="#"></td></tr>
	<tr><td>ADDRESS LINE 2:</td><td><input type="cad2" name="cid" value="#"></td></tr>
	<tr><td>CITY:</td><td><input type="text" name="ct" value="#"></td></tr>
	<tr><td>STATE:</td><td><input type="text" name="cs " value="#"></td></tr>
	<tr><td><input type="submit"  value="Delete"></td></tr>
	</table>
</form>
</center>

</body>
</html>