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
		String bus_id = request.getParameter("bus_id");
		String date = request.getParameter("date");
		String ts = request.getParameter("ts");
		Integer i = Integer.valueOf(ts);
		String tns = request.getParameter("tns");
		String seatno[]=tns.split(",");
	%>
	<div class="sub-udiv card1">
		<p
			style="text-align: center; color: green; font-size: 25px; padding: 10px 0px 10px 0px;">PASSENGER
			DETAILS</p>
		<%
			int j, num;
			for (j = 0; j < i; j++) {
		%>
		<div style="width: 100%;">

			<%
				if (j == 0) {
			%>
			<p
				style="text-align: left; float: left; width: 90%; margin-left: 10%; color: pink; font-size: 23px; padding: 5px 0px 5px 0px;">
				<span style="text-align: left; float:left; width: 50%;">Primary Passenger </span>
				<span style="text-align: right; float:left; width: 40%;">Seat No.&nbsp; &nbsp;<%=seatno[j] %></span></p>
			<%
				} else {
			%>
			<p
				style="text-align: left; float: left; width: 90%; margin-left: 10%; color: pink; font-size: 23px; padding: 5px 0px 5px 0px;">
				
				<span style="text-align: left; float:left; width: 50%;">Co-Passenger &nbsp;&nbsp;<%=j%></span>
				<span style="text-align: right; float:left; width: 40%;">Seat No.&nbsp; &nbsp;<%=seatno[j] %></span>
				</p>
			<%
				}
			%>


			<div style="width: 45%; float: left; padding: 10px 0px 10px 0px;">
				<div style="width: 50%; float: left; text-align: right;">
					<span style="margin-right: 10px;">Enter Name :</span>
				</div>
				<div style="width: 50%; float: left; text-align: left;">
					<span style="margin-left: 10px;"><input type="text" id="n<%=j %>"
						style="border-left: none; border-right: none; border-top: none;"></span>
				</div>
			</div>
			<div style="width: 35%; float: left; padding: 10px 0px 10px 0px;">
				<div style="width: 30%; float: left; text-align: right;">
					<span style="margin-right: 10px;">Enter Age :</span>
				</div>
				<div style="width: 70%; float: left; text-align: left;">
					<span style="margin-left: 10px;"><input type="text" id="a<%=j %>"
						style="border-left: none; border-right: none; border-top: none;"></span>
				</div>
			</div>
			<div style="width: 20%; float: left; padding: 10px 0px 10px 0px;">
				<select id="g<%=j%>">
					<option value="null" selected="selected">Gender</option>
					<option value="male">MALE</option>
					<option value="female">FEMALE</option>
				</select>
			</div>
		</div>
		<%
			}
		%>
		<div style="width: 100%;">
			<p
				style="text-align: left; float: left; width: 90%; margin-left: 10%; color: pink; font-size: 23px; padding: 5px 0px 5px 0px;">Contact
				Details</p>
			<div style="width: 100%; float: left; padding: 10px 0px 10px 0px;">
				<div style="width: 30%; float: left; text-align: right;">
					<span style="margin-right: 10px;">Enter Mobile No :</span>
				</div>
				<div style="width: 70%; float: left; text-align: left;">
					<span style="margin-left: 10px;"><input type="text" id="mob"
						style="border-left: none; border-right: none; border-top: none;"></span>
				</div>
			</div>
		</div>
		<p
			style="text-align: center; padding: 10px 0px 10px 0px;">
			<input type="submit" value="SUBMIT" class="button" onclick="ticketbooking('<%=ts %>','<%=tns %>','<%=bus_id %>','<%=date %>')"
						style="margin-top: 15px; background-color: #f04009;">
			</p>
	</div>
	<%
		
	%>
</body>
</html>