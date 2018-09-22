<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Account</title>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.2/angular.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/AddAccountForm.js"></script> 
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/AddAccountForm.js"></script>  --%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Login.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">

<!-- <script>
var app=angular.module("AddAcoount",[]);
app.controller("AddAccountController",function($scope){
	
	
	
});

</script> -->
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>
<style type="text/css">
.transactionTable tr,td,th{border:0px solid red;}

.transactionTable{
border:2px dotted black;
align:center;
width:35%;}
.reqInput input{
border:1px solid red;
}
.greenBorder input{
	border:1px solid green;
}
</style>
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
<body ng-app="AddAcoount" ng-controller="AddAccountController">
<%@include file="Header.jsp"%>
<center><h2>Add Your Account</h2></center>
<center>
<div class="transactionTable">
<form action="ServletAccount" method="post" name="AddAccountForm" novalidate>


<table>
<tr><td>Customer Id:</td><td class="reqInput" ng-class="{greenBorder:AddAccountForm.cid.$valid}"><input type="text" name="cid"  ng-pattern="/^[0-9]{1,9}$/" ng-model="cid" ng-maxlength="9" data-toggle="tooltip" title="CustomerId must be Numeric and Length Should be less Than 9" required></td></tr>
<tr><td>Account Type:</td><td><select name="at" data-toggle="tooltip" title="Must Select Account Type" required>
  
  <option value="Saving">Saving Account</option>
  <option value="Current">Current Account</option>
</select></td></tr>

<tr><td>Deposit Amount:</td><td class="reqInput" ng-class="{greenBorder:AddAccountForm.damount.$valid}"><input type="text" name="damount" ng-pattern="/^[0-9]{1,9}$/" ng-model="damount" data-toggle="tooltip" title="must Give deposit Amount" required></td></tr>

<tr><td><button type="submit" name="action" value="submit2" ng-disabled="AddAccountForm.$invalid">Submit</button></td></tr>

</table>
<center><p ng-show="AddAccountForm.$invalid" style="font-size:15px;">Fill all Fields</p></center>
</form>

</div>
</center>

</body>
</html>