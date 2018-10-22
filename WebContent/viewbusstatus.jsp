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
		<th colspan="3">Bus Status</th>
	</tr>
	<tr><td colspan="3" class="td-2"><div id="msg1"></div></td></tr>
	<tr>
		<td class="td-c"><input type="text" id="bi" placeholder="Enter Bus Number"></td>
		<td class="td-c"><input type="text" id="date" placeholder="Date (dd/mm/yyyy)."></td>
		<td class="td-c"><input type="submit" value="View Status" class="button" onclick="viewbusstatus2()"> </td>
	</tr>
</table>	
</body>
</html>