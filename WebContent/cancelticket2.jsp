<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.print.attribute.standard.PresentationDirection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css1.css" rel="stylesheet" type="text/css" />
</head>
<body> 
<jsp:useBean id="obj" class="pack1.connection"></jsp:useBean>
<div class="sub-udiv card1" style="width: 98%;">
<table class="table1">
	<tr>
		<th colspan="9">Your Selected Ticket</th>
	</tr>
	<tr><td colspan="9" class="td-2"><div id="msg1"></div></td></tr>
	<tr>
		<th class="td-c">Ticket No.</th>
		<th class="td-c">Name(Age Gender)</th>
		<th class="td-c">Bus No.</th>
		<th class="td-c">Date</th>
		<th class="td-c">Seat No.</th>
		<th class="td-c">S-Stoppage</th>
		<th class="td-c">d-Stoppage</th>
		<th class="td-c">Status</th>
		<th class="td-c">Cancel</th>
	</tr>
	<% 
	String ticket_id=request.getParameter("ticket_id");
	//out.print(ticket_id);
	Connection con=obj.connect();
	try{
		PreparedStatement ps=con.prepareStatement("select *from ticket_table where ticket_id=?");
		ps.setString(1, ticket_id);
		ResultSet rs=ps.executeQuery();
		int i=0;
		while(rs.next()){
			i=i+1;
			String stoppage[]=obj.sd_stoppage(rs.getInt(5)).split(",");
			%>
			<tr>
				<td class="td-c"><input type="text" value="<%=rs.getString(1) %>" style="border: none; background-color: inherit; text-align: center;" readonly="readonly"></td>
				<td class="td-c"><%=rs.getString(2)%><br><%="("+rs.getString(3)+" "+rs.getString(4)+")" %></td>
				<td class="td-c"><input type="text" value="<%=rs.getInt(5) %>" style="border: none; background-color: inherit; text-align: center;" readonly="readonly"></td>
				<td class="td-c"><input type="text" value="<%=obj.datestr(rs.getString(6)) %>" style="border: none; background-color: inherit; text-align: center;" readonly="readonly"></td>
				<td class="td-c"><input type="text" value="<%=rs.getString(7) %>" style="border: none; background-color: inherit; text-align: center;" readonly="readonly"></td>			
				<td class="td-c"><input type="text" value="<%=stoppage[0] %>" style="border: none; background-color: inherit; text-align: center;" readonly="readonly"></td>			
				<td class="td-c"><input type="text" value="<%=stoppage[1] %>" style="border: none; background-color: inherit; text-align: center;" readonly="readonly"></td>			
				<td class="td-c"><input type="text" value="<%=rs.getString(10) %>" style="border: none; background-color: inherit; text-align: center;" readonly="readonly"></td>			
				
				
				
			
			<%
			if(rs.getString(10).equals("Confirm")){
				%>
				<td class="td-c"><input type="submit" value="Cancel" onclick="cancleprocess('<%=rs.getString(1) %>','<%=rs.getInt(5) %>','<%=obj.datestr(rs.getString(6)) %>','<%=rs.getString(7) %>')" class="button"></td>
	
				<% 
			}else{
				%>
				<td></td>
			
				<% 
			}
			%>
			</tr>
		
			<% 
			if(i==0){
				%>
				<tr>
					<td class="td-c"> Ticket Number Is Incorrect.</td>
				</tr>
			
				<% 
			}
		}
	}catch(Exception e){
		out.print(e);
	}
	con.close();
	%>
</table>

</div>
</body>
</html>