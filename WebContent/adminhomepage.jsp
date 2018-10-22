<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pack1.connection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BR_SYSTEM</title>
<link href="css1.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript" src="javascript2.js"></script>

</head>
<body id="body">

	<div id="id1">
		<%@ include file="head.jsp"%>
		<%@ include file="menu1.jsp"%>
		<jsp:useBean id="obj" class="pack1.connection"></jsp:useBean>
		
		<%
		if(session.getAttribute("admin_id")== null){
			response.sendRedirect("brsystem.jsp");
		}else{
		%>
		<div id="id2">
			
			<div id="id3">
				<%
				Connection con=obj.connect();
				try{
					PreparedStatement ps=con.prepareStatement("select name from admin_table where admin_id=?");
					ps.setString(1, session.getValue("admin_id").toString());
					ResultSet rs=ps.executeQuery();
					while(rs.next()){
						%>
						<marquee>Welcome <b style="color: red;"><%=rs.getString(1).toUpperCase() %></b></marquee>
						<%
					}
				}catch(Exception e){
					
				}
				%>
				
			</div>
				
			<div id="id4" class="card1">
				<p style="text-align: center; color: green; font-weight: bolder;">Admin Home Page</p>
			</div>		
			
		</div>
	
  		<%con.close();
  		} %>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>