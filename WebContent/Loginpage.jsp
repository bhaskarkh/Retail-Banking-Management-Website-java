<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>USER LOGIN</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.2/angular.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/LoginPageValidation.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Login.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">

</head>
<body ng-app="myLogin" ng-controller="myLoginPageController" 
			background-repeat:  no-repeat;
			background-attachment: fixed;
			background-size:  cover;
			background-color: #999;">
<%@include file="jsp/Header.jsp"%>
<center>
<form  name="myLoginForm" action="<%=request.getContextPath()%>/Servlet" method="post" onsubmit="return checkInput()" novalidate>
<div style="background-color:rgba(200,200,200,0);margin-top:60px;">

<table class="LoginTable">
<tr><div style="margin-bottom:20px;"><img src="<%=request.getContextPath()%>/image/login.png" alt="login page" width="200" height="200" style="border-radius:60%;"></div></tr>
<tr>
	<td><b>User ID</b></td>
	<td><input type="text" name="UserId" ng-model="UserId" placeholder="UserId"></td>
	
</tr>
<tr>
	<td><b>Password</b></td>
	
	<td><input type="password" name="Password" ng-model="Password" placeholder="Password" required ng-minlength="10"></td>


<tr><td></td>
<td><input type="submit" name="action" value="Login" class="button"></td></tr>

</table>
<center>
<div style="margin-left:190px;"><%String loginInvalid=(String)request.getAttribute("InvalidData");%>
    <p style="color:red; font-size:20px;" id="showErrorMsg"><%if(loginInvalid!=null){%><%=loginInvalid%><%} %></p>
	</div>
	</center>
</div>
</form>
</div>
</center>
</body>
</html>