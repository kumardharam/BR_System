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
String userid=request.getParameter("userid");
Connection con=obj.connect();
try{
	PreparedStatement ps=con.prepareStatement("select user_id from user_table where user_id=?");
	ps.setString(1, userid);
	ResultSet rs=ps.executeQuery();
	int i=0;
	while(rs.next()){
		i=i+1;
		%>
		<p style="font-size: 18px; color: red;">This User Id Already Exist Please Try New One.</p>
		<%
	}
	if(i==0 && userid!=""){
		%>
		<p style="font-size: 18px; color: green;">User Id Valid Proceed Further.</p>
		<%
	}
}catch(Exception e){
	
}
%>
</body>
</html>