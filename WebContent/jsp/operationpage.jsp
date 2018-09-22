<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">
 <% 
    String role=(String)session.getAttribute("AccType");
    
    
    if(role==null){response.sendRedirect("Loginpage.jsp");}
    else
    {if(role.equalsIgnoreCase("CT")){}else{response.sendRedirect("Loginpage.jsp");}}%>
<title>Insert title here</title>
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
</head>
<body>
<%@include file="Header.jsp"%>
<%String s=(String)request.getAttribute("operation");%>
<center><h2><%=s%></h2></center>
<center>
<form>
<table>

<tr><td>SSN ID:<input type="text" name="ssnid"></td></tr>
<tr><td>CUSTOMER ID:<input type="text" name="cid"><tr><td>
<tr><td><input type="submit" name="operation" value="<%=s%>"><tr><td>
</table>
</form>

</center>

</body>
</html>