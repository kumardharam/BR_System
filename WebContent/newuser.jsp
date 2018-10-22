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

		<div class="usinnup">
			<p class="head">New User SignUp</p>
			<p id="msg" style="text-align: center; font-size: 18px;"></p>
			<form action="signup_process.jsp" method="post" name="signupform"
				onsubmit="return validate_su_form()">
				<table class="table">
					<tr>
						<td class="td-1">Enter UserId :</td>
						<td><input type="text" id="userid" name="ui">
						<a href="#" onclick="checkavailability()" style="text-decoration: none; margin-left: 10px;">Check Availability</a>
						</td>
					</tr>
					<tr>
						<td></td>
						<td class="fontsize1">Length of user id must be gretter than
							4 and less than 8</td>
					</tr>
					<tr>
						<td class="td-1">Set Password :</td>
						<td><input type="password" name="sp"></td>
					</tr>
					<tr>
						<td></td>
						<td class="fontsize1">Length of password must be gretter than
							4 and less than 8</td>
					</tr>
					<tr>
						<td class="td-1">Confirm Password :</td>
						<td><input type="password" name="cp"></td>
					</tr>
					<tr>
						<td></td>
						<td class="fontsize1">password must be same</td>
					</tr>
					<tr>
						<td class="td-1">Security Question :</td>
						<td><select name="question">
								<option value="null" selected="selected">...Select Your
									Security Question...</option>
								<option value="school">What was your First School</option>
								<option value="color">What is Your Favourite Color</option>
								<option value="hero">Who is Your Favourite Hero</option>
								<option value="teacher">Who was Your Favourite Teacher</option>
								<option value="team">What is your Favourite Sports</option>
						</select></td>
					</tr>
					<tr>
						<td class="td-1">Security Answer :</td>
						<td><input type="text" name="sans"></td>
					</tr>
					<tr>
						<td class="td-1">Enter Full Name :</td>
						<td><input type="text" name="un"></td>
					</tr>
					<tr>
						<td class="td-1">Gender :</td>
						<td><input type="radio" name="gender" checked="checked"
							value="male">Male <input type="radio" name="gender"
							value="female">FeMale</td>
					</tr>
					<tr>
						<td class="td-1">Marital Status :</td>
						<td><input type="radio" name="mstatus" value="Married"
							checked="checked">Married <input type="radio"
							value="UnMarried" name="mstatus">UnMarried</td>
					</tr>
					<tr>
						<td class="td-1">Date Of Birth :</td>
						<td><input type="date" name="dob"></td>
					</tr>
					<tr>
						<td class="td-1">Enter Email ID :</td>
						<td><input type="text" name="ei"></td>
					</tr>
					<tr>
						<td class="td-1">Enter Mobile Number :</td>
						<td><input type="text" name="mn"></td>
					</tr>
					<tr>
						<td class="td-1">Enter Address :</td>
						<td><textarea rows="3" cols="22" name="ad"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="SignUp" class="button"></td>
					</tr>

				</table>

			</form>
		</div>


		<%@include file="footer.jsp"%>
	</div>
</body>
</html>