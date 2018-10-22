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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="javascript2.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script language="javascript">
	$(document).ready(function() {
		$("#txtdate").datepicker({
			minDate : 0

		});
		
	});
</script>
</head>
<body id="body">

	<div id="id1">
		<%@ include file="head.jsp"%>
		<%@ include file="menu2.jsp"%>
		<jsp:useBean id="obj" class="pack1.connection"></jsp:useBean>

		<%
			if (session.getAttribute("user_id") == null) {
				response.sendRedirect("brsystem.jsp");
			} else {
		%>
		<div id="id2">

			<div id="id3">
				<%
					Connection con = obj.connect();
						try {
							PreparedStatement ps = con.prepareStatement("select name from user_table where user_id=?");
							ps.setString(1, session.getValue("user_id").toString());
							ResultSet rs = ps.executeQuery();
							while (rs.next()) {
				%>
				<marquee>
					Welcome <b style="color: red;"><%=rs.getString(1).toUpperCase()%></b>
				</marquee>
				<%
					}
						} catch (Exception e) {

						}
				%>

			</div>
		
			<div id="udiv1" style="width: 100%;">
				<div id="sub-udiv1" class="card1">
					<div id="aaa"
						style="width: 25%; float: left; border: 1px solid #2bce89; border-radius: 3px;">
						<i class="fa fa-bus fa-fw icon-margin"
							style="color: #2bce89; font-size: 20px"></i> <input type="text"
							id="s_stop" onkeyup="s_stoppage()" placeholder="FROM"
							style="padding: 5px 2px 5px 5px; width: 85%; font-size: medium; border-style: none;"></br>
						<div id="s_stop_content"></div>

					</div>
					<div onclick="change()"
						style="width: 30px; cursor: pointer; margin-left: 8px; float: left; border: 1px solid #2bce89; border-radius: 3px; padding: 5px;">
						<i class="fa fa-exchange fa-fw icon-margin"
							style="color: #2bce89; font-size: 20px;"></i>
					</div>
					<div id="ddd"
						style="width: 25%; margin-left: 8px; float: left; border: 1px solid #2bce89; border-radius: 3px;">
						<i class="fa fa-bus fa-fw icon-margin"
							style="color: #2bce89; font-size: 20px"></i> <input type="text"
							id="d_stop" onkeyup="d_stoppage()" placeholder="TO"
							style="padding: 5px 2px 5px 5px; width: 85%; font-size: medium; border-style: none;">
						<div id="d_stop_content"></div>
					</div>
					<div
						style="width: 25%; margin-left: 8px; float: left; border: 1px solid #2bce89; border-radius: 3px;">
						<i class="fa fa-calendar fa-fw icon-margin"
							style="color: #2bce89; font-size: 20px"></i> <input type="text"
							id="txtdate" placeholder="JOURNEY DATE"
							style="padding: 5px 2px 5px 5px; font-size: medium; border-style: none;">
						<!--<input id="txtdate" type="text">-->
					</div>
					<div
						style="width: 17%; margin-left: 8px; float: left; border: 1px solid #2bce89; border-radius: 3px;">
						<input type="submit" id="s_stop" onclick="searchbuses()"
							value="Search Buses"
							style="padding: 5px; color: white; cursor: pointer; width: 100%; background-color: #2bce89; font-size: medium; border-style: none;">

					</div>
				</div>

			</div>
			<div>
				
				<div id="udiv2" style="width: 100%;">
					<div id="sub-udiv2" class="card1">
					<p style="text-align: center; font-size: 18px; color: green;">User Home Page</p>
					</div>
				</div>
			</div>
		</div>

		<%
			con.close();
			}
		%>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>