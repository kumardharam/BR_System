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
//out.print(bus_id);
String bt=request.getParameter("bt");
String dt=request.getParameter("dt");
String fare1=request.getParameter("fare");
Integer fare=Integer.valueOf(fare1);
String status=request.getParameter("status");
Connection con=obj.connect();
int i=0;
try{
	PreparedStatement ps=con.prepareStatement("update bus_table set bording_time=?,drop_time=?,fare=?,state=? where bus_id=?");
	ps.setString(1, bt);
	ps.setString(2, dt);
	ps.setInt(3, fare);
	ps.setString(4, status);
	ps.setInt(5, bus_id);
	i=ps.executeUpdate();
	if(i>0){
		%>
		<p style="font-size: 18px; color: green;">Successfully Update.</p>
		<%
	}else{
		%>
		<p style="font-size: 18px; color: red;">Unsuccessfully Update.</p>
		<%
	}
}catch(Exception e){
	//out.print(e);
}
%>
</body>
</html>