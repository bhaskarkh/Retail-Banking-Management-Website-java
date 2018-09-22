<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddCustomer Error Page</title>
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
<font color="red"><h2>ERROR</h2></font>
<h3>SSNID Already Exists!!!!!!</h3>
</body>
</html>