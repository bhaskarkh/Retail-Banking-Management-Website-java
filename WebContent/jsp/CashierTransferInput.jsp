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
<style type="text/css">
.cashierInputTransfer{
width:580px;

margin-top:90px;
background-color:rgba(200,200,200,0.2);
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cashier Money Transfer</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/AddCustomerStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bodyStyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.2/angular.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/CashierValidation.js"></script> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/CashierStyle.css">
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>

<%String Errmsg=(String)request.getAttribute("sameId");%>
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
<body ng-app="CashierMoneyTrans" ng-controller="CashierMoneyTransCont">
<%@include file="Header.jsp"%>
<center>
<div class="cashierInputTransfer">
<form action="<%=request.getContextPath()%>/ServletAccount?action=transeferamount" method="post" name="CashierMoneyTransferForm" novalidate>
<center><h2><font color="blue">CASHIER MONEY TRANSFER</font></h2></center>

<table class="CashMoneyTransfer">
<tr>
	<td><b>Transfer Amount</b></td>
	<td class="reqInput" ng-class="{greenBorder:CashierMoneyTransferForm.TransferAmount.$valid}"><input type="text" name="TransferAmount" ng-pattern="/^[0-9]{1,10}$/" ng-model="TransferAmount" data-toggle="tooltip" title="TransferAmount must be Number" required></td>
</tr>
<tr>
	<td><b>Source AccountID</b></td>
	<td class="reqInput" ng-class="{greenBorder:CashierMoneyTransferForm.SourceAccountID.$valid}"><input type="text" name="SourceAccountID"  ng-pattern="/^[0-9]{1,9}$/" ng-model="SourceAccountID" data-toggle="tooltip" title="SourceId must be Number" required></td>
</tr>
<tr>
	<td><b>Target AccountID</b></td>
	<td class="reqInput" ng-class="{greenBorder:CashierMoneyTransferForm.TargetAccountID.$valid}"><input type="text" name="TargetAccountID"  ng-pattern="/^[0-9]{1,9}$/" ng-model="TargetAccountID" data-toggle="tooltip" title="TargetId must be Number" required></td>
</tr>
<tr><td></td><td><button class="button"  type="submit"  value="Submit" ng-disabled="CashierMoneyTransferForm.$invalid">Submit</button></td></tr>
</table>
<%if(Errmsg!=null){%><p style="color:black;font-size:23px;margin-left:50px;"><%=Errmsg%></p><%} %><br>
</form>
</div>
</center>
</body>
</html>