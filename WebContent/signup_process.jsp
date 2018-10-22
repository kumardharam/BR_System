<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj" class="pack1.connection"></jsp:useBean>
<%
	String user_name=request.getParameter("un");
	String user_id=request.getParameter("ui");
	String pass=request.getParameter("sp");
	//String cpass=request.getParameter("cp");
	String s_question=request.getParameter("question");
	String s_answer=request.getParameter("sans");
	String gender=request.getParameter("gender");
	String m_status=request.getParameter("mstatus");
	String dob=request.getParameter("dob");
	String email=request.getParameter("ei");
	String mobile=request.getParameter("mn");
	long mob=Long.parseLong(mobile);
	String address=request.getParameter("ad");
	int i=0;
	String msg=null;
	Connection conn=obj.connect();
	try{
		PreparedStatement ps=conn.prepareStatement("insert into user_table values(?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, user_id);
		ps.setString(2, pass);
		ps.setString(3, s_question);
		ps.setString(4, s_answer);
		ps.setString(5, user_name);
		ps.setString(6, gender);
		ps.setString(7, m_status);
		ps.setString(8, dob);
		ps.setString(9, email);
		ps.setLong(10, mob);
		ps.setString(11, address);
		
		i=ps.executeUpdate();
	}catch(Exception e){
		
	}
	if(i>0){
		msg="You have Successfully SignUp.";
		response.sendRedirect("message.jsp?msg="+msg);
	}
	else{
		msg="You have Unsuccessful SignUp.";
		response.sendRedirect("message.jsp?msg="+msg);
	}
	conn.close();
	//out.print(user_name);
%>
</body>
</html>