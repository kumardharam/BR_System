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
		<th colspan="4">Stoppage View/Edit/Delete</th>
	</tr>
	<tr><td colspan="4" class="td-2"><div id="msg1"></div></td></tr>
	<tr>
		<th>Stop_Id</th>
		<th>Stop_Name</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<%
	Connection con=obj.connect();
	int i=0;
	try{
		PreparedStatement ps=con.prepareStatement("select *from stoppage_table");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			i=i+1;
			%>
			<tr>
				<td class="td-2"><input type="text" value="<%=rs.getString(1)%>" readonly="readonly" style="border: none; text-align: center; background-color: inherit;"></td>
				<td class="td-2"><input type="text" id=<%=i %> value="<%=rs.getString(2)%>"></td>
				<td class="td-2"><input type="submit" value="Edit" class="button" onclick="updatestoppage('<%=rs.getString(1)%>','<%=i%>')"></td>
				<td class="td-2"><input type="submit" value="Delete" class="button" onclick="deletestoppage('<%=rs.getString(1)%>')"></td>
			</tr>
			<% 
		}
	}catch(Exception e){
		
	}
	%>
	<tr>
		<td class="td-2" colspan="4">Total Number Stoppages Is : <%=i %> </td>
	</tr>
</table>
<%
con.close();
%>
</body>
</html>