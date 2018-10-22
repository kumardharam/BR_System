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
<link href="css1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
</head>
<body>

	<jsp:useBean id="obj" class="pack1.connection"></jsp:useBean>
	<%
		String b = request.getParameter("bus_id");
		Integer bus_id = Integer.valueOf(b);
		String date = request.getParameter("date");
		System.out.println(bus_id + "" + date);
		Connection con = obj.connect();
		int a[] = new int[46];
		int c[] = new int[46];
		try {
			PreparedStatement ps = con.prepareStatement(
					"select bus_name,bus_type,total_seat,source_stop,destination_stop,bording_time,drop_time,fare from bus_table where bus_id=?");
			ps.setInt(1, bus_id);
			ResultSet rs = ps.executeQuery();
			int i = 0, seat = 0, fare = 0;
			String bus_name = null, bus_type = null, s_stop = null, d_stop = null, b_time = null, d_time = null;
			while (rs.next()) {
				bus_name = rs.getString(1).toUpperCase();
				bus_type = rs.getString(2);
				seat = rs.getInt(3);
				s_stop = rs.getString(4);
				d_stop = rs.getString(5);
				b_time = rs.getString(6);
				d_time = rs.getString(7);
				fare = rs.getInt(8);
			}
			ps = con.prepareStatement("select bus_id from bus_status where bus_id=? and date=?");
			ps.setInt(1, bus_id);
			ps.setString(2, date);
			rs = ps.executeQuery();
			while (rs.next()) {
				i = i + 1;
			}
			if (i == 0) {
				for (int j = 1; j <= seat; j++) {
					ps = con.prepareStatement("insert into bus_status values(?,?,?,?)");
					ps.setInt(1, bus_id);
					ps.setString(2, date);
					ps.setInt(3, j);
					ps.setString(4, "available");
					i = ps.executeUpdate();
				}
			}
			ps = con.prepareStatement("select seat_no,status from bus_status where bus_id=? and date=?");
			ps.setInt(1, bus_id);
			ps.setString(2, date);
			rs = ps.executeQuery();
			int k = 0;
			while (rs.next()) {
				a[++k] = rs.getInt(1);

				String sss = rs.getString(2).toString();
				if (sss.equals("booked")) {
					c[k] = 1;
				} else {
					c[k] = 0;
				}

			}
	%>
	<div class="sub-udiv card1">
		<div style="width: 100%; float: left;">
			<p style="padding: 10px;">
				<b><%=bus_id%>/<%=bus_name%></b>&nbsp;&nbsp;&nbsp;&nbsp;Type :
				<%=bus_type.toUpperCase()%>
				&nbsp;&nbsp;&nbsp;&nbsp;<b><%=obj.stoppagename(s_stop)%></b>(<%=b_time.toUpperCase()%>)&nbsp;&nbsp;&nbsp;&nbsp;To&nbsp;&nbsp;&nbsp;&nbsp;<b><%=obj.stoppagename(d_stop)%></b>(<%=b_time.toUpperCase()%>)
				&nbsp;&nbsp;&nbsp;&nbsp;<b><%=fare%></b>&nbsp;(Per Seat)
			</p>

		</div>
		<div style="width: 100%;">
			<div style="width: 50%; float: left; border: 1px solid SlateGray;">

				<div style="width: 10%; float: right;">
					<i class="fa fa-circle-thin fa-fw icon-margin"
						style="color: #2bce89; font-size: 40px; margin-top: 10px;"></i>
				</div>
				<div
					style="width: 89%; float: left; border-right: 1px solid SlateGray;">
					<div style="text-align: left;">
						<%
							int j, l = 0;
							String id="id";
								for (j = 1; j <= 11; j++) {
									l = l + 1;
									if (c[l] == 1) {
						%>
						<span> <i class="material-icons"
							style="font-size: 36px; margin-top: 10px; color: SlateGray;">airline_seat_recline_extra</i>
						</span>
						<%
							} else {
							
						%>
						<span class="seat" id="<%=l %>" onclick="selectseat('<%=l %>','<%=fare %>')"> <i class="material-icons"
							style="font-size: 36px; margin-top: 10px; cursor: pointer; ">airline_seat_recline_extra</i>
						</span>
						<%
							}
								}
						%>
					</div>
					<div style="text-align: left;">
						<%
							for (j = 1; j <= 11; j++) {
									l = l + 1;
									if (c[l] == 1) {
						%>
						<span> <i class="material-icons"
							style="font-size: 36px; color: SlateGray;">airline_seat_recline_extra</i>
						</span>
						<%
							} else {
						%>
						<span class="seat" id="<%=l %>" onclick="selectseat('<%=l %>','<%=fare %>')"> <i class="material-icons" onclick=""
							style="font-size: 36px; margin-top: 10px; cursor: pointer; ">airline_seat_recline_extra</i>
						</span>
						<%
							}
								}
						%>
					</div>
					<div style="text-align: left;">
						<%
							l = l + 1;
								if (c[l] == 1) {
						%>
						<span> <i class="material-icons"
							style="font-size: 36px; color: SlateGray;">airline_seat_recline_extra</i>
						</span>
						<%
							} else {
						%>
						<span class="seat" id="<%=l %>" onclick="selectseat('<%=l %>','<%=fare %>')"> <i class="material-icons" onclick=""
							style="font-size: 36px; margin-top: 10px; cursor: pointer; ">airline_seat_recline_extra</i>
						</span>
						<%
							}
						%>
					</div>
					<div style="text-align: left;">
						<%
							for (j = 1; j <= 11; j++) {
									l = l + 1;
									if (c[l] == 1) {
						%>
						<span> <i class="material-icons"
							style="font-size: 36px; color: SlateGray;">airline_seat_recline_extra</i>
						</span>
						<%
							} else {
						%>
						<span class="seat" id="<%=l %>" onclick="selectseat('<%=l %>','<%=fare %>')"> <i class="material-icons" onclick=""
							style="font-size: 36px; margin-top: 10px; cursor: pointer; ">airline_seat_recline_extra</i>
						</span>
						<%
							}
								}
						%>
					</div>
					<div style="text-align: left;">
						<%
							for (j = 1; j <= 11; j++) {
									l = l + 1;
									if (c[l] == 1) {
						%>
						<span> <i class="material-icons"
							style="font-size: 36px; margin-bottom: 10px; color: SlateGray;">airline_seat_recline_extra</i>
						</span>
						<%
							} else {
						%>
						<span class="seat" id="<%=l %>" onclick="selectseat('<%=l %>','<%=fare %>')"> <i class="material-icons" onclick=""
							style="font-size: 36px; margin-top: 10px; cursor: pointer; ">airline_seat_recline_extra</i>
						</span>
						<%
							}
								}
						%>
					</div>


				</div>

			</div>
			
			<div style="width: 49%; float: left;">
				<p style="text-align: center; font-weight: bolder;">Ticket
					Details</p>
				<div style="width: 99%; margin: auto;">

					<div
						style="width: 50%; float: left; text-align: right; padding: 10px 0 10px 0;">
						<span style="margin: 5px;">Total Number of Selected Seat :</span>
					</div>
					<div
						style="width: 50%; float: left; text-align: left; padding: 10px 0 10px 0;">
						<span style="margin: 5px;"><input type="text" id="ts" value="0"
							readonly="readonly" style="border-style: none;"></span>
					</div>

				</div>
				<div style="width: 99%; margin: auto; clear: both;">

					<div
						style="width: 50%; float: left; text-align: right; padding: 10px 0 10px 0;">
						<span style="padding: 10px 5px 10px 0px;">Selected Seat
							Numbers :</span>
					</div>
					<div
						style="width: 50%; float: left; text-align: left; padding: 10px 0 10px 0;">
						<span style="margin: 5px;"><input type="text" value="" id="tns"
							readonly="readonly" style="border-style: none;"></span>
					</div>

				</div>
				<div style="width: 95%; margin: auto; clear: both;">

					<div
						style="width: 50%; float: left; text-align: right; padding: 10px 0 10px 0;">
						<span style="margin: 5px;">Total Fare :</span>
					</div>
					<div
						style="width: 50%; float: left; text-align: left; padding: 10px 0 10px 0;">
						<span style="margin: 5px;"><input type="text" value="0" id="tf"
							readonly="readonly" style="border-style: none;"></span>
					</div>

				</div>
				<div
					style="width: 95%; margin: auto; clear: both; text-align: center;">
					<input type="submit" value="PROCESS" class="button" onclick="passengerdetails('<%=bus_id %>','<%=date %>')"
						style="margin-top: 15px; background-color: #f04009;">
				</div>
			</div>
		</div>
		<div style="width: 100%; float: left;">
			<p style="font-weight: bold; padding: 10px 5px 10px 5px;">
				SLECTED LEGGEND &nbsp;&nbsp; <i class="material-icons "
					style="font-size: 36px; color: SlateGray;">airline_seat_recline_extra</i>&nbsp;
				Booked&nbsp;&nbsp; <i class="material-icons "
					style="font-size: 36px; color: green;">airline_seat_recline_extra</i>&nbsp;Available
					&nbsp;&nbsp; <i class="material-icons "
					style="font-size: 36px; color: #FF6347;">airline_seat_recline_extra</i>&nbsp;Your Selected Seat
			</p>

		</div>
	</div>
	<%
		} catch (Exception e) {
			System.out.println(e);
		}
		con.close();
	%>

</body>
</html>