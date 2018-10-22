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
String user_id=request.getParameter("ui");
String mobile=request.getParameter("mn");
long mob=Long.parseLong(mobile);
String pass=request.getParameter("up");
Connection conn=obj.connect();
int i=0;
String msg=null;
try{
	PreparedStatement ps=conn.prepareStatement("select user_id from user_table where user_id=? and mobile=?");
	ps.setString(1, user_id);
	ps.setLong(2, mob);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		PreparedStatement ps1=conn.prepareStatement("update user_table set pass=? where user_id=?");
		ps1.setString(1, pass);
		ps1.setString(2, user_id);
		i=ps1.executeUpdate();
	}
	
}catch(Exception e){
	System.out.print(e);
}
if(i>0){
	msg="Your Password is Successfully change.";
	response.sendRedirect("message.jsp?msg="+msg);
}
else{
	msg="Provide Information Is Incorroct.";
	response.sendRedirect("message.jsp?msg="+msg);
}
conn.close();
%>
</body>
</html>