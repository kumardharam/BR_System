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
		Connection con = obj.connect();
	String ticket_id=request.getParameter("ticket_id");
	String fb=request.getParameter("fb");
	//out.print(ticket_id+""+fb);
		try {
			int i = 0;
			PreparedStatement ps = con.prepareStatement("insert into feedback values(?,?,?)");
			ps.setString(1, session.getValue("user_id").toString());
			ps.setString(2, ticket_id );
			ps.setString(3,fb);
			i = ps.executeUpdate();
			if (i > 0) {
	%>
	<div class="sub-udiv card1">
		<p
			style="text-align: center; padding: 10px 0px 10px 0px; font-size: 20px;">Thank You. <a href="userhomepage.jsp">Home</a></p>
	</div>
	<%
		}
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>