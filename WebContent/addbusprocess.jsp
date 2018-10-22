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
String b=request.getParameter("bus_id");
Integer bus_id=Integer.valueOf(b);
String bus_name=request.getParameter("bus_name");
String bus_type=request.getParameter("bus_type");
String s=request.getParameter("seat");
Integer seat=Integer.valueOf(s);
String s_stop=request.getParameter("s_stop");
String d_stop=request.getParameter("d_stop");
String mon=request.getParameter("mon");
String tue=request.getParameter("tue");
String wed=request.getParameter("wed");
String thu=request.getParameter("thu");
String fri=request.getParameter("fri");
String sat=request.getParameter("sat");
String sun=request.getParameter("sun");

String[] str=new String[7];
str[0]=mon;
str[1]=tue;
str[2]=wed;
str[3]=thu;
str[4]=fri;
str[5]=sat;
str[6]=sun;

String b_time=request.getParameter("b_time");
String d_time=request.getParameter("d_time");
String f=request.getParameter("fare");
Integer fare=Integer.valueOf(f);
String state=request.getParameter("state");

int i=0,j=0;
Connection con=obj.connect();
try{
	PreparedStatement ps=con.prepareStatement("insert into bus_table values(?,?,?,?,?,?,?,?,?,?)");
	ps.setInt(1, bus_id);
	ps.setString(2, bus_name.toUpperCase());
	ps.setString(3, bus_type);
	ps.setInt(4, seat);
	ps.setString(5, s_stop);
	ps.setString(6, d_stop);
	ps.setString(7, b_time);
	ps.setString(8, d_time);
	ps.setInt(9, fare);
	ps.setString(10, state);
	i=ps.executeUpdate();
	
	for(int q=0;q<7;q++)
	{
		if(!str[q].equals("null")){
			ps=con.prepareStatement("insert into bus_day_avil values(?,?) ");
			ps.setInt(1, bus_id);
			ps.setString(2, str[q]);
			j=ps.executeUpdate();
			
		}
		
	}
	if(i>0 && j>0){
		%>
			<p class="msg" style="color: green;">Bus <%=bus_id %> Successfully Inserted.</p>
		<%
	}
	else{
		%>
			<p class="msg" style="color: red;">Bus Unsuccessfully Inserted or Bus Number <%=bus_id %> Already exist.</p>
		<%
	}
}catch(Exception e){
	%>
	<p class="msg" style="color: red;">Bus Unsuccessfully Inserted or Bus Number <%=bus_id %> Already exist.</p>
<%
}
con.close();
%>
</body>
</html>