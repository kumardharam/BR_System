<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
		<%
			Connection con = obj.connect();
			try {
				PreparedStatement ps = con.prepareStatement("Select *from user_table where user_id=?");
				ps.setString(1, session.getValue("user_id").toString());
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
		%>
		<table class="table1">
			<tr>
				<th colspan="2" class="td-c">Update Profile</th>
			</tr>
			<tr>
				<td class="td-1">UserId :</td>
				<td><input type="text" id="ui" value="<%=rs.getString(1)%>" readonly="readonly" style="border: none; background-color: inherit;"></td>
			</tr>
			<tr>
				<td class="td-1">Security Question :</td>
				<td><select id="question">
						<option value="school">What was your First School</option>
						<option value="color">What is Your Favourite Color</option>
						<option value="hero">Who is Your Favourite Hero</option>
						<option value="teacher">Who was Your Favourite Teacher</option>
						<option value="team">What is your Favourite Sports</option>
						<option value="<%=rs.getString(3)%>" selected="selected"><%=obj.question(rs.getString(3))%></option>
				</select></td>
			</tr>
			<tr>
				<td class="td-1">Security Answer :</td>
				<td><input type="text" id="sans" value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<td class="td-1">Name :</td>
				<td><input type="text" readonly="readonly" value="<%=rs.getString(5)%>" style="border: none; background-color:  inherit;"></td>
			</tr>
			<tr>
				<td class="td-1">Gender :</td>
				<td><input type="text" value="<%=rs.getString(6).toUpperCase()%>" style="border: none; background-color: inherit;"></td>
			</tr>
			<tr>
				<td class="td-1">Marital Status :</td>
				<td>
					<select id="ms">
					<%if(rs.getString(7).equals("UnMarried")){
						%>
						<option value="<%=rs.getString(7)%>" selected="selected">UnMarried</option>
						<option value="Married">Married</option>
						<%
					}else{
						%>
						<option value="<%=rs.getString(7)%>" selected="selected">Married</option>
						<option value="UnMarried">UnMarried</option>
						<%
					}
					%>
					</select>
					
					
					</td>
			</tr>
			<tr>
				<td class="td-1">Date Of Birth :</td>
				<td><input type="date" value="<%=rs.getString(8)%>" id="date" ></td>
			</tr>
			<tr>
				<td class="td-1">Email ID :</td>
				<td><input type="text" id="ei" value="<%=rs.getString(9)%>"></td>
			</tr>
			<tr>
				<td class="td-1">Enter Mobile Number :</td>
				<td><input type="text" id="mob" value="<%=rs.getString(10)%>"></td>
			</tr>
			<tr>
				<td class="td-1">Address :</td>
				<td><textarea rows="3"  cols="22" id="ad" ><%=rs.getString(11)%></textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="submit" value="Update" class="button" onclick="updateprofileprocess()"></td>
			</tr>

		</table>

		<%
			}
			} catch (Exception e) {

			}
			con.close();
		%>
	</div>
</body>
</html>