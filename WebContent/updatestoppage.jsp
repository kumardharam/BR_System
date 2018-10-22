<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack1.connection"%>
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
String sid=request.getParameter("sid");
String sname=request.getParameter("sname");
Connection con=obj.connect();
try{
	PreparedStatement ps=con.prepareStatement("update stoppage_table set stop_name=? where stop_id=?");
	ps.setString(1, sname);
	ps.setString(2, sid);
	int i=0;
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
	
}
con.close();
%>
</body>
</html>