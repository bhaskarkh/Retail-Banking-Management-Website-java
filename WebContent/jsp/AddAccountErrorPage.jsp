<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">
<title>Insert title here</title>
</head>
<body>
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
<%@include file="Header.jsp"%>
<div style="margin-top:80px;">
<center><font color="black" size="6px"><h>Sorry ! Account Already Exist Of This Type</h></font></center>

</div>
</body>
</html>