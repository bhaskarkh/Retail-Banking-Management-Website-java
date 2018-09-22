<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     <%@ page import="java.util.*" %>
      <%@ page import="com.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">
</head>
<center><h2>Update Your Details</h2></center>
<body>
<%@include file="Header.jsp"%>
<center><form>
	<table align=center>
	<tr><td>SSN ID:</td>
	    <td><input type="text" name="ssnid" value="#" readonly></td>
	</tr>
	<tr>
	<td>CUSTOMER ID:</td>
	<td><input type="text" name="cid" value="#" readonly></td>
	</tr>
	<tr><td>NAME:</td>
	<td><input type="text" name="cname" value="#" ></td>
	</tr>
	<tr><td>AGE:</td>
	<td><input type="text" name="cage" value="#" ></td>
	</tr>
	<tr><td>ADDRESS LINE 1:</td>
	<td><input type="text" name="add1" value="#" ></td>
	</tr>
	<tr><td>ADDRESS LINE 2:</td>
	<td><input type="text" name="add2" value="#" ></td>
	<tr>
	<td>CITY:</td>
	<td><input type="text" name="city" value="#" ></td>
	</tr>
	<tr><td>STATE:</td>
	<td><input type="text" name="state" value="#" ></td></tr>
	<tr><td><input type="submit" name="update" value="SUBMIT" ></td></tr>
	</table>


</form></center>
</body>
</html>