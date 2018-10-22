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
String admin_id=request.getParameter("ai");
String admin_pass=request.getParameter("ap");
Connection con=obj.connect();
try{
	PreparedStatement ps=con.prepareStatement("select admin_id from admin_table where admin_id=? and pass=?");
	ps.setString(1, admin_id);
	ps.setString(2, admin_pass);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		session.setAttribute("admin_id", admin_id);
		
		response.sendRedirect("adminhomepage.jsp");
	}else{
		request.setAttribute("message", "Admin Id And Password Is Incorrect.");
		request.getRequestDispatcher("brsystem.jsp").forward(request, response);
	}
}catch(Exception e){
	out.print(e);
}
con.close();
%>
</body>
</html>