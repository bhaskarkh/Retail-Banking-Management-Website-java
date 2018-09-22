<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <% 
    String role=(String)session.getAttribute("AccType");
    
    
    if(role==null){response.sendRedirect("Loginpage.jsp");}
    else
    {if(role.equalsIgnoreCase("CT")){}else{response.sendRedirect("Loginpage.jsp");}}%>
<!DOCTYPE html5 PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Transactions</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.2/angular.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/CashierStyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/CashierValidation.js"></script> 
</head>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>
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
<body ng-app="CashierViewTran" ng-controller="CashierViewTranCont">
<%@include file="Header.jsp"%>
<br><br>
<div class="viewTransactionClass">
<form action="ServletAccount" method=get name="viewTransactionForm" novalidate>
<table>
<tr>
<td>Account Id: </td>
<td class="reqInput" ng-class="{greenBorder:viewTransactionForm.accountid.$valid}"><input type=text name="accountid" placeholder="Enter your Account ID" ng-pattern="/^[0-9]{1,9}$/" ng-model="accountid" ng-maxlength="9" data-toggle="tooltip" title="CustomerId must be Numeric and Length Should be less Than 9" required></td>
</tr>
<tr>
<td>Last N Transactions:</td>
	<td>
	<select name=lastTransactions>
		<option value="99">--Select--</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
	</select>
	</td>
	</tr>
<tr><td>OR</td><td></td></tr><br><br>
<tr>
<td>Start Date:</td><td><input type="text" name="startdate" placeholder="Enter Start Date"></td></tr>
<tr>
<td>End Date:</td><td><input type="text" name="enddate" placeholder="Enter End Date"></td></tr>

</table>
<button type=submit name=action value=viewTransactions ng-disabled="myAddCustomerForm.$invalid">View</button>

</form>
</div>
</body>
</html>