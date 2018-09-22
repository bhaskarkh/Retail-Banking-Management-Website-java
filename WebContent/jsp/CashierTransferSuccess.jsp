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
<title>Insert title here</title>
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
<form>
<font color="black" size="6px"><h><b><p>AMOUNT TRANSFER COMPLETED SUCCESSFULLY</p></b></h></font>
</form>
</body>
</html>