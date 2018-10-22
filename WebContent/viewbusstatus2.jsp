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
String bi=request.getParameter("bi");
Integer bus_id=Integer.valueOf(bi);
String date=request.getParameter("date");
int i=0;
Connection con=obj.connect();
String bus_name=obj.busname(bus_id);
try{
	PreparedStatement ps=con.prepareStatement("select *from bus_status where bus_id=? and date=?");
	ps.setInt(1, bus_id);
	ps.setString(2, date);
	ResultSet rs=ps.executeQuery();
	%>
	<table class="table1">
	<tr>
		<th colspan="5">Bus Status</th>
	</tr>
	<tr><td colspan="5" class="td-2"><div id="msg1"></div></td></tr>
	<tr>
		<th>Bus Number</th>
		<th>Bus Name</th>
		<th>Date</th>
		<th>Seat Number</th>
		<th>Status</th>
	</tr>
	<%
	while(rs.next()){
		i=i+1;
		%>
		<tr>
			<td class="td-c"><%=rs.getInt(1) %> </td>
			<td class="td-c"><%=bus_name %> </td>
			<td class="td-c"><%=rs.getString(2) %> </td>
			<td class="td-c"><%=rs.getInt(3) %> </td>
			<td class="td-c"><%=rs.getString(4) %> </td>
		</tr>
		<%
	}
	if(i==0){
		%>
		<tr>
		<td class="td-c" colspan="5">bus not found. </td>
		</tr>
		<%
	}
	%>
	</table>
	
	<% 
}catch(Exception e){
	
}
con.close();
%>
</body>
</html>