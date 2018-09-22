<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Customer</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.2/angular.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/AddCustomerValidation.js"></script> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/AddCustomerStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">
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
	
	if(str.equalsIgnoreCase("CAE"))
	{}
	else{
		response.sendRedirect("Loginpage.jsp");
	}
}


%>


</head>

<body ng-app="myAddCustomer" ng-controller="AddCustomerController">
<%@include file="Header.jsp"%>
<center><h1 style="color:blue;font-family:Verdana;">ADD CUSTOMER</h1></center>
<form action="ServletCustomer"  name="myAddCustomerForm" novalidate>

<div class="AddCustomerBox">
<table align="center" class="AddCustomerClass">
	<tr>
		<td><b style="font-family:Arial;">SSNID</b></td>
		<td class="reqInput" ng-class="{greenBorder:myAddCustomerForm.SSNID.$valid}"><input type="text" name="SSNID"   ng-pattern="/^[0-9]{1,9}$/" ng-model="SSNID" ng-maxlength="9" data-toggle="tooltip" title="SSNID must be Numeric and Length Should be less Than 9" required></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">Name</b></td>
		<td class="reqInput" ng-class="{greenBorder:myAddCustomerForm.Name.$valid}"><input  type="text" name="Name"  ng-pattern="/^[a-zA-Z. ]*[a-zA-Z]{1,30}$/" data-toggle="tooltip" title="Name must be String" ng-model="Name" required><!-- <p style="color:red;" ng-if="myAddCustomerForm.Name.$dirty" ng-show="myAddCustomerForm.Name.$error.required">Providing a Name is mandatory.</p> --></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">Age</b></td>
		<td><input type="number" name="Age" ng-model="Age"></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">Address Line1</b>
		<td class="reqInput" ng-class="{greenBorder:myAddCustomerForm.AddressLine1.$valid}"><input  type="text"  name="AddressLine1" ng-model="AddressLine1" required></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;" >Address Line2</b>
		<td><input  type="text" name="AddressLine2" value=" "></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">City</b>
		<td class="reqInput" ng-class="{greenBorder:myAddCustomerForm.City.$valid}"><input  type="text" name="City" data-toggle="tooltip" title="CityName must be String"  ng-model="City" ng-pattern="/^[a-zA-Z. ]*[a-zA-Z]{1,30}$/" required></td>
	</tr>
	<tr>
		<td><b style="font-family:Arial;">State</b>
		<td class="reqInput" ng-class="{greenBorder:myAddCustomerForm.State.$valid}"><input type="text" name="State" data-toggle="tooltip" title="StateName must be String" ng-model="State" ng-pattern="/^[a-zA-Z. ]*[a-zA-Z]{1,30}$/" required></td>
	</tr>

</table>
<br>
<center><p ng-show="myAddCustomerForm.$invalid" style="color:#0040ff;font-size:22px;">Fill All Mandatory Fields</p></center>
<center><b><button type="submit" name="action" value="addCustomer" style="background-color:red;width:200px;border-radius:20px;" ng-disabled="myAddCustomerForm.$invalid">Submit</button></b></center>

</div>
</form>
</body>
</html>