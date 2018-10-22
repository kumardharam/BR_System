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
<%
String source=request.getParameter("s_stop");
String[] parts = source.split("-");
String s_stop_id = parts[0]; // 004
String s_stop_name = parts[1];
String destination=request.getParameter("d_stop");
String[] parts1 = destination.split("-");
String d_stop_id = parts1[0]; // 004
String d_stop_name = parts1[1];
String d=request.getParameter("date");
String day=request.getParameter("day");

Connection con=obj.connect();
try{
	PreparedStatement ps=con.prepareStatement("select *from bus_table b1,bus_day_avil b2 where b1.bus_id=b2.bus_id and source_stop=? and destination_stop=? and day=? and state=?");
	ps.setString(1, s_stop_id);
	ps.setString(2, d_stop_id);
	ps.setString(3, day);
	ps.setString(4, "active");
	ResultSet rs=ps.executeQuery();
	int i=0;
	while(rs.next()){
		i=i+1;
		%>
		<div class="sub-udiv card1">
			<div style="width: 10%; text-align:center; float: left; padding: 10px 0 10px 0; ">
				<i class="fa fa-bus fa-fw icon-margin"
							style="color: #2bce89; font-size: 50px"></i>
			</div>
			<div style="width: 15%;  float: left; padding: 10px 0 10px 0;  ">
				<p style="font-weight: bold;"><%=rs.getInt(1) %>/<%=rs.getString(2) %></p>
				<p style="margin-top: 5px;">Type : <%=rs.getString(3).toUpperCase() %></p>
			</div>
			<div style="width: 20%; text-align:center; float: left; padding: 10px 0 10px 0;  ">
				<p style="font-weight: bold;">From</p>
				<p style="font-weight: bold; margin-top: 5px;"><%=s_stop_name %></p>
				<p style="margin-top: 5px;">Bording Time : <%=rs.getString(7).toUpperCase() %></p>
			</div>
			<div style="width: 20%; text-align:center; float: left; padding: 10px 0 10px 0;  ">
				<p style="font-weight: bold;">To</p>
				<p style="font-weight: bold; margin-top: 5px;"><%=d_stop_name %></p>
				<p style="margin-top: 5px;">Drop Time : <%=rs.getString(8).toUpperCase() %></p>
			</div>
			<div style="width: 20%; text-align:center; float: left; padding: 10px 0 10px 0;  ">
				<p style="font-weight: bold;">Fare</p>
				<p style="font-weight: bold; margin-top: 5px;"><%=rs.getInt(9) %></p>
			</div>
			<div style="width: 12%; text-align:center; float: left; padding: 10px 0 10px 0;  ">
				<input type="submit" value="View Seats" class="button" onclick="viewbusseats('<%=rs.getInt(1) %>','<%=d %>')" style="margin-top: 15px; background-color: #f04009;">
			</div>
			
			
		</div>
		
		<% 
	}
	if(i==0){
		%>
		<div class="sub-udiv card1" style="text-align: center; font-weight: bolder; color: red; padding: 10px 0 10px 0;">Bus Not Found.</div>
		<% 
	}
}catch(Exception e){
}
con.close();
%>
</body>
</html>