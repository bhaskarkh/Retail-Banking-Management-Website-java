<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/CustomerAccountStyle.css">
</head>
<body>
<div border="1">
<div class="outerBorder">Banking Management System</div>
<div>
<ul>

 <li><% if(session.getAttribute("LoggedIn")==null){}else{%><a href="<%=request.getContextPath()%>/Servlet?action=HomePage">Home</a><%} %></li>
  <li class="dropdown">
   
    <%if(session.getAttribute("LoggedIn")==null){}else{ %>
      <% if((boolean)session.getAttribute("LoggedIn")){ %><a href="javascript:void(0)" class="dropbtn">Profile</a>
    <div class="dropdown-content"><a href="<%=request.getContextPath()%>/Servlet?action=Logout">Logout</a><%} }%>
      
      
    </div>
  </li>
    
</ul>


</div>

</div>

</body>
</html>