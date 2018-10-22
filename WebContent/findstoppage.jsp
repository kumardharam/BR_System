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
		String s_stop = request.getParameter("s_stop");
	String f= request.getParameter("f");
		Connection con = obj.connect();
		if (s_stop == "" || s_stop.trim().equals("")) {
			out.print("<p>Please Enter Stoppage Name.</p>");
		} else {
			try {
				PreparedStatement ps = con.prepareStatement(
						"select stop_id,stop_name from stoppage_table where stop_name like '" + s_stop + "%'");
				ResultSet rs = ps.executeQuery();
				if (!rs.isBeforeFirst()) {
					out.println("<p>No Record Found!</p>");
				}else{
					while(rs.next()){
				
						%>
						<a href="#" onclick="intervalue1('<%=rs.getString(1) %>','<%=f %>','<%=rs.getString(2) %>')" style="text-decoration: none; color: black;"><%=rs.getString(2) %></a><br>
						
						<%
					}
				}
			} catch (Exception e) {

			}
		}
		con.close();
	%>
</body>
</html>