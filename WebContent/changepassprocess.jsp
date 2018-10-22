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
String ui=request.getParameter("ui");
String op=request.getParameter("op");
String np=request.getParameter("np");
Connection con=obj.connect();
try{
	int i=0;
	PreparedStatement ps=con.prepareStatement("update user_table set pass=? where user_id=? and pass=?");
	ps.setString(1, np);
	ps.setString(2, ui);
	ps.setString(3, op);
	i=ps.executeUpdate();
	if(i>0){
		%>
		<p style="text-align: center; font-size: 18px; color: green;">Your Password Is Successfully Update.</p>
		<%
	}else{
		%>
		<p style="text-align: center; font-size: 18px; color: red;">Your User Id And Password Is Incorrect .</p>
		
		<%
	}
}catch(Exception e){
	out.print(e);
}
%>
</body>
</html>