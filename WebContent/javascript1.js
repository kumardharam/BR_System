/**
 * 
 */

function validate_u_info(){
	var uname=document.userform.un.value;
	var pass=document.userform.up.value;
	
	if(uname=="" && pass==""){
			alert("Please Enter UserId and Password");
			return false;
	 	}
	else if (uname=="") {
			alert("Please Enter UserId");
			document.getElementById("uuid").focus();
			//document.getElementByName("uid").focus();
			return false;
	 	}
	else if (pass=="") {
			alert("Please Enter Passwor");
			document.getElementById("upass").focus();
			return false;
	 	}
	
	
	return true;
}
function validate_a_info(){
	//alert("hello");
	var aname=document.adminform.ai.value;
	var pass=document.adminform.ap.value;
	//alert(uname+" "+pass);
	if(aname=="" && pass==""){
			alert("Please Enter AdminId and Password");
			return false;
	 	}
	else if (aname=="") {
			alert("Please Enter AdminId");
			return false;
	 	}
	else if (pass=="") {
			alert("Please Enter Password");
			return false;
	 	}
	
	
	return true;
}
function validate_su_form(){
	//alert("hello");
	var uid=document.signupform.ui.value;
	var pass=document.signupform.sp.value;
	var cpass=document.signupform.cp.value;
	var question=document.signupform.question.value;
	var sans=document.signupform.sans.value;
	var uname=document.signupform.un.value;
	var dob=document.signupform.dob.value
	var email=document.signupform.ei.value;
	var validmail=/[a-zA-Z0-9.-_]+[@]{1}[a-z]+[.]{1}[a-zA-Z]{3}$/;
	var mobile=document.signupform.mn.value;
	var validmobile=/[7-9]{1}[0-9]{9}$/;
	var address=document.signupform.ad.value;
	if(uid==""){
		alert("Please Enter User Id");
		return false;
	}
	else if(uid.length<5 || uid.length>7){
		alert("Please Enter Valid User Id");
		return false;
	}
	else if(pass==""){
		alert("Please Enter Your Password");
		return false;
	}
	else if(pass.length<4 || pass.length>7){
		alert("Please Enter Valid Password");
		return false;
	}
	else if(cpass==""){
		alert("Please Enter Your Confirm Password ");
		return false;
	}
	else if(pass!=cpass){
		alert("Mismatch password");
		return false;
	}else if (question=="null") {
		alert("Please Select Security Question.");
		return false;
	}else if (sans=="") {
		alert("Please Enter Security Answer.");
		return false;
	}else if(uname==""){
		alert("Please Enter User name");
		return false;
	}else if (dob=="") {
		alert("Please Enter date of birth");
		return false;
	}
	else if(email==""){
		alert("Please Enter Your Email Id");
		return false;
	}
	else if(!(validmail.test(email))){
		alert("Email id is incorrect");
		return false;
	}
	else if(mobile==""){
		alert("Please Enter Your Mobile Number");
		return false;
	}
	else if(isNaN(mobile)){
		alert("Invalid mobile Number");
		return false;
	}

	else if(!(validmobile.test(mobile))){
		alert("mobile number incorrect");
		return false;
	}
	else if(address==""){
		alert("Please Enter Your Address");
		return false;
	}
return true;
}
function validate_f_form(){
	//alert("hello");
	var uid=document.forgetform.ui.value;
	var pass=document.forgetform.up.value;
	var cpass=document.forgetform.cp.value;
	var mobile=document.forgetform.mn.value;
	var validmobile=/[7-9]{1}[0-9]{9}$/;
	if(uid=="" && pass=="" && cpass=="" && mobile==""){
		alert("Please FillUp form");
		return false;
	}
	else if(uid==""){
		alert("Please Enter User Id");
		return false;
		
	}
	else if(mobile==""){
		alert("Please Enter Your Mobile Number");
		return false;
	}
	else if(isNaN(mobile)){
		alert("Invalid mobile Number");
		return false;
	}

	else if(!(validmobile.test(mobile))){
		alert("mobile number incorrect");
		return false;
	}
	else if(pass==""){
		alert("Please Enter User Password");
		return false;
		
	}
	else if(cpass==""){
		alert("Please Enter Your Confirm Password ");
		return false;
	}
	else if(pass!=cpass){
		alert("Mismatch password");
		return false;
	}
	return true;
}

function checkavailability() {
	//alert(sid);
	var userid=document.getElementById("userid").value;
	if(userid==""){
		alert("Please Enter User Id.");
	}else if(userid.length<5 || userid.length>7){
		alert("Please Enter Valid User Id");
		return false;
	}
	else {
		var url = "checkavailability.jsp?userid="+userid;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('msg').innerHTML = val;
					// document.getElementById('msg1').innerHTML = "";
				}
			}// end of function
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
	
}