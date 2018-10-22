<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
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
String ticket_id=request.getParameter("ticket_id");
String b=request.getParameter("bus_id");
//out.print(b);
Integer bus_id=Integer.valueOf(b);
//out.print(bus_id);
String date1=request.getParameter("date");
String s=request.getParameter("seat_no");
Integer seat_no=Integer.valueOf(s);
Date date = Date.valueOf(obj.datesql(date1));
Connection con=obj.connect();
int i=0,j=0;
String msg="viewbookedhisrory.jsp";
try{
	PreparedStatement ps=con.prepareStatement("update ticket_table set status=? where ticket_id=? and bus_id=? and seat_no=? and date=?");
	ps.setString(1, "Canceled");
	ps.setString(2, ticket_id);
	ps.setInt(3, bus_id);
	ps.setString(4, s);
	ps.setDate(5, date);
	i=ps.executeUpdate();
	ps=con.prepareStatement("update bus_status set status=? where bus_id=? and seat_no=? and date=?");
	ps.setString(1, "available");
	ps.setInt(2, bus_id);
	ps.setInt(3, seat_no);
	ps.setString(4, date1);
	j=ps.executeUpdate();
	if(i>0 && j>0){
		%>
		<p onclick="refresh('<%=msg%>')" style="cursor: pointer; font-size: 20px; color: green;">You Are Successfully Cancel Seat Number <%=seat_no %> Click To Refresh.</p>
		<% 
	}
}catch(Exception e){
	//out.print(e);
}
con.close();
%>
</body>
</html>