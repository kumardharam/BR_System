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
<table class="table1">
	<tr>
		<th colspan="2">Bus View/Edit/Delete</th>
	</tr>
	<tr><td colspan="2" class="td-2"><div id="msg1"></div></td></tr>
	<%
	String bi=request.getParameter("bi");
	Integer bus_id=Integer.valueOf(bi);
	Connection con=obj.connect();
	String dayavail=obj.dayavail(bus_id);
	int i=0;
	try{
		PreparedStatement ps=con.prepareStatement("select *from bus_table where bus_id=?");
		ps.setInt(1, bus_id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			i=i+1;
			%>
			<tr>
				<td class="td-1">Bus Number :</td>
				<td><input type="text" id="bi" value="<%=rs.getInt(1) %>" style="border: none; background-color: inherit;"></td>
			</tr>
			<tr>
				<td class="td-1">Bus Name :</td>
				<td><input type="text" value="<%=rs.getString(2) %>"  style="border: none; background-color: inherit;"></td>
			</tr>
			<tr>
				<td class="td-1">Bus Type :</td>
				<td><input type="text" value="<%=rs.getString(3).toUpperCase() %>"  style="border: none; background-color: inherit;"></td>
			</tr>
			<tr>
				<td class="td-1">Total Number Of Seats :</td>
				<td><input type="text" value="<%=rs.getInt(4) %>"  style="border: none; background-color: inherit;"></td>
			</tr>
			<tr>
				<td class="td-1">Source stoppage :</td>
				<td><input type="text" value="<%=obj.stoppagename(rs.getString(5)) %>"  style="border: none; background-color: inherit;"></td>
			</tr>
			<tr>
				<td class="td-1">Destination stoppage :</td>
				<td><input type="text" value="<%=obj.stoppagename(rs.getString(6)) %>"  style="border: none; background-color: inherit;"></td>
			</tr>
			<tr>
				<td class="td-1">Available Days :</td>
				<td><input type="text" value="<%=obj.dayavail(bus_id) %>"  style="border: none; background-color: inherit;"></td>
			</tr>
			<tr>
				<td class="td-1">Bording Time :</td>
				<td><input type="text" id="bt" value="<%=rs.getString(7) %>" ></td>
			</tr>
			<tr>
				<td class="td-1">Droping Time :</td>
				<td><input type="text" id="dt" value="<%=rs.getString(8) %>" ></td>
			</tr>
			<tr>
				<td class="td-1">Fare :</td>
				<td><input type="text" id="fare" value="<%=rs.getString(9) %>" ></td>
			</tr>
			<tr>
				<td class="td-1">Status :</td>
				<td>
					<select id="status">
						<%
						if(rs.getString(10).equals("active")){
							%>
							<option value="<%=rs.getString(10) %>" selected="selected"><%=rs.getString(10).toUpperCase() %></option>
							<option value="inactive">INACTIVE</option>
							<%
						}
						else{
							%>
							<option value="<%=rs.getString(10) %>" selected="selected"><%=rs.getString(10).toUpperCase() %></option>
							<option value="active">ACTIVE</option>
							<%
						}
						%>
					</select>
			</td>
			</tr>
			<%
		}
		if(i==0){
			%>
			<tr>
			<td colspan="2" class="td-c">bus not found</td>
			</tr>
			<%
		}else{
			%>
			<tr>
			<td colspan="2" class="td-c">
			<input type="submit" value="Update" class="button" onclick="updatebus()" style="margin-right: 20px;">
			<input type="submit" value="Delete" class="button" style="margin-right: 20px; " onclick="deletebus()">
			<input type="submit" value="Close" class="button" onclick="viewbus()">
			</td>
			</tr>
			<%
		}
	}catch(Exception e){
		
	}
	%>
</table>
</body>
</html>