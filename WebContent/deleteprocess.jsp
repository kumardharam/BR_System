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
String bi=request.getParameter("bi");
Integer bus_id=Integer.valueOf(bi);
Connection con=obj.connect();
//out.print(bus_id);
int k=obj.yesno(bus_id);
//out.print(k);
if(k==1){
	%>
	<p style="font-size: 18px; color: red;">You Can't Delete Because Some Seats Are Already Booked</p>
	<%
}else{
	try{
		PreparedStatement ps=con.prepareStatement("delete from bus_day_avil where bus_id=?");
		ps.setInt(1, bus_id);
		int i=0,j=0;
		i=ps.executeUpdate();
		ps=con.prepareStatement("delete from bus_table where bus_id=?");
		ps.setInt(1, bus_id);
		j=ps.executeUpdate();
		//out.print(i+" "+j);
		if(i>0 && j>0){
			%>
			<p style="font-size: 18px; color: green;">Delete Successfully.</p>
			<%
		}else{
			%>
			<p style="font-size: 18px; color: red;">Delete Unsuccessfully.</p>
			<%
		}
	}catch(Exception e){
		//out.print(e);
		
	}
	con.close();
}
%>
</body>
</html>