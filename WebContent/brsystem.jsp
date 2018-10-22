<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BR_SYSTEM</title>
<link href="css1.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#logintype").change(function() {
			$("#user").toggleClass("display1");
			$("#admin").toggleClass("display1");
		});
	});
</script>
<script type="text/javascript" src="javascript1.js"></script>

</head>
<body id="body">

	<div id="id1">
		<%@ include file="head.jsp"%>
		<ul id="menu1">
			<li><a href="brsystem.jsp">Home</a></li>
			<li><a href="about.jsp">About</a></li>
			<li><a href="contact.jsp">Contact</a></li>
			<li class="m_right" style="float: right;"><select id="logintype">
					<option selected="selected">User Login</option>
					<option>Admin Login</option>
			</select></li>
			<li class="m_right" style="float: right;">Login Type:-</li>
		</ul>
		<div class="message" style="color: red;">${message}</div>
		<div class="login card1" id="user">
			<p class="head">User Login</p>

			<form action="userloginprocess.jsp" method="post" name="userform"
				onsubmit="return validate_u_info()">
				<table class="table">
					<tr>
						<td class="td-1">Enter UserID :</td>
						<td><input type="text" name="un" placeholder="Enter User Id" id="uuid"></td>
					</tr>
					<tr>
						<td class="td-1">Enter Password :</td>
						<td><input type="password" name="up"
							placeholder="Enter Password" id="upass"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="Login" class="button"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><a
							href="forgetpass.jsp">Forget Password</a></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">Click Here For
							&nbsp<a href="newuser.jsp">New User</a>
						</td>
					</tr>
				</table>

			</form>

		</div>

		<div class="login display1 card1" id="admin">
			<p class="head">Admin Login</p>
			<form action="adminloginprocess.jsp" method="post" name="adminform" onsubmit="return validate_a_info()">
				
				<table class="table">
					<tr>
						<td class="td-1">Enter AdminID :</td>
						<td><input type="text" name="ai" placeholder="Enter Admin Id"></td>
					</tr>
					<tr>
						<td class="td-1">Enter Password :</td>
						<td><input type="password" name="ap" placeholder="Enter Password"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="Login" class="button"></td>
					</tr>

				</table>

			</form>

		</div>


		<%@include file="footer.jsp"%>
	</div>
</body>
</html>