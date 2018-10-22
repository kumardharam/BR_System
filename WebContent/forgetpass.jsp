<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NewUser</title>
<link href="css1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="javascript1.js"></script>

</head>
<body id="body">

	<div id="id1">
		<%@ include file="head.jsp"%>
		<ul id="menu1">
			<li><a href="brsystem.jsp">Home</a></li>
			<li><a href="about.jsp">About</a></li>
			<li><a href="contact.jsp">Contact</a></li>
		</ul>

		<div class="forget">
			<p class="head">Forget Password</p>
			<form action="forget_process.jsp" method="post" name="forgetform"
				onsubmit="return validate_f_form()">
				<table class="table">
					<tr>
						<td class="td-1">Enter UserID :</td>
						<td><input type="text" placeholder="Enter user Id" name="ui"></td>
					</tr>
					<tr>
						<td class="td-1">Enter Mobile Number :</td>
						<td><input type="text" placeholder="Enter Mobile number" name="mn"></td>
					</tr>
					<tr>
						<td class="td-1">Enter New Password :</td>
						<td><input type="password" placeholder="Enter New Password" name="up"></td>
					</tr>
					<tr>
						<td></td>
						<td class="fontsize1">Length of password must be gretter than
							4 and less than 8</td>
					</tr>
					<tr>
						<td class="td-1">Enter Confirm Password :</td>
						<td><input type="password"
							placeholder="Enter Confirm Password" name="cp"></td>
					</tr>
					<tr>
						<td></td>
						<td class="fontsize1">password must be same</td>
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