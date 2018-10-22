<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj" class="pack1.connection"></jsp:useBean>
	<div class="sub-udiv card1">
		<div id="msg1"></div>
		<table class="table1">
			<tr>
				<th colspan="2" class="td-c">Change Password</th>
			</tr>
			<tr>
				<td class="td-1">Enter UserID :</td>
				<td><input type="text" readonly="readonly" placeholder="Enter user Id" id="ui" value="<%=session.getValue("user_id").toString() %>"></td>
			</tr>
			<tr>
				<td class="td-1">Enter Old Password:</td>
				<td><input type="password" placeholder="Enter Old Password"
					id="op"></td>
			</tr>
			<tr>
				<td class="td-1">Enter New Password :</td>
				<td><input type="password" placeholder="Enter New Password"
					id="np"></td>
			</tr>
			<tr>
				<td></td>
				<td class="fontsize1">Length of password must be gretter than 4
					and less than or equal to 8</td>
			</tr>
			<tr>
				<td class="td-1">Enter Confirm Password :</td>
				<td><input type="password" placeholder="Enter Confirm Password"
					id="cp"></td>
			</tr>
			<tr>
				<td></td>
				<td class="fontsize1">password must be same</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="submit" value="Change" class="button" onclick="changepassprocess()"></td>
			</tr>

		</table>

	</div>
</body>
</html>