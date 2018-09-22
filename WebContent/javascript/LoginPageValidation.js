/**
 * 
 */

var app=angular.module("myLogin",[]);
app.controller("myLoginPageController",function($scope){
	

	
});

function checkInput()
{
	var username=document.myLoginForm.UserId.value;
	var password=document.myLoginForm.Password.value;
	  if(username==null&&password==null||username==""&&password=="")
		{
		    document.getElementById("showErrorMsg").innerHTML="please Enter Username and Password";
		  
			return false;
		}
	else if(username==""||username==null)
		{
		
		 document.getElementById("showErrorMsg").innerHTML="Enter Username";
		return false;
		}
	else if(password==""||password==null)
		{
		 document.getElementById("showErrorMsg").innerHTML="Enter Password";
		return false;
		}
	
	
	return true;
}