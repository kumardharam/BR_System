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
String question=request.getParameter("question");
String sans=request.getParameter("sans");
String ms=request.getParameter("ms");
String dob=request.getParameter("date");
String ei=request.getParameter("ei");
String mob1=request.getParameter("mob");
long mob=Long.parseLong(mob1);
String ad=request.getParameter("ad");
Connection con=obj.connect();
int i=0;
try{
	PreparedStatement ps=con.prepareStatement("update user_table set s_question=?,s_answer=?,m_status=?,dob=?,email=?,mobile=?,address=? where user_id=?");
	ps.setString(1, question);
	ps.setString(2, sans);
	ps.setString(3, ms);
	ps.setString(4, dob);
	ps.setString(5, ei);
	ps.setLong(6, mob);
	ps.setString(7, ad);
	ps.setString(8, ui);
	i=ps.executeUpdate();
	if(i>0){
		%>
		<p style="text-align: center; font-size: 18px; color: green;">Your Profile Is Successfully Update.</p>
		<%
	}else{
		%>
		<p style="text-align: center; font-size: 18px; color: red;">Some error .</p>
		
		<%
	}
}catch(Exception e){
	
}
con.close();
%>
</body>
</html>