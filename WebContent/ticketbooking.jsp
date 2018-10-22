<%@page import="java.math.BigInteger"%>
<%@page import="java.sql.Date"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
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
	<%
		String ts = request.getParameter("ts");
		Integer nos = Integer.valueOf(ts);
		String tns = request.getParameter("tns");
		String seats[] = tns.split(",");
		//System.out.print("ok");
		String b1 = request.getParameter("bus_id");
		Integer bus_id = Integer.valueOf(b1);
		String date1 = request.getParameter("date");
		String ddd[] = date1.split("/");
		String date2;
		date2 = ddd[2] + "-" + ddd[0] + "-" + ddd[1];
		//System.out.print("ok" + date2);
		Date date = Date.valueOf(date2);
		String mob1 = request.getParameter("mob");
		long mob = Long.parseLong(mob1);
		String dt = java.time.Clock.systemUTC().instant().toString();
		String d = dt.substring(8, 10) + dt.substring(11, 13) + dt.substring(14, 16) + dt.substring(17, 19)
				+ dt.substring(20, 23);
		//out.println(d);
		//System.out.print(request.getParameter("n0"));
		Connection con = obj.connect();
		try {
			if (session.getAttribute("user_id") == null) {
	%>
	<div class="sub-udiv card1">
		<p style="text-align: center;">You Are LogOut Please Login Again.</p>
		<p style="text-align: center;">
			Click Here To <a href="brsystem.jsp">LOGIN</a>
		</p>
	</div>

	<%
		} else {
				//System.out.print("ok1");
				PreparedStatement ps1, ps2;
				ResultSet rs1, rs2;
				int k = 0, l = 0;
				Integer ssss;
				ps2 = con
						.prepareStatement("update bus_status set status=? where bus_id=? and date=? and seat_no=?");
				ps2.setString(1, "booked");
				ps2.setInt(2, bus_id);
				ps2.setString(3, date1);
				ps1 = con.prepareStatement("insert into ticket_table values(?,?,?,?,?,?,?,?,?,?)");
				ps1.setString(1, d);
				ps1.setInt(5, bus_id);
				ps1.setDate(6, date);
				ps1.setLong(8, mob);
				ps1.setString(9, session.getValue("user_id").toString());
				ps1.setString(10, "Confirm");
				if (nos <= 4) {
					//System.out.print("ok2");
					ps1.setString(2, request.getParameter("n0").toString());
					ps1.setString(3, request.getParameter("a0").toString());
					ps1.setString(4, request.getParameter("g0").toString());
					ps1.setString(7, seats[0]);
					k = ps1.executeUpdate();
					ssss = Integer.valueOf(seats[0]);
					ps2.setInt(4, ssss);
					l = ps2.executeUpdate();
					//System.out.print("ok3");
				}
				if (nos >= 2) {
					//System.out.print("ok2");
					ps1.setString(2, request.getParameter("n1").toString());
					ps1.setString(3, request.getParameter("a1").toString());
					ps1.setString(4, request.getParameter("g1").toString());
					ps1.setString(7, seats[1]);
					k = ps1.executeUpdate();
					ssss = Integer.valueOf(seats[1]);
					ps2.setInt(4, ssss);
					l = ps2.executeUpdate();

					//System.out.print("ok3");
				}
				if (nos >= 3) {
					//System.out.print("ok2");
					ps1.setString(2, request.getParameter("n2").toString());
					ps1.setString(3, request.getParameter("a2").toString());
					ps1.setString(4, request.getParameter("g2").toString());
					ps1.setString(7, seats[2]);
					k = ps1.executeUpdate();
					ssss = Integer.valueOf(seats[2]);
					ps2.setInt(4, ssss);
					l = ps2.executeUpdate();

					//System.out.print("ok3");
				}
				if (nos == 4) {
					//System.out.print("ok2");
					ps1.setString(2, request.getParameter("n3").toString());
					ps1.setString(3, request.getParameter("a3").toString());
					ps1.setString(4, request.getParameter("g3").toString());
					ps1.setString(7, seats[3]);
					k = ps1.executeUpdate();
					ssss = Integer.valueOf(seats[3]);
					ps2.setInt(4, ssss);
					l = ps2.executeUpdate();

					//System.out.print("ok3");
				}
				if (k > 0 && l > 0) {
				%>
					<div class="sub-udiv card1">
						<p style="text-align: center; color: green; padding: 10px 0px 10px 0px; font-size: 25px;">Thank you for using our Bus Reservation System. </p>
						<%
						if(nos==1){
							%>
							<p style="text-align: center;  padding: 10px 0px 10px 0px; font-size: 20px;">Your bus ticket number is <b style="color: red;"><%=d %></b> and your seat number is  <b style="color: red;"><%=tns %></b>  </p>
							<%
						}else{
							%>
							<p style="text-align: center; padding: 10px 0px 10px 0px; font-size: 20px;">Your bus ticket number is <b style="color: red;"><%=d %></b> and your following seat numbers are <b style="color: red;"><%=tns %></b> </p>
							<%
						}
						%>
						<p style="text-align: right; width:45%; float:left; padding: 10px 0px 10px 0px;">
							<input type="submit" value="Write Feedback" class="button" onclick="feedback('<%=d %>')" 
						style="margin-top: 15px;">
						</p>
						<p style="text-align: left; width:45%; float:right; padding: 10px 0px 10px 0px;">
							<a href="userhomepage.jsp"><input type="submit" value="Later" class="button" 
						style="margin-top: 15px;"></a>
						</p>
					</div>
				<%
		}
			}

		} catch (Exception e) {
			System.out.print(e);
		}
		con.close();
	%>

</body>
</html>