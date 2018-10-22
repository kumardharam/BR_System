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
String stop_id=request.getParameter("stop_id");
String stop_name=request.getParameter("stop_name");
Connection con=obj.connect();
int i=0;
try{
	PreparedStatement ps=con.prepareStatement("insert into stoppage_table values(?,?)");
	ps.setString(1, stop_id.toUpperCase());
	ps.setString(2, stop_name.toUpperCase());
	i=ps.executeUpdate();
}catch(Exception e){
	//System.out.print(e);
}
if(i>0){
	%>
		<p class="msg" style="color: green;">Stoppage <%=stop_name.toUpperCase() %> Successfully Inserted.</p>
	<%
}
else{
	%>
		<p class="msg" style="color: red;">Stoppage Unsuccessfully Inserted or Stop Id Already exist.</p>
	<%
}
con.close();
%>

</body>
</html>