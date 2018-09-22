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
<title>Id Not Found</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">
</head>
<body>
<%@include file="Header.jsp"%>
<center><h2><font color="red">ERROR!!!!</font></h2></center>
<center><font color="black" size="13px"><b><p>Source or Traget Account ID Does Not Exists!<br>Please Check Again!</p></b></font></center>
</body>
</html>