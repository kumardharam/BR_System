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
		<th colspan="3">All Feedback</th>
	</tr>
	<tr><td colspan="3" class="td-2"><div id="msg1"></div></td></tr>
	<tr>
		<th>User</th>
		<th>Ticket Number</th>
		<th>Feedback</th>
	</tr>
	<%
	Connection con=obj.connect();
	try{
		PreparedStatement ps=con.prepareStatement("select *from feedback");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			%>
			<tr>
				<td class="td-c"><%=obj.username(rs.getString(1)) %></td>
				<td class="td-c"><%=rs.getString(2) %></td>
				<td class="td-c"><%=rs.getString(3) %></td>
			</tr>
			<%
		}
	}catch(Exception e){
		
	}
	%>
	<tr>
		<td class="td-c" colspan="3"><a href="adminhomepage.jsp" style="text-decoration: none;"><input type="submit" value="Close" class="button"></a> </td>
	</tr>
</table>	
</body>
</html>