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

<div id="msg1"></div>
<table class="table1">
	<tr>
		<th colspan="2">Add Bus Stoppage</th>
	</tr>
	<tr>
		<td class="td-1">Enter Stoppage Id :</td>
		<td><input type="text" id="stop_id"> </td>
	</tr>
	<tr>
		<td class="td-1">Enter Stoppage Name :</td>
		<td><input type="text" id="stop_name"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;"><input type="submit" value="Submit" class="button" onclick="addstoppageprocess()"></td>
	</tr>
</table>
</body>
</html>