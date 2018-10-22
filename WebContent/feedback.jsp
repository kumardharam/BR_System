<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String ticket_id=request.getParameter("ticket_id");
	%>
	<div class="sub-udiv card1">
	<p style="text-align: center; color: green; padding: 10px 0px 10px 0px; font-size: 20px;">Write Some Feedback. </p>
		<div style="width: 50%; margin: auto;">
			<p
				style="text-align: right; width: 100%; padding: 10px 0px 10px 0px;">
				<textarea id="fb" rows="5" cols="70"></textarea>
			</p>
			<p style="text-align: right; width: 95%; padding: 10px 0px 10px 0px;">
				<input type="submit" value="Submit" onclick="feedbackprocess('<%=ticket_id %>')" class="button">
			</p>
		</div>
	</div>
	<%
	
	%>
</body>
</html>