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
	<div id="msg1"></div>
	<table class="table1">
		<tr>
			<th colspan="2">Add Bus</th>
		</tr>
		<tr>
			<td class="td-1">Enter Bus Number :</td>
			<td><input type="text" id="bus_id"></td>
		</tr>
		<tr>
			<td class="td-1">Enter Bus Name :</td>
			<td><input type="text" id="bus_name"></td>
		</tr>
		<tr>
			<td class="td-1">Select Bus Type :</td>
			<td><select id="bus_type">
					<option value="null" selected="selected">Select-Bus-Type</option>
					<option value="ac">AC</option>
					<option value="nonac">NON-AC</option>
			</select></td>
		</tr>
		<tr>
			<td class="td-1">Select Total Number Of Seat :</td>
			<td><select id="seat">
					<option value="null" selected="selected">Select-Number Of
						Seat</option>
					<option value="45">45</option>
					
			</select></td>
		</tr>
		<%
			Connection con = obj.connect();
			ResultSet rs1, rs2;
			try {
				PreparedStatement ps = con.prepareStatement("Select *from stoppage_table");
				rs1 = ps.executeQuery();
		%>
		<tr>
			<td class="td-1">Select Source Stoppage :</td>
			<td><select id="s_stop">
					<option value="null" selected="selected">Select-Source-Stoppage</option>
					<%
						while (rs1.next()) {
					%>
					<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
					<%
						}
					%>
			</select></td>
		</tr>

		<tr>
			<td class="td-1">Select Destination Stopppage :</td>
			<td><select id="d_stop">
					<option value="null" selected="selected">Select-Destination-Stoppage</option>
					<%
						ps = con.prepareStatement("Select *from stoppage_table");
							rs2 = ps.executeQuery();
							while (rs2.next()) {
					%>
					<option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
					<%
						}
					%>
			</select></td>
		</tr>
		<%
			} catch (Exception e) {

			}
		%>
		<tr>
			<td class="td-1">Available Days :</td>
			<td><input type="checkbox" id="t6">Mon <input
				style="margin-left: 8px;" type="checkbox" id="t7">Tue <input
				style="margin-left: 8px;" type="checkbox" id="t8">Wed <input
				style="margin-left: 8px;" type="checkbox" id="t9">Thu <input
				style="margin-left: 8px;" type="checkbox" id="t10">Fri <input
				style="margin-left: 8px;" type="checkbox" id="t11">Sat <input
				style="margin-left: 8px;" type="checkbox" id="t12">Sun</td>
		</tr>
		<tr>
			<td class="td-1">Enter Bording Time :</td>
			<td><input type="text" id="b_time"></td>
		</tr>
		<tr>
			<td class="td-1">Enter Droping Time :</td>
			<td><input type="text" id="d_time"></td>
		</tr>
		<tr>
			<td class="td-1">Enter Fare :</td>
			<td><input type="text" id="fare"></td>
		</tr>
		<tr>
			<td class="td-1">Select State :</td>
			<td><select id="state">
					<option value="null" selected="selected">Select-State</option>
					<option value="active">ACTIVE</option>
					<option value="inactive">INACTIVE</option>
			</select></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;"><input type="submit"
				value="Submit" class="button" onclick="addbusprocess()"></td>
		</tr>
	</table>

</body>
</html>