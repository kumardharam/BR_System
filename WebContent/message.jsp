<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NewUser</title>
<link href="css1.css" rel="stylesheet" type="text/css"/>
</head>
<body id="body">

	<div id="id1">
		<%@ include file="head.jsp" %>
		<ul id="menu1">
			<li><a href="brsystem.jsp">Home</a> </li>
			<li><a href="about.jsp">About</a> </li>
			<li><a href="contact.jsp">Contact</a> </li>
		</ul>
		<%
		String msg=request.getParameter("msg");
		%>
		<div style="clear: both; margin-bottom: 20px; text-align: center; font-weight:bolder;">
		 <%=msg %>
		</div>
		
	
	
		<%@include file="footer.jsp"  %>
	</div>
</body>
</html>